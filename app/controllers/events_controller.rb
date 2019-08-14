class EventsController < ApplicationController
  def index
  	#permet d'afficher une alerte à l'utilisateur
    puts flash[:alert]

    puts "-" * 60
    puts "Voici le nom du dernier auteur :"
    @events_list = Event.all
    puts @events_list[-1].user.last_name
    puts "-" * 60
  end

  def new
  end

  def show  	
  end
end
