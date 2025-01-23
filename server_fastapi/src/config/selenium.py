import os
from selenium import webdriver


def initialize_selenium():
    option = webdriver.ChromeOptions()
    option.binary_location = os.environ["BROWSER_PATH"]

    driver = webdriver.Chrome(options=option)

    driver.get(os.environ["MOVIE_WEBSITE_URL"])

    return driver
