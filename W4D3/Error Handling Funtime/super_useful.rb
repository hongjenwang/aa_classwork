require "byebug"
# PHASE 2
def convert_to_int(str)
  Integer(str)
end

class CoffeeError < StandardError
  def message
    "Coffe is cool, but fruit is cooler"
  end
  def message_2
    "test is cool, but fruit is cooler"
  end
end

class AngryError < StandardError
  def message
    "You didn't give me what I want"
  end
end


# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  count = 0 
  
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise AngryError
  end
 
end
def give_coffee
  puts "Feed me a coffee! (Enter coffee:)"
  coffee = gets.chomp
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
    puts e.message_2
    retry
  rescue AngryError => e
    puts e.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


