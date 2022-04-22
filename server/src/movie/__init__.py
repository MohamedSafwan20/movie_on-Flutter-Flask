from flask import Blueprint, jsonify, request

from .controller import MovieController

movie_blueprint = Blueprint(
    'movie_blueprint', __name__, url_prefix="/api/v1")


@movie_blueprint.route('/movies', methods=["GET"])
def index():
    try:
        res = MovieController.getMovies()
        return jsonify({"status": 1, "data": res}), 200
    except:
        return jsonify({"status": 0, "msg": "Error getting movies"})


@movie_blueprint.route('/movie', methods=["GET"])
def getMovieByTitle():
    movieTitle = request.args.get('title')

    if movieTitle is None:
        return jsonify({"status": 0, "msg": "Movie title is required"})

    try:
        res = MovieController.getMovieByTitle(movieTitle)
        return jsonify({"status": 1, "data": res}), 200
    except Exception as e:
        return jsonify({"status": 0, "msg": str(e)})
