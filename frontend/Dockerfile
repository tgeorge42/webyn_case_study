# Utilisation de l'image Node.js
FROM node:20

# Définition du dossier de travail
WORKDIR /app

# Copie du fichier package.json et installation des dépendances
COPY package.json package-lock.json ./
RUN npm install

# Copie des fichiers du frontend
COPY . .

# Exposer le port 4200
EXPOSE 4200

# Commande pour démarrer l'application Angular
CMD ["npm", "start", "--", "--host", "0.0.0.0"]
