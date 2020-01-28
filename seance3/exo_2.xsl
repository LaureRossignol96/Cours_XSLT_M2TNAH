<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"     xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="TEI">
        <html>
            <head><meta charset="UTF‐8"/>
                <title>Exercice de structuration HTML</title>
            </head>
            <body><h1> 
                <xsl:value-of select="concat(.//title, ' écrit par ', .//author)"/>
            </h1>
                <ul>
                    <xsl:apply-templates select=".//body"/>
                </ul>
            <div> Ajouter ici le texte demandé en 7</div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="lg">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="l">
        <li>
            <xsl:apply-templates></xsl:apply-templates>
        </li>
    </xsl:template>
    
</xsl:stylesheet>