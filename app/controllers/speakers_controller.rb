class SpeakersController < ApplicationController
  before_filter [:load_event]
  skip_before_filter :require_user, :only=>[:public]
  
  # GET /speakers
  # GET /speakers.xml
  def index
    @speakers = @event.speakers.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @speakers }
    end
  end

  # GET /speakers/1
  # GET /speakers/1.xml
  def show
    @speaker = @event.speakers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @speaker }
    end
  end

  # GET /speakers/new
  # GET /speakers/new.xml
  def new
    @speaker = @event.speakers.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @speaker }
    end
  end

  # GET /speakers/1/edit
  def edit
    @speaker = @event.speakers.find(params[:id])
  end

  # POST /speakers
  # POST /speakers.xml
  def create
    @speaker = @event.speakers.build(params[:speaker])

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to([@event, @speaker], :notice => 'Speaker was successfully created.') }
        format.xml  { render :xml => @speaker, :status => :created, :location => @speaker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @speaker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /speakers/1
  # PUT /speakers/1.xml
  def update
    @speaker = @event.speakers.find(params[:id])

    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to([@event, @speaker], :notice => 'Speaker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @speaker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.xml
  def destroy
    @speaker = @event.speakers.find(params[:id])
    @speaker.destroy

    respond_to do |format|
      format.html { redirect_to(event_speakers_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
    @speakers = @event.speakers.all

    respond_to do |format|
      format.xml
      format.json {
          render :json => @speakers.to_json(:only => [:id, :name, :description, :email, :twitter], :methods => [:image_url])
        }
    end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end
  
end
