from msilib.schema import Error
import os

from flask import jsonify
from config.selenium import initialize_selenium


class MovieController:
    def getMovies():
        driver = initialize_selenium()
        driver.implicitly_wait(10)

        moviesContainer = driver.find_element_by_css_selector(".entry-content")
        movieList = moviesContainer.find_elements_by_css_selector(
            '.boxed.film')
        movies = []
        for movie in movieList:
            movieTitle = movie.find_element_by_css_selector(
                '.attachment-full.size-full.wp-post-image').get_attribute('alt')
            movieImg = movie.find_element_by_css_selector(
                '.attachment-full.size-full.wp-post-image').get_attribute('src')

            movies.append({"title": movieTitle, "img": movieImg})

        return movies

    def getMovieByTitle(title):
        driver = initialize_selenium()
        driver.implicitly_wait(10)

        moviesContainer = driver.find_element_by_css_selector(".entry-content")
        movieList = moviesContainer.find_elements_by_css_selector(
            '.boxed.film')
        for movie in movieList:
            movieTitle = movie.find_element_by_css_selector(
                '.attachment-full.size-full.wp-post-image').get_attribute('alt')

            if movieTitle == title:
                movie.click()
                movieLinksList = []
                movieContainerList = driver.find_elements_by_css_selector(
                    '.entry-content>p>a')
                for movieContainer in movieContainerList:
                    if movieContainer.get_attribute("rel") == "nofollow noopener":
                        movieLinksList.append(
                            movieContainer.get_attribute("href"))
                return movieLinksList

        raise Exception("Movie not found")
