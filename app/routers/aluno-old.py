from fastapi import APIRouter, Depends, HTTPException
from typing import List
from prisma import Prisma
from app.models.aluno import CreateAlunoDto
from app.database import get_db

router = APIRouter()

@router.get("/", response_model=List[CreateAlunoDto])
def list_alunos(db: Prisma = Depends(get_db)):
    alunos = db.aluno.find_many()
    if not alunos:
        raise HTTPException(status_code=404, detail="Nenhum aluno encontrado")
    return alunos

@router.post("/", response_model=CreateAlunoDto)
def create_aluno(dto: CreateAlunoDto, db: Prisma = Depends(get_db)):
    aluno = db.aluno.create(data=dto.dict(exclude_none=True))
    return aluno
