FROM python:3.10.12

# Gerekli bağımlılıkları yükleme
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git curl ffmpeg aria2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /root/tyler/urlbot

# Gereksinim dosyasını kopyala ve bağımlılıkları yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . .

# Botu çalıştır
CMD ["python3", "bot.py"]

