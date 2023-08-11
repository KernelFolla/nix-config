{ config, pkgs, lib, ... }: {
  # https://karabiner-elements.pqrs.org/docs/json/location/
  home.file.karabiner = {
    executable = false;
    target = ".config/karabiner/karabiner.json";
    source = ./karabiner.json;
  };

#  home.file.karabiner_complex_modifications_test = {
#    executable = false;
#    target = ".config/karabiner/assets/complex_modifications/test.json";
#    source = ./karabiner_complex_modifications/test.json;
#  };
}
