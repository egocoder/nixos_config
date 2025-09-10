{ pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          eamodio.gitlens
          usernamehw.errorlens
          aaron-bond.better-comments
          vscodevim.vim
          oderwat.indent-rainbow
          pkief.material-icon-theme
          rust-lang.rust-analyzer
          vadimcn.vscode-lldb
          fill-labs.dependi
          tamasfe.even-better-toml
          ms-python.python
          ms-python.vscode-pylance
          ms-python.black-formatter
          ms-python.isort
          ms-python.flake8
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.jupyter-renderers
          llvm-vs-code-extensions.vscode-clangd
          ms-vscode.cpptools
          ms-azuretools.vscode-docker
          ms-azuretools.vscode-containers
          esbenp.prettier-vscode
          ms-ceintl.vscode-language-pack-pt-br
        ];

        userSettings = lib.mkForce {
          "workbench.colorTheme" = "Absolute Black";
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.sideBar.location" = "right";

          "editor.fontFamily" = "'Terminess Nerd Font Mono', 'Hack Nerd Font Mono', monospace";
          "editor.fontSize" = 12;
          "editor.fontLigatures" = false;
          "editor.lineHeight" = 20;
          "editor.cursorStyle" = "block";
          "editor.cursorBlinking" = "phase";
          "editor.cursorSmoothCaretAnimation" = "on";

          "files.autoSave" = "afterDelay";
          "files.trimTrailingWhitespace" = true;
          "files.insertFinalNewline" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnPaste" = true;
          "editor.codeActionsOnSave" = {
            "source.organizeImports" = "explicit";
            "source.fixAll" = "explicit";
          };

          "editor.suggestSelection" = "first";
          "editor.suggest.snippetsPreventQuickSuggestions" = false;
          "editor.quickSuggestions" = {
            other = true;
            comments = false;
            strings = true;
          };

          "terminal.integrated.fontSize" = 12;
          "terminal.integrated.fontFamily" = "Monocraft Nerd Font, Hack Nerd Font Mono, monospace";
          "terminal.integrated.cursorStyle" = "block";
          "terminal.integrated.cursorBlinking" = true;
          "terminal.integrated.inheritEnv" = false;

          "rust-analyzer.checkOnSave.command" = "clippy";
          "rust-analyzer.cargo.allFeatures" = true;
          "[rust]" = {
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          };

          "python.linting.enabled" = true;
          "python.linting.pylintEnabled" = false;
          "python.linting.flake8Enabled" = true;
          "python.linting.mypyEnabled" = true;
          "python.analysis.autoImportCompletions" = true;
          "[python]" = {
            "editor.defaultFormatter" = "ms-python.black-formatter";
          };

          "[c]" = {
            "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
          };
          "[cpp]" = {
            "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
          };
          "C_Cpp.intelliSenseEngine" = "disabled";

          "codeium.enableConfig" = {
            "*" = true;
            "plaintext" = true;
	    "visualg" = true;
          };
        };
      };
    };

    mutableExtensionsDir = true;
  };
}

