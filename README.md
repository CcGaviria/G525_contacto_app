# Contact Management System

Este proyecto es una aplicación web para la gestión de contactos que permite registrar y listar contactos con información como sexo, fecha de nacimiento, nombre, apellido, dirección, país, departamento, ciudad, email, entre otros. También incluye validaciones para asegurar que no se registren más de tres contactos por ciudad y que los usuarios sean mayores de 18 años.

## Características
- Creación de contactos con validaciones.
- Limitación a 3 registros por ciudad.
- Verificación de que los usuarios sean mayores de 18 años.
- Listado y totalización de contactos por ciudad, departamento y país.
- Exportación de los registros a PDF.
- Vista JSON de los contactos.
- Relación entre `Country`, `Department` y `City`.

## Tecnologías utilizadas
- **Ruby on Rails** (versión 6.1.x)
- **MySQL** como base de datos.
- **PDFKit** para la generación de PDFs.
- **JavaScript (AJAX)** para la carga dinámica de departamentos y ciudades.
- **Bootstrap** para los estilos front-end.

## Requisitos previos
Asegúrate de tener las siguientes herramientas instaladas antes de iniciar:
- **Ruby**: Versión 2.7 o superior
- **Rails**: Versión 6.1.x
- **MySQL**: Versión 5.7 o superior
- **Node.js** y **Yarn**: Para la administración de paquetes front-end
- **Bundler**: Gemas de Ruby

## Configuración del proyecto


   ```bash
   git clone https://github.com/tu-usuario/contact-management-system.git
   cd contact-management-system
   bundle install
   rails db:create
   rails db:migrate
   rails db:seed
   rails server
   ```


