class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :lockable
  after_create :send_email_welcome     
  has_many :orders    
  def send_email_welcome
    UserMailer.welcome_email(self).deliver
  end         
end
