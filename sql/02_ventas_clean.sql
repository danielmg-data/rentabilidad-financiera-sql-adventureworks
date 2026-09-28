-- =====================================================================
-- Parte 2 · Extraer y limpiar datos
-- Construye la tabla base "ventas_clean": una fila por línea de pedido
-- con producto, categoría, territorio, ingreso_total y costo_total.
--
-- Limpieza aplicada:
--   * COALESCE(..., 0) para que precios, costos y cantidades nulos
--     no anulen el cálculo de ingresos y costos.
--   * JOIN con "productos" (una venta sin producto no se puede valorar).
--   * LEFT JOIN con categorías y territorios, para no perder ventas
--     si falta la categoría o el territorio.
--
-- Nota: en la plataforma este SELECT se guardó como la tabla
-- "ventas_clean". Aquí se conserva solo la consulta.
-- =====================================================================

SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0) AS precio_producto,
    COALESCE(v.cantidad_pedido, 0) AS cantidad_pedido,
    COALESCE(p.costo_producto, 0) AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
    COALESCE(p.precio_producto, 0) * COALESCE(v.cantidad_pedido, 0) AS ingreso_total,
    COALESCE(p.costo_producto, 0) * COALESCE(v.cantidad_pedido, 0) AS costo_total
FROM ventas_2017 AS v
JOIN productos AS p
    ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
    ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
    ON v.clave_territorio = t.clave_territorio;
