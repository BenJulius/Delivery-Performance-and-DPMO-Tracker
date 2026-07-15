-- Create the temporary/mock table structure
CREATE TABLE mock_delivery_performance (
    package_id VARCHAR(50),
    delivery_date DATE,
    delivery_status VARCHAR(50),
    route_id VARCHAR(20),
    driver_id VARCHAR(20),
    failure_reason_code VARCHAR(50)
);

-- Insert realistic logistics test data
INSERT INTO mock_delivery_performance 
    (package_id, delivery_date, delivery_status, route_id, driver_id, failure_reason_code)
VALUES
    -- Successful Deliveries (Date: 2026-07-14)
    ('PKG-1001', '2026-07-14', 'Delivered', 'R-101', 'D-9901', NULL),
    ('PKG-1002', '2026-07-14', 'Delivered', 'R-101', 'D-9901', NULL),
    ('PKG-1003', '2026-07-14', 'Delivered', 'R-102', 'D-9902', NULL),
    ('PKG-1004', '2026-07-14', 'Delivered', 'R-102', 'D-9902', NULL),
    ('PKG-1005', '2026-07-14', 'Delivered', 'R-103', 'D-9903', NULL),
    ('PKG-1006', '2026-07-14', 'Delivered', 'R-103', 'D-9903', NULL),
    ('PKG-1007', '2026-07-14', 'Delivered', 'R-104', 'D-9904', NULL),
    ('PKG-1008', '2026-07-14', 'Delivered', 'R-104', 'D-9904', NULL),
    ('PKG-1009', '2026-07-14', 'Delivered', 'R-105', 'D-9905', NULL),
    
    -- Delivery Defects / Missed Packages (Date: 2026-07-14)
    -- This brings the defect count to 1 out of 10 packages (DPMO: 100,000)
    ('PKG-1010', '2026-07-14', 'Returned_To_Station', 'R-105', 'D-9905', 'BC_BUSINESS_CLOSED'),

    -- Successful Deliveries (Date: 2026-07-15)
    ('PKG-2001', '2026-07-15', 'Delivered', 'R-101', 'D-9901', NULL),
    ('PKG-2002', '2026-07-15', 'Delivered', 'R-101', 'D-9901', NULL),
    ('PKG-2003', '2026-07-15', 'Delivered', 'R-102', 'D-9902', NULL),
    ('PKG-2004', '2026-07-15', 'Delivered', 'R-102', 'D-9902', NULL),
    ('PKG-2005', '2026-07-15', 'Delivered', 'R-103', 'D-9903', NULL),
    ('PKG-2006', '2026-07-15', 'Delivered', 'R-103', 'D-9903', NULL),
    ('PKG-2007', '2026-07-15', 'Delivered', 'R-104', 'D-9904', NULL),
    ('PKG-2008', '2026-07-15', 'Delivered', 'R-105', 'D-9905', NULL),

    -- Delivery Defects / Missed Packages (Date: 2026-07-15)
    -- This brings the defect count to 2 out of 10 packages (DPMO: 200,000)
    ('PKG-2009', '2026-07-15', 'Undeliverable', 'R-104', 'D-9904', 'UTA_ACCESS_CODE_REQUIRED'),
    ('PKG-2010', '2026-07-15', 'Rejected', 'R-105', 'D-9905', 'NSL_NO_SAFE_LOCATION');
