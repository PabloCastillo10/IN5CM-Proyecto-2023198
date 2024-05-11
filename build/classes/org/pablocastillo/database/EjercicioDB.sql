USE EjercicioDB;

-- ********************************** CRUDS ********************************** --
 
-- ********************************** CLIENTES ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarClientes(IN nom VARCHAR(30), IN ape VARCHAR(30), IN tel VARCHAR(80), IN dir VARCHAR(50), IN nit VARCHAR(15))
    BEGIN
        INSERT INTO Clientes (nombre, apellido, telefono, direccion, nit)
            VALUES (nom, ape, tel, dir, nit);
     END$$

DELIMITER ;

CALL sp_AgregarClientes('Jose', 'Morejon', '3724-3462', 'Pueblo', 'CF');

DELIMITER $$

CREATE PROCEDURE sp_ListarClientes()
    BEGIN
        SELECT
			Clientes.clienteId,
            Clientes.nombre,
            Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
                FROM Clientes;
    END$$

DELIMITER ;


 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarClientes(IN cliId INT)
	BEGIN
		SELECT
            Clientes.clienteId,
            Clientes.nombre,
            Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
				FROM Clientes
					WHERE clienteId = cliId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarClientes(IN cliId INT)

	BEGIN
		DELETE FROM Clientes
			WHERE clienteId = cliId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarClientes(IN cliId INT, IN nom VARCHAR(30), IN ape VARCHAR(30), IN tel VARCHAR(80), IN dir VARCHAR(50), IN nit VARCHAR(15))
	BEGIN
		UPDATE Clientes
			SET
				nombre = nom,
				apellido = ape,
				telefono = tel,
				direccion = dir,
				nit = nit
					WHERE clienteId = cliId;
	END$$

DELIMITER ;

-- ********************************** CARGOS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarCargos(IN nomCar VARCHAR(30), IN desCar VARCHAR(100))
    BEGIN
        INSERT INTO Cargos (nombreCargo, descripcionCargo)
            VALUES (nomCar, desCar);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarCargos()
    BEGIN
        SELECT
			Cargos.cargoId,
            Cargos.nombreCargo,
            Cargos.descripcionCargo
                FROM Cargos;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarCargos(IN carId INT)
	BEGIN
		SELECT
            Cargos.cargoId,
            Cargos.nombreCargo,
            Cargos.descripcionCargo
				FROM Cargos
					WHERE cargoId = carId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarCargos(IN carId INT)
	BEGIN
		DELETE FROM Cargos
			WHERE cargoId = carId;
	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarCargos(IN carId INT, IN nomCar VARCHAR(30), IN desCar VARCHAR(100))
	BEGIN
		UPDATE Cargos
			SET
				nombreCargo = nomCar,
				descripcionCargo = desCar
					WHERE cargoId = carId;
	END$$

DELIMITER ;

-- ********************************** EMPLEADOS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarEmpleados(IN nomEmp VARCHAR(30), IN apeEmp VARCHAR(30), IN sue DECIMAL(10,2), IN horEnt TIME, IN horSal TIME, IN carId INT, IN encaId INT)
    BEGIN
        INSERT INTO Empleados (nombreEmpleado, apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId)
            VALUES (nomEmp, apeEmp, sue, horEnt, horSal, carId, encaId);
     END$$

DELIMITER ;

CALL sp_AgregarEmpleados('Cuxun', 'Luis', 300.05, '15:00', '21:00', 1, null);

DELIMITER $$

