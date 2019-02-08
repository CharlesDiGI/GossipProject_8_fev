class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def home
    @gossips = Gossip.all
  end


end
