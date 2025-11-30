FROM python:3.11-slim

# 作業ディレクトリ
WORKDIR /src

# 必要に応じてビルド系パッケージ
RUN apt-get update && apt-get install -y gcc fonts-ipafont-gothic fonts-ipafont-mincho && \
    rm -rf /var/lib/apt/lists/*

# requirements.txt のコピー
COPY requirements.txt /src/requirements.txt

# ライブラリインストール
RUN pip install --no-cache-dir -r requirements.txt

# Notebook カーネル用
RUN pip install ipykernel

# Docker イメージのビルド時にカーネル自動登録
RUN python -m ipykernel install --user --name=dockerPy --display-name "Python (Docker)"

CMD ["bash"]