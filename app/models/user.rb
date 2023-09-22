class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Validations
  validates :name, presence: true
  # Associations
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy
end
