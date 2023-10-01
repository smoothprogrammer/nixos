define SOURCE_BREW
# Brew
eval "$$(/opt/homebrew/bin/brew shellenv)"
# End Brew
endef
export SOURCE_BREW

install-brew:
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

install-nix:
  @sudo curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
  @echo "$$SOURCE_NIX" >> ~/.zprofile
