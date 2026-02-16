FROM python:3.12-slim

# Install system dependencies and Rust
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        build-essential \
        git \
        pkg-config \
        libssl-dev && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:${PATH}"

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

# Copy project files and install dependencies
COPY pyproject.toml uv.lock .python-version ./
RUN uv sync

# Copy the rest of the project
COPY . .

EXPOSE 8888

CMD ["uv", "run", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--IdentityProvider.token=''"]
