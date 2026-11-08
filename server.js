const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'iphone_store_db'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Đã kết nối tới MySQL thành công!');

    // Tự động tạo bảng orders nếu chưa có
    const createOrdersTable = `
        CREATE TABLE IF NOT EXISTS orders (
            id INT AUTO_INCREMENT PRIMARY KEY,
            customer_name VARCHAR(255) NOT NULL,
            customer_phone VARCHAR(50) NOT NULL,
            customer_address TEXT NOT NULL,
            product_name VARCHAR(255) NOT NULL,
            total_price INT NOT NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );
    `;
    db.query(createOrdersTable);
});

// API 1: Lấy danh sách sản phẩm
app.get('/api/products', (req, res) => {
    db.query("SELECT * FROM products", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

// API 2: Tạo đơn hàng mới
app.post('/api/orders', (req, res) => {
    const { customer_name, customer_phone, customer_address, product_name, total_price } = req.body;
    const sql = "INSERT INTO orders (customer_name, customer_phone, customer_address, product_name, total_price) VALUES (?, ?, ?, ?, ?)";

    db.query(sql, [customer_name, customer_phone, customer_address, product_name, total_price], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json({ message: 'Đặt hàng thành công!', orderId: result.insertId });
    });
});
// API 3: Lấy danh sách toàn bộ đơn hàng (Dành cho Admin)
app.get('/api/orders', (req, res) => {
    // Sắp xếp đơn hàng mới nhất lên đầu
    const sql = "SELECT * FROM orders ORDER BY created_at DESC";
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server đang chạy tại http://localhost:${PORT}`);
});