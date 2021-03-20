# frozen_string_literal: true

require_relative 'overflowing_array'

module ThroughputMonitor
  # The controller for all throughput access.
  class Throughput
    attr_accessor :interface, :download, :upload

    def initialize(interface = 'eth0')
      @interface = interface
      @download = OverflowingArray.new(10)
      @upload = []
    end

    def start
      x = 0
      loop do
        @download.add(x)
        sleep 4
        x = x + 1
      end
    end

    def download_rate
      arr = @download.arr
      (0...@download.arr.length()).map do |i|
        @download.arr[i]
      end
    end
  end
end
