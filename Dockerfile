FROM microsoft/dotnet:1.1.0-sdk-projectjson-nanoserver

MAINTAINER Maurice de Beijer

COPY ./project.json /app/project.json

WORKDIR /app

RUN ["dotnet", "restore"]

COPY . /app

RUN ["dotnet", "build"]

EXPOSE 5000/tcp

CMD ["dotnet", "run", "--server.urls", "http://*:5000"]
