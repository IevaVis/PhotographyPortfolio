class Album < ApplicationRecord
	belongs_to :admin
	validates :title, :body, presence: true

end