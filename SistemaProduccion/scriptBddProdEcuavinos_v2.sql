
CREATE TABLE tipos_producto (
                cod_tipo_producto VARCHAR(1) NOT NULL,
                descripcion VARCHAR(255) NOT NULL,
                PRIMARY KEY (cod_tipo_producto)
);

ALTER TABLE tipos_producto MODIFY COLUMN cod_tipo_producto VARCHAR(1) COMMENT 'Código de tipo de producto';

ALTER TABLE tipos_producto MODIFY COLUMN descripcion VARCHAR(255) COMMENT 'descripción del tipo de producto';


CREATE TABLE productos (
                codigo_producto VARCHAR(10) NOT NULL,
                cod_tipo_producto VARCHAR(1) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                PRIMARY KEY (codigo_producto)
);

ALTER TABLE productos MODIFY COLUMN codigo_producto VARCHAR(10) COMMENT 'código de producto';

ALTER TABLE productos MODIFY COLUMN cod_tipo_producto VARCHAR(1) COMMENT 'Código de tipo de producto';

ALTER TABLE productos MODIFY COLUMN descripcion VARCHAR(500) COMMENT 'descripción';


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


ALTER TABLE productos ADD CONSTRAINT tipos_producto_productos_fk
FOREIGN KEY (cod_tipo_producto)
REFERENCES tipos_producto (cod_tipo_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE historial_produccion ADD CONSTRAINT productos_historial_produccion_fk
FOREIGN KEY (codigo_producto)
REFERENCES productos (codigo_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
