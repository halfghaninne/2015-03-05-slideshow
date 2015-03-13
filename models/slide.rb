require 'pry'
require 'sqlite3'

# DATABASE = SQLite3::Database.new("slideshow.db")
#
# DATABASE.results_as_hash = true
#
# DATABASE.execute("CREATE TABLE IF NOT EXISTS slides (id INTEGER PRIMARY KEY,
#                   title TEXT, body TEXT)")

class Slide < ActiveRecord::Base
  
  belongs_to :user
  
  def to_hash
    {
      id: id,
      title: title,
      body: body,
      user_id: user_id,
    }
  end
  
  # def add_user
  #   DATABASE.execute("ALTER TABLE slides ADD COLUMN (user)")
  # end

end

