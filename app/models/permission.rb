class Permission < ApplicationRecord
  has_many :user_permissions, dependent: :destroy
end
