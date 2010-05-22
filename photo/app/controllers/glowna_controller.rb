class GlownaController < ApplicationController
  def index
    @kategorie = Kategoria.all

    @ostatnie = Zdjecie.all(:order => "created_at DESC", :limit => 10) 

    @najczesciej = Zdjecie.all(:order => "licznik DESC", :limit => 3) 

    if params[:search]
      @zdjecia = Zdjecie.tagged_with(params[:search], :on => :tags)
      tag_cloud
    elsif params[:szukaj_opisu]
      if params[:szukaj_opisu].length == 0
        flash[:notice] = "Nie znaleziono żadnego zdjęcia, należy wpisać jakiś tekst do wyszukiwarki!"
        redirect_to root_path       
      end
      @zdjecia = Zdjecie.find(:all, :conditions => [ "opis LIKE ?","%" + params[:szukaj_opisu] +"%"]) 
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

  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
end
