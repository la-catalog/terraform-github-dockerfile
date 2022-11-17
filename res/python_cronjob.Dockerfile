FROM python:3.10.1-slim-buster

# Update system
RUN apt update
RUN apt upgrade -y

# Install PDM
RUN curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
RUN $HOME/.local/bin/pdm --pep582 >> ~/.bash_profile
RUN $HOME/.local/bin/pdm config python.use_venv false

# Create project
WORKDIR /project/

# Install dependencies
COPY pyproject.toml pdm.lock README.md /project/
RUN pdm install

# Copy files
COPY . /project/

# Run
ENTRYPOINT ["python", "project/main.py"]