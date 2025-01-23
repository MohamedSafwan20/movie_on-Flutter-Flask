from fastapi import APIRouter
import os
from ..controllers.movie_controller import MovieController

movieRouter = APIRouter(prefix="/movies")


@movieRouter.get("/")
def fetchMovies():
    MovieController.getMovies()

    return {"username": os.environ.get("BROWSER_PATH")}
