class ParcelsController < ApplicationController
  before_filter :require_authentication
  # GET /parcels
  # GET /parcels.xml
  def index
    @parcels = Parcel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parcels }
    end
  end

  # GET /parcels/1
  # GET /parcels/1.xml
  def show
    @parcel = Parcel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parcel }
    end
  end

  # GET /parcels/new
  # GET /parcels/new.xml
  def new
    @parcel = Parcel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parcel }
    end
  end

  # GET /parcels/1/edit
  def edit
    @parcel = Parcel.find(params[:id])
  end

  # POST /parcels
  # POST /parcels.xml
  def create
    @parcel = Parcel.new(params[:parcel])
    @parcel.user_id = current_user.id
    respond_to do |format|
      if @parcel.save
#        if @parcel.category == 1
#          json_object = JSON.parse(open(@parcel.to).read)
#          Postman.fb_message(json_object['username'] + "@facebook.com", current_user.profile.email , @parcel.message).deliver!

          
        #   current_user.profile.message(
        #      :to => @parcel.to,
        #      :message => @parcel.message,
        #      :link => "https://www.facebook.com/planlater",
        #      :picture => "http://udproducts.in/sites/default/files/pl.jpg",
        #      :description => "We, at UDProducts can create, deploy and maintain customized applications which can be capitalized to improve your business solutions. We develop feature rich applications considering the industry standards and industry evolution which..",
        #      :name => @parcel.title
        #   )

          
#        else
#          current_user.profile.feed!(
#             :message => @parcel.message,
#             :link => "https://www.facebook.com/planlater",
#             :picture => "http://udproducts.in/sites/default/files/pl.jpg",
#             :description => "We, at UDProducts can create, deploy and maintain customized applications which can be capitalized to improve your business solutions. We develop feature rich applications considering the industry standards and industry evolution which..",
#             :name => @parcel.title
#          )
#        end
        format.html { redirect_to parcels_path }
        format.xml  { render :xml => @parcel, :status => :created, :location => @parcel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parcel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parcels/1
  # PUT /parcels/1.xml
  def update
    @parcel = Parcel.find(params[:id])

    respond_to do |format|
      if @parcel.update_attributes(params[:parcel])
        format.html { redirect_to(@parcel, :notice => 'Parcel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parcel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1
  # DELETE /parcels/1.xml
  def destroy
    @parcel = Parcel.find(params[:id])
    @parcel.destroy

    respond_to do |format|
      format.html { redirect_to(parcels_url) }
      format.xml  { head :ok }
    end
  end
end
