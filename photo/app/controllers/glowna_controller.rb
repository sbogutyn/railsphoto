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
  end

  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
end
