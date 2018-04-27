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
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = 'id'")
  end




end
