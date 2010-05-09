class Komentarz < ActiveRecord::Base
  attr_accessible :autor, :tresc
  belongs_to :zdjecie
end
