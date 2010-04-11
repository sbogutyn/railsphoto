class Zdjecie < ActiveRecord::Base
    attr_accessible :opis, :photo
    has_attached_file :photo, :styles => {
        :thumb=> "200x200#",
        :small  => "300x300>",
    }  
    has_many :komentarze
end
