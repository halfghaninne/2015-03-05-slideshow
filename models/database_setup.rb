require 'sqlite3'

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides
                  (order INTEGER PRIMARY KEY,
                  title TEXT, 
                  body_text TEXT)"