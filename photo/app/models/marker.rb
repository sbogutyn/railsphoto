class Marker < ActiveRecord::Base
  has_many :galerie
  accepts_nested_attributes_for :galerie
end
