<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
          <h1>ZONAS</h1>
          <table>
            <tr>
              <th>ZONA</th>
              <th>Ubicación</th>
              <th>Horario</th>
            </tr>
            <!-- Solo seleccionamos las zonas que abren antes de las 10 o que abren a las 10:00 en punto -->
            <xsl:apply-templates select="//zona[number(substring-before(horarioapertura, ':')) &lt; 10
            or (substring-before(horarioapertura, ':') = '10' and substring-after(horarioapertura, ':') = '00')
  ]"/>
      </table>			
    </main>
    <footer>
      <address>&#169; Desarrollado por info@birt.eus</address>
    </footer>
  </body>
</html>
    
  </xsl:template>
  <xsl:template match="zona">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <!-- Verificamos si la ubicación contiene 'Exterior', si contiene le asignamos la clase azul a ubicacion y sino, nada -->
      <xsl:choose>
      <xsl:when test="contains(ubicacion,'Exterior')">
        <td class="azul"><xsl:value-of select="ubicacion"/></td>
      </xsl:when>
      <xsl:otherwise>
        <td><xsl:value-of select="ubicacion"/></td>
      </xsl:otherwise>
    </xsl:choose>
      <td><xsl:value-of select="horarioapertura"/> - <xsl:value-of select="horariocierre"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>