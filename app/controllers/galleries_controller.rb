class GalleriesController < ApplicationController
  skip_before_filter :require_user, :only=>[:public]
  before_filter [:load_event]
  
  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = @event.galleries.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = @event.galleries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = @event.galleries.build
    
    5.times { @gallery.gallery_images.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = @event.galleries.find(params[:id])
  
    5.times { @gallery.gallery_images.build }
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = @event.galleries.build(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to([@event, @gallery], :notice => 'Gallery was successfully created.') }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = @event.galleries.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to([@event, @gallery], :notice => 'Gallery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = @event.galleries.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(event_galleries_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
   @galleries = @event.galleries.all

   respond_to do |format|
     format.xml
     format.json {
        render :json => @galleries.to_json(:include => 
        { 
           :gallery_images => { :only => [:id], :methods => [:image_url] }
        },
        :only => [:id, :name])
      }
   end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end
     
end
