class PagesController < ApplicationController
  def about
    @heading = "Страница про нас"
    @text = "немного текста про нас..."
  end
end
