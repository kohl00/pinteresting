class Pin < ActiveRecord::Base
	belongs_to :user
	has_many :likes
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	validates :user_id, :description, :image, presence: true
  	default_scope -> { order('created_at DESC') }

  	def liked_by?(user)
      likes.where(:user_id => user.id).any?
    end


end
