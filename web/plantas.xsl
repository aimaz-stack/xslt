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
      
      <main id="jardinbotanico">
        <h1>PLANTAS</h1>
        <xsl:apply-templates select="jardinBotanico/plantas/planta"/>      
      </main>

      <footer>
        <address>&#169; Desarrollado por info@birt.eus</address>
      </footer>
    </body>
  </html>
</xsl:template>
<xsl:template match="planta">
    <article class="articulo">
      <img class="imagen" src="../img/{@foto}" alt="{nombreComun}"/>
      <h2>
        <!-- Modifica la url para que enlace a la página de la familia en Wikipedia -->
        <a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank">
          <xsl:value-of select="nombreComun"/>
        </a>
      </h2>	
      <h3>
        <xsl:choose>
          <xsl:when test="contains(luminosidad,'Alta')">
            <img class="alta-icono" src="../img/Alta.png" alt="Alta luminosidad" title="Alta luminosidad"/>
          </xsl:when>
        </xsl:choose>
        <xsl:value-of select="luminosidad"/>
      </h3>
    </article>   
</xsl:template>
</xsl:stylesheet>