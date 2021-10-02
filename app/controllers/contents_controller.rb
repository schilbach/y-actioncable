class ContentsController < ApplicationController

  def edit
    @content = Content.find(params[:id])
  end
end
