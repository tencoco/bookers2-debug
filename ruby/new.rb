class Car

  def self.run(distance)

    if distance <= 3

      puts "徒歩で#{distance}キロ歩きます."

    elsif distance <= 5

      puts "自転車で#{distance}キロ走ります"

    elsif distance <=100

      puts "車で#{distance}キロ走ります"

    else return puts "#{distance}キロは走りません"

    end

    def turn(direction)

    puts "#{direction}に曲がります。"

    end

    def run(distance)

    puts "車で#{distance}キロ走ります。"

    end

  end

end

puts "走る距離を入力"

x = gets.to_i

Car.run(x)

class Car

  def move(direction,distance)
    self.turn(direction)
    self.run(distance)
  end

  def turn(direction)
    puts "#{direction}に曲がります。"
  end

  def run(distance)
    puts "車で#{distance}キロ走ります。"
  end
end

car = Car.new
car.move("右",5)

class Car
  def self.run(distance)
    puts "車で#{distance}キロ走ります。"
  end
end

Car.run(10)

class Car
  def self.turn(direction)
    puts "#{direction}に曲がります。"
  end
end

Car.turn("右")
