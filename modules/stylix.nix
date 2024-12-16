{ config, pkgs, lib, inputs, ... }:
{
  imports = [inputs.stylix.nixosModules.stylix];
  stylix.autoEnable = true;

}
