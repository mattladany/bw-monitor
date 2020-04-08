# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BandwidthMonitor do
  it 'has a version number' do
    expect(BandwidthMonitor::VERSION).not_to be nil
  end
end
