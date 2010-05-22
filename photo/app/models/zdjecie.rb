class Zdjecie < ActiveRecord::Base
#    attr_accessible :opis, :photo, :licznik, :tag_list, :galeria_id, :crop_x, :crop_y, :crop_w, :crop_h
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    acts_as_taggable_on :tags
    has_attached_file :photo, :styles => {
        :thumb => "90x90>",
        :smaller  => "130x130>",
        :small  => "150x150>",
        :medium  => "170x170>",
        :large => "700x500>"},
        :processors => [:cropper]
    has_many :komentarze, :dependent=> :destroy
    belongs_to :galeria
    belongs_to :kategoria
    ajaxful_rateable :dimensions => [:ocena], :allow_update => true

    after_update :reprocess_photo, :if => :cropping?
  
    def cropping?
      !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
    end
    
    def photo_geometry(style= :original)
      @geometry ||={}
      @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
    end
    
    private
    
    def reprocess_photo
      photo.reprocess!
    end

    def self.per_page
      50
    end

end

