# Use the official devcontainers Haskell image to avoid double-installing GHC
FROM mcr.microsoft.com/devcontainers/haskell:1-9.6-bullseye

ARG USERNAME=vscode
ENV DEBIAN_FRONTEND=noninteractive

# Basics + git
RUN apt-get update && apt-get install -y --no-install-recommends         ca-certificates git curl xz-utils       && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}
SHELL ["/bin/bash", "-lc"]

# Ensure ghcup+cabal/GHC are on PATH (already installed by base image)
RUN echo 'export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"' >> ~/.bashrc

# Install Agda via cabal (single GHC already present) and clean caches to save space
RUN cabal update && cabal install Agda       && ln -s "$HOME/.cabal/bin/agda" /usr/local/bin/agda || true       && rm -rf ~/.cabal/packages ~/.cabal/store/ghc-*/package.db/*.cache ~/.ghcup/cache || true

# Install Cubical library and register it
RUN mkdir -p /opt/agda-libs       && git clone --depth=1 https://github.com/agda/cubical.git /opt/agda-libs/cubical       && mkdir -p /home/${USERNAME}/.agda       && echo "/opt/agda-libs/cubical/cubical.agda-lib" >> /home/${USERNAME}/.agda/libraries       && echo "cubical" > /home/${USERNAME}/.agda/defaults
