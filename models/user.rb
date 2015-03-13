require 'pry'
require 'sqlite3'

class User < ActiveRecord::Base
  has_many :slides, foreign_key: "user_id"
end

