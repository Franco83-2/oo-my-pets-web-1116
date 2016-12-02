class Owner
  attr_accessor :mood, :name, :buy_fish, :pets
  attr_reader :species, :say_species

@@all = []

  def initialize(name)
    @name = name
    @mood = "nervous"
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
    self.class.all << self
  end

  def self.reset_all
    all.clear
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish)
    pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
      @pets[:dogs].each {|dog| dog.mood = "nervous"}
      @pets[:cats].each {|cat| cat.mood = "nervous"}
      @pets[:fishes].each {|fish| fish.mood = "nervous"}
      @pets.each {|type,pets| pets.clear}
  end

   def list_pets
    fishcount = @pets[:fishes].count; dogcount = @pets[:dogs].count; catcount = @pets[:cats].count
    return "I have #{fishcount} fish, #{dogcount} dog(s), and #{catcount} cat(s)."
  end
end