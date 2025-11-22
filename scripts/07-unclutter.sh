echo "  [>] Removing unwanted pre-installed content"
sudo pacman --noconfirm -Rnsc 1password-beta 1password-cli

$HOME/.local/share/omarchy/bin/omarchy-webapp-remove HEY
$HOME/.local/share/omarchy/bin/omarchy-webapp-remove WhatsApp
$HOME/.local/share/omarchy/bin/omarchy-webapp-remove Zoom
$HOME/.local/share/omarchy/bin/omarchy-webapp-remove Basecamp
