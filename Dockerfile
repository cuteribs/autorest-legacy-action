FROM node:18-alpine

WORKDIR /root

ADD https://dotnetcli.azureedge.net/dotnet/Runtime/6.0.25/dotnet-runtime-6.0.25-linux-musl-x64.tar.gz /root/.dotnet/runtime.tar.gz
COPY *.md /root/
COPY *.sh /root/

RUN tar xvf /root/.dotnet/runtime.tar.gz --directory /root/.dotnet/ && \
    rm /root/.dotnet/runtime.tar.gz && \
    chmod +x /root/*.sh && \
    npm i -g autorest && \
    autorest --version:3.5 --legacy; exit 0

ENTRYPOINT [ "/root/entrypoint.sh" ]