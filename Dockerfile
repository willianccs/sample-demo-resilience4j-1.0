FROM openjdk:17-jdk-slim

# Copiar apenas os arquivos necessários
COPY . /app
WORKDIR /app

# Compilar o projeto sem testes
RUN chmod +x ./gradlew && \
    ./gradlew --version && \
    ./gradlew clean build -x test

# Executar a aplicação
CMD ["./gradlew", "bootRun"]