CREATE PROCEDURE sp_ListarEmpleados()
    BEGIN
        SELECT
			Empleado.empleadoId,
            Empleados.nombreEmpleado,
            Empleados.apellidoEmpleado,
            Empleados.sueldo,
            Empleados.horaEntrada,
            Empleados.horaSalida,
			Empleados.cargoId,
            Empleados.encargadoId
                FROM Empleados;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarEmpleados(IN empId INT)
	BEGIN
		SELECT
            Empleado.empleadoId,
            Empleados.nombreEmpleado,
            Empleados.apellidoEmpleado,
            Empleados.sueldo,
            Empleados.horaEntrada,
            Empleados.horaSalida,
			Empleados.cargoId,
            Empleados.encargadoId
				FROM Empleados
					WHERE empleadoId = empId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarEmpleados(IN empId INT)

	BEGIN
		DELETE FROM Empleados
			WHERE empleadoId = empId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarEmpleados(IN empId INT, IN nomEmp VARCHAR(30), IN apeEmp VARCHAR(30), IN sue DECIMAL(10,2), IN horEnt TIME, IN horSal TIME, IN carId INT, IN encaId INT)
	BEGIN
		UPDATE Empleados
			SET
				nombreEmpleado = nomEmp,
				apellidoEmpleado = apeEmp,
				sueldo = sue,
                horaEntrada = horEnt,
                horaSalida = horSal,
                cargoId = carId,
                encargadoId = encaId
					WHERE empleadoId = empId;
	END$$

DELIMITER ;

create procedure sp_asignarEmpleados(IN empId INT, IN nomEmp VARCHAR(30), IN apeEmp VARCHAR(30), IN sue DECIMAL(10,2), IN horEnt TIME, IN horSal TIME, IN carId INT, IN encaId INT)
	BEGIN
		UPDATE Empleados
			SET
				nombreEmpleado = nomEmp,
				apellidoEmpleado = apeEmp,
				sueldo = sue,
                horaEntrada = horEnt,
                horaSalida = horSal,
                cargoId = carId,
                encargadoId = encaId
					WHERE empleadoId = empId
	END$$

DELIMITER ;
 

SELECT  Empleados.nombreEmpleado, Empleados.apellidoEmpleado, Empleados.sueldo, Empleados.horaEntrada, Empleados.horaSalida, Empleados.cargoId, Empleados.encargadoId,
		CONCAT(Empleados1.nombreEmpleado, '', Empleados1.apellidoEmpleado) AS 'Auxiliar Asignado' FROM Empleados
RIGHT JOIN Empleados Empleados1 ON Empleados.encargadoId = Empleados1.empleadoId;
 


-- ********************************** FACTURAS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarFacturas(IN fec DATE, IN hor TIME, IN cliId INT, IN empId INT, IN tot DECIMAL(10,2))
    BEGIN
        INSERT INTO Facturas (fecha, hora, clienteId, empleadoId, total)
            VALUES (fec, hor, cliId, empId, tot);
     END$$

DELIMITER ;

CALL sp_AgregarFacturas('2018/03/05', '16:00', 1, 1, null);

DELIMITER $$

CREATE PROCEDURE sp_ListarFacturas()
    BEGIN
        SELECT
			Facturas.facturaId,
            Facturas.fecha,
            Facturas.hora,
            Facturas.clienteId,
            Facturas.empleadoId,
			Facturas.total
                FROM Facturas;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarFacturas(IN facId INT)
	BEGIN
		SELECT
            Facturas.facturaId,
            Facturas.fecha,
            Facturas.hora,
            Facturas.clienteId,
            Facturas.empleadoId,
            Facturas.total
				FROM Facturas
					WHERE facturaId = facId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarFacturas(IN facId INT)

	BEGIN
		DELETE FROM Facturas
			WHERE facturaId = facId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarFacturas(IN facId INT, IN fec DATE, IN hor TIME, IN cliId INT, IN empId INT, IN total DECIMAL(10,2))
	BEGIN
		UPDATE Facturas
			SET
				fecha = fac,
				hora = hor,
				clienteId = cliId,
				empleadoId = empId,
				total = tot
					WHERE facturaId = facId;
	END$$

DELIMITER ;

-- ********************************** TICKET SOPORTES ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarTicketSoportes(IN desTic VARCHAR(250), IN cliId INT, IN facId INT)
    BEGIN
        INSERT INTO TicketSoportes (descripcionTicket, estatus, clienteId, facturaId)
            VALUES (desTic, 'Recien Creado', cliId, facId);
     END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_ListarTicketSoportes()
