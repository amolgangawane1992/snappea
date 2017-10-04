class Restaurant < ApplicationRecord
	has_many :menus

	validates :name, presence:true
	validates :rating, presence:true
	validates :address, presence:true
	validates :description, presence:true
end
