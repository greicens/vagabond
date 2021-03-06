class User < ApplicationRecord
  include UsersHelper

  has_many :posts

  mount_uploader :photo, PhotoUploader
  has_secure_password
  validates_uniqueness_of :username, :email

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end


  extend FriendlyId
  friendly_id :username, use: :slugged
end
