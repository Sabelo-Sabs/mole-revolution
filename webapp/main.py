from fastapi import FastAPI
from webapp.routers import users

app = FastAPI()

app.include_router(users.router)
