class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :campaigns
  has_many :comments, dependent: :destroy
  validates :username, presence: true
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :validatable
         
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
end
