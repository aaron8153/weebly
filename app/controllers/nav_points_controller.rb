class NavPointsController < ApplicationController
  before_action :set_nav_point, only: [:show, :edit, :update, :destroy]

  # GET /nav_points
  # GET /nav_points.json
  def index
    @nav_points = NavPoint.all
  end

  # GET /nav_points/1
  # GET /nav_points/1.json
  def show
  end

  # GET /nav_points/new
  def new
    @nav_point = NavPoint.new
  end

  # GET /nav_points/1/edit
  def edit
  end

  # POST /nav_points
  # POST /nav_points.json
  def create
    @nav_point = NavPoint.new(nav_point_params)

    respond_to do |format|
      if @nav_point.save
        format.html { redirect_to @nav_point, notice: 'Nav point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nav_point }
      else
        format.html { render action: 'new' }
        format.json { render json: @nav_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nav_points/1
  # PATCH/PUT /nav_points/1.json
  def update
    respond_to do |format|
      if @nav_point.update(nav_point_params)
        format.html { redirect_to @nav_point, notice: 'Nav point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nav_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nav_points/1
  # DELETE /nav_points/1.json
  def destroy
    @nav_point.destroy
    respond_to do |format|
      format.html { redirect_to nav_points_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nav_point
      @nav_point = NavPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nav_point_params
      params.require(:nav_point).permit(:nav_content_id, :lat, :long)
    end
end
