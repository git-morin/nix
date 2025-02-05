<div align='center'>
<img src="https://nixos.org/logo/nixos-logo-only-hires.png" height="60" />

📂 This is my current NixOS configuration.
</div>

```
├── ❄️ flake.nix  # Main entry-point for the Nix flake setup.
├── 🍧 flakes/  # Flake-related configuration.
│   └── 🤘 nixos.nix  # NixOS-specific flake configurations.
├── 🏠 homes/  # Home Manager configurations.
│   └── 📂 gab/
│       ├── 📂 configs/  # Home Manager service configurations.
│       └── 📂 packages/  # User-specific package definitions.
├── 🏠 hosts/  # System-wide configurations for different hosts.
│   ├── 📂 common/  # Common configurations across all hosts.
│   │   ├── ⚙️ bootloader.nix  # Bootloader settings.
│   │   ├── 🖥️ desktop.nix  # Desktop environment settings.
│   │   ├── 🌐 network.nix  # Network-related settings.
│   │   ├── 📦 nix.nix  # Nix package manager configurations.
│   │   ├── 🖥️ system.nix  # System-wide settings.
│   │   └── 👥 users.nix  # User account configurations.
│   └── 📂 main/  # Configuration for the 'main' host.
│       ├── 🏡 default.nix  # System configuration.
│       └── 🖥️ hardware-configuration.nix  # Hardware settings.
├── 📚 lib/  # Library of helper Nix functions.
└── 📜 README.md  # Documentation for the configuration.
```