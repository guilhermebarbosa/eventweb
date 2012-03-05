class EstablishmentTypesController < ApplicationController
  before_filter [:load_event]
  
  # GET /establishment_types
  # GET /establishment_types.xml
  def index
    @establishment_types = @event.establishment_types.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @establishment_types }
    end
  end

  # GET /establishment_types/1
  # GET /establishment_types/1.xml
  def show
    @establishment_type = @event.establishment_types.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @establishment_type }
    end
  end

  # GET /establishment_types/new
  # GET /establishment_types/new.xml
  def new
    @establishment_type = @event.establishment_types.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @establishment_type }
    end
  end

  # GET /establishment_types/1/edit
  def edit
    @establishment_type = @event.establishment_types.find(params[:id])
  end

  # POST /establishment_types
  # POST /establishment_types.xml
  def create
    @establishment_type = @event.establishment_types.build(params[:establishment_type])

    respond_to do |format|
      if @establishment_type.save
        format.html { redirect_to([@event, @establishment_type], :notice => 'Establishment type was successfully created.') }
        format.xml  { render :xml => @establishment_type, :status => :created, :location => @establishment_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @establishment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /establishment_types/1
  # PUT /establishment_types/1.xml
  def update
    @establishment_type = @event.establishment_types.find(params[:id])

    respond_to do |format|
      if @establishment_type.update_attributes(params[:establishment_type])
        format.html { redirect_to([@event, @establishment_type], :notice => 'Establishment type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @establishment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /establishment_types/1
  # DELETE /establishment_types/1.xml
  def destroy
    @establishment_type = @event.establishment_types.find(params[:id])
    @establishment_type.destroy

    respond_to do |format|
      format.html { redirect_to(event_establishment_types_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
   @establishment_types = @event.establishment_types.all

   respond_to do |format|
     format.xml
     format.json { render :json => @establishment_types.to_json(:except => [:created_at, :updated_at, :event_id]) }
   end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end
end
