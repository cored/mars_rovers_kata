require "spec_helper"

describe CommandCenter::Commands::M do
  subject(:move) { described_class }

  let(:coordinate) { CommandCenter::Coordinate.new(x: 5, y: 5) }
  let(:direction) do
    CommandCenter::Direction.new(coordinate: coordinate,
                                 orientation: orientation)
  end

  describe "#call" do
    context "when orientation is N" do
      let(:orientation) { "N" }

      it "moves up" do
        expect(move.call(direction).to_s).to eql "5 6 N"
      end
    end

    context "when orientation is S" do
      let(:orientation) { "S" }

      it "moves down" do
        expect(move.call(direction).to_s).to eql "5 4 S"
      end
    end

    context "when orientation is W" do
      let(:orientation) { "W" }

      it "moves left" do
        expect(move.call(direction).to_s).to eql "4 5 W"
      end
    end

    context "when orientation is E" do
      let(:orientation) { "E" }

      it "moves right" do
        expect(move.call(direction).to_s).to eql "6 5 E"
      end
    end
  end
end
