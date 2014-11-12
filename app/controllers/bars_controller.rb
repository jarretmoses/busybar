class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @id = params[:id];
  end
end
