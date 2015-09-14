class InterestingThing < ActiveRecord::Base
  belongs_to :student

  validates :name, uniqueness: true
end
