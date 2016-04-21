require "journey_log"

describe JourneyLog do
  let(:journey) { double :journey}
  let(:entry_station) { double :entry_station}
  let(:exit_station) { double :exit_station}
  let(:journey_class) { double :journey_class, new: journey }
  # let(:journey){ {entry_station: entry_station, exit_station: exitstation} }
  # subject { JourneyLog.new journey_class }

  xit "initializes with a journey_class" do
    expect(subject.journey_class).to eq journey_class
  end

  describe "#start" do
    it "starts a new journey" do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end
  end

  describe "#finish" do
    it "should add exit station to @journeys" do
      expect(subject.finish(exit_station)[entry_station]).to include exit_station
    end

  end

  describe "#journeys" do
    it "returns a duplicate of @journeys" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to eq {entry_station => exit_station}
    end
  end

end
