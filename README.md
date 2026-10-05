# Web Server Log Analytics Project

## Project Overview

This project demonstrates web server log analytics using **Hadoop HDFS, Pig Latin, and Apache Hive**. The workflow covers data storage, cleansing, transformation, aggregation, error analysis, and performance optimization using partitioning and bucketing.

## Objectives

- Store web server logs in HDFS.
- Process and clean log data using Pig Latin.
- Analyze traffic patterns using HiveQL.
- Identify HTTP status and error trends.
- Improve query performance using partitioning and bucketing.
- Document project findings and recommendations.

## Technologies Used

- Apache Hadoop / HDFS
- Apache Pig
- Apache Hive
- MapReduce
- Linux
- CSV dataset

## Dataset

The project uses a web server log dataset containing fields such as:

`ip, timestamp, method, page, status, response_time_ms, user_agent`

## Project Workflow

1. Start Hadoop services and verify the daemons.
2. Upload the dataset into HDFS.
3. Load and clean the dataset using Pig Latin.
4. Perform URL, HTTP method, and error analysis with Pig.
5. Create an external Hive table.
6. Run HiveQL analytics for traffic and HTTP status analysis.
7. Clean and transform Hive data.
8. Apply partitioning and bucketing for optimization.
9. Review final analytics output.

## Hadoop and HDFS

Hadoop services are started using the Hadoop startup scripts and verified through the Java daemon process list. The dataset is stored in HDFS before Pig and Hive processing.

## Pig Latin Processing

Pig is used for loading the web log data, selecting required fields, grouping records, counting URL requests, and analyzing HTTP status codes.

The processing includes:

- Total record counting
- URL frequency analysis
- HTTP method analysis
- 400-level client error analysis
- 500-level server error analysis

## Error Analysis

The project analyzes HTTP error responses to identify failed requests and server-side problems.

- **400-level errors:** used to identify client/request related failures.
- **500-level errors:** used to identify server-side failures.

## Hive Analytics

Hive is used to create an external table over the web log data and execute analytical HiveQL queries.

The analysis includes:

- Total request count
- URL request frequency
- HTTP method distribution
- HTTP status analysis
- Response-time analysis
- Data cleaning and transformation

## Partitioning

Partitioning is demonstrated using the HTTP status field:

```sql
PARTITIONED BY (status INT)
```

This organizes data into partitions based on status values and can reduce the amount of data scanned by suitable queries.

## Bucketing

Bucketing is demonstrated by distributing records using the client IP field:

```sql
CLUSTERED BY (ip) INTO 4 BUCKETS
```

This provides a structured distribution of records and supports efficient processing for suitable operations.

## Project Findings

The analytics workflow helps identify frequently requested URLs, common HTTP methods, response-status patterns, errors, and response-time behavior. These results can be used to understand website usage and identify areas requiring performance or reliability improvements.

## Project Screenshots

### 1. Hadoop Daemon Startup and JPS Verification
![Hadoop Daemon Startup and JPS Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(1).jpeg)

### 2. Hadoop Cluster Startup and JPS Verification
![Hadoop Cluster Startup and JPS Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM.jpeg)

### 3. Pig Script Loading, Cleaning and URL Grouping
![Pig Script Loading, Cleaning and URL Grouping](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM.jpeg)

### 4. Pig Job Statistics and Aggregation
![Pig Job Statistics and Aggregation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(3).jpeg)

### 5. Pig URL Frequency Output
![Pig URL Frequency Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(2).jpeg)

### 6. Pig Record Count Output
![Pig Record Count Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM.jpeg)

### 7. Pig Error Output — 404 and 500 Error Counts
![Pig Error Output — 404 and 500 Error Counts](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM.jpeg)

### 8. Hive External Table Creation
![Hive External Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(3).jpeg)

### 9. Hive Table Data Verification
![Hive Table Data Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(2).jpeg)

### 10. Hive Total Record Count
![Hive Total Record Count](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM.jpeg)

### 11. Hive URL Request Analysis
![Hive URL Request Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(1).jpeg)

### 12. Hive URL Frequency Analysis
![Hive URL Frequency Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM%20(1).jpeg)

### 13. Hive HTTP Method Analysis
![Hive HTTP Method Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM.jpeg)

### 14. Hive HTTP Status Analysis
![Hive HTTP Status Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM%20(1).jpeg)

### 15. Hive Data Cleaning and Transformation
![Hive Data Cleaning and Transformation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(1).jpeg)

### 16. Hive Partitioned Table Creation
![Hive Partitioned Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM.jpeg)

### 17. Hive Bucketed Table Creation
![Hive Bucketed Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(2).jpeg)

### 18. Pig Input Processing and Job Statistics
![Pig Input Processing and Job Statistics](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.06%20PM.jpeg)

## Source Files

The repository contains the project source and data files:

- `web_logs.csv`
- `web_logs.pig`
- `web_logs.hql`
- `README.md`

## Team Members

1. Karri Sai Kiran
2. Kolli Tejesh Chowdary
3. Yalamaati Shanmuka Sai
4. Ponnamanda Mohana Lakshmi Srikrishna

## Conclusion

The project demonstrates a complete Hadoop-based web server log analytics workflow using HDFS, Pig Latin, and HiveQL. The analysis helps reveal traffic behavior, frequently accessed pages, HTTP methods, errors, and response characteristics, while partitioning and bucketing demonstrate approaches for improving large-scale query processing.

## Repository

[Web Server Log Analytics Project](https://github.com/YalamaatiShanmukasai/web-server-log-analytics-project)
