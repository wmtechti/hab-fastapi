# Use uma imagem base com Python 3.10
FROM python:3.10-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo .env
COPY .envprod .env

# Copie todos os arquivos do diretório atual para o diretório de trabalho
COPY . /app

# Crie o diretório prisma e copie o schema.prisma
# RUN mkdir prisma
COPY prisma/schema.prisma prisma/

# Instale as dependências do Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Instale o Node.js e npm
# RUN apt-get update && apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
# RUN apt-get install -y nodejs

# Instale o Prisma CLI globalmente
# RUN npm install -g prisma

# Gere o Prisma Client
RUN prisma generate

# Comando padrão para rodar o container
# CMD ["python", "seu_script.py"]

# Comando para rodar a aplicação FastAPI
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# If running behind a proxy like Nginx or Traefik add --proxy-headers
CMD ["fastapi", "run", "app/main.py", "--port", "80", "--proxy-headers"]