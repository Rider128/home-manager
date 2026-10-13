{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pyright # Python
    rust-analyzer # Rust
  ];
}
