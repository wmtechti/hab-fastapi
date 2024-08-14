Aqui está um exemplo de `Dockerfile` para criar uma imagem Docker para o seu projeto FastAPI:

### Dockerfile

```dockerfile
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
```

### Explicação das Etapas:

1. **Build Stage**:
    - **Base Image**: Utiliza uma imagem base `python:3.11-slim` para manter a imagem leve.
    - **WORKDIR**: Define `/app` como o diretório de trabalho no contêiner.
    - **COPY requirements.txt**: Copia o arquivo de dependências para o contêiner.
    - **RUN pip install**: Instala as dependências do Python listadas no `requirements.txt`.
    - **COPY . .**: Copia todo o código da aplicação para o contêiner.

2. **Final Stage**:
    - **Base Image**: Utiliza a mesma imagem base `python:3.11-slim` para a fase final.
    - **WORKDIR**: Define novamente o diretório de trabalho `/app`.
    - **COPY**: Copia os pacotes instalados e o código da aplicação da fase de build para a fase final.
    - **EXPOSE**: Expõe a porta `8000`, que será usada pelo FastAPI.
    - **CMD**: Define o comando para iniciar o servidor FastAPI usando `uvicorn`.

### Como Usar:

1. **Construir a Imagem**:
   ```bash
   docker build -t my-fastapi-app .
   ```

2. **Executar o Contêiner**:
   ```bash
   docker run -d -p 8000:8000 my-fastapi-app
   ```

3. **Acessar a Aplicação**:
   - A aplicação estará acessível em `http://localhost:8000`.

### Requisitos:

Certifique-se de que o arquivo `requirements.txt` contenha todas as dependências do seu projeto. Por exemplo:

```plaintext
fastapi
uvicorn[standard]
pydantic
prisma
```

Esse `Dockerfile` está de acordo com o que você estava buscando?