class EventsController < ApplicationController
  respond_to :xml, :html, :json
  
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_with @events
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = find_event(params[:id])

    respond_with @event
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_with @event
  end

  # GET /events/1/edit
  def edit
    @event = find_event(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

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

    respond_with @event
  end
  
  private
  def find_event(param)
    # puts "==> Finding event: [#{param}]"
    if param
      if param.to_i > 0
        # puts "====> An integer > 0: #{param.to_i}"
        @event = Event.find(param)
      else
        # puts "====> An integer !> 0: #{param.to_i}"
        @event = Event.find_by_name(param)
      end
      # puts "==> Event found: #{@event}"
    end
    @event
  end
end
