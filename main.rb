require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'pry'
require 'sqlite3'
require 'json'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'slideshow_w_users.db'}

DATABASE = SQLite3::Database.new("slideshow_w_users.db")

require_relative "models/slide.rb"
require_relative "models/user.rb"
require_relative "models/database_setup.rb"



get "/" do 
  @slide_count = Slide.all.length
  
  erb :homepage
end

get "/slides" do
  all_slides = Slide.all.length
  
  slides_hash = all_slides.map {|s| s.to_hash}
  slides_hash.to_json
end


post "/slide/:id" do
  id = params[:id]
  slide = Slide.find(id)
  
  slide_hash = slide.to_hash
  slide_hash.to_json
end