class Galeria < ActiveRecord::Base
  attr_accessible :nazwa, :autor, :opis
  has_many :zdjecia, :dependent=> :destroy 
end
