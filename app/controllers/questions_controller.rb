class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    the_actor = Actor.second

    the_actors_movies = []

    the_actor.roles.each do |the_role|
      the_actors_movies.push(the_role.movie)
    end

    most_recent_movie = { :year => 0, :title => "" }

    the_actors_movies.each do |the_movie|
      if the_movie.year.to_i > most_recent_movie[:year]
        most_recent_movie = { :year => the_movie.year.to_i, :title => the_movie.title }
      end
    end

    @most_recent_movie_for_second_actor = most_recent_movie[:title]

  end

  def question_2
    # Who directed the longest movie on the list?



    the_longest_movie_director_id = Movie.order("duration ASC").last.director_id

    @director_of_longest_movie = Director.find(the_longest_movie_director_id).name


  end

  def question_3
    # Which director has the most movies on the list?

    movie_counts = []

    Director.all.each do |the_director|
    number_of_movies_directed_by_the_director = the_director.movies.count

    movie_counts.push(number_of_movies_directed_by_the_director)
    end

    the_most_movies_director_id = Movie.find(movie_counts).sort.last.director_id

    @director_with_the_most_movies = Director.find(the_most_movies_director_id).name



  end




  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # roles_count = []

    # Actor.all.each do |the_actor|
    # number_of_roles = the_actor.roles.count

    # roles_count.push(number_of_roles)
    # end

    # the_most_movies_actor_id = Role.find(roles_count).sort.first.actor_id

    # @actor_with_the_most_movies = Actor.find(the_most_movies_actor_id).name

# @actor_with_the_most_movies = Role.find(roles_count).sort

# @actor_with_the_most_movies = Role.find(roles_count)

the_leader = Actor.new

    Actor.all.each do |the_actor|
      if the_actor.movies.count > the_leader.movies.count
        the_leader = the_actor
      end
    end

    @actor_with_the_most_movies = the_leader
  end



  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
