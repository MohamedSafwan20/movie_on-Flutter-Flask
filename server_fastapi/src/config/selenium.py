import os
from selenium import webdriver


def initialize_selenium():
    options = webdriver.ChromeOptions()
    options.binary_location = os.environ["BROWSER_PATH"]

    driver = webdriver.Chrome(
        executable_path=os.environ["DRIVER_PATH"], chrome_options=options)

    driver.get(os.environ["MOVIE_WEBSITE_URL"])

    return driver
