#!/bin/zsh

# macOS system settings. Safe to re-run.

echo "\nRemapping caps lock to escape"

# HID usage codes: caps lock 0x700000039, escape 0x700000029.
# 0-0-0 is the fallback used by keyboards without their own entry;
# 1452-592-0 is the built-in Apple keyboard, which needs its own.
caps_to_escape='<dict><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer><key>HIDKeyboardModifierMappingDst</key><integer>30064771113</integer></dict>'

for keyboard in 0-0-0 1452-592-0; do
  defaults -currentHost write -g "com.apple.keyboard.modifiermapping.$keyboard" -array "$caps_to_escape"
done

# The defaults above only take effect at next login, so apply it to the
# current session too.
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":30064771129,"HIDKeyboardModifierMappingDst":30064771113}]}' > /dev/null

echo "\nLog out and back in for the keyboard remap to stick."

echo "\nConfiguring the Dock"

# Move the Dock to the left edge.
defaults write com.apple.dock orientation -string left

# Auto-hide, with no delay before it slides away and no slide animation.
defaults write com.apple.dock autohide -bool true

# Don't show recently used apps.
defaults write com.apple.dock show-recents -bool false

# Clear the right-hand section, which is where the Downloads stack lives.
defaults write com.apple.dock persistent-others -array

# Clear all dock pins 
defaults write com.apple.dock persistent-apps -array

killall Dock

echo "\nMacOS settings applied"
