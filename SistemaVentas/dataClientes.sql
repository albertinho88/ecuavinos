INSERT INTO tipos_cliente (tipo_cliente_id, descripcion) VALUES ('W','Wholesale');
INSERT INTO tipos_cliente (tipo_cliente_id, descripcion) VALUES ('R','Retail');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion) 
VALUES ('C478W', 'W','Prestige Wines','170150','Av. 12 de Octubre, Quito.');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion)
VALUES ('C567R','R','Acme Wine Imports','SW6','High St, Fullham, London.');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion)
VALUES ('C121R','R','Oz Wines','170150','Av. Patria, UIO.');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion)
VALUES ('C479W','W','The Wine Club','EC4','Fleet Street, London.');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion)
VALUES ('C128R','R','London Wines','SW6','The Strand, London');


INSERT INTO clientes (cliente_id, tipo_cliente_id, nombre, codigo_postal, direccion)
VALUES ('C342W','W','International Wines','28001','PO Box 324, Madrid');
