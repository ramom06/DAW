<?xml-stylesheet href="file.xsl" type="text/xsl"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Cartelera pelicula</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Plataforma</th>
                        <th>Titulo</th>
                        <th>Director</th>
                        <th>Año</th>
                    </tr>
                    <xsl:for-each select="cartelera/pelicula">
                        <xsl:sort select="anyo" data-type="number" order="ascending"/>
                    <xsl:if test="anyo &gt; 2010">
                    <tr>    
                        <td><xsl:value-of select="@plataforma"/></td>
                        <td><xsl:value-of select="titulo"/>(<xsl:value-of select="titulo/@idioma"/>)</td>
                        <td><xsl:value-of select="director"/></td>
                        <td><xsl:value-of select="anyo"/></td>
                    </tr>
                    </xsl:if>
                    <xsl:if test="anyo &lt; 2010">
                        <ul>
                            <li><xsl:value-of select="titulo"/>(<xsl:value-of select="@idioma"/>)</li>
                        </ul>
                    </xsl:if>  
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>