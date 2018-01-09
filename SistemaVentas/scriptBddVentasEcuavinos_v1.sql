
CREATE TABLE public.productos (
                anio VARCHAR(4) NOT NULL,
                producto_id VARCHAR(10) NOT NULL,
                descripcion VARCHAR(255) NOT NULL,
                precio_por_docena NUMERIC(10,2) NOT NULL,
                CONSTRAINT productos_pk PRIMARY KEY (anio, producto_id)
);
COMMENT ON COLUMN public.productos.anio IS 'año de producción del producto';
COMMENT ON COLUMN public.productos.producto_id IS 'código del producto';
COMMENT ON COLUMN public.productos.descripcion IS 'descripción';
COMMENT ON COLUMN public.productos.precio_por_docena IS 'precio por docena';


CREATE TABLE public.clientes (
                cliente_id VARCHAR(10) NOT NULL,
                nombre VARCHAR(255) NOT NULL,
                direccion TEXT,
                codigo_postal VARCHAR(10),
                tipo VARCHAR(50) NOT NULL,
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);
COMMENT ON COLUMN public.clientes.cliente_id IS 'código del cliente';
COMMENT ON COLUMN public.clientes.nombre IS 'nombre';
COMMENT ON COLUMN public.clientes.direccion IS 'dirección';
COMMENT ON COLUMN public.clientes.codigo_postal IS 'código postal';
COMMENT ON COLUMN public.clientes.tipo IS 'tipo de cliente';


CREATE TABLE public.ordenes_compra (
                codigo_orden VARCHAR(10) NOT NULL,
                cliente_id VARCHAR(10) NOT NULL,
                direccion_entrega TEXT,
                fecha DATE NOT NULL,
                CONSTRAINT ordenes_compra_pk PRIMARY KEY (codigo_orden)
);
COMMENT ON COLUMN public.ordenes_compra.codigo_orden IS 'código de orden de compra';
COMMENT ON COLUMN public.ordenes_compra.cliente_id IS 'código del cliente';
COMMENT ON COLUMN public.ordenes_compra.direccion_entrega IS 'dirección de entrega';


CREATE TABLE public.ordenes_compra_detalle (
                codigo_orden VARCHAR(10) NOT NULL,
                producto_id VARCHAR(10) NOT NULL,
                anio VARCHAR(4) NOT NULL,
                cantidad INTEGER NOT NULL,
                precio_por_docena NUMERIC(10,2) NOT NULL,
                precio_total NUMERIC(10,2) NOT NULL,
                CONSTRAINT ordenes_compra_detalle_pk PRIMARY KEY (codigo_orden)
);
COMMENT ON COLUMN public.ordenes_compra_detalle.codigo_orden IS 'código de orden de compra';
COMMENT ON COLUMN public.ordenes_compra_detalle.producto_id IS 'código del producto';
COMMENT ON COLUMN public.ordenes_compra_detalle.anio IS 'año de elaboración del producto';
COMMENT ON COLUMN public.ordenes_compra_detalle.cantidad IS 'cantidad de la compra';
COMMENT ON COLUMN public.ordenes_compra_detalle.precio_por_docena IS 'precio unitario (por docena)';
COMMENT ON COLUMN public.ordenes_compra_detalle.precio_total IS 'precio unitario por la cantidad';


ALTER TABLE public.ordenes_compra_detalle ADD CONSTRAINT productos_ordenes_compra_detalle_fk
FOREIGN KEY (anio, producto_id)
REFERENCES public.productos (anio, producto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordenes_compra ADD CONSTRAINT clientes_ordenes_compra_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordenes_compra_detalle ADD CONSTRAINT ordenes_compra_ordenes_compra_detalle_fk
FOREIGN KEY (codigo_orden)
REFERENCES public.ordenes_compra (codigo_orden)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
