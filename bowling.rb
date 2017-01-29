 # class Player
 #   def initialize(name)
 #     @name = name
 #   end
 # end

class Game
  attr_accessor :frames

  def initialize
    @frames = []
  end

  def rolls(num)
    frames.push(num)
  end

  def even?
    roll%2==0
  end

  def odd?
    !even2?
  end

  def calculate_score(rolls)
    rolls.inject(0){|memo,s| memo+=s}
  end

  def strike?
    rolls[0] == 10
  end

  def spare?
    rolls[0] + rolls[1] == 10
  end

  def format_input(rolls)
   case rolls
     when spare?
       rolls.gsub(/[0-9]/,'/')
     when strike?
       rolls.gsub(/[0-9]/,'X')
    end
  end

  def print_score
    print "Frame Roll Roll Score\n"
    frames.each do |frame|
      result=0
      frame.each_slice(2).with_index do |(roll1,roll2),frame_num|
        #print "#{name} final Score"
        puts  "#{frame_num+1} #{roll1} #{roll2} #{result+=calculate_score([roll1,roll2])}"
      end
    end
  end
end
