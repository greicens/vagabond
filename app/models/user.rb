class User < ApplicationRecord
  has_many :posts
  after_initialize :init
  mount_uploader :photo, PhotoUploader
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  def init
    self.points ||= 15
    
  end

  extend FriendlyId
  friendly_id :username, use: :slugged
end
