require 'minitest/autorun'
require_relative 'lib/libkeyevent'

class LaunchApp < MiniTest::Unit::TestCase
  def setup
    @device_id = "HT36FS906020"
    @video_id = "6169"
    cmd = KeyEvent.new(@device_id)
  end

  def test_launch_app
    activity
    system ("rake automation:execute[#{@device_id},#{activity}]")
  end

  def test_play_video
    cmd.execute_adb_keyevent(:play)
    sleep 5
    cmd.execute_adb_keyevent(:pause)
  end

end
