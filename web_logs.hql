-- Web Server Log Analytics using HiveQL

CREATE DATABASE IF NOT EXISTS web_log_analytics;
USE web_log_analytics;

CREATE EXTERNAL TABLE IF NOT EXISTS web_logs (
    ip STRING,
    timestamp STRING,
    method STRING,
    page STRING,
    status INT,
    response_time_ms INT,
    user_agent STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/input/web_logs';

-- Verify data
SELECT * FROM web_logs LIMIT 20;

-- Total records
SELECT COUNT(*) AS total_records
FROM web_logs;

-- URL frequency
SELECT page, COUNT(*) AS request_count
FROM web_logs
GROUP BY page
ORDER BY request_count DESC;

-- HTTP method analysis
SELECT method, COUNT(*) AS request_count
FROM web_logs
GROUP BY method
ORDER BY request_count DESC;

-- HTTP status analysis
SELECT status, COUNT(*) AS status_count
FROM web_logs
GROUP BY status
ORDER BY status;

-- Error analysis
SELECT status, COUNT(*) AS error_count
FROM web_logs
WHERE status >= 400
GROUP BY status
ORDER BY status;

-- Response-time analysis
SELECT
    MIN(response_time_ms) AS min_response_time,
    MAX(response_time_ms) AS max_response_time,
    AVG(response_time_ms) AS avg_response_time
FROM web_logs;

-- Clean/transformed table
CREATE TABLE IF NOT EXISTS clean_logs AS
SELECT
    TRIM(ip) AS ip,
    timestamp,
    UPPER(TRIM(method)) AS method,
    TRIM(page) AS page,
    status,
    response_time_ms,
    TRIM(user_agent) AS user_agent
FROM web_logs
WHERE ip IS NOT NULL
  AND page IS NOT NULL;

-- Partitioning example
CREATE TABLE IF NOT EXISTS logs_partitioned (
    ip STRING,
    timestamp STRING,
    method STRING,
    page STRING,
    response_time_ms INT,
    user_agent STRING
)
PARTITIONED BY (status INT)
STORED AS TEXTFILE;

-- Bucketing example
CREATE TABLE IF NOT EXISTS logs_bucketed (
    ip STRING,
    timestamp STRING,
    method STRING,
    page STRING,
    status INT,
    response_time_ms INT,
    user_agent STRING
)
CLUSTERED BY (ip) INTO 4 BUCKETS
STORED AS TEXTFILE;