BEGIN
	select TS.ticketSoporteId, TS.descripcionTicket, TS.estatus,
    CONCAT("Id: ", C.clienteId, " | ", C.nombre, " ", C.apellido)AS cliente, TS.facturaId from TicketSoportes TS
    join Clientes C on TS.clienteId = C.clienteId;

END$$

DELIMITER ;


 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarTicketSoportes(IN ticSopId INT)
	BEGIN
		SELECT
            TicketSoportes.ticketSoporteId,
            TicketSoportes.descripcionTicket,
            TicketSoportes.estatus,
            TicketSoportes.clienteId,
            TicketSoportes.facturaId
				FROM TicketSoportes
					WHERE ticketSoporteId = ticSopId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarTicketSoportes(IN TicSopId INT)

	BEGIN
		DELETE FROM TicketSoportes
			WHERE ticketSoporteId = ticSopId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarTicketSoportes(IN ticSopId INT, IN desTic VARCHAR(250), IN est VARCHAR(30), IN cliId INT, IN facId INT)
	BEGIN
		UPDATE TicketSoportes
			SET
				descripcionTicket = desTic,
				estatus = est,
				clienteId = cliId,
				facturaId = facId
				WHERE ticketSoporteId = ticSopId;
	END$$

DELIMITER ;

-- ********************************** DISTRIBUIDORES ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarDistribuidores(IN nomDis VARCHAR(30), IN dirDis VARCHAR(200), IN ntDis VARCHAR(15), IN telDis VARCHAR(15), IN wb VARCHAR(50))
    BEGIN
        INSERT INTO Distribuidores (nombreDistribuidor, direccionDistribuidor, nitDistribuidor, telefonoDistribuidor, web)
            VALUES (nomDis, dirDis, ntDis, telDis, wb);
     END$$

DELIMITER ;
call sp_AgregarDistribuidores('Pablo', 'Guatemala', 'CF', '5221-1232', 'Walmart.com');


DELIMITER $$

CREATE PROCEDURE sp_ListarDistribuidores()
    BEGIN
        SELECT
			Distribuidores.distribuidorId,
            Distribuidores.nombreDistribuidor,
            Distribuidores.direccionDistribuidor,
            Distribuidores.nitDistribuidor,
            Distribuidores.telefonoDistribuidor,
            Distribuidores.web
                FROM Distribuidores;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarDistribuidores(IN disId INT)
	BEGIN
		SELECT
            Distribuidores.distribuidorId,
            Distribuidores.nombreDistribuidor,
            Distribuidores.direccionDistribuidor,
            Distribuidores.nitDistribuidor,
            Distribuidores.telefonoDistribuidor,
            Distribuidores.web
				FROM Distribuidores
					WHERE distribuidorId = disId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarDistribuidores(IN disId INT)

	BEGIN
		DELETE FROM Distribuidores
			WHERE distribuidorId = disId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarDistribuidores(IN disId INT, IN nomDis VARCHAR(30), IN dirDis VARCHAR(200), IN ntDis VARCHAR(15), IN telDis VARCHAR(15), IN wb VARCHAR(50))
	BEGIN
		UPDATE Distribuidores
			SET
				nombreDistribuidor = nomDis,
				direccionDistribuidor = dirDis,
				nitDistribuidor = ntDis,
				telefonoDistribuidor = telDis,
				web = wb
					WHERE distribuidorId = disId;
	END$$

DELIMITER ;

-- ********************************** CATEGORIA PRODUCTOS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarCategoriaProductos(IN nomCat VARCHAR(30), IN desCat VARCHAR(100))
    BEGIN
        INSERT INTO CategoriaProductos (nombreCategoria, descripcionCategoria)
            VALUES (nomCat, desCat);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarCategoriaProductos()
    BEGIN
        SELECT
			CategoriaProductos.categoriaProductoId,
            CategoriaProductos.nombreCategoria,
            CategoriaProductos.descripcionCategoria
                FROM CategoriaProductos;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarCategoriaProductos(IN catProId INT)
	BEGIN
		SELECT
            CategoriaProductos.categoriaProductoId,
            CategoriaProductos.nombreCategoria,
            CategoriaProductos.descripcionCategoria
				FROM CategoriaProductos
					WHERE categoriaProductoId = catProId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarCategoriaProductos(IN catProId INT)

	BEGIN
		DELETE FROM CategoriaProductos
			WHERE categoriaProductoId = catProId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarCategoriaProductos(IN catProId INT, IN nomCat VARCHAR(30), IN desCat VARCHAR(100))
	BEGIN
		UPDATE CategoriaProductos
			SET
				nombreCategoria = nomCat,
				descripcionCategoria = desCat
					WHERE categoriaProductoId = catProId;
	END$$

