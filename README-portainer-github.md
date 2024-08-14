Rodar sua aplicação a partir do GitHub via Portainer é uma maneira eficiente de gerenciar e implantar contêineres Docker. Aqui está um guia passo a passo para você configurar e rodar a aplicação dessa forma:

### 1. **Preparar o Repositório no GitHub**

Certifique-se de que o repositório GitHub esteja bem estruturado e contenha todos os arquivos necessários, como:

- `Dockerfile`
- `docker-compose.yaml` (se aplicável)
- `.env` (opcional)
- Código da aplicação em pastas como `app/`
- `requirements.txt` ou qualquer outro arquivo de dependências

### 2. **Configurar o Portainer**

1. **Acessar o Portainer**:
   - Entre na interface do Portainer via navegador.

2. **Criar um Novo Stack**:
   - No menu lateral, clique em "Stacks".
   - Clique em "Add Stack" para criar um novo stack.

3. **Configurar o Stack**:
   - **Nome do Stack**: Dê um nome ao seu stack, por exemplo, `my-fastapi-app`.
   - **Git Repository**:
     - Selecione a opção "Git repository".
     - **Repository URL**: Insira a URL do repositório GitHub onde o código está hospedado, por exemplo, `https://github.com/username/my-fastapi-app`.
     - **Branch**: Especifique a branch a ser utilizada, geralmente `main` ou `master`.
     - **Compose Path** (opcional): Se você estiver usando um `docker-compose.yaml` e ele não estiver na raiz do repositório, especifique o caminho aqui.
   - **Env File**: Se você tiver um arquivo `.env` no repositório, o Portainer o carregará automaticamente se você especificar o caminho correto.

4. **Deploy do Stack**:
   - Clique em "Deploy the stack" para que o Portainer comece a baixar o código do GitHub, construa a imagem (se necessário), e inicie os contêineres.

### 3. **Monitorar e Gerenciar o Stack**

- Após o deploy, você pode monitorar os serviços e contêineres diretamente pelo Portainer.
- Na seção "Containers", você pode ver logs, acessar o console do contêiner, reiniciar serviços, e outras opções de gerenciamento.

### 4. **Expor a Aplicação**

- Certifique-se de que as portas necessárias estão expostas no `docker-compose.yaml` ou no `Dockerfile` e configuradas no Portainer.
- Por exemplo, se sua aplicação FastAPI está rodando na porta 8000, verifique se essa porta está mapeada para uma porta no host.

### 5. **Atualizar o Código**

- Sempre que você fizer alterações no repositório GitHub, basta ir ao Portainer e clicar em "Re-deploy the stack" para que o Portainer atualize a aplicação com as novas mudanças.

### Exemplo de `docker-compose.yaml` para Portainer

Se você estiver usando `docker-compose`, seu `docker-compose.yaml` pode ser parecido com este:

```yaml
version: '3.8'

services:
  app:
    build: 
      context: .
      dockerfile: Dockerfile
    image: my-fastapi-app
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=${DATABASE_URL}  # Usando variáveis de ambiente
    restart: always

  db:
    image: postgres:15
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: database
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

volumes:
  postgres_data:
```

### 6. **Boas Práticas**

- **Segurança**: Evite armazenar segredos sensíveis diretamente no repositório GitHub. Utilize variáveis de ambiente para isso.
- **Atualizações Automáticas**: Configure webhooks no GitHub para que o Portainer redeploy automaticamente a aplicação quando houver novos commits, se for necessário.

