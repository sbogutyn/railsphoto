class MapaController < ApplicationController
  def index
    @markery = Marker.all(:include => :galerie)
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([54.37,18.64],10)
    for marker in @markery
      if marker.galerie.exists?
        info = ""
        for galeria in marker.galerie.all
          if galeria.zdjecia.exists?
            tmp = "<a href=\"galerie/#{galeria.id}\"><img src=\"#{galeria.zdjecia.first.photo.url(:small)}\" width=\"50px\" height=\"50px\"></a>"
            info += tmp
          end
        end
          @map.overlay_init(GMarker.new([marker.wysokosc, marker.szerokosc],:title => "test", :info_window => info))
      end
    end
  end
end
