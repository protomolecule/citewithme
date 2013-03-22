class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :sauces
  has_many :cites
  has_many :htags
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
