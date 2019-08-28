module CommandCenter
  class Plateau
    OutOfBound = Class.new(StandardError)

    def self.with(coord, rovers)
      x, y = coord.split(/\s/)
      coordinate = Coordinate.new(x: x, y: y)
      raise OutOfBound if rovers.any? { |rover| rover.coordinate > coordinate }
      new(coordinate: coordinate, rovers: rovers)
    end

    def initialize(coordinate:, rovers:)
      @coordinate = coordinate
      @rovers = rovers
    end

    def to_s
      rovers.map(&:to_s)
    end

    private

    attr_reader :coordinate, :rovers
  end
end
