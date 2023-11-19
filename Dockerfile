FROM node:18-alpine

WORKDIR /root

ADD https://dotnetcli.azureedge.net/dotnet/Runtime/6.0.25/dotnet-runtime-6.0.25-linux-musl-x64.tar.gz /root/.dotnet/runtime.tar.gz
COPY *.md /root/
COPY *.sh /root/

ENV PATH="$PATH:/root/.dotnet"
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

RUN tar xvf /root/.dotnet/runtime.tar.gz --directory /root/.dotnet/ && \
    rm /root/.dotnet/runtime.tar.gz && \
    npm i -g autorest && \
    autorest --version:3.5 --legacy; exit 0
RUN mv /root/*.md /root/.autorest/@autorest_core@3.5.1/node_modules/@autorest/core/dist/resources/

ENTRYPOINT [ "/root/entrypoint.sh" ]