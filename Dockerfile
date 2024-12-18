# Utiliser une image de base Node.js
FROM node:16

# Créer un répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY package*.json ./
RUN npm install
COPY . .

# Exposer le port et démarrer l'application
EXPOSE 3000
CMD ["npm", "start"]
