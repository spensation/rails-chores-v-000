class Chore < ApplicationRecord

  # t.string "name"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_many :tasks
  has_many :user_chores
  has_many :users, through: :user_chores
  
  validates :name, :presence => true
end
