package com.amigoscode.movie;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

// this class specifies how to map a row from the database to a Movie object
// e.g. how every column becomes a data type in Java
public class MovieRowMapper implements RowMapper<Movie> {
    @Override
    public Movie mapRow(ResultSet resultSet, int i) throws SQLException {
        return new Movie(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                List.of(),
                LocalDate.parse(resultSet.getString("release_date"))
        );
    }
}
