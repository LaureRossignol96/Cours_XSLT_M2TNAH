<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:copy>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body/head">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="div[@type='cantilene']">
        <lg type="orig">
            <xsl:apply-templates mode="orig"/>
        </lg>
        <lg type="reg">
            <xsl:apply-templates mode="norm"/>
        </lg>
    </xsl:template>
    
    <xsl:template match="l" mode="orig">
        <l>
            <xsl:value-of select="text()|.//orig/text()|.//abbr/text()"/>
        </l>
    </xsl:template>
    
    <xsl:template match="l" mode="norm">
        <l>
            <xsl:value-of select="text()|.//reg/text()|.//expan/text()"/>
        </l>
    </xsl:template>
    
</xsl:stylesheet>