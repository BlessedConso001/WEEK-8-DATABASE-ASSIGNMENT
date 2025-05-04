-- ======================================
--  QUESTION ONE; 1  CHURCH DATABASE: Structure & Sample Data
-- ======================================

-- Step 1: Drop tables if they already exist
DROP TABLE IF EXISTS donations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS services;

-- Step 2: Create Services Table
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_date DATE,
    theme VARCHAR(255),
    preacher VARCHAR(255)
);

-- Insert Sample Data into Services
INSERT INTO services (service_date, theme, preacher) VALUES
('2024-12-01', 'Imani na Maombi', 'Pastor Kamau'),
('2024-12-08', 'Nguvu ya Neema', 'Rev. Achieng'),
('2024-12-15', 'Uponyaji wa Mungu', 'Bishop Otieno'),
('2024-12-22', 'Shukrani ya Mwaka', 'Pastor Wambua'),
('2024-12-25', 'Kristo Amefika', 'Rev. Chebet'),
('2025-01-01', 'Mwaka Mpya na Tumaini', 'Bishop Muthoni');

-- Step 3: Create Members Table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    join_date DATE,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Insert Sample Data into Members
INSERT INTO members (service_id, first_name, last_name, join_date) VALUES
(1, 'Mwikali', 'Nduku', '2024-11-20'),
(2, 'Otieno', 'Ouma', '2024-11-25'),
(3, 'Wanjiku', 'Kariuki', '2024-11-22'),
(4, 'Chebet', 'Kiptoo', '2024-11-30'),
(5, 'Mutiso', 'Wambua', '2024-12-01'),
(6, 'Achieng', 'Adhiambo', '2024-12-02');

-- Step 4: Create Donations Table
CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    service_id INT,
    amount DECIMAL(10,2),
    donation_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Insert Sample Data into Donations
INSERT INTO donations (member_id, service_id, amount, donation_date) VALUES
(1, 1, 500.00, '2024-12-01'),
(2, 2, 300.00, '2024-12-08'),
(3, 3, 750.00, '2024-12-15'),
(4, 4, 1200.00, '2024-12-22'),
(5, 5, 250.00, '2024-12-25'),
(6, 6, 1000.00, '2025-01-01');
