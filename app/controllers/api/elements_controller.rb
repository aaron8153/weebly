module Api
  class ElementsController < ApplicationController
    before_action :set_element, only: [:show, :update, :destroy]
    before_filter :require_api_key
    #CSRF token not necessary for json api
    skip_before_filter :verify_authenticity_token

    # GET /elements
    # GET /elements.json
    def index
      #Element.all is fine for small sets of data, for larger sets pagination would be best
      @elements = data_cache("page-#{params[:page_id]}-elements", 10.minutes) do
        Element.all
      end
      respond_to do |format|
        format.json { render action: 'index', status: :ok, location: api_page_elements_url(@elements) }
        format.xml { render xml: @elements, location: api_page_elements_url(@elements) }
      end
    end

    # GET /elements/1
    # GET /elements/1.json
    def show
      #Elements are likely to change more frequently than pages so 10 min should be good
      @element = data_cache("element-#{@element.id}", 10.minutes) do
        Element.find(params[:id])
      end
      respond_to do |format|
        format.json { render action: 'show', status: :ok, location: api_page_element_url(params[:page_id], @element) }
        format.xml { render xml: @element, location: api_page_element_url(params[:page_id], @element) }
      end
    end

    # POST /elements
    # POST /elements.json
    def create
      #Each element could be tied to an ApiKey or set of ApiKeys for security
      @element = Element.new(element_params)
      #Use new instead of create, will be saved when @element.save is called
      case @element.content_type
        when 'TitleContent'
          @element.content = TitleContent.new(title: params['element']['title_content']['title'])
        when 'TextContent'
          @element.content = TextContent.new(text: params['element']['text_content']['text'])
        when 'ImageContent'
          @element.content = ImageContent.new(uri: params['element']['image_content']['uri'])
        when 'NavContent'
          #Placeholder for NavContent
      end

      respond_to do |format|
        if @element.save
          #Cache bust elements
          Rails.cache.delete("page-#{params[:page_id]}-elements")
          format.json { render action: 'show', status: :created, location: api_page_element_url(params[:page_id], @element) }
        else
          format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /elements/1
    # PATCH/PUT /elements/1.json
    def update
      case @element.content_type
        when 'TitleContent'
          @element.content.update(title_content_params)
        when 'TextContent'
          @element.content.update(text_content_params)
        when 'ImageContent'
          @element.content.update(image_content_params)
        when 'NavContent'
          #Placeholder for NavContent
      end

      respond_to do |format|
        case @element.content_type
          when 'TitleContent'
            if @element.content.update(title_content_params)
              bust_cache_on_update(@element)
              format.json { render action: 'show', status: :ok, location: api_page_element_url(params[:page_id], @element) }
            else
              format.json { render json: @element.errors, status: :unprocessable_entity }
            end
          when 'TextContent'
            if @element.content.update(text_content_params)
              bust_cache_on_update(@element)
              format.json { render action: 'show', status: :ok, location: api_page_element_url(params[:page_id], @element) }
            else
              format.json { render json: @element.errors, status: :unprocessable_entity }
            end
          when 'ImageContent'
            if @element.content.update(image_content_params)
              bust_cache_on_update(@element)
              format.json { render action: 'show', status: :ok, location: api_page_element_url(params[:page_id], @element) }
            else
              format.json { render json: @element.errors, status: :unprocessable_entity }
            end
          when 'NavContent'
            #Placeholder for updating NavContent
          else
            if @element.update(element_params)
              bust_cache_on_update(@element)
              format.json { head :no_content }
            else
              format.json { render json: @element.errors, status: :unprocessable_entity }
            end
        end


      end
    end

    # DELETE /elements/1
    # DELETE /elements/1.json
    def destroy
      @element.content.destroy
      @element.destroy
      respond_to do |format|
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
        params.require(:element).permit(:content_type, :content_id, :page_id, :title_content, :title, :text_content, :text, :image_content, :uri)
      end

      def title_content_params
        params[:element].require(:title_content).permit(:title)
      end

      def text_content_params
        params[:element].require(:text_content).permit(:text)
      end

      def image_content_params
        params[:element].require(:image_content).permit(:uri)
      end

      def nav_content_params
        #fill out later
      end

      def require_api_key
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

      def bust_cache_on_update(element)
        #Cache bust elements and updated element
        Rails.cache.delete("page-#{params[:page_id]}-elements")
        Rails.cache.delete("element-#{element.id}")
      end
  end
end