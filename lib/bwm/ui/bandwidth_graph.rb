# frozen_string_literal: true

require_relative '../bandwidth/bandwidth'
require 'curses'
require 'singleton'
require 'ascii_chart'

module BandwidthMonitor
  module UI
    class BandwidthGraph
      include Singleton

      attr_reader :window, :bandwidth

      def initialize
        @bandwidth = Bandwidth.new

        @window = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols - 2, 0, 0)
#        @window.box('|', '-')
        @window.setpos(5, 0)
#        @window.addstr('hello')
        @window.addstr(AsciiChart.plot((0...40).map { |i|
          Math.cos(i * ((Math::PI * 8) / 90)).round(2) * 10
        }))

        @window.setpos(10,2)
        @window.addstr("testing1234!")

        @window.refresh
      end

      def start
        loop do
        end
      end
    end
  end
end
