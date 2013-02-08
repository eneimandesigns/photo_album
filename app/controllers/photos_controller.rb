class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  before_filter :authenticate, :except => [:index, :show ]

    def index
      @photos = Photo.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @photos }
      end
    end

    # GET /photos/1
    # GET /photos/1.json
    def show
      @photo = Photo.find(params[:id])
      @album = Album.new(params[:album])
      @output = '<div class="thumbnail">'
      @output.concat( "<a href='/albums/show?id=".concat(@photo.album_id.to_s) )
      @output.concat( "' /a>\n<img src='/images/" + @photo.path + "/".concat(@photo.image) )
      @output.concat( "' /></div>" )

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @photo }
      end
    end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
       format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
       # format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
       # format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
       # format.json { head :no_content }
      else
        format.html { render action: "edit" }
       # format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
     # format.json { head :no_content }
    end
  end
end
