# frozen_string_literal: true

require 'curses'

module BandwidthMonitor
  # The controller for all throughput access.
  class Bandwidth
    attr_accessor :download, :upload

    def initialize
      @download = 0
      @upload = 0
    end
  end
end
