class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets, dependent: :destroy
  has_many :events, through: :tickets

  def self.generate_password
    Devise.friendly_token.first(8)
  end

  def self.check_if_exists(email, phone)
    User.find_by email: email, phone: phone
  end
end
