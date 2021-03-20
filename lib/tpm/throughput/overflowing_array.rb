# frozen_string_literal: true

module ThroughputMonitor
  class OverflowingArray
    attr_reader :arr
    attr_accessor :size

    def initialize(size = 20)
      @size = size
      @arr = []
    end

    def add(element)
      if @arr.length() >= size
        @arr.shift
      end
      @arr << element
    end
  end
end
