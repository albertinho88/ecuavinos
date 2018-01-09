
CREATE TABLE public.paises (
                pais_id VARCHAR(10) NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                CONSTRAINT paises_pk PRIMARY KEY (pais_id)
);
COMMENT ON COLUMN public.paises.pais_id IS 'código país';
COMMENT ON COLUMN public.paises.nombre IS 'nombre país';


CREATE TABLE public.ciudades (
                ciudad_id VARCHAR(10) NOT NULL,
                pais_id VARCHAR(10) NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                CONSTRAINT ciudades_pk PRIMARY KEY (ciudad_id)
);
COMMENT ON COLUMN public.ciudades.ciudad_id IS 'código ciudad';
COMMENT ON COLUMN public.ciudades.pais_id IS 'código país';
COMMENT ON COLUMN public.ciudades.nombre IS 'nombre ciudad';


CREATE TABLE public.area_postal (
                codigo_postal VARCHAR(10) NOT NULL,
                ciudad_id VARCHAR(10) NOT NULL,
                descripcion VARCHAR(100),
                CONSTRAINT area_postal_pk PRIMARY KEY (codigo_postal)
);
COMMENT ON COLUMN public.area_postal.codigo_postal IS 'código postal';
COMMENT ON COLUMN public.area_postal.ciudad_id IS 'código ciudad';
COMMENT ON COLUMN public.area_postal.descripcion IS 'descripción area postal';


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
                codigo_postal VARCHAR(10) NOT NULL,
                tipo_cliente_id VARCHAR(1) NOT NULL,
                nombre VARCHAR(255) NOT NULL,
                direccion VARCHAR(500),
                CONSTRAINT clientes_pk PRIMARY KEY (cliente_id)
);
COMMENT ON COLUMN public.clientes.cliente_id IS 'código del cliente';
COMMENT ON COLUMN public.clientes.codigo_postal IS 'código postal';
COMMENT ON COLUMN public.clientes.tipo_cliente_id IS 'código tipo cliente';
COMMENT ON COLUMN public.clientes.nombre IS 'nombre';
COMMENT ON COLUMN public.clientes.direccion IS 'dirección cliente';


CREATE TABLE public.ordenes_compra (
                codigo_orden VARCHAR(10) NOT NULL,
                codigo_postal VARCHAR(10) NOT NULL,
                cliente_id VARCHAR(10) NOT NULL,
                fecha DATE NOT NULL,
                direccion_entrega VARCHAR(500),
                CONSTRAINT ordenes_compra_pk PRIMARY KEY (codigo_orden)
);
COMMENT ON COLUMN public.ordenes_compra.codigo_orden IS 'código de orden de compra';
COMMENT ON COLUMN public.ordenes_compra.codigo_postal IS 'código postal';
COMMENT ON COLUMN public.ordenes_compra.cliente_id IS 'código del cliente';
COMMENT ON COLUMN public.ordenes_compra.direccion_entrega IS 'dirección entrega orden';


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

ALTER TABLE public.ciudades ADD CONSTRAINT paises_ciudades_fk
FOREIGN KEY (pais_id)
REFERENCES public.paises (pais_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.area_postal ADD CONSTRAINT ciudad_area_postal_fk
FOREIGN KEY (ciudad_id)
REFERENCES public.ciudades (ciudad_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.clientes ADD CONSTRAINT area_postal_clientes_fk
FOREIGN KEY (codigo_postal)
REFERENCES public.area_postal (codigo_postal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ordenes_compra ADD CONSTRAINT area_postal_ordenes_compra_fk
FOREIGN KEY (codigo_postal)
REFERENCES public.area_postal (codigo_postal)
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

ALTER TABLE public.ordenes_compra_detalle ADD CONSTRAINT ordenes_compra_ordenes_compra_detalle_fk
FOREIGN KEY (codigo_orden)
REFERENCES public.ordenes_compra (codigo_orden)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
