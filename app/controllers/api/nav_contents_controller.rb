module Api
class NavContentsController < ApplicationController
  before_action :set_nav_content, only: [:show, :edit, :update, :destroy]

  # GET /nav_contents
  # GET /nav_contents.json
  def index
    @nav_contents = NavContent.all
  end

  # GET /nav_contents/1
  # GET /nav_contents/1.json
  def show
  end

  # GET /nav_contents/new
  def new
    @nav_content = NavContent.new
  end

  # GET /nav_contents/1/edit
  def edit
  end

  # POST /nav_contents
  # POST /nav_contents.json
  def create
    @nav_content = NavContent.new(nav_content_params)

    respond_to do |format|
      if @nav_content.save
        format.html { redirect_to @nav_content, notice: 'Nav content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nav_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @nav_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nav_contents/1
  # PATCH/PUT /nav_contents/1.json
  def update
    respond_to do |format|
      if @nav_content.update(nav_content_params)
        format.html { redirect_to @nav_content, notice: 'Nav content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nav_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nav_contents/1
  # DELETE /nav_contents/1.json
  def destroy
    @nav_content.destroy
    respond_to do |format|
      format.html { redirect_to nav_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nav_content
      @nav_content = NavContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nav_content_params
      params.require(:nav_content).permit(:content_id)
    end
end
end