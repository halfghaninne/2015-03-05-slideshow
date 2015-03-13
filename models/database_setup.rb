require 'sqlite3'

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides
                  (id INTEGER PRIMARY KEY,
                  title TEXT, 
                  body TEXT
                  FOREIGN KEY(user_id) REFERENCES users(id))")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users
                  (id INTEGER PRIMARY KEY,
                  password TEXT)")