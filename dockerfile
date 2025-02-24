# 使用 Python 3.12.9-slim-bullseye 作為基礎映像
FROM python:3.12.9-slim-bullseye

# 設定工作目錄
WORKDIR /app

# 設定 Python 環境變數
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# 安裝系統依賴
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 複製專案檔案
COPY . .

# 安裝 Python 依賴
RUN pip install --no-cache-dir -r requirements.txt

# 設定容器對外埠號
EXPOSE 9898

# 設定啟動命令
CMD ["python", "app.py"]