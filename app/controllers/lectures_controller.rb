class LecturesController < ApplicationController
  
  before_filter [:load_event]
  before_filter [:load_speakers], :only=>[:new,:edit, :create, :update]
  before_filter [:load_places], :only=>[:new,:edit, :create, :update]
  before_filter [:load_categories], :only=>[:new,:edit, :create, :update]
  skip_before_filter :require_user, :only=>[:public]
  
  # GET /lectures
  # GET /lectures.xml
  def index
    @lectures = @event.lectures.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lectures }
    end
  end
  
  def insert_category_select
    @category = @event.categories.build
    @category.name = params[:name]
    @category.save
    
    @selected = params[:name]
    
    @categories = @event.categories.order(:name)
    render :partial => "category", :categories => @categories, :selected => @selected
  end
  
  def insert_place_select
    @place = @event.places.build
    @place.name = params[:name]
    @place.save
    
    @selected = params[:name]
    
    @places = @event.places.order(:name)
    render :partial => "place", :places => @places, :selected => @selected
  end

  # GET /lectures/1
  # GET /lectures/1.xml
  def show
    @lecture = @event.lectures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lecture }
    end
  end

  # GET /lectures/new
  # GET /lectures/new.xml
  def new
    @lecture = @event.lectures.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lecture }
    end
  end

  # GET /lectures/1/edit
  def edit
    @lecture = @event.lectures.find(params[:id])
  end

  # POST /lectures
  # POST /lectures.xml
  def create
    @lecture = @event.lectures.build(params[:lecture])

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to([@event, @lecture], :notice => 'Lecture was successfully created.') }
        format.xml  { render :xml => @lecture, :status => :created, :location => @lecture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lectures/1
  # PUT /lectures/1.xml
  def update
    @lecture = @event.lectures.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        format.html { redirect_to([@event, @lecture], :notice => 'Lecture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.xml
  def destroy
    @lecture = @event.lectures.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to(event_lectures_url) }
      format.xml  { head :ok }
    end
  end

  def public
   @lectures = @event.lectures.all

   respond_to do |format|
     format.xml
     format.json {
        render :json => @lectures.to_json(:include => { 
        :place => { :only => [:id, :name], :methods => [:image_url] },
        :category => { :only => [:id, :name] },
        :speakers => { :only => [:id, :name, :description, :twitter, :email], :methods => [:image_url] }
        },
        :only => [:id, :name, :description, :initial_date, :end_date])
      }
   end
  end
  
private
  def load_event
    @event = Event.find(params[:event_id])
  end
  def load_places
    @places = @event.places.all.collect { |c| [c.name, c.id] }
    @places.concat(["Novo"])
  end
  def load_categories
    @categories = @event.categories.all.collect { |c| [c.name, c.id] }
    @categories.concat(["Nova"])
  end
  def load_speakers 
    @speakers = @event.speakers.find(:all, :order => "name")
  end

end
