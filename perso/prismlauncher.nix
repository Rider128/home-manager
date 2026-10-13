{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [ ffmpeg ];

      jdks = [
        graalvmPackages.graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
