#!/bin/bash
source "${BASE_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/zpwa}/variables/variables.sh"

# Use the centralized DESKTOP_DIR variable
mkdir -p "$DESKTOP_DIR"
DESKTOP_FILE="$DESKTOP_DIR/webapp.$SAFE_NAME.desktop"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=Zen PWA for $APP_NAME
Exec=bash -c 'nohup "$PWA_MONITOR" > /dev/null 2>&1 & if [ -n "\$HYPRLAND_INSTANCE_SIGNATURE" ] && command -v hyprctl >/dev/null; then hyprctl dispatch exec "[float;center;size 1000 800] \"$PROFILE_PATH/$SAFE_NAME\" --no-remote --profile \"$PROFILE_PATH\" --class \"webapp.$SAFE_NAME\" --name \"webapp.$SAFE_NAME\" \"$APP_URL\""; else exec "$PROFILE_PATH/$SAFE_NAME" --no-remote --profile "$PROFILE_PATH" --class "webapp.$SAFE_NAME" --name "webapp.$SAFE_NAME" "$APP_URL"; fi'
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupWMClass=webapp.$SAFE_NAME
Categories=Network;WebBrowser;
EOF

chmod +x "$DESKTOP_FILE"
