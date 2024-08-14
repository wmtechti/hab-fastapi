# Etapa 1: Construção
FROM python:3.11-slim as build

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos de requirements para o contêiner
COPY requirements.txt .

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante da aplicação para o contêiner
COPY . .

# Etapa 2: Execução
FROM python:3.11-slim

# Definir diretório de trabalho
WORKDIR /app

# Copiar as dependências instaladas da fase de build
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

# Copiar o código da aplicação
COPY --from=build /app /app

# Expor a porta em que o FastAPI vai rodar
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
