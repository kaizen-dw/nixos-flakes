{ self, inputs, ... }:

let
  user = "wolly";
  system = "x86_64-linux";
  lib = inputs.nixpkgs.lib;
  hm = inputs.home-manager;

  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;  # Allow Proprietary Software
  };

  unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in 
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user unstable; };
    modules = [ 
      ./thinkpad
      ./system.nix 
      inputs.nur.nixosModules.nur 
      hm.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          # users.wolly = import ../home/users/wolly/thinkpad;
        };
      }
    ];
  };
}
