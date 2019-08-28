module CommandCenter
  Direction = Struct.new(:coordinate, :orientation, keyword_init: true) do
    def self.for(input)
      x, y, orientation = input.split(/\s/)
      new(
        orientation: orientation,
        coordinate: Coordinate.new(x: x, y: y)
      )
    end

    def to_s
      "#{coordinate} #{orientation}"
    end

    def with(new_orientation: orientation, new_coordinate: coordinate)
      self.class.new(orientation: new_orientation, coordinate: new_coordinate)
    end
  end
end
