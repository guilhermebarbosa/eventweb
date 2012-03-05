class EventsController < ApplicationController
  skip_before_filter :require_user, :only=>[:public, :public_event]
  before_filter :instantiate_controller_and_action_names
  before_filter [:load_event_types], :only=>[:new,:edit, :create, :update]
  
  # GET /events
  # GET /events.xml
  def index
    @events = Event.order(:name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.event_type_id = "1"

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  def public_event
   @event = Event.find(params[:event_id])

   respond_to do |format|
     format.xml
     format.json { 
           render :json => @event.to_json(:include => 
           { 
           :event_type => { :only => [:id, :name] }
           },
           :except => [:event_type_id, :created_at, :updated_at, :map_file_name, :map_content_type, :map_file_size, :map_updated_at], :methods => [:map_url])
           }
   end
  end
  
  def public
   @events = Event.all

   respond_to do |format|
     format.xml
     format.json { 
       render :json => @events.to_json(:include => 
       { 
       :event_type => { :only => [:id, :name] }
       },
       :except => [:event_type_id, :created_at, :updated_at, :map_file_name, :map_content_type, :map_file_size, :map_updated_at], :methods => [:map_url])
       }
   end
  end
  
  private
    def load_event_types
      @event_types = EventType.all.collect { |c| [c.name, c.id] }
    end
    def instantiate_controller_and_action_names
        @current_action = action_name
        @current_controller = controller_name
    end
end