#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General Tweaks                                                              #
###############################################################################

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable the “Are you sure you want to open this application?” dialog
# not working in ventura
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable reopen windows when logging back in
defaults write com.apple.loginwindow TALLogoutSavesState -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Set scrollbar to show always
defaults write -g AppleShowScrollBars -string "Always"
defaults write -g AppleScrollerPagingBehavior -int 1

# Disable wallpaper tinting
defaults write -g AppleReduceDesktopTinting -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Save screenshots to ~/Pictures/Screenshots
mkdir -p ${HOME}/Pictures/Screenshots 2> /dev/null
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

###############################################################################
# Keyboard tweaks                                                             #
###############################################################################

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart completion
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool false

# Enable navigation with tab key
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Enable repeat instead of accent menu on holding down keys
defaults write -g ApplePressAndHoldEnabled -bool false

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

###############################################################################
# Dock                                                                        #
###############################################################################

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array ""

# Disable recent apps from dock
defaults write com.apple.dock show-recents -bool false

# Disable app launch animation
defaults write com.apple.dock launchanim -bool false

# Set dock animation to scale
defaults write com.apple.dock mineffect scale

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Set left as default position for dock
defaults write com.apple.dock orientation left

# Prevent applications from bouncing in Dock
defaults write com.apple.dock no-bouncing -bool true

# Set dock to auto hide and update auto hide delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock minimize-to-application -bool true

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 40

# Speed up Mission control animation
defaults write com.apple.dock expose-animation-duration -float 0.1

###############################################################################
# Finder                                                                      #
###############################################################################

# Set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display status bar at bottom
defaults write com.apple.finder ShowStatusBar -bool true

# Display path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Disable desktop items
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Trackpad and Gesture                                                        #
###############################################################################

# Enable dragging using trackpad
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Increase scroll speed
defaults write -g com.apple.trackpad.scaling -float 0.875
defaults write -g com.apple.mouse.scaling -float 0.875

# Disable 'natural' scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
