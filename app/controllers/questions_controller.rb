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



    @longest_movie = Movie.order("").max.duration

    @length_of_longest_movie = @longest_movie

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

    @most_number_of_movies_by_a_single_director = movie_counts.sort

    @director_with_the_most_movies =  @most_number_of_movies_by_a_single_director






  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

  # movie_counts = []

  #   Actor.all.each do |the_actor|
  #     number_of_movies_acted_in = the_actor.movies.count

  #     # movie_counts.push(number_of_movies_directed_by_the_director)


  # #   # @most_number_of_movies_by_a_single_actor = movie_counts.max




  #   @actor_with_the_most_movies =
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
