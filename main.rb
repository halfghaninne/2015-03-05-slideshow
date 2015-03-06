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

get "/slide/:id" do
  id = params[:id]
  slide = Slide.find(id)
  
  slide_hash = slide.to_hash
  slide_hash.to_json
end