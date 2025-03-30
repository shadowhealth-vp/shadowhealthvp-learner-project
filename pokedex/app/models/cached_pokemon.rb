# Acts as a caching layer for the DB that stores Pokemon data. Holds the unstructured data

class CachedPokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :data, presence: true
end
