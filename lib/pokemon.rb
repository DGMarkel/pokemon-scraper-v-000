class Pokemon
attr_accessor :id, :type, :name, :db
@@all = []

  def initialize(name)
    @name = name
    name.each {|k, v| self.send "#{k}=", v}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  
    pokemon_hash = {
    :name => pokemon_from_db[0][1],
    :type => pokemon_from_db[0][2],
    :db => db
    }
    Pokemon.new(pokemon_hash)
  end




end
