CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    details JSONB
);

-- JSONB Insertions -- Simply a String

INSERT INTO products (details)
VALUES
(
  '{
     "name": "DevBook Pro",
     "type": "Laptop",
     "specs": {
       "cpu": "M3 Pro",
       "ram_gb": 18,
       "storage_gb": 512
     },
     "tags": ["tech", "work", "apple"],
     "in_stock": true
   }'
);

INSERT INTO products (details)
VALUES
(
  '{
     "name": "GamerMouse X1",
     "type": "Mouse",
     "specs": {
       "dpi": 12000,
       "buttons": 8
     },
     "tags": ["tech", "gaming"],
     "in_stock": false
   }'
);

-- JSONB Selection 

-- Get the 'name' of all products, RTYPE(Text)
SELECT details ->> 'name' AS product_name
FROM products;

-- Get the 'name' of all products, RTYPE(JSONB)
SELECT details -> 'name' AS product_name
FROM products;

-- Get the 'cpu' from inside the 'specs' object. RTYPE(Text)
SELECT id, details #>> '{specs, cpu}' AS cpu_model
FROM products
WHERE details ->> 'type' = 'Laptop';

-- Accessing Arrays
SELECT details #>> '{tags, 2}' AS third_tag
FROM products
WHERE details ->> 'name' = 'DevBook Pro';


--       Operator    Description                                  Returns
--       ->          Get JSON object field by key                 jsonb
--       ->>         Get JSON object field as text                text
--       #>          Get JSON object at a specified path          jsonb
--       #>>         Get JSON object at a specified path as text  text


-- Drawbacks

-- Poor Query Performance
-- No Data Integrity
-- Inefficient Updates & Row Locking
-- Slower Writes
-- Increased Storage (TOAST)
-- Limited Indexing