const express = require('express');
const jwt = require('jsonwebtoken');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

const JWT_SECRET = 'clave_super_segura';

const PRODUCTS = [
  { id: 1, name: 'Balón de fútbol', category: 'balones', price: 120000 },
  { id: 2, name: 'Zapatillas deportivas', category: 'calzado', price: 250000 },
  { id: 3, name: 'Guantes de boxeo', category: 'accesorios', price: 90000 }
];

app.post('/login', (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) return res.status(400).json({ error: 'Faltan datos' });
  const token = jwt.sign({ email }, JWT_SECRET, { expiresIn: '2h' });
  res.json({ token });
});

app.get('/productos', (req, res) => res.json(PRODUCTS));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Servidor corriendo en puerto ${PORT}`));
