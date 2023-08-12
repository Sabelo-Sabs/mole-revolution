from fastapi import APIRouter, Response, HTTPException
from typing import Union
from webapp.schemas import users as schemas

router = APIRouter()


@router.get("/users/{user_id}", response_model=schemas.User)
async def read_user(user_id: int):
    return {"user_id": user_id}


@router.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@router.get("/")
def read_root() -> Response:
    return Response("Server is running!")
