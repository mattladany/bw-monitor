require './lib/bandwidth_monitor'

RSpec.describe BandwidthMonitor do
  it "has a version number" do
    expect(BandwidthMonitor::VERSION).not_to be nil
  end

#  it "does something useful" do
#    expect(false).to eq(true)
#  end
end
