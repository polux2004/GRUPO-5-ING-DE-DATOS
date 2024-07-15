DROP INDEX IF EXISTS Documento__IDX ON Documento;

-- Crear índice único para Compra_id donde Venta_id es NULL
CREATE UNIQUE INDEX Documento_Compra_IDX
ON Documento (Compra_id)
WHERE Venta_id IS NULL;

-- Crear índice único para Venta_id donde Compra_id es NULL
CREATE UNIQUE INDEX Documento_Venta_IDX
ON Documento (Venta_id)
WHERE Compra_id IS NULL;