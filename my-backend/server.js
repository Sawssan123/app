const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const donationRoutes = require('./routes/donationRoutes');

// Initialisation de l'application
const app = express();
const port = 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Connexion à MongoDB
mongoose.connect('mongodb://localhost:27017/classroom', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log("MongoDB connecté"))
  .catch(err => console.log("Erreur MongoDB : ", err));

// Routes
app.use('/api/donations', donationRoutes);

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur lancé sur le port ${port}`);
});
