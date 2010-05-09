class Kategoria < ActiveRecord::Base
  attr_accessible :nazwa
  validates_presence_of :nazwa
  has_many :zdjecia
end
