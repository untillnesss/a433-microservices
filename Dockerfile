# Menggunakan node js versi 14
FROM node:14

# Membuat working directory /app
WORKDIR /app

# Salin semua file disini, ke dalam working directory
COPY . .

# Menerapkan ENV yang akan di gunakan oleh Node App
ENV NODE_ENV=production DB_HOST=item-db

# Menjalankan command untuk menginstall package npm
RUN npm install --production --unsafe-perm && npm run build
# RUN npm -v

# Mengeluarkan atau membuka port 8080 di sambugkan ke node app
EXPOSE 8080

# Melakukan perintah saat container di jalankan
CMD [ "npm", "start" ]


