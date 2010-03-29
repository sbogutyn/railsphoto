class Zdjecie < ActiveRecord::Base
    attr_accessible :opis, :photo
    has_attached_file :photo, :styles => {
        :thumb=> "100x100#",
        :small  => "150x150>",
    }  

end
