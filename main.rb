require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'pry'
require 'bcrypt'
require 'sqlite3'
require 'json'
require 'sinatra/activerecord'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'slideshow_w_users.db'}

DATABASE = SQLite3::Database.new("slideshow_w_users.db")

require_relative "models/slide.rb"
require_relative "models/user.rb"
require_relative "models/database_setup.rb"

before do
  if !session[:user_id].nil?
    @user = User.find(session[:user_id])
  end
end

get "/" do 
  @slide_count = Slide.all.length

  erb :homepage
end

get "/slides" do
  all_slides = Slide.all
  
  slides_hash = all_slides.map {|s| s.to_hash}
  slides_hash.to_json
end

post "/slide/:id" do
  id = params[:id]
  slide = Slide.find(id)
  
  slide_hash = slide.to_hash
  slide_hash.to_json
end

get "/login" do
  erb :login
end

get "/user/new" do
  erb :new_user
end

post "/user/register" do
  password_key = BCrypt::Password.create(params[:password])
  params[:password] = password_key
  @user = User.new(params)
  
  if @user.save
    redirect "/login"
  else
    redirect "/user/new"
  end
end

post "/login/auth" do
  @user = User.find_by_name(params[:name])
  
  if @user
    if BCrypt::Password.new(@user.password) == params[:password]
    session[:user_id] = @user.id
    redirect "/"
    else
    redirect "/login"
    end
  else
    redirect "/login"
  end
  
end

get "/logout" do
  
  session[:user_id] = nil
  @user = nil
  
  redirect "/"
end