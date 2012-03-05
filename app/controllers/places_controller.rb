class PlacesController < ApplicationController
  before_filter [:load_event]
  skip_before_filter :require_user, :only=>[:public]
    
  # GET /places
  # GET /places.xml
  def index
    @places = @event.places.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = @event.places.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = @event.places.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = @event.places.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = @event.places.build(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to([@event,@place], :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = @event.places.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to([@event, @place], :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = @event.places.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(event_places_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
    @places = @event.places.all

   respond_to do |format|
     format.xml
     format.json {
       render :json => @places.to_json(:only => [:id, :name], :methods => [:image_url])
     }
   end
  end

  private
    def load_event
      @event = Event.find(params[:event_id])
    end
end
