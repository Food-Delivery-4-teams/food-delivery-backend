-- ============================================
-- Food Delivery App — Local Seed Data
-- Automatically runs when Postgres first starts
-- ============================================


-- ============ USERS ============
CREATE TABLE IF NOT EXISTS users (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    phone       VARCHAR(20),
    created_at  TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (name, email, phone) VALUES
    ('Ali Ahmed',   'ali@test.com',   '+92-300-1111111'),
    ('Sara Khan',   'sara@test.com',  '+92-301-2222222'),
    ('Umar Sheikh', 'umar@test.com',  '+92-302-3333333')
ON CONFLICT DO NOTHING;


-- ============ RESTAURANTS ============
CREATE TABLE IF NOT EXISTS restaurants (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    city        VARCHAR(50),
    created_at  TIMESTAMP DEFAULT NOW()
);

INSERT INTO restaurants (name, city) VALUES
    ('Burger Point',  'Lahore'),
    ('Pizza House',   'Karachi'),
    ('Desi Dhaba',    'Islamabad')
ON CONFLICT DO NOTHING;


-- ============ ORDERS ============
CREATE TABLE IF NOT EXISTS orders (
    id              SERIAL PRIMARY KEY,
    user_id         INT REFERENCES users(id),
    restaurant_id   INT REFERENCES restaurants(id),
    status          VARCHAR(20) DEFAULT 'pending',
    total_amount    DECIMAL(10,2),
    created_at      TIMESTAMP DEFAULT NOW()
);

INSERT INTO orders (user_id, restaurant_id, status, total_amount) VALUES
    (1, 1, 'delivered', 850.00),
    (2, 2, 'pending',   1200.00),
    (3, 3, 'preparing', 650.00)
ON CONFLICT DO NOTHING;