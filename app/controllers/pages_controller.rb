class PagesController < ApplicationController
  def home
    render :home
  end

  def definition
    render :definition
  end

  def perspectives
    render :perspectives
  end

  def resources
    render :resources
  end

  def join
    @requester = Requester.new
    render :join
  end

  def about
    render :about
  end
end
