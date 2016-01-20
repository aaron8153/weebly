class TextContentsController < ApplicationController
  before_action :set_text_content, only: [:show, :edit, :update, :destroy]

  # GET /text_contents
  # GET /text_contents.json
  def index
    @text_contents = TextContent.all
  end

  # GET /text_contents/1
  # GET /text_contents/1.json
  def show
  end

  # GET /text_contents/new
  def new
    @text_content = TextContent.new
  end

  # GET /text_contents/1/edit
  def edit
  end

  # POST /text_contents
  # POST /text_contents.json
  def create
    @text_content = TextContent.new(text_content_params)

    respond_to do |format|
      if @text_content.save
        format.html { redirect_to @text_content, notice: 'Text content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @text_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @text_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /text_contents/1
  # PATCH/PUT /text_contents/1.json
  def update
    respond_to do |format|
      if @text_content.update(text_content_params)
        format.html { redirect_to @text_content, notice: 'Text content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @text_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_contents/1
  # DELETE /text_contents/1.json
  def destroy
    @text_content.destroy
    respond_to do |format|
      format.html { redirect_to text_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_content
      @text_content = TextContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_content_params
      params.require(:text_content).permit(:content_id, :text)
    end
end
