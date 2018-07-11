class Admin < ApplicationRecord
	extend Devise::Models
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 
end
