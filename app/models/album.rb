class Album < ApplicationRecord
	has_many_attached :images
	belongs_to :admin
	validates :title, :body, presence: true

end