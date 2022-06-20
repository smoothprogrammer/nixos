{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		autocd = true;
		enableAutosuggestions = true;
		enableCompletion = true;
		enableSyntaxHighlighting = true;
		initExtra = ''
			eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
		'';
		envExtra = ''
			export DIRENV_LOG_FORMAT=
		'';
		plugins = with pkgs; [
			{
				name = "powerlevel10k";
				src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
				file = "powerlevel10k.zsh-theme";
			}
			{
				name = "powerlevel10k-config";
				src = lib.cleanSource ./.;
				file = "p10k.zsh";
			}
		];
	};
}
