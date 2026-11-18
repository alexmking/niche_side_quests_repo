#!/bin/bash
# Toggles the Apple Music playlist "alex king work audio" without bringing Music to the front:
# pauses if it's playing, resumes if paused, otherwise starts it.

PLAYLIST="alex king work audio"
SHUFFLE=false   # set to false for in-order playback

osascript - "$PLAYLIST" "$SHUFFLE" <<'EOF'
on run argv
	set playlistName to item 1 of argv
	set doShuffle to (item 2 of argv is "true")
	tell application "Music"
		if not (exists user playlist playlistName) then
			error "Playlist not found: " & playlistName
		end if
		set currentName to ""
		try
			set currentName to name of current playlist
		end try
		if currentName is playlistName and player state is playing then
			pause
		else if currentName is playlistName and player state is paused then
			play
		else
			set shuffle enabled to doShuffle
			play user playlist playlistName
		end if
	end tell
end run
EOF
