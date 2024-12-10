FROM openjdk:17-jdk-slim

# Copiar apenas os arquivos necessários
COPY . /app
WORKDIR /app

# Compilar o projeto sem testes
RUN chmod +x ./gradlew && \
    ./gradlew --version && \
    ./gradlew bootJar && \
    mv build/libs/app.jar /app/app.jar

# Executar a aplicação
CMD ["java", "-jar", "/app/app.jar"]