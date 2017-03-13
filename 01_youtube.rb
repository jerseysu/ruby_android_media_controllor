require 'minitest/autorun'
require_relative 'lib/lib_keyevent.rb'

class TestYouTube < MiniTest::Unit::TestCase
  def setup
    @device_id = "016d62192b794b2d"
    @activity = "com.google.android.youtube"
    @cmd = KeyEvent.new(@device_id)
    video = "https://www.youtube.com/watch?v=T0LfHEwEXXw"
    system ("rake automation:video[#{@device_id},#{video}]")
    @cmd.execute_adb_keyevent(:unlock)
  end

  def test_01_pause_video
    @cmd.execute_adb_keyevent(:pause)
    puts 'Pause'
    sleep 5
  end

  def test_02_play_video
    @cmd.execute_adb_keyevent(:play)
    puts 'Play'
    sleep 5
  end

  def test_03_suspend_resume
    @cmd.execute_adb_keyevent(:power_key)
    puts 'Power'
    sleep 5
    @cmd.execute_adb_keyevent(:power_key)
    puts 'Power'
  end

  def teardown
    system ("rake automation:stop[#{@device_id},#{@activity}]")
  end
end
