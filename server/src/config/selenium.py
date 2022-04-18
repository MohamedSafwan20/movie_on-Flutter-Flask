import os
from selenium import webdriver


def initialize_selenium():
    os.environ["PATH"] = os.environ["SELENIUM_PATH"]
    driver = webdriver.Chrome(os.environ["SELENIUM_PATH"])
    return driver
