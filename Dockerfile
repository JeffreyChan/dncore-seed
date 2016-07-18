FROM microsoft/dotnet:latest

# Create app directory
RUN mkdir -p /usr/src/dncore/

WORKDIR /usr/src/dncore/

RUN git clone https://github.com/JeffreyChan/dncore-seed.git dncore-seed

WORKDIR /usr/src/dncore/dncore-seed

RUN dotnet restore 

RUN dotnet build

RUN dotnet publish

EXPOSE 5000/tcp

ENTRYPOINT dotnet /usr/src/dncore/dncore-seed/bin/Debug/netcoreapp1.0/publish/dncore-seed.dll