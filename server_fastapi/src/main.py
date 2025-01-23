from fastapi import FastAPI
from .routers.root_router import rootRouter
from dotenv import load_dotenv

load_dotenv()

app = FastAPI()

app.include_router(rootRouter)
