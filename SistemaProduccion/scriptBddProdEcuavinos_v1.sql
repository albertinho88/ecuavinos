/*CREATE SCHEMA `sys_prod_ecuavinos` DEFAULT CHARACTER SET utf8 ;*/


CREATE TABLE productos (
                codigo_producto VARCHAR(10) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                grupo VARCHAR(50) NOT NULL,
                PRIMARY KEY (codigo_producto)
);

ALTER TABLE productos MODIFY COLUMN codigo_producto VARCHAR(10) COMMENT 'código de producto';

ALTER TABLE productos MODIFY COLUMN descripcion VARCHAR(500) COMMENT 'descripción';

ALTER TABLE productos MODIFY COLUMN grupo VARCHAR(50) COMMENT 'grupo del producto';


CREATE TABLE historial_produccion (
                codigo_producto VARCHAR(10) NOT NULL,
                anio VARCHAR(4) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                volumen_produccion INT NOT NULL,
                costo_docena NUMERIC(10,2) NOT NULL,
                PRIMARY KEY (codigo_producto, anio)
);

ALTER TABLE historial_produccion MODIFY COLUMN codigo_producto VARCHAR(10) COMMENT 'código del producto';

ALTER TABLE historial_produccion MODIFY COLUMN anio VARCHAR(4) COMMENT 'año de producción';

ALTER TABLE historial_produccion MODIFY COLUMN descripcion VARCHAR(500) COMMENT 'descripción del producto';

ALTER TABLE historial_produccion MODIFY COLUMN volumen_produccion INTEGER COMMENT 'volumen de producción';

ALTER TABLE historial_produccion MODIFY COLUMN costo_docena NUMERIC(10, 2) COMMENT 'costo por docena';


ALTER TABLE historial_produccion ADD CONSTRAINT productos_historial_produccion_fk
FOREIGN KEY (codigo_producto)
REFERENCES productos (codigo_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
