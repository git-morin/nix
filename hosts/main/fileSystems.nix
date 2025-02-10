{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4d842995-17a4-494d-86dd-a6135058b324";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/628B-55B5";
      fsType = "vfat";
    };

  swapDevices = [ ];
}
