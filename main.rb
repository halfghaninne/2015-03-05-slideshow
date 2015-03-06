require 'sinatra'
require 'pry'
require 'sqlite3'
require 'json'

DATABASE = SQLite3::Database.new("slideshow.db")

require_relative "models/database_setup.rb"
require_relative "models/slide.rb"

get "/" do 
  erb :homepage
end