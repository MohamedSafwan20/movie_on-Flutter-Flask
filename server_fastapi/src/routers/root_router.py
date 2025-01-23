from fastapi import APIRouter

from .movie_router import movieRouter

rootRouter = APIRouter(prefix="/api/v1")

rootRouter.include_router(movieRouter)