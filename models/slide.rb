require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("slideshow.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides
                  (order INTEGER PRIMARY KEY,
                  title TEXT, 
                  body_text TEXT)"

class Slide
  
  attr_reader :order
  
  attr_accessor :title, :body_text 
  
  def initialize(options)
    @title = options["title"]
    @body = options["body"]
  end
  
  def insert
    DATABASE.execute("INSERT INTO slides (title, body) 
                      VALUES ('#{@text}', '#{@body})")
    @order = DATABASE.last_insert_row_id
  end
  
  def edit(order, field, value)
    DATABASE.execute("UPDATE slides SET '#{field}' = '#{value}' 
                      WHERE order = '#{order}'")
  end
  
  def find(order)
    result = DATABASE.execute("SELECT * FROM slides WHERE order = #{order}").[0]
    
    self.new(result)
  end
  
  def self.all
    results = DATABASE.execute("SELECT * FROM slides")
    
    results.map { |row_hash| self.new(row_hash) }
  end
  
  def to_hash
    {
      order: order,
      title: title,
      body: body,
    }
  end
  
  def self.delete(order)
    DATABASE.execute("DELETE FROM slides where order = #{order}")
  end
end
