define SOURCE_BREW
# Brew
eval "$$(/opt/homebrew/bin/brew shellenv)"
# End Brew
endef
export SOURCE_BREW

darwin/brew-install:
	@sudo NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	@echo "$$SOURCE_BREW" >> ~/.zprofile

define SOURCE_NIX
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
endef
export SOURCE_NIX

darwin/nix-install:
	@sudo curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
	@echo "$$SOURCE_NIX" >> ~/.zprofile

VM_ADDR ?= unset
SSH_OPTIONS = -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

vm/nixos-install:
	$(MAKE) vm/bootstrap
	$(MAKE) vm/copy
	@ssh $(SSH_OPTIONS) root@$(VM_ADDR) " \
		sudo nixos-install --no-channel-copy --no-root-password --flake /tmp/nixos-install#testing; \
	"

vm/bootstrap:
	@ssh $(SSH_OPTIONS) root@$(VM_ADDR) " \
		parted /dev/nvme0n1 -- mklabel gpt; \
		parted /dev/nvme0n1 -- mkpart primary 512MiB -8GiB; \
		parted /dev/nvme0n1 -- mkpart primary linux-swap -8GiB 100\%; \
		parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB; \
		parted /dev/nvme0n1 -- set 3 esp on; \
		mkfs.ext4 -L nixos /dev/nvme0n1p1; \
		mkswap -L swap /dev/nvme0n1p2; \
		mkfs.fat -F 32 -n boot /dev/nvme0n1p3; \
		mount /dev/disk/by-label/nixos /mnt; \
		mkdir -p /mnt/boot; \
		mount /dev/disk/by-label/boot /mnt/boot; \
		swapon /dev/disk/by-label/swap; \
	"

vm/copy:
	@rsync -av \
	./minimal/ \
	root@$(VM_ADDR):/tmp/nixos-install
