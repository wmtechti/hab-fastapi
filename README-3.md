Se você precisar utilizar o Docker Compose para gerenciar o seu ambiente, você pode criar um arquivo `docker-compose.yaml` que define como os serviços do seu aplicativo devem ser configurados e orquestrados. Aqui está um exemplo básico de um `docker-compose.yaml` para o seu projeto FastAPI:

### docker-compose.yaml

```yaml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: fastapi_app
    ports:
      - "8000:8000"
    environment:
      DATABASE_URL: "postgresql://user:password@db:5432/database"
    depends_on:
      - db

  db:
    image: postgres:15
    container_name: fastapi_db
    restart: always
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: database
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

### Explicação dos Componentes:

1. **version**: Define a versão do Docker Compose. Neste exemplo, estamos usando a versão `3.8`.

2. **services**:
   - **app**:
     - **build**: Define como o serviço `app` deve ser construído a partir do `Dockerfile`.
       - **context**: O diretório onde o Docker deve procurar o `Dockerfile`.
       - **dockerfile**: O nome do arquivo Dockerfile a ser usado.
     - **container_name**: Define o nome do contêiner para o serviço FastAPI.
     - **ports**: Mapeia a porta `8000` do contêiner para a porta `8000` da máquina host.
     - **environment**: Define variáveis de ambiente. Nesse caso, estamos passando a string de conexão para o banco de dados.
     - **depends_on**: Garante que o serviço `db` (banco de dados) seja iniciado antes do serviço `app`.
  
   - **db**:
     - **image**: Usa a imagem oficial do PostgreSQL, versão `15`.
     - **container_name**: Define o nome do contêiner para o banco de dados.
     - **restart**: Configura o serviço para reiniciar automaticamente em caso de falha (`always`).
     - **environment**: Define variáveis de ambiente para configurar o banco de dados (usuário, senha, e nome do banco).
     - **volumes**: Mapeia um volume Docker para persistir os dados do banco de dados.

3. **volumes**:
   - **postgres_data**: Um volume Docker que armazena os dados do banco de dados PostgreSQL, garantindo que os dados sejam preservados mesmo que o contêiner seja removido.

### Como Usar:

1. **Iniciar os serviços**:
   ```bash
   docker-compose up -d
   ```

   Isso irá construir e iniciar os contêineres em segundo plano.

2. **Parar os serviços**:
   ```bash
   docker-compose down
   ```

3. **Logs dos serviços**:
   ```bash
   docker-compose logs -f
   ```

   Esse comando mostra os logs em tempo real de todos os serviços.

### Variáveis de Ambiente:

O `DATABASE_URL` no serviço `app` deve ser ajustado de acordo com o nome do usuário, senha, e nome do banco de dados que você configurou no serviço `db`.

Este `docker-compose.yaml` oferece uma configuração básica que deve funcionar para o desenvolvimento. Você pode estendê-lo conforme necessário, por exemplo, adicionando um serviço de cache, um servidor web como Nginx, ou qualquer outro serviço que você precise.


Em um projeto típico, tanto o `Dockerfile` quanto o `docker-compose.yaml` ficam na raiz do projeto. Vou detalhar a organização de pastas com base na estrutura sugerida anteriormente.

### Estrutura Final do Projeto

```
my_fastapi_app/
├── app/
│   ├── main.py
│   ├── models/
│   │   └── aluno.py
│   ├── routers/
│   │   └── aluno.py
│   └── database.py
├── Dockerfile
├── docker-compose.yaml
└── requirements.txt
```

### Colocação dos Arquivos:

- **`Dockerfile`**: Fica na raiz do projeto (`my_fastapi_app/`). Isso facilita a construção da imagem Docker, pois o caminho padrão do `context` e do `dockerfile` no `docker-compose.yaml` refere-se à raiz.

- **`docker-compose.yaml`**: Também fica na raiz do projeto (`my_fastapi_app/`). Dessa forma, ele pode referenciar facilmente o `Dockerfile` e qualquer outro arquivo ou pasta dentro do projeto.

- **`requirements.txt`**: Fica na raiz do projeto para que o Docker possa copiar e instalar as dependências durante a construção da imagem.

### Por que manter esses arquivos na raiz?

- **Facilidade de uso**: Manter esses arquivos na raiz permite que você execute comandos do Docker e Docker Compose de maneira simples e direta, sem precisar especificar caminhos adicionais.

- **Clareza**: Seguir essa convenção é uma prática comum em projetos que utilizam Docker, o que facilita a colaboração com outros desenvolvedores.

O arquivo `.env` deve ser colocado na raiz do projeto, junto com o `Dockerfile` e o `docker-compose.yaml`. Isso facilita o carregamento das variáveis de ambiente tanto pelo Docker Compose quanto pela sua aplicação FastAPI.

### Estrutura Final do Projeto com `.env`

```
my_fastapi_app/
├── .env
├── app/
│   ├── main.py
│   ├── models/
│   │   └── aluno.py
│   ├── routers/
│   │   └── aluno.py
│   └── database.py
├── Dockerfile
├── docker-compose.yaml
└── requirements.txt
```

### Configuração do `.env`

Dentro do seu arquivo `.env`, você pode definir variáveis de ambiente, como:

```plaintext
DATABASE_URL=postgresql://user:password@db:5432/database
SECRET_KEY=mysecretkey
```

### Referência ao `.env` no `docker-compose.yaml`

O Docker Compose carrega automaticamente as variáveis do arquivo `.env` que estiver na mesma pasta do `docker-compose.yaml`. Portanto, você não precisa fazer nenhuma configuração adicional no `docker-compose.yaml` para que as variáveis sejam carregadas. Elas serão automaticamente disponibilizadas para os serviços definidos no `docker-compose.yaml`.

### Utilização do `.env` na aplicação FastAPI

Na sua aplicação FastAPI, você pode usar a biblioteca `python-dotenv` para carregar as variáveis do `.env`:

```python
from dotenv import load_dotenv
import os

# Carregar as variáveis do .env
load_dotenv()

# Acessar as variáveis de ambiente
database_url = os.getenv("DATABASE_URL")
secret_key = os.getenv("SECRET_KEY")
```

### Instalação da Biblioteca `python-dotenv`

Se você ainda não tiver a biblioteca `python-dotenv` instalada, adicione-a ao seu `requirements.txt`:

```plaintext
fastapi
uvicorn[standard]
pydantic
prisma
python-dotenv
```

Isso garantirá que as variáveis de ambiente do `.env` sejam carregadas corretamente na sua aplicação.

### Por que manter o `.env` na raiz?

- **Padronização**: Seguir essa convenção facilita o uso do arquivo `.env` tanto pelo Docker Compose quanto pela aplicação em si.
- **Centralização**: Manter todas as configurações de ambiente na raiz do projeto torna mais fácil gerenciar e versionar essas configurações.

