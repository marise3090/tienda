
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

#Etapa 1: Compilacion
From maven:3.8.5-openjdk-17 as build
workdir /app 
COPY . .
RUN MVN -f pom.xml clean package -DskipTests

#Etapa 2: Creacion de la imagen final
FROM openjdk:17.0.1-jdk-slim
workdir /app
COPY --from=build /app/target/*.jar ./app.jar
expose 80
ENTRYPOINT ["java","-jar","app.jar"]
