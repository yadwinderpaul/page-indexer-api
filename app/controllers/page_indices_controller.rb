class PageIndicesController < ApplicationController
  before_action :is_authenticated?

  def index
    page_indices = PageIndex.all
    render_api(object: page_indices)
  end

  def create
    page_index = PageIndex.find_or_create_by!(:url => params[:url])
    render_api(object: page_index, serializer: PageIndexDetailSerializer)
  end

  def show
    page_index = PageIndex.find(params[:id])
    render_api(object: page_index, serializer: PageIndexDetailSerializer)
  end

end
