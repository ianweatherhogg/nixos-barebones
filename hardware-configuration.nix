# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    # <nixos/modules/programs/virtualbox.nix>
    ];

  boot.initrd = {
    availableKernelModules = [ "xhci_hcd" "ehci_pci" "ahci" "usb_storage" "usbhid" ];
    kernelModules = [
      "i915"
      "aes_x86_64"
      "fbcon"
    ];
  };
  boot.initrd.luks = {
    devices = [{
      name = "cryptdisk";
      device = "/dev/sda2";
      allowDiscards = true;
      preLVM = true;
    }];
  };
  boot.kernelModules = [ "kvm-intel" "tun" "fuse" "virtio" ];
  boot.extraModulePackages = [ ];
  # boot.kernelPackages = pkgs.linuxPackages // {
  #   virtualbox = pkgs.linuxPackages.virtualbox.override { enableExtensionPack = true; };
  # };

#  boot.kernelPackages = pkgs.linuxPackages_3_14;
#  boot.kernelPackages = pkgs.linuxPackages_3_15;
#  boot.kernelPackages = linuxPackages_latest;

  fileSystems."/" =
    { device = "/dev/mapper/vg-root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "vfat";
    };

  fileSystems."/data" =
    { device = "/dev/sdb1";
      fsType = "ext4";
    };

  fileSystems."/tmp" = { device = "none"; fsType = "tmpfs"; };

  swapDevices =
    [ { device = "/dev/dm-1"; }
    ];

  nix.maxJobs = 2;
}
