{ inputs, pkgs, ... }:
let
  icons = import ./icons.nix;
in {
	imports = [
    inputs.nixvim.nixosModules.nixvim 
    (import ./utils { inherit icons; })
  ];

  environment.systemPackages = with pkgs; [ 
    ripgrep # for telescope live_grep
  ];

	programs.nixvim = {
	  enable = true;
	  globals.mapleader = " ";
	  options = import ./options.nix;

    colorschemes = {
      catppuccin = {
        enable = true;
        flavour = "mocha";
        dimInactive.enabled = true;
      };
    #   gruvbox = { enable = true; };
    };

		colorscheme = "catppuccin";

	  plugins = {
	    lsp = import ./lsp.nix;
      packer = import ./packer.nix;

      inc-rename = { enable = true; };
      markdown-preview.enable = true;

      nvim-cmp = { enable = true; };

      # UI
      noice = { enable = true; };

			# Git
      neogit.enable = true;
			gitsigns = { enable = true; };

	    telescope = {
				enable = true;
				defaults = {
				  prompt_prefix = "${icons.ui.telescope} ";
				  color_devicons = true;
          vimgrep_arguments = [
            "rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"
            "--glob=!.git/"
          ];
				};
      };
			navic = { enable = true; };
      lualine = { enable = true; };
      treesitter = {
        enable = true;
        indent = true;
        nixGrammars = true;
        ensureInstalled = [ "comment" "markdown_inline" "regex" ];
      };
	  };
		keymaps = import ./keymaps.nix;
	};
}
