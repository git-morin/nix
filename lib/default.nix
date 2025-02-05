{
  # Read all .nix files (except default.nix and home.nix) and import them
  importNixFiles = path: let
    nixFiles = builtins.filter 
      (n: n != "default.nix" && n != "home.nix" && builtins.match ".*\\.nix$" n != null)
      (builtins.attrNames (builtins.readDir path));
  in
    map (x: path + "/${x}") nixFiles;

  # Parses the current directory for .nix files (except default.nix)
  # and returns a list of actual package derivations
  importHomeManagerPackages = path: pkgs: 
    let
      nixFiles = builtins.filter 
        (n: builtins.match ".*\\.nix$" n != null && n != "default.nix")
        (builtins.attrNames (builtins.readDir path));

      packageNames = map (n: builtins.replaceStrings [".nix"] [""] n) nixFiles;

      getPackage = pkg: 
        if pkgs ? ${pkg} 
        then pkgs.${pkg} 
        else null;
    in
      builtins.filter (p: p != null) (map getPackage packageNames);
}