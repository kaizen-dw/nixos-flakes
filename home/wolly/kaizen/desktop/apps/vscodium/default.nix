# INFO: I like vscodium but I still don't see myself using it.
{ pkgs, ... }:
{
  imports = [
    ./extensions.nix
    ./user-settings.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    keybindings = [
      {
        key = "ctrl+q";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
    ];
  };
}