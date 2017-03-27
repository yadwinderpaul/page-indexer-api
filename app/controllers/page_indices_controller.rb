class PageIndicesController < ApplicationController
  http_basic_authenticate_with name: 'cool_user', password: 'secret_sauce_7'

  def index
    page_indices = PageIndex.all
    render json: {
      :meta => { :success => true },
      :data => page_indices
    }
  end

  def create
    page_index = PageIndex.find_or_create_by!(:url => params[:url])
    render json: {
      :meta => { :success => true },
      :data => page_index
    }
  end

end
