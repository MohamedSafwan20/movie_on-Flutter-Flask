from fastapi import APIRouter, Response, status
from ..controllers.movie_controller import MovieController

movieRouter = APIRouter(prefix="/movies")


@movieRouter.get("/")
def fetchMovies(response: Response):
    try:
        res = MovieController.getMovies()
        return {"status": True, "data": res}
    except:
        response.status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
        return {"status": False, "msg": "Failed to fetch movies"}


@movieRouter.get("/movie/details")
def fetchMovieDetails(response: Response, title: str):
    try:
        res = MovieController.getMovieDetails(title)
        return {"status": True, "data": res}
    except Exception as e:
        response.status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
        return {"status": False, "msg": e}
