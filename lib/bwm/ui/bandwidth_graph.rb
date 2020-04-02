# frozen_string_literal: true

require_relative '../bandwidth/bandwidth'
require 'curses'
require 'singleton'

module BandwidthMonitor
  module UI
    class BandwidthGraph
      include Singleton

      attr_reader :window, :bandwidth

      def initialize
        @bandwidth = Bandwidth.new

        @window = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols - 2, 0, 0)
        @window.box('|', '-')
        @window.setpos(2, 2)
        @window.addstr('hello')
        @window.refresh
      end

      def start

        # Loop forever until killed
        loop do
        end
      end
    end
  end
end
