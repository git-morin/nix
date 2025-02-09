{ inputs, system, ... }: {
  home = {
    username = "gab";
    homeDirectory = "/home/gab";
    stateVersion = "24.11";
    packages =
      let
        packageFiles = builtins.filter
          (n: n != "default.nix" && builtins.match ".*\\.nix$" n != null)
          (builtins.attrNames (builtins.readDir ./packages));
        pkgs = import inputs.nixpkgs { inherit system; config = { allowUnfree = true; }; };
        getPackage = pkg:
          if builtins.hasAttr pkg pkgs then pkgs.${pkg} else null;
        packageNames = map (n: builtins.replaceStrings [".nix"] [""] n) packageFiles;
        validPackages = builtins.filter (p: p != null) (map getPackage packageNames);
      in
        validPackages;
  };

  imports =
    let
      configsPath = ./configs;
      configFiles = builtins.filter
        (n: n != "default.nix" && builtins.match ".*\\.nix$" n != null)
        (builtins.attrNames (builtins.readDir configsPath));
    in
      map (x: configsPath + "/${x}") configFiles;

  programs.home-manager.enable = true;
}
