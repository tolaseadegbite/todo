class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy

  def completed
    List.where(user_id: id, completed: true)
  end

  def uncompleted
    List.where(user_id: id, completed: false)
  end
end
