
-- 1. Clientes
CREATE TABLE G5.Clientes (
    cliente_id VARCHAR(10) PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    categoria VARCHAR(50),
    direccion VARCHAR(150)
);

-- 2. Proveedores
CREATE TABLE G5.Proveedores (
    proveedor_id VARCHAR(10) PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    contacto VARCHAR(100)
);

-- 3. Productos
CREATE TABLE G5.Productos (
    producto_id VARCHAR(10) PRIMARY KEY,
    nombre_producto VARCHAR(100),
    proveedor_id VARCHAR(10),
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (proveedor_id) REFERENCES G5.Proveedores(proveedor_id)
);

-- 4. Almacen
CREATE TABLE G5.Almacen (
    almacen_id VARCHAR(10) PRIMARY KEY,
    nombre_almacen VARCHAR(100),
    direccion VARCHAR(150),
    ciudad VARCHAR(50),
    encargado VARCHAR(100)
);

-- 5. Inventario
CREATE TABLE G5.Inventario (
    inventario_id VARCHAR(10) PRIMARY KEY,
    producto_id VARCHAR(10),
    almacen_id VARCHAR(10),
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES G5.Productos(producto_id),
    FOREIGN KEY (almacen_id) REFERENCES G5.Almacen(almacen_id)
);

-- 6. Pedidos
CREATE TABLE G5.Pedidos (
    pedido_id VARCHAR(10) PRIMARY KEY,
    cliente_id VARCHAR(10),
    producto_id VARCHAR(10),
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES G5.Clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES G5.Productos(producto_id)
);


-- 7. Detalle_Pedidos
CREATE TABLE G5.Detalle_Pedidos (
    detalle_id VARCHAR(10) PRIMARY KEY,
    pedido_id VARCHAR(10),
    producto_id VARCHAR(10),
    cantidad INT,
    FOREIGN KEY (pedido_id) REFERENCES G5.Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES G5.Productos(producto_id)
);

-- 8. Entregas
CREATE TABLE G5.Entregas (
    entrega_id VARCHAR(10) PRIMARY KEY,
    pedido_id VARCHAR(10),
    fecha_entrega DATE,
    entregado_por VARCHAR(100),
    almacen_id VARCHAR(10),
    completo CHAR(1),
    FOREIGN KEY (pedido_id) REFERENCES G5.Pedidos(pedido_id),
    FOREIGN KEY (almacen_id) REFERENCES G5.Almacen(almacen_id)
);

-- 9. Detalle_Entregas
CREATE TABLE G5.Detalle_Entrega (
    detalle_entrega_id VARCHAR(10) PRIMARY KEY,
    entrega_id VARCHAR(10),
    producto_id VARCHAR(10),
    cantidad_entregada INT,
    FOREIGN KEY (entrega_id) REFERENCES G5.Entregas(entrega_id),
    FOREIGN KEY (producto_id) REFERENCES G5.Productos(producto_id)
);

