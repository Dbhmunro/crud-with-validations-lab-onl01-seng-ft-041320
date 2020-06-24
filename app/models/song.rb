class Song < ApplicationRecord
    
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year, message: "must be unique for the year"}
    validates :released, inclusion: { in: [true, false]}
    validates_presence_of :release_year, if: -> { released? }
    validates :artist_name, presence: true
    validates_numericality_of :release_year, less_than_or_equal_to: Date.today.year, allow_nil: true

end
