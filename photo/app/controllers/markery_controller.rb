class MarkeryController < ApplicationController
  # GET /markery
  def index
    @markery = Marker.all
  end

  # GET /markery/1
  def show
    @marker = Marker.find(params[:id])
  end

  # GET /markery/new
  def new
    @marker = Marker.new
    @marker.galerie.build


    # dla mapy
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([54.37,18.64],10)
  end

  # GET /markery/1/edit
  def edit
    @marker = Marker.find(params[:id])
  end

  # POST /markery
  # POST /markery.xml
  def create
    @marker = Marker.new(params[:marker])

    respond_to do |format|
      if @marker.save
        flash[:notice] = 'Marker was successfully created.'
        format.html { redirect_to(@marker) }
        format.xml  { render :xml => @marker, :status => :created, :location => @marker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /markery/1
  # PUT /markery/1.xml
  def update
    @marker = Marker.find(params[:id])

    respond_to do |format|
      if @marker.update_attributes(params[:marker])
        flash[:notice] = 'Marker was successfully updated.'
        format.html { redirect_to(@marker) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /markery/1
  # DELETE /markery/1.xml
  def destroy
    @marker = Marker.find(params[:id])
    @marker.destroy

    respond_to do |format|
      format.html { redirect_to(markery_url) }
      format.xml  { head :ok }
    end
  end
end
