require_relative("../db/sql_runner")

require("pry-byebug")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i() if options[id]
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first()
    @id = movie['id'].to_i()
  end

  def update()
    sql = "UPDATE movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stars()
    sql = "SELECT stars.* from stars INNER JOIN castings
    ON stars.id = castings.star_id WHERE castings.movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map {|star| Star.new(star)}
  end

#----- More 'Ruby-ish' way! --------

  # def castings()
  #   sql = "SELECT castings.* from castings WHERE movie_id = $1"
  #   values = [@id]
  #   castings = SqlRunner.run(sql, values)
  #   return castings.map {|casting| Casting.new(casting)}
  # end
  #
  # def remaining_budget()
  #   actor_fees = castings().map{|casting| casting.fee().to_i() }
  #   return @budget - actor_fees.sum()
  # end

#----- SQL way! ----------

  def remaining_budget()
    sql = "SELECT SUM(castings.fee) FROM castings WHERE castings.movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    casting_fees = result['sum'].to_i()
    return @budget - casting_fees
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

end

#sql = "SELECT SUM(castings.fee) FROM castings WHERE id = $1"
#sql = SELECT castings.fee FROM castings
