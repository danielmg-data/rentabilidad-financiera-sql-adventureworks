-- =====================================================================
-- Parte 4 · Validación y control de calidad (QA)
-- =====================================================================

-- Precios no válidos en el catálogo: un precio negativo distorsiona
-- los ingresos. El resultado esperado es 0.
SELECT
    COUNT(*) AS productos_precio_no_valido
FROM productos
WHERE precio_producto < 0;

-- ---------------------------------------------------------------------
-- Validaciones recomendadas (no forman parte del código original del
-- proyecto; se proponen para verificar los resultados):
-- ---------------------------------------------------------------------

-- 1) Cada territorio debe tener una sola fila en pais_campanas; si hay
--    varias, el LEFT JOIN de 03_kpis_por_pais.sql multiplicaría ingresos
--    y costos e inflaría el ROI.
-- SELECT clave_territorio, COUNT(*)
-- FROM pais_campanas
-- GROUP BY clave_territorio
-- HAVING COUNT(*) > 1;

-- 2) Los ingresos por país deben sumar el total de ventas_clean.
-- SELECT SUM(ingreso_total) FROM ventas_clean;
