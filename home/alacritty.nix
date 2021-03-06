{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      window = {
        decorations = "full";
        startup_mode = "Maximized";
      };

      font = {
        normal = {
          family = "Cica";
          style = "Regular";
        };
        bold = {
          family = "Cica";
          style = "Bold";
        };
        italic = {
          family = "Cica";
          style = "Italic";
        };
        use_thin_stroke = true;
      };

      colors = {
        primary = {
          background = "0x002b36";
          foreground = "0x839496";
        };
        normal = {
          black = "0x073642";
          red = "0xdc322f";
          green = "0x859900";
          yellow = "0xb58900";
          blue = "0x268bd2";
          magenta = "0xd33682";
          cyan = "0x2aa198";
          white = "0xeee8d5";
        };
        bright = {
          black = "0x002b36";
          red = "0xcb4b16";
          green = "0x586e75";
          yellow = "0x657b83";
          blue = "0x839496";
          magenta = "0x6c71c4";
          cyan = "0x93a1a1";
          white = "0xfdf6e3";
        };
      };

      bell = {
        animation = "Ease";
        duration = 0;
        color = "#ffffff";
      };

      shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "--login" ];
      };

      live_config_reload = true;

      key_bindings = [
        {
          key = "Q";
          mods = "Control";
          chars = "\\x11";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        # Linux only
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        # macOS only
        {
          key = "V";
          mods = "Command";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Command";
          action = "Copy";
        }
      ];
    };
  };
}
