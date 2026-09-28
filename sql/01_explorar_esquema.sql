-- =====================================================================
-- Parte 1 · Explorar el esquema
-- Motor: PostgreSQL (sintaxis usada en las consultas del proyecto)
-- =====================================================================
-- En la plataforma se revisaron las 10 primeras filas de cada tabla:
-- ventas_2017, productos, productos_categorias, territorios y campanas.
-- Solo se conserva el código de la consulta sobre "campanas".

SELECT *
FROM campanas
LIMIT 10;
