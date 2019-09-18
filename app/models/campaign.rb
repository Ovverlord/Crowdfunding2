class Campaign < ApplicationRecord

	has_one_attached :image
	has_many :taggings,  dependent: :destroy
	has_many :tags, through: :taggings
	has_many :comments, dependent: :destroy
	validates :title, :summary, :body, presence: true
	belongs_to :category
	belongs_to :user

	def all_tags
		self.tags.map(&:name).join(', ')
	end

	def all_tags=(names)
		self.tags = names.split(',').map do |name|
			Tag.where(name: name.strip).first_or_create
		end
	end
end
