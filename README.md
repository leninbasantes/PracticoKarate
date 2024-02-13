# Instrucciones para ejecutar pruebas automatizadas con Karate en IntelliJ
Este documento proporciona una guía paso a paso para configurar y ejecutar pruebas automatizadas utilizando Karate en IntelliJ, así como instrucciones para visualizar los informes generados.

## 1. Prerequisitos

- Sistema Operativo: Windows 11
- Software IDE: IntelliJ IDEA 2022.3.3 (Community Edition)
- Apache Maven Versión: 3.9.6
- Java Versión: 11
- Karate Versión: 1.4.1

## 2. Comandos de instalación

Ejecuta el siguiente comando para crear un proyecto esqueleto Karate Maven:

```shell
mvn archetype:generate -DarchetypeGroupId=com.intuit.karate -DarchetypeArtifactId=karate-archetype -DarchetypeVersion=1.4.1 -DgroupId=com.mycompany -DartifactId=myproject

```

## 3. Instrucciones para ejecutar los test

- **Configuración del Entorno**
  
  Antes de ejecutar las pruebas, asegúrate de tener instalado IntelliJ y de haber configurado el proyecto para usar Karate. Si aún no has configurado Karate en tu proyecto, sigue estos pasos:

  1. **Añadir dependencias de Karate:** Edita el archivo `pom.xml` de tu proyecto Maven (o el archivo de configuración correspondiente si estás utilizando otro sistema de gestión de proyectos) para incluir las dependencias de Karate.

     ```xml
     <dependencies>
       <dependency>
         <groupId>com.intuit.karate</groupId>
         <artifactId>karate-junit5</artifactId>
         <version>1.4.1</version>
         <scope>test</scope>
       </dependency>
     </dependencies>
     ```

  2. **Sincronizar dependencias:** Asegúrate de sincronizar las dependencias en IntelliJ para que el proyecto reconozca Karate.

- **Ejecución de las Pruebas**

  Para ejecutar las pruebas automatizadas, sigue estos pasos:

  1. **Navegar al paquete de pruebas:** Dirígete al paquete `Pets` dentro de tu proyecto, donde encontrarás la clase `PetsRunner`.

  2. **Ejecutar `PetsRunner`:** Haz clic derecho en la clase `PetsRunner` y selecciona `Run 'PetsRunner'`. Esto ejecutará las pruebas definidas en el archivo `pets.feature`.

- **Visualización de Reportes**

  Los informes generados por Karate pueden ser visualizados de dos maneras:

  1. **A través de la consola:** Al finalizar la ejecución de las pruebas, si todo sale bien, la consola mostrará un enlace. Haz clic en este enlace para abrir el informe en tu navegador.

  2. **Acceso directo a los archivos de reporte:**

     - Navega a la carpeta `target` generada en la raíz del proyecto.
     - Dentro de `target`, localiza y abre la carpeta `karate-reports`.
     - Busca el archivo `karate-summary.html`.
     - Haz clic derecho en el archivo y selecciona `Open in >`, luego elige Google Chrome o tu navegador preferido para ver el informe.

Siguiendo estos pasos, podrás configurar, ejecutar tus pruebas automatizadas con Karate, y visualizar los informes generados para analizar los resultados de tus pruebas.

