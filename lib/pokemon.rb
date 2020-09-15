class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id: , name: , type: , db: )
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
 
      db.execute(sql, name, type)
      # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
 
    db.execute(sql, id)
  end

end
