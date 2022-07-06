{ config, pkgs, ... }:

{
	imports = [
		./libreoffice.nix	# Word, Spreadsheet, Presentation
		./zathura.nix		# PDF
		./pcalc.nix			# Calculator
	];
}
