{lib, ...}:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      min-free = 128000000; # 128 MB
      max-free = 1000000000; # 1 GB
      keep-outputs = true;
      keep-derivations = true;
      auto-optimise-store = true;
      max-jobs = "auto";
      use-xdg-base-directories = true;
      http-connections = 128;
      max-substitution-jobs = 128;
      log-lines = 25;
      warn-dirty = false;
      builders-use-substitutes = true;
      fallback = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };
}
