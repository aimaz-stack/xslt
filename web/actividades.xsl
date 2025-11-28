<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/'>
    <html lang="es">
      
      <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8"/>
        <meta name="description" content="Página principal" />
        <title>Jardín Botánico de Harkaitz</title>
      </head>
      
      <body>
        <header>
          <img src= "../img/logotipo.png" alt= "Reservas" />
          <a href="zonas.xml">Zonas</a>
          <a href="plantas.xml">Plantas</a>
          <a href="actividades.xml">Actividades</a>
        </header>
        
        <main>
          <!-- Asignamos el mes 11 a la variable mes y lo mostramos en la cabecera -->
          <xsl:variable name="mes" select="11"/>
          <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
          <!-- Solo seleccionamos las actividades cuyo mes en la fechaHora sea igual a la variable mes -->
          <xsl:apply-templates select="jardinBotanico/actividades/actividad[substring(fechaHora,6,2) = $mes]"/>
        </main>
        
        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
</xsl:template> 
<xsl:template match="actividad">
  <article class="actividades">
    <!-- Contamos el número de responsables y lo mostramos en el título -->
    <h4><xsl:value-of select="titulo"/> - <xsl:value-of select="count(responsables/responsable)"/> Responsables</h4>
    <!-- Damos formato a la fecha y hora usando substring y mostramos los datos de la actividad -->    
    <h2>Fecha: <xsl:value-of select="substring(fechaHora,1,10)"/> </h2>
    <h2>Hora: <xsl:value-of select="substring(fechaHora,12,8)"/></h2>
    <h2>Lugar: <xsl:value-of select="@sala"/></h2>
    <ul>
      <xsl:apply-templates select="responsables/responsable"/>
    </ul>
  </article>
</xsl:template>
<xsl:template match="responsable">
    <li><xsl:value-of select="nomresponsable"/> - <xsl:value-of select="email"/></li>
</xsl:template>
</xsl:stylesheet>