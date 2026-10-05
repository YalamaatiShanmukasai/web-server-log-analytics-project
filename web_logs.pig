-- Web Server Log Analytics using Pig Latin
-- Load, clean, group and analyze web server logs

logs = LOAD '/input/web_logs.csv'
       USING PigStorage(',')
       AS (ip:chararray, timestamp:chararray, method:chararray,
           page:chararray, status:int, response_time_ms:int,
           user_agent:chararray);

clean_logs = FILTER logs BY ip IS NOT NULL
             AND page IS NOT NULL
             AND status IS NOT NULL;

total_records = GROUP clean_logs ALL;
record_count = FOREACH total_records GENERATE COUNT(clean_logs) AS total_records;

grouped_urls = GROUP clean_logs BY page;
url_counts = FOREACH grouped_urls GENERATE
             group AS page,
             COUNT(clean_logs) AS request_count;

ordered_urls = ORDER url_counts BY request_count DESC;

grouped_methods = GROUP clean_logs BY method;
method_counts = FOREACH grouped_methods GENERATE
                group AS method,
                COUNT(clean_logs) AS request_count;

client_errors = FILTER clean_logs BY status >= 400 AND status < 500;
server_errors = FILTER clean_logs BY status >= 500 AND status < 600;

grouped_client_errors = GROUP client_errors BY status;
client_error_counts = FOREACH grouped_client_errors GENERATE
                       group AS status,
                       COUNT(client_errors) AS error_count;

grouped_server_errors = GROUP server_errors BY status;
server_error_counts = FOREACH grouped_server_errors GENERATE
                      group AS status,
                      COUNT(server_errors) AS error_count;

DUMP record_count;
DUMP ordered_urls;
DUMP method_counts;
DUMP client_error_counts;
DUMP server_error_counts;
