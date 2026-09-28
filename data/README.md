# 📖 Datos del proyecto

## Tablas de origen (no incluidas)

El análisis se hizo en la plataforma del Bootcamp de TripleTen sobre un subconjunto del dataset de ejemplo **AdventureWorks**. Las tablas viven en la base de datos de la plataforma y no se pueden exportar, por lo que **no se incluyen en este repositorio**.

| Tabla | Contenido |
| --- | --- |
| `ventas_2017` | Líneas de pedido de 2017 (una fila por producto y pedido) |
| `productos` | Catálogo con costo y precio unitario |
| `productos_categorias` | Jerarquía de categoría y subcategoría |
| `clientes` | Maestro de clientes (no se usó en las consultas conservadas) |
| `territorios` | Mapa de territorio → país y continente |
| `campanas` | Gasto de marketing por territorio o campaña |

Objetos creados durante el análisis: la tabla `ventas_clean` (ver `sql/02_ventas_clean.sql`) y las vistas `pais_ingreso_costo` y `pais_campanas`.

## Resultados incluidos

### `kpis_por_pais.csv`

Resultado de los KPIs por país, tomado del resumen ejecutivo (hoja *Dashboard*).

| Columna | Descripción |
| --- | --- |
| `pais` | País |
| `clave_territorio` | Clave del territorio que aparece en el resumen |
| `ingresos` | Suma de precio × cantidad vendida (USD) |
| `costos` | Suma de costo unitario × cantidad vendida (USD) |
| `costo_campanas` | Gasto de marketing asociado al territorio (USD) |
| `beneficio_bruto` | `ingresos - costos`. **No descuenta** el gasto de campañas |
| `margen_pct` | `beneficio_bruto / ingresos × 100` |
| `roi_pct` | `beneficio_bruto / costo_campanas × 100` |