DELIMITER ;

-- ********************************** PRODUCTOS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarProductos(IN nomPro VARCHAR(50), IN desPro VARCHAR(100), IN canSto INT, IN preVenUni DECIMAL(10,2), IN preVenMay DECIMAL(10,2), IN preCom DECIMAL(10,2), IN imaPro BLOB, IN disId INT, IN catProId INT)
    BEGIN
        INSERT INTO Productos (nombreProducto, descripcionProducto, cantidadStock, precioVentaUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorId, categoriaProductoId)
            VALUES (nomPro, desPro, canSto, preVenUni, preVenMay, preCom, imaPro, disId, catProId);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarProductos()
    BEGIN
        SELECT
			Productos.productoId,
            Productos.nombreProducto,
            Productos.descripcionProducto,
            Productos.cantidadStock,
            Productos.precioVentaUnitario,
            Productos.precioVentaMayor,
            Productos.precioCompra,
            Productos.imagenProducto,
            Productos.distribuidorId,
            Productos.categoriaProductoId
                FROM Productos;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarProductos(IN proId INT)
	BEGIN
		SELECT
            Productos.productoId,
            Productos.nombreProducto,
            Productos.descripcionProducto,
            Productos.cantidadStock,
            Productos.precioVentaUnitario,
            Productos.precioVentaMayor,
            Productos.precioCompra,
            Productos.imagenProducto,
            Productos.distribuidorId,
            Productos.categoriaProductoId
				FROM Productos
					WHERE productoId = proId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarProductos(IN proId INT)

	BEGIN
		DELETE FROM Productos
			WHERE productoId = proId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarProductos(IN proId INT, IN nomPro VARCHAR(50), IN desPro VARCHAR(100), IN canSto INT, IN preVenUni DECIMAL(10,2), IN preVenMay DECIMAL(10,2), IN preCom DECIMAL(10,2), IN imaPro BLOB, IN disId INT, IN catProId INT)
	BEGIN
		UPDATE Productos
			SET
				nombreProducto = nomPro,
				descripcionProducto = desPro,
				cantidadStock = canSto,
				precioVentaUnitario = preVenUni,
				precioVentaMayor = preVenMay,
                precioCompra = preCom,
                imagenProducto = imaPro,
                distribuidorId = disId,
                categoriaProductoId = catProId
					WHERE productoId = proId;
	END$$

DELIMITER ;

-- ********************************** PROMOCIONES ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarPromociones(IN prePro DECIMAL(10,2), IN desPro VARCHAR(100), IN fecIni DATE, IN FecFin DATE, IN proId INT)
    BEGIN
        INSERT INTO Promociones (precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId)
            VALUES (prePro, desPro, fecIni, FecFin, proId);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarPromociones()
    BEGIN
        SELECT
			Promociones.promocionId,
            Promociones.precioPromocion,
            Promociones.descripcionPromocion,
            Promociones.fechaInicio,
            Promociones.fechaFinalizacion,
            Promociones.productoId
                FROM Promociones;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarPromociones(IN promoId INT)
	BEGIN
		SELECT
            Promociones.promocionId,
            Promociones.precioPromocion,
            Promociones.descripcionPromocion,
            Promociones.fechaInicio,
            Promociones.fechaFinalizacion,
            Promociones.productoId
				FROM Promociones
					WHERE promocionId = promoId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarPromociones(IN promoId INT)

	BEGIN
		DELETE FROM Promociones
			WHERE promocionId = promoId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarPromociones(IN promoId INT, IN prePro DECIMAL(10,2), IN desPro VARCHAR(100), IN fecIni DATE, IN fecFin DATE, IN proId INT)
	BEGIN
		UPDATE Promociones
			SET
				precioPromocion = prePro,
				descripcionPromocion = desPro,
				fechaInicio = fecIni,
				fechaFinalizacion = fecFin,
				productoId = proId
					WHERE promocionId = promoId;
	END$$

