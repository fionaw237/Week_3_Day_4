require_relative("models/movie")
require_relative("models/star")
require_relative("models/casting")

require("pry-byebug")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


star1 = Star.new(
  {
  'first_name' => 'Ian',
  'last_name' => 'McKellen'
})


star2 = Star.new(
  {
  'first_name' => 'Elijah',
  'last_name' => 'Wood'
})

star1.save()
star2.save()

movie1 = Movie.new(
  {
    'title' => 'The Fellowship of the Ring',
    'genre' => 'Adventure'
  }
)

movie2 = Movie.new(
  {
    'title' => 'The Two Towers',
    'genre' => 'Adventure'
  }
)

movie3 = Movie.new(
  {
    'title' => 'X-Men',
    'genre' => 'Action'
  }
)

movie1.save()
movie2.save()
movie3.save()


casting1 = Casting.new(
  {
    'movie_id' => movie1.id(),
    'star_id' => star1.id(),
    'fee' => 10
  }
)

casting2 = Casting.new(
  {
    'movie_id' => movie1.id(),
    'star_id' => star2.id(),
    'fee' => 8
  }
)

casting3 = Casting.new(
  {
    'movie_id' => movie3.id(),
    'star_id' => star1.id(),
    'fee' => 12
  }
)

casting4 = Casting.new(
  {
    'movie_id' => movie2.id(),
    'star_id' => star2.id(),
    'fee' => 11
  }
)

casting1.save()
casting2.save()
casting3.save()
casting4.save()

binding.pry
nil
