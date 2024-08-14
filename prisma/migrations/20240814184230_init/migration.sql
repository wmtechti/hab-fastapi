-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "stripeCustomerId" TEXT,
    "stripeSubscriptionId" TEXT,
    "stripeSubscriptionStatus" TEXT,
    "stripePriceId" TEXT,
    "isResponsibleForBilling" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gym" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "responsibleId" TEXT,

    CONSTRAINT "Gym_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserType" (
    "id" TEXT NOT NULL,
    "perfil" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Todo" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "doneAt" TIMESTAMP(3),

    CONSTRAINT "Todo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuestionarioProntidaoAvaliacaoFisica" (
    "id" TEXT NOT NULL,
    "aluno" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "treinador" TEXT NOT NULL,
    "dataNascimento" TEXT NOT NULL,
    "Objetivo" TEXT NOT NULL,
    "tempoTreinamentoIninterruptoAtual" TEXT NOT NULL,
    "tempoDestreinamento" TEXT NOT NULL,
    "experienciaPreviaTreinamento" TEXT NOT NULL,
    "frequenciaMusculacao" TEXT NOT NULL,
    "modalidadeExtra" TEXT NOT NULL,
    "frequenciaModalidadeExtra" TEXT NOT NULL,
    "altura" DOUBLE PRECISION NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "torax" DOUBLE PRECISION NOT NULL,
    "cintura" DOUBLE PRECISION NOT NULL,
    "abdomen" DOUBLE PRECISION NOT NULL,
    "quadril" DOUBLE PRECISION NOT NULL,
    "braco_d" DOUBLE PRECISION NOT NULL,
    "braco_e" DOUBLE PRECISION NOT NULL,
    "coxa_d" DOUBLE PRECISION NOT NULL,
    "coxa_e" DOUBLE PRECISION NOT NULL,
    "panturrilha_d" DOUBLE PRECISION NOT NULL,
    "panturrilha_e" DOUBLE PRECISION NOT NULL,
    "medidaMao" DOUBLE PRECISION NOT NULL,
    "mobilidadeGlenoumeralDireita" DOUBLE PRECISION NOT NULL,
    "mobilidadeGlenoumeralEsquerda" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoQuadrilDireito" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoQuadrilEsquerdo" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoTornozeloDireito" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoTornozeloEsquerdo" DOUBLE PRECISION NOT NULL,
    "pranchaVentral" DOUBLE PRECISION NOT NULL,
    "extensaoColuna" DOUBLE PRECISION NOT NULL,
    "pranchaLateralDireita" DOUBLE PRECISION NOT NULL,
    "pranchaLateralEsquerda" DOUBLE PRECISION NOT NULL,
    "squatJump1" DOUBLE PRECISION NOT NULL,
    "squatJump2" DOUBLE PRECISION NOT NULL,
    "squatJump3" DOUBLE PRECISION NOT NULL,
    "RMagachamento" DOUBLE PRECISION NOT NULL,
    "RMsupino" DOUBLE PRECISION NOT NULL,
    "RMterra" DOUBLE PRECISION NOT NULL,
    "RMbarraFixa" DOUBLE PRECISION NOT NULL,
    "VelocidadeAerobiaMaxima" DOUBLE PRECISION NOT NULL,
    "bracoDireito" DOUBLE PRECISION NOT NULL,
    "bracoEsquerdo" DOUBLE PRECISION NOT NULL,
    "coxaDireita" DOUBLE PRECISION NOT NULL,
    "coxaEsquerda" DOUBLE PRECISION NOT NULL,
    "panturrilhaDireita" DOUBLE PRECISION NOT NULL,
    "panturrilhaEsquerda" DOUBLE PRECISION NOT NULL,
    "idade" INTEGER NOT NULL,
    "data" TEXT NOT NULL,
    "hora" TEXT NOT NULL,
    "pontuacaoTempoTreinoAtual" INTEGER NOT NULL,
    "pontuacao_tempo_de_destreinamento_atual" INTEGER NOT NULL,
    "pontuacao_experiencia_previa_de_treinamento" INTEGER NOT NULL,
    "pontuacao_media_nivel_treinamento" DOUBLE PRECISION NOT NULL,
    "status_de_treinamento" TEXT NOT NULL,
    "nivel_mob_torn_direito" TEXT NOT NULL,
    "nivel_mob_torn_esquerdo" TEXT NOT NULL,
    "nivel_mob_quadril_direito" TEXT NOT NULL,
    "nivel_mob_quadril_esquerdo" TEXT NOT NULL,
    "nivel_mob_omb_direito" TEXT NOT NULL,
    "nivel_mob_omb_esquerdo" TEXT NOT NULL,
    "nivelPranchaVentral" TEXT NOT NULL,
    "nivelExtensaoColuna" TEXT NOT NULL,
    "nivelPranchaLateralDireita" TEXT NOT NULL,
    "nivelPranchaLateralEsquerda" TEXT NOT NULL,
    "pontosPranchaVentral" DOUBLE PRECISION NOT NULL,
    "pontosExtensaoColuna" DOUBLE PRECISION NOT NULL,
    "pontosPranchaLateralDireita" DOUBLE PRECISION NOT NULL,
    "pontosPranchaLateralEsquerda" DOUBLE PRECISION NOT NULL,
    "forcaRelativaAgachamento" DOUBLE PRECISION NOT NULL,
    "forcaRelativaSupino" DOUBLE PRECISION NOT NULL,
    "forcaRelativaTerra" DOUBLE PRECISION NOT NULL,
    "forcaRelativaBarraFixa" DOUBLE PRECISION NOT NULL,
    "squat_nivel" TEXT NOT NULL,
    "supino_nivel" TEXT NOT NULL,
    "terra_nivel" TEXT NOT NULL,
    "pontuacao_squat_nivel" DOUBLE PRECISION NOT NULL,
    "pontuacao_supino_nivel" DOUBLE PRECISION NOT NULL,
    "pontuacao_terra_nivel" DOUBLE PRECISION NOT NULL,
    "media_squat_jump" DOUBLE PRECISION NOT NULL,
    "vo2_estimado" DOUBLE PRECISION NOT NULL,
    "faixa_etaria" TEXT NOT NULL,
    "nivel_vo2" TEXT NOT NULL,
    "IMC" DOUBLE PRECISION NOT NULL,
    "ClassificacaoIMC" TEXT NOT NULL,
    "idtagaluno" TEXT NOT NULL,

    CONSTRAINT "QuestionarioProntidaoAvaliacaoFisica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FormularioAvaliacaoFisica" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "aluno" TEXT NOT NULL,
    "treinador" TEXT NOT NULL,
    "diaTreino" TEXT NOT NULL,
    "modalidadeTreino" TEXT NOT NULL,
    "diaTreinoExtra" TEXT NOT NULL,
    "modalidadeTreinoExtra" TEXT NOT NULL,
    "altura" DOUBLE PRECISION NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "torax" DOUBLE PRECISION NOT NULL,
    "cintura" DOUBLE PRECISION NOT NULL,
    "abdomen" DOUBLE PRECISION NOT NULL,
    "quadril" DOUBLE PRECISION NOT NULL,
    "braco_d" DOUBLE PRECISION NOT NULL,
    "braco_e" DOUBLE PRECISION NOT NULL,
    "coxa_d" DOUBLE PRECISION NOT NULL,
    "coxa_e" DOUBLE PRECISION NOT NULL,
    "panturrilha_d" DOUBLE PRECISION NOT NULL,
    "panturrilha_e" DOUBLE PRECISION NOT NULL,
    "medidaMao" DOUBLE PRECISION NOT NULL,
    "mobilidadeGlenoumeralDireita" DOUBLE PRECISION NOT NULL,
    "mobilidadeGlenoumeralEsquerda" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoQuadrilDireito" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoQuadrilEsquerdo" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoTornozeloDireito" DOUBLE PRECISION NOT NULL,
    "AmplitudeMovimentoTornozeloEsquerdo" DOUBLE PRECISION NOT NULL,
    "pranchaVentral" DOUBLE PRECISION NOT NULL,
    "extensaoColuna" DOUBLE PRECISION NOT NULL,
    "pranchaLateralDireita" DOUBLE PRECISION NOT NULL,
    "pranchaLateralEsquerda" DOUBLE PRECISION NOT NULL,
    "squatJump1" DOUBLE PRECISION NOT NULL,
    "squatJump2" DOUBLE PRECISION NOT NULL,
    "squatJump3" DOUBLE PRECISION NOT NULL,
    "RMagachamento" DOUBLE PRECISION NOT NULL,
    "RMsupino" DOUBLE PRECISION NOT NULL,
    "RMterra" DOUBLE PRECISION NOT NULL,
    "RMbarraFixa" DOUBLE PRECISION NOT NULL,
    "VelocidadeAerobiaMaxima" DOUBLE PRECISION NOT NULL,
    "bracoDireito" DOUBLE PRECISION NOT NULL,
    "bracoEsquerdo" DOUBLE PRECISION NOT NULL,
    "coxaDireita" DOUBLE PRECISION NOT NULL,
    "coxaEsquerda" DOUBLE PRECISION NOT NULL,
    "panturrilhaDireita" DOUBLE PRECISION NOT NULL,
    "panturrilhaEsquerda" DOUBLE PRECISION NOT NULL,
    "idade" INTEGER NOT NULL,
    "data" TEXT NOT NULL,
    "hora" TEXT NOT NULL,
    "pontuacaoTempoTreinoAtual" INTEGER NOT NULL,
    "pontuacao_tempo_de_destreinamento_atual" INTEGER NOT NULL,
    "pontuacao_experiencia_previa_de_treinamento" INTEGER NOT NULL,
    "pontuacao_media_nivel_treinamento" DOUBLE PRECISION NOT NULL,
    "status_de_treinamento" TEXT NOT NULL,
    "nivel_mob_torn_direito" TEXT NOT NULL,
    "nivel_mob_torn_esquerdo" TEXT NOT NULL,
    "nivel_mob_quadril_direito" TEXT NOT NULL,
    "nivel_mob_quadril_esquerdo" TEXT NOT NULL,
    "nivel_mob_omb_direito" TEXT NOT NULL,
    "nivel_mob_omb_esquerdo" TEXT NOT NULL,
    "nivelPranchaVentral" TEXT NOT NULL,
    "nivelExtensaoColuna" TEXT NOT NULL,
    "nivelPranchaLateralDireita" TEXT NOT NULL,
    "nivelPranchaLateralEsquerda" TEXT NOT NULL,
    "pontosPranchaVentral" DOUBLE PRECISION NOT NULL,
    "pontosExtensaoColuna" DOUBLE PRECISION NOT NULL,
    "pontosPranchaLateralDireita" DOUBLE PRECISION NOT NULL,
    "pontosPranchaLateralEsquerda" DOUBLE PRECISION NOT NULL,
    "forcaRelativaAgachamento" DOUBLE PRECISION NOT NULL,
    "forcaRelativaSupino" DOUBLE PRECISION NOT NULL,
    "forcaRelativaTerra" DOUBLE PRECISION NOT NULL,
    "forcaRelativaBarraFixa" DOUBLE PRECISION NOT NULL,
    "squat_nivel" TEXT NOT NULL,
    "supino_nivel" TEXT NOT NULL,
    "terra_nivel" TEXT NOT NULL,
    "pontuacao_squat_nivel" DOUBLE PRECISION NOT NULL,
    "pontuacao_supino_nivel" DOUBLE PRECISION NOT NULL,
    "pontuacao_terra_nivel" DOUBLE PRECISION NOT NULL,
    "media_squat_jump" DOUBLE PRECISION NOT NULL,
    "vo2_estimado" DOUBLE PRECISION NOT NULL,
    "faixa_etaria" TEXT NOT NULL,
    "nivel_vo2" TEXT NOT NULL,
    "IMC" DOUBLE PRECISION NOT NULL,
    "ClassificacaoIMC" TEXT NOT NULL,

    CONSTRAINT "FormularioAvaliacaoFisica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Treino" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Treino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RegistraTreino" (
    "id" TEXT NOT NULL,
    "cdTipodeTreino" TEXT NOT NULL,
    "cdTreino" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "dataHoraRegistroInterno" TEXT NOT NULL,
    "dataHoraRegistroPeloUser" TEXT NOT NULL,
    "treinoId" TEXT NOT NULL,
    "escalacomosesente" INTEGER NOT NULL,
    "escaladisposicaoantesdasecao" INTEGER NOT NULL,
    "estadocontroleinterno" INTEGER NOT NULL,
    "logdoprocessoderegistro" TEXT NOT NULL,

    CONSTRAINT "RegistraTreino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GymUsers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "_GymUsers_AB_unique" ON "_GymUsers"("A", "B");

-- CreateIndex
CREATE INDEX "_GymUsers_B_index" ON "_GymUsers"("B");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gym" ADD CONSTRAINT "Gym_responsibleId_fkey" FOREIGN KEY ("responsibleId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserType" ADD CONSTRAINT "UserType_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Todo" ADD CONSTRAINT "Todo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionarioProntidaoAvaliacaoFisica" ADD CONSTRAINT "QuestionarioProntidaoAvaliacaoFisica_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormularioAvaliacaoFisica" ADD CONSTRAINT "FormularioAvaliacaoFisica_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegistraTreino" ADD CONSTRAINT "RegistraTreino_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GymUsers" ADD CONSTRAINT "_GymUsers_A_fkey" FOREIGN KEY ("A") REFERENCES "Gym"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GymUsers" ADD CONSTRAINT "_GymUsers_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
