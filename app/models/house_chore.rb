class HouseChore < ApplicationRecord
  # t.integer "house_id"
  # t.integer "chore_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false


  belongs_to :house
  belongs_to :chore
  has_many :tasks
  has_many :user_chores
  has_many :users, through: :user_chores

  # validates :house, :presence => true
  # validates :chore, :presence => true

  scope :user_house, ->  (house_id){ where house_id: house_id }
end
