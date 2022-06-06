# Get the hostname to pick the configuration in the hosts directory
HOSTNAME := $(shell hostname)

# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

init:
ifndef HOST
	@echo "HOST is not defined"
endif
	@rsync -av --delete \
		--exclude='.git/' \
		$(MAKEFILE_DIR)/ /etc/nixos/
	@ln -s /etc/nixos/hosts/$(HOST)/configuration.nix /etc/nixos/configuration.nix

sync:
	@rsync -av --delete \
		--exclude='.git/' \
		$(MAKEFILE_DIR)/ /etc/nixos/
	@ln -s /etc/nixos/hosts/$(HOSTNAME)/configuration.nix /etc/nixos/configuration.nix
