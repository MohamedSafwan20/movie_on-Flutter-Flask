from ..config.selenium import initialize_selenium
from selenium.webdriver.common.by import By


class MovieController:
    def getMovies():
        driver = initialize_selenium()
        driver.implicitly_wait(10)

        moviesContainer = driver.find_element_by_css_selector(
            ".content.home_style")

        movieList = moviesContainer.find_elements(
            by=By.TAG_NAME, value="li")

        movies = []
        for movie in movieList:
            movieTitle = movie.find_element_by_css_selector(
                '.attachment-post-thumbnail.size-post-thumbnail.wp-post-image').get_attribute('alt')

            movieImg = movie.find_element_by_css_selector(
                '.attachment-post-thumbnail.size-post-thumbnail.wp-post-image').get_attribute('src')

            movies.append({"title": movieTitle, "img": movieImg})

        return movies

    def getMovieDetails(title: str):
        driver = initialize_selenium()
        driver.implicitly_wait(10)

        moviesContainer = driver.find_element_by_css_selector(
            ".content.home_style")

        movieList = moviesContainer.find_elements(
            by=By.TAG_NAME, value="li")

        for movie in movieList:
            movieTitle = movie.find_element_by_css_selector(
                '.attachment-post-thumbnail.size-post-thumbnail.wp-post-image').get_attribute('alt')

            if movieTitle == title:
                movie.click()

                movie = {}

                # MOVIE NAME
                movie["name"] = title

                # MOVIE IMG
                movieImg = driver.find_element_by_css_selector(
                    ".attachment-post-thumbnail.size-post-thumbnail.wp-post-image")
                movie["image"] = movieImg.get_attribute("src")

                # MOVIE DESCRIPTION
                movieDesc = driver.find_elements_by_css_selector(
                    ".entry-content>p")
                movie["description"] = movieDesc[2].text

                # MOVIE GENRES
                movieGenre = driver.find_elements_by_css_selector(
                    ".entry-content>p")
                splittedGenre = movieGenre[1].text.split("Genres:", 2)[1]
                movie["genres"] = splittedGenre.split("\n")[0].strip()

                # MOVIE STREAMING LINKS
                movieLinksList = []
                movieContainerList = driver.find_elements_by_css_selector(
                    '.entry-content>p>a')
                for movieContainer in movieContainerList:
                    if movieContainer.get_attribute("rel") == "nofollow noopener":
                        movieLinksList.append(
                            movieContainer.get_attribute("href"))
                movie["links"] = movieLinksList

                return movie

        raise Exception("Movie not found")
