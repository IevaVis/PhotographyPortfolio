class Album < ApplicationRecord
	belongs_to :admin
	has_many_attached :images
	validates :title, :body, presence: true
end