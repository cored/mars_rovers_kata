module CommandCenter
  Coordinate = Struct.new(:x, :y, keyword_init: true) do
    include Comparable

    def to_s
      "#{x} #{y}"
    end

    def <=>(other)
      return 1 if x.to_i > other.x.to_i  || y.to_i > other.y.to_i
      return -1 if x.to_i < other.x.to_i  || y.to_i < other.y.to_i
      0
    end

    def with(coord)
      self.class.new(x: x.to_i + Array(coord).first,
                     y: y.to_i + Array(coord).last)
    end
  end
end
