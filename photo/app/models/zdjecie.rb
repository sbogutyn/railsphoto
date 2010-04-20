class Zdjecie < ActiveRecord::Base
    attr_accessible :opis, :photo, :tag_list
    acts_as_taggable_on :tags
    has_attached_file :photo, :styles => {
        :thumb=> "200x200#",
        :small  => "300x300>",
    }
    has_many :komentarze
    ajaxful_rateable :dimensions => [:ocena], :allow_update => true
end
