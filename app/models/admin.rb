class Admin < ActiveRecord::Base
	extend Devise::Models
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 
end
