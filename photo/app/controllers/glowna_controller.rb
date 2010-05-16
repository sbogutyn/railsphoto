class GlownaController < ApplicationController
  def index
    @kategorie = Kategoria.all

    if params[:search]
      @zdjecia = Zdjecie.tagged_with(params[:search], :on => :tags)
      tag_cloud
    else
      @zdjecia = Zdjecie.all
      tag_cloud
    end
    @markery = Marker.all(:include => :galerie)
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([54.37,18.64],10)
    for marker in @markery
      if marker.galerie.exists?
      @map.overlay_init(GMarker.new([marker.wysokosc, marker.szerokosc],:title => "test", :info_window => "<a href=\"galerie/#{marker.galerie.first.id}\"><img src=\"#{marker.galerie.first.zdjecia.first.photo.url(:small)}\" width=\"50px\" height=\"50px\"></a>"))
      end
    end
  end

  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
end
