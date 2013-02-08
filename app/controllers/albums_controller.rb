class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
    @output = "<div ><br><table  class='entries'><br><tr>"
    10.times { |i| @output.concat("<th></th>") }
    @output.concat("</tr></tr>")
    irc = 0
    @album.photos.each do |photo|
      irc += 1
      @output.concat( "<td><div class='thumbnail'><a href='/photos/show?id=".concat(photo.id.to_s) )
      @output.concat( "'><img class='icons' src='/images/".concat(photo.path) )
      @output.concat( "/".concat(photo.image))
      @output.concat( "'  /></a></div></td>\n")
      if irc == 10
        irc = 0
        @output.concat( "</tr>\n<tr>" )
      end
    end
    @output.concat( "</tr>\n</table>\n</div>" )
   # respond_to do |format|
   #   format.html # show.html.erb
      #format.json { render json: @album }
  # end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        #Dir.chdir("public/images")
        Dir.mkdir(@album['directory'])
        flash[:notice] = 'Album was successfully created.'
        #flash[:notice] = Dir.pwd
        format.html { redirect_to @album }
        #format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action = "new" }
        #format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to @album }
        format.json { head :no_content }
      else
        format.html { render action = "edit" }
       # format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
   # Dir.chdir("public/images")
    Dir.delete(@album['directory'])

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
