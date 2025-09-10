{ config, lib, pkgs, ... }:

let
  resumeUUID = "83bba610-31f9-479d-a972-acdeb0e5be30";
in {
  config = {
    # Parâmetro de resume no boot
    boot.kernelParams = [ "resume=UUID=${resumeUUID}" ];

    # Define o dispositivo de resume no initrd
    boot.resumeDevice = "/dev/disk/by-uuid/${resumeUUID}";

    # Swap devices (pode incluir mais de um, mas só o de disco é usado pro resume)
    swapDevices = [
      {
        device = "/dev/disk/by-uuid/${resumeUUID}";
      }
    ];
  };
}

