<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"     xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
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
    
    <xsl:template match="lg">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:copy-of select="@n"></xsl:copy-of>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:copy-of select="@type"></xsl:copy-of>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:copy-of select="@n"></xsl:copy-of>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="app">
        <app>
            <xsl:for-each-group select="rdg" group-by="@type">
                <rdgGrp type="{current-grouping-key()}">
                    <xsl:for-each select="current-group()">
                        <xsl:element name="rdg">
                            <xsl:attribute name="wit">
                                <xsl:value-of select="@wit"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:for-each>
                </rdgGrp>
            </xsl:for-each-group>
        </app>
    </xsl:template>
</xsl:stylesheet>