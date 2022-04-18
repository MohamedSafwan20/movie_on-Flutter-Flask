import os
from config.selenium import initialize_selenium


class MovieController:
    def getMovies():
        driver = initialize_selenium()
        driver.get(os.environ["MOVIE_WEBSITE_URL"])
        return "1"
