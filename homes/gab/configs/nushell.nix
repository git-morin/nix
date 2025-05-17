{
    programs.nushell = {
        enable = true;
        configFile.source = ./nushell/config.nu;
        shellAliases = {
            switch   = "nh os switch #main";  # evaluate -> build -> switch to new generation
            test     = "nh os test #main";  # evaluate -> test
            clean    = "nh clean all";  # clean up old generations
            upgrade  = "sudo nix-env --upgrade";  # upgrade packages
            optimize = "sudo nix-store --optimize"; # optimize nix-store
        };
    };

    programs.carapace = {
        enable = true;
        enableNushellIntegration = true;
    };

    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;
            character = {
                success_symbol = "[➜](bold green)";
                error_symbol = "[➜](bold red)";
            };
        };
    };
}