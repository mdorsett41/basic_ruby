class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at
 
  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end
 
  
  def ==(game)
    name == game.name && 
    system == game.system &&
    year == game.year
  end
end


class Library
  attr_accessor :games

  def initialize(games)
    self.games = games
  end

  def has_game?(search_game)
    for game in games               # i dont understand this who game in games thing
      return true if game == search_game
    end
    false
  end
end

##########
class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at
 
  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end
end

class Library
  attr_accessor :games

  def initialize(games)
    self.games = games
  end

  def has_game?(search_game)
    for game in games
      return true if game == search_game
    end
    false
  end
  
  def add_game(game)
    @games << game  # when was this created? 
  
  end

###########

class ArcadeGame < Game
  attr_accessor :weight

  def initialize(name, options={})
    super
    self.weight = options[:weight]
  end
end

class ConsoleGame < Game
end  


# vs @weight= weight 
# super(name)

# I think it might be because weight is optional vs required 


#########


=begin 

Our to_s method will come in very handy.
 Whenever we need to output a game, rather 
 than calling a method on the game, we can just 
 output the game object and Ruby will call to_s 
 on it automatically. Refactor both classes below. 
 Change the description method of Game to use 
 the to_s method implicitly. Then remove any 
 duplicated code in ConsoleGame. Note: you'll 
 need to use self inside a class to reference the entire object.

? game vs game object

? also i think it would be helpful to see what they mean by that...
... is it pacman.to_s called from within the class ConsoleGame? or
.... puts pacman - and then it automatically does that

=end

class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at
  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end

  def to_s
    self.name
  end

  def description
    "#{self.name} was released in #{self.year}."
  end
end

class ConsoleGame < Game
  def to_s
    "#{self.name} - #{self.system}"
  end

  def description
    "#{self.name} - #{self.system} was released in #{self.year}." 
    #says to refactor description so that it implicitly calls to_s ??? not sure i get it
  end
end

###########
game.rb
class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at
 
  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end
end


seed.rb
GAMES = [
  Game.new('Contra', year: 1987, system: 'NES'),
  Game.new('Civilization', year: 1991, system: 'PC'),
  Game.new('The Legend of Zelda', year: 1986, system: 'NES'),
  Game.new('Mega Man X2', year: 1995, system: 'SNES'),
  Game.new('Super Metroid', year: 1994, system: 'SNES'),
  Game.new('Sim City 2000', year: 1993, system: 'PC'),
  Game.new('Starcraft', year: 1998, system: 'PC')
]

library.rb 
class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def list
    games.each { |game| puts game.name}  #??????? why is this game.name and not 
                                         #        game[:name]
   
  end
end

################

#refactoring to add private method emulate and remove repeat code in play and 
#sceenshot. Want to go over how this is running and how it interacts with file EMULATOR.RB

#file called GAME.RB
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end

  def play
    emulate do |emulator|
      emulator.play(self)
        end
        end

  def screenshot
    emulate do |emulator|
      emulator.start(self)
      emulator.screenshot
    end
    end
  private 
  def emulate
     begin
      emulator = Emulator.new(system)
       yield emulator
     rescue Exception => e
      puts "Emulator failed: #{e}"
    end
  end
  
end

#File called EMULATOR.RB


class Emulator
  def initialize(system)
    # Creates an emulator for the given system
  end
 
  def play(game)
    # Runs the given game in the emulator
  end
 
  def start(game)
    # Loads the given game but doesn't run it
  end
 
  def screenshot
    # Returns a screenshot of the currently loaded game
  end
end

#######

