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
            <xsl:copy-of select="lem"></xsl:copy-of>
            <xsl:for-each select="rdg[contains(@wit, 'Z')]">
                <xsl:sort select="@wit" order="ascending"/>
                <rdgGrp>
                    <xsl:attribute name="type">main</xsl:attribute>
                    <xsl:element name="rdg">
                        <xsl:attribute name="wit">
                            <xsl:copy-of select="@wit"></xsl:copy-of>
                        </xsl:attribute>
                        <xsl:copy-of select="text()"></xsl:copy-of>
                    </xsl:element>
                </rdgGrp>
            </xsl:for-each>
            <xsl:for-each select="rdg[ not(contains(@wit, 'Z'))]">
                <xsl:sort select="@wit" order="ascending"/>
                <rdgGrp>
                    <xsl:attribute name="type">sub</xsl:attribute>
                    <xsl:element name="rdg">
                        <xsl:attribute name="wit">
                            <xsl:copy-of select="@wit"></xsl:copy-of>
                        </xsl:attribute>
                        <xsl:copy-of select="text()"></xsl:copy-of>
                    </xsl:element>
                </rdgGrp>
            </xsl:for-each>
        </app>
    </xsl:template>
    
</xsl:stylesheet>