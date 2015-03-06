require 'pry'
require 'sqlite3'

# DATABASE = SQLite3::Database.new("slideshow.db")
#
# DATABASE.results_as_hash = true
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS slides (id INTEGER PRIMARY KEY,
#                   title TEXT, body TEXT)")

class Slide
  
  attr_reader :id
  
  attr_accessor :title, :body 
  
  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
  end
  
  def insert
    DATABASE.execute("INSERT INTO slides (title, body) 
                      VALUES ('#{@title}', '#{@body}')")
    @id = DATABASE.last_insert_row_id
  end
  
  def edit(id, field, value)
    DATABASE.execute("UPDATE slides SET '#{field}' = '#{value}' 
                      WHERE id = '#{id}'")
  end
  
  def self.find(id)
    result = DATABASE.execute("SELECT * FROM slides WHERE id = #{id}")[0]
    
    self.new(result)
  end
  
  def self.all
    results = DATABASE.execute("SELECT * FROM slides")
    
    results.map { |row_hash| self.new(row_hash) }
  end
  
  def to_hash
    {
      id: id,
      title: title,
      body: body,
    }
  end
  
  def self.delete(order)
    DATABASE.execute("DELETE FROM slides where id = #{id}")
  end
end