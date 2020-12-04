class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :nickname, :first_name, :last_name, :kana_first, :kana_last, :birthday ,presence: true
end
