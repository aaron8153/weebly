class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]

  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
  end

  # GET /elements/new
  def new
    @element = Element.new
  end

  # GET /elements/1/edit
  def edit
  end

  # POST /elements
  # POST /elements.json
  def create
    @element = Element.new(element_params)
    @element.page_id = params[:page_id]


    respond_to do |format|
      if @element.save
        @content = nil

        case @element.content_type
          when 'Title'
            @content = TitleContent.create(:element_id => @element.id, :title => params['element']['title_content']['title'])
          when 'Text'
            @content = TextContent.create(:element_id => @element.id, :text => params['element']['text_content']['text'])
          when 'Image'
            @content = ImageContent.create(:element_id => @element.id, :uri => params['element']['image_content']['uri'])
          when 'Nav'
            #blah
        end

        format.html { redirect_to page_element_path(params[:page_id], @element), notice: 'Element was successfully created.' }
        format.json { render action: 'show', status: :created, location: @element }
      else
        format.html { render action: 'new' }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elements/1
  # PATCH/PUT /elements/1.json
  def update
    respond_to do |format|
      if @element.update(element_params)
        format.html { redirect_to @element, notice: 'Element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    @element.destroy
    respond_to do |format|
      format.html { redirect_to elements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:content_type, :page_id)
    end
end
