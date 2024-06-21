/* Enunciado de Restaurantes
1- Listado de platos con su recetas e ingredientes
2- Los platos con todos los encargados su nombre sea jose
3-    a. Los platos con todos los encargados que su nombre empiece con M
         b. Los platos con todos los encargados que su nombre termina con o 
         c. Los platos con todos los encargados contegan  os
4- Listado de ingrediente sin stock
5- Platos que sean de nivel 1  o nivel 2 como dificultad  y que sean de jose o miguel
6- Indicar los platos con la receta 5. mostrando datos del plato,  descripcion de la receta, precio
7- indicar las recetas que no tenga  platos. 
8- Plato mas caro 
9- Platos con más ingredientes
*/

-- 1. Listado de platos con su recetas e ingredientes

Select	p.Nombre_Plato, r.Descripcion, i.Ingrediente
  from			PracticaDDL.restaurante.Plato p 
 inner  join	PracticaDDL.restaurante.PlatoReceta pr on (p.idPlato = pr.idPlato)
 inner  join	PracticaDDL.restaurante.Receta r on (pr.idReceta = r.idReceta)
 inner  join	PracticaDDL.restaurante.RecetaIngrediente ri on ( r.idReceta = ri.IdReceta )
 inner  join	PracticaDDL.restaurante.Ingrediente i on (ri.IdIngrediente = i.idIngrediente)

-- 2. Los platos con todos los encargados su nombre sea jose

Select  p.Nombre_Plato, e.Nombre
  from			PracticaDDL.restaurante.Plato p
 inner  join	PracticaDDL.restaurante.Empleado e  on ( p.Encargado = e.ID_Empleado)
 where  e.Nombre = 'Jose'

 /* 

 3-    a. Los platos con todos los encargados que su nombre empiece con M
       b. Los platos con todos los encargados que su nombre termina con o 
       c. Los platos con todos los encargados contegan  os

 */

Select  p.Nombre_Plato, e.Nombre
  from			PracticaDDL.restaurante.Plato p
 inner  join	PracticaDDL.restaurante.Empleado e  on ( p.Encargado = e.ID_Empleado)
 where			e.Nombre like 'M%'
    or          e.Nombre like '%o'
	or          e.Nombre like '%os%'

-- 4- Listado de ingrediente sin stock

Select	p.Nombre_Plato, r.Descripcion, i.Ingrediente, i.stock_ingrediente
  from			PracticaDDL.restaurante.Plato p 
 inner  join	PracticaDDL.restaurante.PlatoReceta pr on (p.idPlato = pr.idPlato)
 inner  join	PracticaDDL.restaurante.Receta r on (pr.idReceta = r.idReceta)
 inner  join	PracticaDDL.restaurante.RecetaIngrediente ri on ( r.idReceta = ri.IdReceta )
 inner  join	PracticaDDL.restaurante.Ingrediente i on (ri.IdIngrediente = i.idIngrediente)
 where i.stock_ingrediente is null
 order by i.stock_ingrediente asc

 -- 5- Platos que sean de nivel 1  o nivel 2 como dificultad  y que sean de jose o miguel

 Select p.Descripcion, d.Descripcion, e.Nombre
   from			PracticaDDL.restaurante.Plato p 
  inner join	PracticaDDL.restaurante.Dificultad d on ( p.id_Dificultad = d.IdDificultad)
  inner join	PracticaDDL.restaurante.Empleado e on (p.Encargado = e.ID_Empleado)
  where d.IdDificultad between 1 and 2  
  -- también pude haber utilizado where d.IdDificultad in(1,2) 
    and e.Nombre in('Jose','miguel')

-- 6- Indicar los platos con la receta 5. mostrando datos del plato,  descripcion de la receta, precio

Select	p.Nombre_Plato as NombrePlato,p.Descripcion as PlatoDesc, pr.precio PlatoPrecio, r.idReceta RecetaNro, 
        r.Descripcion as RecetaDesc, c.Nombre_categoria Categoria, ri.Cantidad_ingrediente CantidadIngredientes, 
		i.Ingrediente Ingredientes, d.Descripcion
  from			PracticaDDL.restaurante.Plato p
 inner  join    PracticaDDL.restaurante.Empleado e on ( p.Encargado = e.ID_Empleado )
 inner  join    PracticaDDL.restaurante.Dificultad d on ( p.id_Dificultad = d.IdDificultad)
 inner  join    PracticaDDL.restaurante.Categoria c on ( p.idCategoria = c.IdCategoria )
 inner  join	PracticaDDL.restaurante.PlatoReceta pr on (p.idPlato = pr.idPlato)
 inner  join	PracticaDDL.restaurante.Receta r on (pr.idReceta = r.idReceta)
 inner  join	PracticaDDL.restaurante.RecetaIngrediente ri on ( r.idReceta = ri.IdReceta )
 inner  join	PracticaDDL.restaurante.Ingrediente i on (ri.IdIngrediente = i.idIngrediente)
 where r.idReceta = 5

 -- 7- indicar los platos que no tienen receta. 

 select p.Nombre_Plato, pr.idPlato
   from PracticaDDL.restaurante.Plato p
   left join PracticaDDL.restaurante.PlatoReceta pr on ( p.idPlato = pr.idPlato )
  where pr.idPlato is null
--  order by p.idPlato

 select p.idPlato, p.Descripcion
   from PracticaDDL.restaurante.Plato p
  group by p.idPlato, p.Descripcion

 select distinct(pr.idPlato)
   from PracticaDDL.restaurante.PlatoReceta pr

-- 8- Plato mas caro

Select top 1 pr.precio, p.Descripcion
  from PracticaDDL.restaurante.Plato p
 inner join PracticaDDL.restaurante.PlatoReceta pr on ( p.idPlato = pr.idPlato)
 order by pr.precio DESC

 -- 9- Platos con más ingredientes

 Select p1.idPlato, p1.Descripcion, ri1.Cantidad_ingrediente
 from PracticaDDL.restaurante.Plato p1
 inner  join	PracticaDDL.restaurante.PlatoReceta pr on (p1.idPlato = pr.idPlato)
 inner  join	PracticaDDL.restaurante.Receta r on (pr.idReceta = r.idReceta)
 inner  join	PracticaDDL.restaurante.RecetaIngrediente ri1 on ( r.idReceta = ri1.IdReceta )
 inner  join	PracticaDDL.restaurante.Ingrediente i on (ri1.IdIngrediente = i.idIngrediente)
 where ri1.Cantidad_ingrediente = 
-- Busco la igualdad con la cantidad Maxima de Ingredientes 
 (   Select top 1 max(ri.Cantidad_ingrediente)
       from PracticaDDL.restaurante.Plato p 
	  inner join PracticaDDL.restaurante.PlatoReceta pr on ( p.idPlato = pr.idPlato )
	  inner join PracticaDDL.restaurante.RecetaIngrediente ri on ( pr.idReceta = ri.IdReceta )
	  group by ri.Cantidad_ingrediente 
	  order by ri.Cantidad_ingrediente DESC
)