from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel

from prisma import Prisma
from datetime import datetime

app = FastAPI()

class CreateAlunoDto(BaseModel):
    aluno : str
    sexo : str
    treinador : str
    dataNascimento :                             datetime
    Objetivo  : str
    tempoTreinamentoIninterruptoAtual : str
    tempoDestreinamento : str
    experienciaPreviaTreinamento : str
    frequenciaMusculacao : str
    modalidadeExtra : str
    frequenciaModalidadeExtra : str
    altura :                                    float
    peso :                                      float
    torax :                                     float
    cintura :                                   float
    abdomen :                                  float
    quadril :                                   float
    braco_d :                                   float
    braco_e :                                  float
    coxa_d :                                 float
    coxa_e :                                float
    panturrilha_d :                              float
    panturrilha_e :                             float
    medidaMao :                            float
    mobilidadeGlenoumeralDireita :             float
    mobilidadeGlenoumeralEsquerda :            float
    AmplitudeMovimentoQuadrilDireito :           float
    AmplitudeMovimentoQuadrilEsquerdo :          float
    AmplitudeMovimentoTornozeloDireito :         float
    AmplitudeMovimentoTornozeloEsquerdo :        float
    pranchaVentral :                           float
    extensaoColuna :                          float
    pranchaLateralDireita :                      float
    pranchaLateralEsquerda :                     float
    squatJump1 :                               float
    squatJump2 :                              float
    squatJump3 :                             float
    RMagachamento :                            float
    RMsupino :                           float
    RMterra :                          float
    RMbarraFixa :                         float
    VelocidadeAerobiaMaxima :                    float
    bracoDireito :                             float
    bracoEsquerdo :                            float
    coxaDireita :                           float
    coxaEsquerda :                          float
    panturrilhaDireita :                         float
    panturrilhaEsquerda :                        float
    idade :                               int
    data :                              datetime
    hora :                             datetime
    pontuacaoTempoTreinoAtual :                  int
    pontuacao_tempo_de_destreinamento_atual :    int
    pontuacao_experiencia_previa_de_treinamento : int
    pontuacao_media_nivel_treinamento :           float
    status_de_treinamento : str
    nivel_mob_torn_direito : str
    nivel_mob_torn_esquerdo : str
    nivel_mob_quadril_direito : str
    nivel_mob_quadril_esquerdo : str
    nivel_mob_omb_direito : str
    nivel_mob_omb_esquerdo : str
    nivelPranchaVentral : str
    nivelExtensaoColuna : str
    nivelPranchaLateralDireita : str 
    nivelPranchaLateralEsquerda : str
    pontosPranchaVentral :                        float
    pontosExtensaoColuna :                    float
    pontosPranchaLateralDireita :                float
    pontosPranchaLateralEsquerda :            float
    forcaRelativaAgachamento :        float
    forcaRelativaSupino :                       float
    forcaRelativaTerra  :                      float
    forcaRelativaBarraFixa :                     float
    squat_nivel : str
    supino_nivel : str
    terra_nivel : str
    pontuacao_squat_nivel :                       float
    pontuacao_supino_nivel :                      float
    pontuacao_terra_nivel :                     float
    media_squat_jump :                    float
    vo2_estimado :                    float
    faixa_etaria           : str
    nivel_vo2              : str
    IMC                    :                      float
    ClassificacaoIMC        : str
    idtagaluno : str

@app.get("/")
def list_alunos():
    db = Prisma()
    db.connect()

    alunos = db.aluno.find_many()

    db.disconnect()

    return alunos


@app.post("/")
def create_aluno(dto: CreateAlunoDto):
    db = Prisma()
    db.connect()

    aluno = db.aluno.create(data=dto.model_dump(exclude_none=True))

    db.disconnect()

    return aluno
