<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:variable name="titre">
        <xsl:value-of select="upper-case(.//head)"/>
    </xsl:variable>
    <xsl:template match="head">
        <xsl:value-of select="$titre"/>
    </xsl:template>
    
</xsl:stylesheet>