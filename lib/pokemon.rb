class Pokemon
    attr_accessor :name, :type, :id, :db
    def initialize(name:, type:, id:, db:)
        # binding.pry
        @name = name
        @id = id
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        # binding.pry
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end
    def self.find(id, db)
        # binding.pry
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id == ?
        SQL
        found = db.execute(sql, id).flatten
        new_poke = Pokemon.new(name:found[1], type:found[2], id:found[0], db:db)

        new_poke
    end
end
