class Admin < ApplicationRecord
	extend Devise::Models
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 
  has_many :albums
end
