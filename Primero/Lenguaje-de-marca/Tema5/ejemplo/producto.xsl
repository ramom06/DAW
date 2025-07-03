<?xml-stylesheet href="producto.xsl" type="text/xsl"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Productos de Electrónica</title>
    </head>
    <body>
        <ul>
            <xsl:for-each select="productos/producto">
                <li>
                    <xsl:value-of select="@tipo"/>,
                    <xsl:value-of  select="nombre"/>,
                    <xsl:value-of  select="precio"/>
                </li>
            </xsl:for-each>
        </ul>
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet> 