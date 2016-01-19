class ImageContentsController < ApplicationController
  before_action :set_image_content, only: [:show, :edit, :update, :destroy]

  # GET /image_contents
  # GET /image_contents.json
  def index
    @image_contents = ImageContent.all
  end

  # GET /image_contents/1
  # GET /image_contents/1.json
  def show
  end

  # GET /image_contents/new
  def new
    @image_content = ImageContent.new
  end

  # GET /image_contents/1/edit
  def edit
  end

  # POST /image_contents
  # POST /image_contents.json
  def create
    @image_content = ImageContent.new(image_content_params)

    respond_to do |format|
      if @image_content.save
        format.html { redirect_to @image_content, notice: 'Image content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_contents/1
  # PATCH/PUT /image_contents/1.json
  def update
    respond_to do |format|
      if @image_content.update(image_content_params)
        format.html { redirect_to @image_content, notice: 'Image content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_contents/1
  # DELETE /image_contents/1.json
  def destroy
    @image_content.destroy
    respond_to do |format|
      format.html { redirect_to image_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_content
      @image_content = ImageContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_content_params
      params.require(:image_content).permit(:content_id, :uri, :target)
    end
end
