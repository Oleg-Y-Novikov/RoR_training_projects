class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @destinations = Destination.where(tag_id: params[:id]) # @tag.destinations
  end
end
