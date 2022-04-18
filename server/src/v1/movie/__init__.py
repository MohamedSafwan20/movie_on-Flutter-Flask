from flask import Blueprint
from .controller import MovieController

movie_blueprint = Blueprint(
    'movie_blueprint', __name__, url_prefix="/api/v1")


@movie_blueprint.route('/')
def index():
    res = MovieController.test()
    return str(res)