DELIMITER ;

-- ********************************** DETALLE FACTURAS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarDetalleFacturas(IN facId INT, IN proId INT)
    BEGIN
        INSERT INTO DetalleFacturas (facturaId, productoId)
            VALUES (facId, proId);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarDetalleFacturas()
    BEGIN
        SELECT
			DetalleFacturas.detalleFacturaId,
            DetalleFacturas.facId,
            DetalleFacturas.proId
                FROM DetalleFacturas;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarDetalleFacturas(IN detFacId INT)
	BEGIN
		SELECT
            DetalleFacturas.detalleFacturaId,
            DetalleFacturas.facId,
            DetalleFacturas.proId
				FROM DetalleFacturas
					WHERE detalleFacturaId = detFacId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarDetalleFacturas(IN detFacId INT)

	BEGIN
		DELETE FROM DetalleFacturas
			WHERE detalleFacturaId = detFacId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarDetalleFacturas(IN detFacId INT, IN facId INT, IN proId INT)
	BEGIN
		UPDATE DetalleFacturas
			SET
				facturaId = facId,
				productoId = proId
					WHERE detalleFacturaId = detFacId;
	END$$

DELIMITER ;

-- ********************************** COMPRAS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarCompras(IN fecCom DATE, IN totCom DECIMAL(10,2))
    BEGIN
        INSERT INTO Compras (fechaCompra, totalCompra)
            VALUES (fecCom, totCom);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarCompras()
    BEGIN
        SELECT
			Compras.compraId,
            Compras.fechaCompra,
            Compras.totalCompra
                FROM Compras;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarCompras(IN comId INT)
	BEGIN
		SELECT
            Compras.compraId,
            Compras.fechaCompra,
            Compras.totalCompra
				FROM Compras
					WHERE compraId = comId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarCompras(IN comId INT)

	BEGIN
		DELETE FROM Compras
			WHERE compraId = comId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarCompras(IN comId INT, IN fecCom DATE, IN totCom DECIMAL(10,2))
	BEGIN
		UPDATE Compras
			SET
				fechaCompra = fecCom,
				totalCompra = totCom
					WHERE compraId = comId;
	END$$

DELIMITER ;

-- ********************************** DETALLE COMPRAS ********************************** --

DELIMITER $$

CREATE PROCEDURE sp_AgregarDetalleCompras(IN canCom INT, IN proId INT, IN comId INT)
    BEGIN
        INSERT INTO DetalleCompras (cantidadCompra, productoId, compraId)
            VALUES (canCom, proId, comId);
     END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_ListarDetalleCompras()
    BEGIN
        SELECT
			DetalleCompras.detalleCompraId,
            DetalleCompras.cantidadCompra,
            DetalleCompras.productoId,
            DetalleCompras.compraId
                FROM DetalleCompras;
    END$$

DELIMITER ;
 
DELIMITER $$
 
CREATE PROCEDURE sp_BuscarDetalleCompras(IN detComId INT)
	BEGIN
		SELECT
            DetalleCompras.detalleCompraId,
            DetalleCompras.cantidadCompra,
            DetalleCompras.productoId,
            DetalleCompras.compraId
				FROM DetalleCompras
					WHERE detalleCompraId = detComId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EliminarDetalleCompras(IN detComId INT)

	BEGIN
		DELETE FROM DetalleCompras
			WHERE detalleCompraId = detComId;

	END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_EditarDetalleCompras(IN detComId INT, IN canCom INT, IN proId INT, IN comId INT)
	BEGIN
		UPDATE DetalleCompras
			SET
				cantidadCompra = canCom,
				productoId = proId,
				compraId = comId
					WHERE detalleCompraId = detComId;
	END$$

DELIMITER ;

set global time_zone = '-6:00';