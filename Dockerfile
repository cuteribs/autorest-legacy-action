FROM node:16-bullseye

apt update && \
    apt install -y --no-install-recommends libunwind-dev && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh && \
    ./dotnet-install.sh -c 3.1 && \
    export DOTNET_ROOT=$HOME/.dotnet && \
    export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools && \
    export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 && \
    npm i -g autorest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

