# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ThroughputMonitor do
  it 'has a version number' do
    expect(ThroughputMonitor::VERSION).not_to be nil
  end
end
