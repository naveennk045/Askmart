CREATE TABLE transaction_logs (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    transaction_status VARCHAR(50),
    transaction_type VARCHAR(50), -- e.g., payment, refund
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
ALTER TABLE users ADD COLUMN status VARCHAR(50) DEFAULT 'active';
ALTER TABLE users ADD COLUMN last_login TIMESTAMP;

ALTER TABLE products ADD COLUMN sku VARCHAR(100) UNIQUE;
ALTER TABLE products ADD COLUMN weight DECIMAL(10,2);
ALTER TABLE products ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE orders ADD COLUMN payment_method VARCHAR(50);
ALTER TABLE orders ADD COLUMN shipping_method VARCHAR(100);

ALTER TABLE order_items ADD COLUMN discount DECIMAL(5,2) DEFAULT 0;

ALTER TABLE shipping_info ADD COLUMN shipping_date DATE;
ALTER TABLE shipping_info ADD COLUMN pick_up_location VARCHAR(255);

ALTER TABLE admin_users ADD COLUMN last_login TIMESTAMP;
ALTER TABLE admin_users ADD COLUMN status VARCHAR(50) DEFAULT 'active';
ALTER TABLE admin_users ADD COLUMN password_reset_token VARCHAR(255);
ALTER TABLE admin_users ADD COLUMN reset_token_expiration TIMESTAMP;

ALTER TABLE feedback ADD COLUMN resolved BOOLEAN DEFAULT FALSE;
ALTER TABLE feedback ADD COLUMN anonymous BOOLEAN DEFAULT FALSE;

ALTER TABLE loyalty_points ADD COLUMN tier VARCHAR(50) DEFAULT 'bronze';
ALTER TABLE loyalty_points ADD COLUMN points_expiration DATE;

CREATE INDEX idx_orders_payment_status ON orders(payment_status);
CREATE INDEX idx_shipping_status ON shipping_info(status);
CREATE INDEX idx_feedback_resolved ON feedback(resolved);
