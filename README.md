# pytorch-pysig

A ready-to-go Python project for working with [PyTorch](https://pytorch.org/) and [TorchSig](https://github.com/TorchDSP/torchsig), managed with [uv](https://docs.astral.sh/uv/). Includes Jupyter Lab for interactive notebooks.

## Prerequisites

You need two tools installed before getting started: **Rust** and **uv**.

### 1. Install Rust

TorchSig includes a compiled Rust extension, so you need the Rust toolchain on your system.

Open a terminal and run:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Follow the on-screen prompts (the defaults are fine). When it finishes, restart your terminal or run:

```bash
source $HOME/.cargo/env
```

Verify it worked:

```bash
rustc --version
```

You should see something like `rustc 1.xx.x`.

### 2. Install uv

uv is a fast Python package manager that handles Python versions, virtual environments, and dependencies all in one tool.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Restart your terminal or follow the instructions printed by the installer. Verify it worked:

```bash
uv --version
```

## Getting Started

### Clone the repository

```bash
git clone <repo-url>
cd pytorch-pysig
```

### Install everything

This single command will download the correct Python version (3.12), create a virtual environment, and install all dependencies including PyTorch and TorchSig:

```bash
uv sync
```

This may take several minutes the first time as it downloads Python, compiles the TorchSig Rust extension, and installs PyTorch (which is a large package).

### Verify the installation

```bash
uv run python -c "import torch; import torchsig; print('PyTorch', torch.__version__); print('TorchSig OK')"
```

You should see the PyTorch version printed and `TorchSig OK`.

## Usage

### Run a Python script

```bash
uv run python main.py
```

### Start Jupyter Lab

```bash
uv run jupyter lab
```

This opens Jupyter Lab in your browser where you can create and run notebooks interactively.

### Run any command in the project environment

Prefix any command with `uv run` to execute it inside the virtual environment:

```bash
uv run python my_script.py
```

## Troubleshooting

### Rust compiler errors during install

Make sure Rust is installed and available on your PATH:

```bash
rustc --version
cargo --version
```

If these commands aren't found, re-run the Rust install step and restart your terminal.

### `uv sync` fails to resolve dependencies

Try clearing the cache and re-syncing:

```bash
uv cache clean
uv sync
```

### Python version issues

This project requires Python 3.12. uv will download and manage this automatically -- you do not need to install Python yourself. If you see version-related errors, make sure you're running commands with `uv run` rather than calling `python` directly.
