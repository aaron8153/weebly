module Api
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :update, :destroy]
    before_filter :require_api_key
    #CSRF token not necessary for json api
    skip_before_filter :verify_authenticity_token

    # GET /pages
    # GET /pages.json
    def index
      #Page.all is fine for small sets of data, for larger sets pagination would be best
      @pages = data_cache('pages', 10.minutes) do
        Page.all
      end
      respond_to do |format|
        format.json { render action: 'index', status: :ok, location: api_pages_url(@pages) }
        format.xml { render xml: @pages, location: api_pages_url(@pages) }
      end
    end

    # GET /pages/1
    # GET /pages/1.json
    def show
      #Page data isn't updated very frequently so a longer cache time is acceptable
      @page = data_cache("page-#{@page.id}", 1.hour) do
        Page.find(params[:id])
      end
      respond_to do |format|
        format.json { render action: 'show', status: :ok, location: api_page_url(@page) }
        format.xml { render xml: @page, location: api_page_url(@page) }
      end
    end

    # POST /pages
    # POST /pages.json
    def create
      #Each Page could be tied to an ApiKey or set of ApiKeys for security
      @page = Page.new(page_params)
      #Render the object created or errors
      respond_to do |format|
        if @page.save
          #Cache bust pages
          Rails.cache.delete("pages")
          format.json { render action: 'show', status: :created, location: api_page_url(@page) }
          format.xml { render xml: @page, location: api_page_url(@page) }
        else
          format.json { render json: @page.errors, status: :unprocessable_entity }
          format.xml { render xml: @page.errors }
        end
      end
    end

    # PATCH/PUT /pages/1
    # PATCH/PUT /pages/1.json
    def update
      #Render the object created or errors
      respond_to do |format|
        if @page.update(page_params)
          #Cache bust pages and updated page. With pagination we would only bust the cache of the page that was updated.
          Rails.cache.delete("pages")
          Rails.cache.delete("page-#{@page.id}")
          format.json { render action: 'show', status: :ok, location: api_page_url(@page) }
          format.xml { render xml: @page, location: api_page_url(@page) }
        else
          format.json { render json: @page.errors, status: :unprocessable_entity }
          format.xml { render xml: @page.errors }
        end
      end
    end

    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page.destroy
      #Cache bust pages and individual page. With pagination we would only bust the cache on the paginated "pages" key.
      Rails.cache.delete("pages")
      Rails.cache.delete("page-#{@page.id}")
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def page_params
        params.require(:page).permit(:title)
      end

      def require_api_key
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
  end
end