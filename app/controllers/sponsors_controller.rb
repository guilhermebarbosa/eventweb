class SponsorsController < ApplicationController
  before_filter [:load_event]
  before_filter [:load_sponsor_types], :only=>[:new,:edit, :create, :update]
  skip_before_filter :require_user, :only=>[:public]
  
  # GET /sponsors
  # GET /sponsors.xml
  def index
    @sponsors = @event.sponsors.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sponsors }
    end
  end
  
  def insert_sponsor_type_select
    @sponsor_type = @event.sponsor_types.build
    @sponsor_type.name = params[:name]
    @sponsor_type.save
    
    @selected = params[:name]
    
    @sponsor_types = @event.sponsor_types.order(:name)
    render :partial => "sponsor_type", :sponsor_types => @sponsor_types, :selected => @selected
  end

  # GET /sponsors/1
  # GET /sponsors/1.xml
  def show
    @sponsor = @event.sponsors.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.xml
  def new
    @sponsor = @event.sponsors.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit
    @sponsor = @event.sponsors.find(params[:id])
  end

  # POST /sponsors
  # POST /sponsors.xml
  def create
    @sponsor = @event.sponsors.build(params[:sponsor])
    
    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to([@event, @sponsor], :notice => 'Sponsor was successfully created.') }
        format.xml  { render :xml => @sponsor, :status => :created, :location => @sponsor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sponsor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.xml
  def update
    @sponsor = @event.sponsors.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        format.html { redirect_to([@event, @sponsor], :notice => 'Sponsor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sponsor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.xml
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to(event_sponsors_url) }
      format.xml  { head :ok }
    end
  end

  def public
    @sponsors = @event.sponsors.all

    respond_to do |format|
      format.xml
      format.json {
          render :json => @sponsors.to_json(:include => { 
          :sponsor_type => { :only => [:id, :name] }},
          :only => [:id, :name, :description, :site], :methods => [:image_url])
        }
    end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end
    def load_sponsor_types 
      @sponsor_types = @event.sponsor_types.all.collect { |c| [c.name, c.id] }
      @sponsor_types.concat(["Novo"])
    end
end