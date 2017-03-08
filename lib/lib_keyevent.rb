class KeyEvent
	module KeyEventTable
		@@keytable = {
			:fast_forward => 90, #KEYCODE_MEDIA_FAST_FORWARD
			:play_pause => 85, #KEYCODE_MEDIA_PLAY_PAUSE
			:stop => 86, #KEYCODE_MEDIA_STOP
			:next => 87, #KEYCODE_MEDIA_NEXT
			:previous => 88, #KEYCODE_MEDIA_PREVIOUS
			:rewind => 89, #KEYCODE_MEDIA_REWIND
			:play => 126, #KEYCODE_MEDIA_PLAY
			:pause => 127, #KEYCODE_MEDIA_PAUSE
			:close => 128, #KEYCODE_MEDIA_CLOSE
			:eject => 129, #KEYCODE_MEDIA_EJECT
			:record => 130, #KEYCODE_MEDIA_RECORD
			:audio_track => 222, #KEYCODE_MEDIA_AUDIO_TRACK
			:top_menu => 226, #KEYCODE_MEDIA_TOP_MENU
			:power_key => 26 #
		}
	end
	
	include KeyEventTable

	def initialize(device_id)
		@device_id = device_id
	end

	def execute_adb_keyevent(keyevent_id)
		id = @@keytable[keyevent_id]
		puts "adb -s #{@device_id} shell input keyevent #{id}"

		system("adb -s #{@device_id} shell input keyevent #{id}")
	end
end