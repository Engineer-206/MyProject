const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000; // or any port of your choice

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// MySQL database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ossp'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
    } else {
        console.log('Connected to MySQL database');
    }
});


app.post('/register', (req, res) => {
    const {fname,lname,username,email,phone, password,department } = req.body;
    const insertQuery = `INSERT INTO users (fname,lname,username, email,phone, password, department) VALUES (?, ?, ?, ?, ?, ?, ?,?)`;
    const values = [fname,lname,username,email,phone,password, department];

    db.query(insertQuery, values, (err, result) => {
        if (err) {
            console.error('Error registering user:', err);
            res.status(500).json({ message: 'Error registering user' });
        } else {
            console.log('User registered successfully');
            res.status(200).json({ message: 'User registered successfully' });
        }
    });
});

app.post('/login', (req, res) => {
    res.status(200).json({ message: 'Login successful' });
});


app.get('/download', (req, res) => {
    const softwareName = req.query.softwareName;
    const downloadLink = `https://example.com/downloads/${softwareName}.zip`;

    res.status(200).json({ downloadLink });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
