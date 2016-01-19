class TitleContentsController < ApplicationController
  before_action :set_title_content, only: [:show, :edit, :update, :destroy]

  # GET /title_contents
  # GET /title_contents.json
  def index
    @title_contents = TitleContent.all
  end

  # GET /title_contents/1
  # GET /title_contents/1.json
  def show
  end

  # GET /title_contents/new
  def new
    @title_content = TitleContent.new
  end

  # GET /title_contents/1/edit
  def edit
  end

  # POST /title_contents
  # POST /title_contents.json
  def create
    @title_content = TitleContent.new(title_content_params)

    respond_to do |format|
      if @title_content.save
        format.html { redirect_to @title_content, notice: 'Title content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @title_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @title_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /title_contents/1
  # PATCH/PUT /title_contents/1.json
  def update
    respond_to do |format|
      if @title_content.update(title_content_params)
        format.html { redirect_to @title_content, notice: 'Title content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @title_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /title_contents/1
  # DELETE /title_contents/1.json
  def destroy
    @title_content.destroy
    respond_to do |format|
      format.html { redirect_to title_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title_content
      @title_content = TitleContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_content_params
      params.require(:title_content).permit(:content_id, :title)
    end
end
