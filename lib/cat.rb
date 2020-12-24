class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name 

  @@all = []
  

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save

  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.buy(name, owner)
    self.new(name,owner)
  end


  

  
end