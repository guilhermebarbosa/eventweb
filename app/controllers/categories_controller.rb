class CategoriesController < ApplicationController
  skip_before_filter :require_user, :only=>[:public]
  
  before_filter [:load_event]
  
  # GET /categories
  # GET /categories.xml
  def index
    @categories = @event.categories.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = @event.categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = @event.categories.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = @event.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = @event.categories.build(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to([@event, @category], :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = @event.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to([@event, @category], :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = @event.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(event_categories_url) }
      format.xml  { head :ok }
    end
  end
  
  def public
   @categories = @event.categories.all

   respond_to do |format|
     format.xml
     format.json { render :json => @categories.to_json(:only => [:id, :name]) }
   end
  end
  
  private
    def load_event
      @event = Event.find(params[:event_id])
    end

end