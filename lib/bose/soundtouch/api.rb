require 'bose/soundtouch/api/version'
require 'httparty'

module Bose
  module Soundtouch
    class Api
      include HTTParty

      KEY_VALUES = [
          :PLAY,
          :PAUSE,
          :STOP,
          :PREV_TRACK,
          :NEXT_TRACK,
          :THUMBS_UP,
          :THUMBS_DOWN,
          :BOOKMARK,
          :POWER,
          :MUTE,
          :VOLUME_UP,
          :VOLUME_DOWN,
          :PRESET_1,
          :PRESET_2,
          :PRESET_3,
          :PRESET_4,
          :PRESET_5,
          :PRESET_6,
          :AUX_INPUT,
          :SHUFFLE_OFF,
          :SHUFFLE_ON,
          :REPEAT_OFF,
          :REPEAT_ONE,
          :REPEAT_ALL,
          :PLAY_PAUSE,
          :ADD_FAVORITE,
          :REMOVE_FAVORITE,
          :INVALID_KEY
      ]

      def initialize(ip_or_hostname)
        self.base_uri "#{ip_or_hostname}:8090"
      end

      def info
        self.class.get("/info")
      end

      def press_key(key)
        raise 'Unknown key' unless KEY_VALUES.include?(key)

        self.class.post('/key', body: "<key state='press' sender='Gabbo'>#{key}</key>")
        self.class.post('/key', body: "<key state='release' sender='Gabbo'>#{key}</key>")
      end

      def get_volume
        self.class.get('/volume')
      end

      def set_volume(target_volume)
        self.class.post('/volume', body: "<volume>#{target_volume}</volume>")
      end

      def now_playing
        self.class.get('/now_playing')
      end

    end
  end
end
