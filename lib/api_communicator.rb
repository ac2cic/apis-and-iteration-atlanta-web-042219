require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  movies_array = []
  response_hash["results"].each do |char|
    if char ["name"] == character_name
      movies_array = char["films"]
    end
  end
  new_movie_info = []
  movies_array.each do |movie|
    response = (RestClient.get(movie))
    new_movie_info << JSON.parse(response)
  end
# binding.pry
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  new_movie_info
# puts new_movie_info
end


def print_movies(films)
  films.each do |film|
    titles_together = "#{film}"
  end
  # some iteration magic and puts out the movies in a nice lis
end




def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
