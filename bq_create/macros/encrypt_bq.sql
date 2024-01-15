-- macros/encrypt_bq.sql

{% macro run_encrypt_bq() %}
    
create schema engenharia;

CREATE OR REPLACE FUNCTION `integracao-bq.engenharia.encrypt`(input_string STRING) RETURNS STRING AS (
(SELECT TO_HEX(MD5(CONCAT(input_string, 'E3GD8uPL0AFwLbYtGQx1HHqOvZ9jROnAnEbtUSLdhyI'))))
);

{% endmacro %}
