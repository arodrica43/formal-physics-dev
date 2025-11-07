FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ARG USERNAME=vscode
ARG GHC_VERSION=9.4.8
ARG CABAL_VERSION=3.10.2.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends     ca-certificates curl git build-essential xz-utils gnupg     libgmp-dev libncurses-dev zlib1g-dev pkg-config  && rm -rf /var/lib/apt/lists/*

RUN if ! id -u $USERNAME >/dev/null 2>&1; then       useradd -m -s /bin/bash $USERNAME;     fi

USER $USERNAME
SHELL ["/bin/bash", "-lc"]

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org       | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1 sh  && source ~/.ghcup/env  && ghcup install ghc ${GHC_VERSION}  && ghcup set ghc ${GHC_VERSION}  && ghcup install cabal ${CABAL_VERSION}  && ghcup set cabal ${CABAL_VERSION}  && cabal update  && cabal install Agda  && echo 'export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"' >> ~/.bashrc

RUN mkdir -p /opt/agda-libs  && git clone --depth=1 https://github.com/agda/cubical.git /opt/agda-libs/cubical  && mkdir -p /home/${USERNAME}/.agda  && echo "/opt/agda-libs/cubical/cubical.agda-lib" >> /home/${USERNAME}/.agda/libraries  && echo "cubical" > /home/${USERNAME}/.agda/defaults

RUN echo '# Register workspace library if present' >> ~/.bashrc  && echo 'if [ -f "/workspaces/${PWD##*/}/myproject.agda-lib" ]; then' >> ~/.bashrc  && echo '  grep -qxF "/workspaces/${PWD##*/}/myproject.agda-lib" ~/.agda/libraries || echo "/workspaces/${PWD##*/}/myproject.agda-lib" >> ~/.agda/libraries' >> ~/.bashrc  && echo 'fi' >> ~/.bashrc

USER root
SHELL ["/bin/bash", "-lc"]
RUN ln -sf /home/${USERNAME}/.cabal/bin/agda /usr/local/bin/agda  && chown -R ${USERNAME}:${USERNAME} /opt/agda-libs /home/${USERNAME}/.agda
USER $USERNAME
