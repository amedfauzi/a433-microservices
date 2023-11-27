# Docker akan mengunduh/mengambil base image bernama node dari Docker Hub dengan versi 14-alpine
FROM node:14.21.3-alpine3.17

# Membuat directory bernama app di dalam container dan menjadikannya sebagai working directory
WORKDIR /app

# Titik pertama = source, titik kedua = destination. Menyalin seluruh source code ke working directory di container
COPY . .

# Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengeksekusi perintah untuk menjalankan aplikasi yang berarti node app.js bila pada shell dan # Menjalankan server saat container diluncurkan
CMD ["node", "app.js"]


# Ekspos port yang digunakan oleh aplikasi, yaitu 8080
EXPOSE 8080
