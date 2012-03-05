class EstablishmentsController < ApplicationController
  skip_before_filter :require_user, :only=>[:public]

  before_filter [:load_event]
  before_filter [:load_establishment_types], :only=>[:new,:edit, :create, :update]
  
  # GET /establishments
  # GET /establishments.xml
  def index
    @establishments = @event.establishments.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @establishments }
    end
  end

  # GET /establishments/1
  # GET /establishments/1.xml
  def show
    @establishment = @event.establishments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @establishment }
    end
  end

  # GET /establishments/new
  # GET /establishments/new.xml
  def new
    @establishment = @event.establishments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @establishment }
    end
  end

  # GET /establishments/1/edit
  def edit
    @establishment = @event.establishments.find(params[:id])
  end

  # POST /establishments
  # POST /establishments.xml
  def create
    @establishment = @event.establishments.build(params[:establishment])

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to([@event, @establishment], :notice => 'Establishment was successfully created.') }
        format.xml  { render :xml => @establishment, :status => :created, :location => @establishment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @establishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /establishments/1
  # PUT /establishments/1.xml
  def update
    @establishment = @event.establishments.find(params[:id])

    respond_to do |format|
      if @establishment.update_attributes(params[:establishment])
        format.html { redirect_to([@event, @establishment], :notice => 'Establishment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @establishment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.xml
  def destroy
    @establishment = @event.establishments.find(params[:id])
    @establishment.destroy

    respond_to do |format|
      format.html { redirect_to(event_establishments_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
   @establishments = @event.establishments.all

   respond_to do |format|
     format.xml
     format.json {
       render :json => @establishments.to_json(:include => {
       :establishment_type => { :only => [:id, :name] }
       },
       :except => [:created_at, :updated_at, :event_id])
     }
   end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end
    def load_establishment_types
      @establishment_types = @event.establishment_types.all.collect { |c| [c.name, c.id] }
    end
end