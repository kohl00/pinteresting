class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  validates :email, :name, presence: true
  validates_format_of :email, with: /@/
  has_many :pins, dependent: :destroy
  has_many :likes

  def likes?(pin)
  	pin.likes.where(user_id: id).any?
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.find_by(:uid => session['devise.twitter_uid'])
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.uid+"@twitter.com",
                            password:Devise.friendly_token[0,20]
                          )
      end

    end
  end
end
