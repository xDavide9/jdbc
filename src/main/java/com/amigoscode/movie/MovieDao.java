package com.amigoscode.movie;

import java.util.List;
import java.util.Optional;

// data access object design pattern
// it is an abstraction that separates the business logic from the data persistence/access logic
// when using jdbc template all of this is manually, we need to explicitly design
// the data access object interface (interface from Java is the best way to do this)
// and then create atleast one implementation that uses the jdbc template
// this is generally considered redundant when using Spring Data JPA because this functionality is already implemented (just by using a repository)
public interface MovieDao {
    List<Movie> selectMovies();
    int insertMovie(Movie movie);
    int deleteMovie(int id);
    Optional<Movie> selectMovieById(int id);
    // TODO: Update
}
