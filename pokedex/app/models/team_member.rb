class TeamMember < ApplicationRecord
  belongs_to :team
  attribute :types, :string, array: true, default: []
end
