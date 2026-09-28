-- =====================================================================
-- Parte 3 · KPIs financieros por país
--
-- Definiciones:
--   beneficio_bruto = ingresos - costos              (NO descuenta campañas)
--   margen_pct      = beneficio_bruto / ingresos * 100
--   roi_pct         = beneficio_bruto / costo_campana * 100
--
-- Depende de dos vistas creadas en pasos anteriores de la plataforma:
--   * pais_ingreso_costo : ingresos y costos por país/territorio
--                          (derivada de ventas_clean)
--   * pais_campanas      : gasto de campañas por territorio
-- El código de esas dos vistas no se conserva en este repositorio.
--
-- NULLIF evita divisiones por cero; COALESCE trata como 0 los
-- territorios sin campañas.
--
-- Nota: esta versión convierte a entero (::integer). Las cifras del
-- resumen ejecutivo (data/kpis_por_pais.csv) conservan decimales.
-- =====================================================================

SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    (SUM(p.ingresos)::integer - SUM(p.costos))::integer AS beneficio_bruto,
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0)
        / NULLIF(SUM(p.ingresos), 0) AS margen_pct,
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0)
        / NULLIF(SUM(c.costo_campana), 0) AS roi_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
    ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;
