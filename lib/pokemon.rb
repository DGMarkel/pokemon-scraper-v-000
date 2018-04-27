class Pokemon
attr_accessor :id, :type, :name, :db, :hp
@@all = []

  def initialize(name)
    @name = name
    name.each {|k, v| self.send "#{k}=", v}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon_hash = {
    :id => id,
    :name => pokemon_from_db[1],
    :type => pokemon_from_db[2],
    :hp => pokemon_from_db[3],
    :db => db
    }
    Pokemon.new(pokemon_hash)
  end

  def alter_hp(new_hp, db)
    binding.pry
    db.execute("UPDATE pokemon SET hp = ? where id = self.id",new_hp)
  end




end
