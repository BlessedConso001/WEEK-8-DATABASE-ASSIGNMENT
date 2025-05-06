const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Database Connection
const db = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '123456789',
  database: process.env.DB_NAME || 'church_db'
});

db.connect(err => {
  if (err) throw err;
  console.log('✅ Connected to MySQL Database');
});

// ============================
// MEMBERS ROUTES - CRUD
// ============================

// CREATE member
app.post('/members', (req, res) => {
  const { service_id, first_name, last_name, join_date } = req.body;
  db.query(
    'INSERT INTO members (service_id, first_name, last_name, join_date) VALUES (?, ?, ?, ?)',
    [service_id, first_name, last_name, join_date],
    (err, result) => {
      if (err) return res.status(500).json(err);
      res.json({ id: result.insertId, message: 'Member created' });
    }
  );
});

// READ all members
app.get('/members', (_, res) => {
  db.query('SELECT * FROM members', (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results);
  });
});

// READ one member
app.get('/members/:id', (req, res) => {
  db.query('SELECT * FROM members WHERE member_id = ?', [req.params.id], (err, result) => {
    if (err) return res.status(500).json(err);
    res.json(result[0]);
  });
});

// UPDATE member
app.put('/members/:id', (req, res) => {
  const { service_id, first_name, last_name, join_date } = req.body;
  db.query(
    'UPDATE members SET service_id = ?, first_name = ?, last_name = ?, join_date = ? WHERE member_id = ?',
    [service_id, first_name, last_name, join_date, req.params.id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: 'Member updated' });
    }
  );
});

// DELETE member
app.delete('/members/:id', (req, res) => {
  db.query('DELETE FROM members WHERE member_id = ?', [req.params.id], err => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Member deleted' });
  });
});

// ============================
// SERVICES ROUTES - CRUD
// ============================

// CREATE service
app.post('/services', (req, res) => {
  const { service_date, theme, preacher } = req.body;
  db.query(
    'INSERT INTO services (service_date, theme, preacher) VALUES (?, ?, ?)',
    [service_date, theme, preacher],
    (err, result) => {
      if (err) return res.status(500).json(err);
      res.json({ id: result.insertId, message: 'Service created' });
    }
  );
});

// READ all services
app.get('/services', (_, res) => {
  db.query('SELECT * FROM services', (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results);
  });
});

// READ one service
app.get('/services/:id', (req, res) => {
  db.query('SELECT * FROM services WHERE service_id = ?', [req.params.id], (err, result) => {
    if (err) return res.status(500).json(err);
    res.json(result[0]);
  });
});

// UPDATE service
app.put('/services/:id', (req, res) => {
  const { service_date, theme, preacher } = req.body;
  db.query(
    'UPDATE services SET service_date = ?, theme = ?, preacher = ? WHERE service_id = ?',
    [service_date, theme, preacher, req.params.id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: 'Service updated' });
    }
  );
});

// DELETE service
app.delete('/services/:id', (req, res) => {
  db.query('DELETE FROM services WHERE service_id = ?', [req.params.id], err => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Service deleted' });
  });
});

// ============================
// DONATIONS ROUTES - CRUD
// ============================

// CREATE donation
app.post('/donations', (req, res) => {
  const { member_id, service_id, amount, donation_date } = req.body;
  db.query(
    'INSERT INTO donations (member_id, service_id, amount, donation_date) VALUES (?, ?, ?, ?)',
    [member_id, service_id, amount, donation_date],
    (err, result) => {
      if (err) return res.status(500).json(err);
      res.json({ id: result.insertId, message: 'Donation created' });
    }
  );
});

// READ all donations
app.get('/donations', (_, res) => {
  db.query('SELECT * FROM donations', (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results);
  });
});

// READ one donation
app.get('/donations/:id', (req, res) => {
  db.query('SELECT * FROM donations WHERE donation_id = ?', [req.params.id], (err, result) => {
    if (err) return res.status(500).json(err);
    res.json(result[0]);
  });
});

// UPDATE donation
app.put('/donations/:id', (req, res) => {
  const { member_id, service_id, amount, donation_date } = req.body;
  db.query(
    'UPDATE donations SET member_id = ?, service_id = ?, amount = ?, donation_date = ? WHERE donation_id = ?',
    [member_id, service_id, amount, donation_date, req.params.id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: 'Donation updated' });
    }
  );
});

// DELETE donation
app.delete('/donations/:id', (req, res) => {
  db.query('DELETE FROM donations WHERE donation_id = ?', [req.params.id], err => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Donation deleted' });
  });
});

// ============================
// Start Server
// ============================
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
