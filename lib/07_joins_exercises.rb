# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    actors.name = 'Harrison Ford' AND
    castings.ord > 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SELECT
    title,
    actors.name
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    movies.yr = 1962 AND
    castings.ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)

  SELECT
    travolta_by_year.yr,
    travolta_by_year.num_films
    FROM
    (
    SELECT
      travolta_films.yr,
      COUNT(*) num_films
    FROM
      (
        SELECT
          title,
          yr
        FROM
          movies
        JOIN
          castings ON movies.id = castings.movie_id
        JOIN
          actors ON castings.actor_id = actors.id
        WHERE
          actors.name = 'John Travolta'
      ) travolta_films
    GROUP BY
      yr
    ) travolta_by_year
  WHERE
    travolta_by_year.num_films > 1

  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)

  SELECT
    andrews_movies.title,
    lead_actors.name
  FROM
    movies andrews_movies
  JOIN
    castings AS julie_castings ON andrews_movies.id = julie_castings.movie_id
  JOIN
    actors AS julie_actors ON julie_castings.actor_id = julie_actors.id
  JOIN
    castings AS lead_castings ON andrews_movies.id = lead_castings.movie_id
  JOIN
    actors lead_actors ON lead_castings.actor_id = lead_actors.id
  WHERE
    lead_castings.ord = 1 AND
    julie_actors.name = 'Julie Andrews'
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)

  SELECT
    all_leads.lead
  FROM
    (SELECT
      lead_actors.name lead,
      COUNT(*) num_leads
    FROM
      castings lead_castings
    JOIN
      actors AS lead_actors ON lead_castings.actor_id = lead_actors.id
    WHERE
      lead_castings.ord = 1
    GROUP BY
      lead_actors.id
    ) all_leads
  WHERE
    num_leads >= 15
  ORDER BY
    all_leads.lead
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)

  SELECT
    all_movies.title,
    num_actors.actor_count
  FROM
    (
      SELECT
        movie_id,
        COUNT(*) actor_count
      FROM
        castings
      GROUP BY
        movie_id
    ) num_actors
  JOIN
    movies AS all_movies ON all_movies.id = num_actors.movie_id
  WHERE
    all_movies.yr = 1978
  ORDER BY
    num_actors.actor_count DESC,
    all_movies.title ASC
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SELECT
    costars.name
  FROM
    movies AS garfunkel_movies
  JOIN
    castings AS garfunkel_castings ON garfunkel_movies.id = garfunkel_castings.movie_id
  JOIN
    actors AS garfunkel_actor ON garfunkel_actor.id = garfunkel_castings.actor_id
  JOIN
    castings AS costar_castings ON garfunkel_movies.id = costar_castings.movie_id
  JOIN
    actors AS costars ON costars.id = costar_castings.actor_id
  WHERE
    garfunkel_actor.name = 'Art Garfunkel' AND
    costars.name != 'Art Garfunkel'

  SQL
end
