-- Query to calculate Daily Delivery Success and DPMO (Defects Per Million Opportunities)
SELECT 
    delivery_date,
    COUNT(package_id) AS total_scheduled,
    SUM(CASE WHEN delivery_status = 'Delivered' THEN 1 ELSE 0 END) AS total_delivered,
    SUM(CASE WHEN delivery_status != 'Delivered' THEN 1 ELSE 0 END) AS total_defects,
    
    -- DPMO Formula: (Total Defects / Total Scheduled) * 1,000,000
    ROUND(
        (SUM(CASE WHEN delivery_status != 'Delivered' THEN 1.0 ELSE 0 END) 
        / COUNT(package_id)) * 1000000, 
        0
    ) AS dpmo
FROM 
    mock_delivery_performance
GROUP BY 
    delivery_date
ORDER BY 
    delivery_date DESC;


-- Query to pull granular failure reasons for operational root-cause analysis
SELECT 
    route_id,
    driver_id,
    package_id,
    delivery_status AS failure_status,
    failure_reason_code,
    COUNT(package_id) AS missed_count
FROM 
    mock_delivery_performance
WHERE 
    delivery_status IN ('Rejected', 'Undeliverable', 'Returned_To_Station')
GROUP BY 
    route_id, 
    driver_id, 
    package_id, 
    delivery_status, 
    failure_reason_code
ORDER BY 
    missed_count DESC;
