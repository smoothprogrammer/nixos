# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

sync:
	@mkdir -p /etc/nixos/nixos-config
	@rsync -av --delete-excluded \
		--exclude='.git/' \
		$(MAKEFILE_DIR)/ /etc/nixos/nixos-config/
