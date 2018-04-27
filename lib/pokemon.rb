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



end
