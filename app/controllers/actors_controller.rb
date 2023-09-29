class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => @the_id })
    @the_actor = matching_actors.first
      
    render({ :template => "actor_templates/show" })
  end

  def create
    actor = Actor.new

    actor.name = params.fetch("query_name")
    actor.dob = params.fetch("query_dob")
    actor.bio = params.fetch("query_bio")
    actor.image = params.fetch("query_image")

    actor.save

    redirect_to("/actors")
  end

  def update

    id = params.fetch("path_id")

    @actor = Actor.where({:id => id}).first

    @actor.name = params.fetch("query_name")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")
    @actor.image = params.fetch("query_image")

    @actor.save

    redirect_to("/actors/#{id}")

  end

  def delete

    id = params.fetch("path_id")

    Actor.destroy(id)

    redirect_to("/actors")
  end
end
