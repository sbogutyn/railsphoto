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
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([54.37,18.64],10)
    @map.overlay_init(GMarker.new([54.37, 18.64],:title => "Gdansk", :info_window => "Duża wieś!"))
  end

  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
end
