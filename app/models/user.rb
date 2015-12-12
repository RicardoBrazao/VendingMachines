class User < ActiveRecord::Base
  has_many :vending_machines
end