class Group < ApplicationRecord
has_many :group_users, dependent: :destroy
belongs_to :owner, class_name: 'User'
has_many :users, through: :group_users

validates :name, presence: true
validates :introduction, presence: true
has_one_attached :group_image

def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
end

def is_owned_by?(user)
    owner.id == user.id
end
 
end