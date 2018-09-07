class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  has_many :contacts
  has_many :gifts, :through => :contact
  has_many :lists


  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
