# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  username              :string(255)
#  password              :string(255)
#  fullname              :string(255)
#  email                 :string(255)
#  address               :string(255)
#  remember_token        :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_confirmation :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :address, :email, :fullname, :password, :password_confirmation, :remember_token, :username
  has_many :entries, dependent: :destroy   
  validates(:username, presence: true)
  validates_uniqueness_of :username
  validates :username, :length => { :maximum => 10, :minimum=>6 }
  validates :password, :length => { :maximum => 10, :minimum=>6 }
  validates(:password_confirmation, presence: true)
  validates_confirmation_of :password
  validates(:fullname, presence: true)
  validates(:address, presence: true)
  validates(:email, presence: true)
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  before_save{ |user| user.username = username.downcase }
  before_save { |user| user.email = email.downcase }
  before_save:create_remember_token
  
  def self.check(username,password) 
	user =find_by_username(username)
	if user && user.password==password
		user
	else
		nil
	end
  end
  
  #include current_user's entries
  def feed 
  	Entry.where("user_id= ?",id)
  end
  
  private
  def create_remember_token
  	  self.remember_token = SecureRandom.urlsafe_base64
  end
  

  
  
end
