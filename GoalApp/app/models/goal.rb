class Goal < ApplicationRecord
  validates :list_of_goal, :user_id, presence: true
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
end