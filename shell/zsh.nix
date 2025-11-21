{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    history = {
      append = true;
      findNoDups = true;
    };

    setOptions = [
      "NOMATCH"
      "NOTIFY"
      "NO_BEEP"
    ];

    # Loal completion settings
    initContent = lib.mkOrder 550 (builtins.readFile ./completions.zsh);

    # Plugin manager
    zplug = {
      enable = true;
      plugins = [
        { name = "plugins/git"; tags = [ "from:oh-my-zsh" ]; }
        { name = "plugins/sudo"; tags = [ "from:oh-my-zsh" ]; }
        { name = "MichaelAquilina/zsh-you-should-use"; }
        { name = "zsh-users/zsh-completions"; }
      ];
    };

    syntaxHighlighting.enable = true;
  };
}
