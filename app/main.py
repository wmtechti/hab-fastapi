from fastapi import FastAPI
from app.routers import aluno

app = FastAPI()

app.include_router(aluno.router, prefix="/alunos", tags=["alunos"])

