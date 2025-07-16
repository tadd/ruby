require_relative 'libtime'

class Point
  attr_reader :x, :y
  def initialize(x, y)
    @x, @y = x, y
  end

  def manhattan = @x + @y
  def manhattan2 = x + y
end

# DPoint = Data.define(:x, :y)
# class DPoint
#   def manhattan = x + y
# end
class DPoint < Data.define(:x, :y)
  def initialize(*v)
    @x, @y = *v
    super
  end
  def manhattan = @x + @y
end

# SPoint = Struct.new(:x, :y)
# class SPoint
#   def manhattan = x + y
# end
class SPoint < Struct.new(:x, :y)
  def initialize(x, y)
    super
    @x, @y = x, y
  end
  def manhattan = @x + @y
end


N = 10_000_000
c = Point.new(1, 2)
d = DPoint.new(1, 2)
s = SPoint.new(1, 2)

5.times do
tc = cputime do
  N.times do
    c.manhattan
  end
end

tc2 = cputime do
  N.times do
    c.manhattan2
  end
end

td = cputime do
  N.times do
    d.manhattan
  end
end

ts = cputime do
  N.times do
    s.manhattan
  end
end

pp [tc, tc2, td, ts].map{_1.round(9)}
end
