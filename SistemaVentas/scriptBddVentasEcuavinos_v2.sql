
CREATE TABLE public.division_politica (
                codigo VARCHAR(10) NOT NULL,
                descripcion VARCHAR(255) NOT NULL,
                tipo VARCHAR(20) NOT NULL,
                codigo_padre VARCHAR(10),
                CONSTRAINT division_politica_pk PRIMARY KEY (codigo)
);
COMMENT ON COLUMN public.division_politica.codigo IS 'código división politica';
COMMENT ON COLUMN public.division_politica.descripcion IS 'descripción división política';
COMMENT ON COLUMN public.division_politica.tipo IS 'tipo división política';
COMMENT ON COLUMN public.division_politica.codigo_padre IS 'código división politica padre';


CREATE TABLE public.tipos_cliente (
                tipo_cliente_id VARCHAR(1) NOT NULL,
                descripcion VARCHAR(50) NOT NULL,
                CONSTRAINT tipos_cliente_pk PRIMARY KEY (tipo_cliente_id)
);
COMMENT ON COLUMN public.tipos_cliente.tipo_cliente_id IS 'código tipo cliente';
COMMENT ON COLUMN public.tipos_cliente.descripcion IS 'descripción tipo cliente';


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
                tipo_cliente_id VARCHAR(1) NOT NULL,
                nombre VARCHAR(255) NOT NULL,
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);
COMMENT ON COLUMN public.clientes.cliente_id IS 'código del cliente';
COMMENT ON COLUMN public.clientes.tipo_cliente_id IS 'código tipo cliente';
COMMENT ON COLUMN public.clientes.nombre IS 'nombre';


CREATE SEQUENCE public.direccion_entrega_seq;

CREATE TABLE public.direccion_entrega (
                direccion_entrega_id INTEGER NOT NULL DEFAULT nextval('public.direccion_entrega_seq'),
                codigo_postal VARCHAR(10) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                cliente_id VARCHAR(10) NOT NULL,
                CONSTRAINT direccion_entrega_pk PRIMARY KEY (direccion_entrega_id)
);
COMMENT ON COLUMN public.direccion_entrega.direccion_entrega_id IS 'código dirección entrega';
COMMENT ON COLUMN public.direccion_entrega.codigo_postal IS 'código división politica';
COMMENT ON COLUMN public.direccion_entrega.descripcion IS 'descripción direccion entrega';
COMMENT ON COLUMN public.direccion_entrega.cliente_id IS 'código del cliente';


ALTER SEQUENCE public.direccion_entrega_seq OWNED BY public.direccion_entrega.direccion_entrega_id;

CREATE TABLE public.ordenes_compra (
                codigo_orden VARCHAR(10) NOT NULL,
                direccion_entrega_id INTEGER NOT NULL,
                cliente_id VARCHAR(10) NOT NULL,
                fecha DATE NOT NULL,
                CONSTRAINT ordenes_compra_pk PRIMARY KEY (codigo_orden)
);
COMMENT ON COLUMN public.ordenes_compra.codigo_orden IS 'código de orden de compra';
COMMENT ON COLUMN public.ordenes_compra.direccion_entrega_id IS 'código dirección entrega';
COMMENT ON COLUMN public.ordenes_compra.cliente_id IS 'código del cliente';


CREATE SEQUENCE public.ordenes_compra_detalle_seq;

CREATE TABLE public.ordenes_compra_detalle (
                codigo_detalle INTEGER NOT NULL DEFAULT nextval('public.ordenes_compra_detalle_seq'),
                codigo_orden VARCHAR(10) NOT NULL,
                producto_id VARCHAR(10) NOT NULL,
                anio VARCHAR(4) NOT NULL,
                cantidad INTEGER NOT NULL,
                precio_por_docena NUMERIC(10,2) NOT NULL,
                precio_total NUMERIC(10,2) NOT NULL,
                CONSTRAINT ordenes_compra_detalle_pk PRIMARY KEY (codigo_detalle)
);
COMMENT ON COLUMN public.ordenes_compra_detalle.codigo_detalle IS 'código detalle orden compra';
COMMENT ON COLUMN public.ordenes_compra_detalle.codigo_orden IS 'código de orden de compra';
COMMENT ON COLUMN public.ordenes_compra_detalle.producto_id IS 'código del producto';
COMMENT ON COLUMN public.ordenes_compra_detalle.anio IS 'año de elaboración del producto';
COMMENT ON COLUMN public.ordenes_compra_detalle.cantidad IS 'cantidad de la compra';
COMMENT ON COLUMN public.ordenes_compra_detalle.precio_por_docena IS 'precio unitario (por docena)';
COMMENT ON COLUMN public.ordenes_compra_detalle.precio_total IS 'precio unitario por la cantidad';


ALTER SEQUENCE public.ordenes_compra_detalle_seq OWNED BY public.ordenes_compra_detalle.codigo_detalle;

ALTER TABLE public.division_politica ADD CONSTRAINT division_politica_division_politica_fk
FOREIGN KEY (codigo_padre)
REFERENCES public.division_politica (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.direccion_entrega ADD CONSTRAINT division_politica_direccion_entrega_fk
FOREIGN KEY (codigo_postal)
REFERENCES public.division_politica (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clientes ADD CONSTRAINT tipos_cliente_clientes_fk
FOREIGN KEY (tipo_cliente_id)
REFERENCES public.tipos_cliente (tipo_cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

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

ALTER TABLE public.direccion_entrega ADD CONSTRAINT clientes_direccion_entrega_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordenes_compra ADD CONSTRAINT direccion_entrega_ordenes_compra_fk
FOREIGN KEY (direccion_entrega_id)
REFERENCES public.direccion_entrega (direccion_entrega_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordenes_compra_detalle ADD CONSTRAINT ordenes_compra_ordenes_compra_detalle_fk
FOREIGN KEY (codigo_orden)
REFERENCES public.ordenes_compra (codigo_orden)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
