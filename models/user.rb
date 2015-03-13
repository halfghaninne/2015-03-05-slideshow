require 'pry'
require 'sqlite3'

class User < ActiveRecord::Base
  has_many :slides
end
