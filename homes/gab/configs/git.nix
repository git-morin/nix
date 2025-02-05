{ ... }: {
  programs.git = {
    enable = true;
    userName = "git-morin";
    userEmail = "dev.gab.morin@gmail.com";
    # aliases = {
    #   co = "checkout";
    #   br = "branch";
    #   ci = "commit";
    #   st = "status";
    # };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.default = "simple";
      core.editor = "nvim";
    };
  };
}