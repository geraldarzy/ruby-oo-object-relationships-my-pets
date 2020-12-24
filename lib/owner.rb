require "pry"
class Owner
  # code goes here
  attr_accessor 
  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def say_species
    return "I am a human."
  end

  def self.count 
    self.all.count
  end

  def self.reset_all 
    self.all.clear
  end

  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
  Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(cat_name)
    Cat.buy(cat_name, self)

  end
  
  def buy_dog(dog_name)
    Dog.buy(dog_name, self)

  end
  
  def walk_dogs
    dogs.each{|d| d.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|c| c.mood = "happy"}

  end

  def sell_pets
    Cat.all.each do |c|
       c.mood = "nervous"
       c.owner=nil
    end
    Dog.all.each do |c| 
      c.mood = "nervous"
      c.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
