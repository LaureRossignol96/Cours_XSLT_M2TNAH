<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- tout récupérer, mais inverser les lg saizain et quatrain -->
    
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
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="lg[@type='sonnet']">
        <xsl:apply-templates select="lg[@type='sizain']"/>
        <xsl:apply-templates select="lg[@type='quatrain']"/>        
    </xsl:template>
    
    <xsl:template match="lg[not(@type='sonnet')]">
        <xsl:element name="lg">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>