class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :poke_id, presence: true, uniqueness: true
end
