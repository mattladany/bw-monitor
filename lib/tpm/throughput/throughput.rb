# frozen_string_literal: true

require 'curses'

module ThroughputMonitor
  # The controller for all throughput access.
  class Throughput
    attr_accessor :interface, :download, :upload

    def initialize(interface = 'eth0')
      @interface = interface
      @download = []
      @upload = []
    end

    def start
      x = 0
      loop do
        @download << x
        sleep 4
        x = x + 1
      end
    end

    def download_rate
      (0...@download.length()).map do |i|
        @download[i]
      end
#      (0...90).map do |i|
#        Math.cos(i * ((Math::PI * 8) / 90)).round(2) * 10
#      end
    end
  end
end
