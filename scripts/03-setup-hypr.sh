HYPR_LOCAL_PATH="$HOME/.config/hypr-local"

if [ -d "$HYPR_LOCAL_PATH" ]; then
  echo "  [>] Local hypr config already there, skipping..."
else
  echo "  [>] Creating local hypr config files..."
  mkdir -p "$HYPR_LOCAL_PATH"
  touch "$HYPR_LOCAL_PATH/autostart.conf"
  touch "$HYPR_LOCAL_PATH/bindings.conf"
  touch "$HYPR_LOCAL_PATH/envs.conf"
  touch "$HYPR_LOCAL_PATH/hypridle.conf"
  touch "$HYPR_LOCAL_PATH/hyprland.conf"
  touch "$HYPR_LOCAL_PATH/hyprlock.conf"
  touch "$HYPR_LOCAL_PATH/hyprsunset.conf"
  touch "$HYPR_LOCAL_PATH/input.conf"
  touch "$HYPR_LOCAL_PATH/monitors.conf"
  touch "$HYPR_LOCAL_PATH/windows.conf"
  stow -S hypr
fi
