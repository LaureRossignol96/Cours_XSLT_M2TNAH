<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"     xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <!-- reproduire l'arbre TEI, récupérer les apparats, les rdg (quand wit a Z, ajouter sur rdg attribut type de valeur main; dans les autres cas, rajouter l'attribut type de valeur sub) -->


    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- ou bien en plus court
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:copy-of select="teiHeader"/>
            <xsl:apply-templates select="text"/>
        </xsl:copy>
    </xsl:template> -->
    
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
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="lem">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="rdg">
        <xsl:choose>
            <xsl:when test="contains(@wit, 'Z')">
                <xsl:element name="rdg">
                    <xsl:attribute name="wit">
                        <xsl:copy-of select="@wit"></xsl:copy-of>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:text>main</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="text()"></xsl:copy-of>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="rdg">
                    <xsl:attribute name="wit">
                        <xsl:copy-of select="@wit"></xsl:copy-of>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:text>sub</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="text()"></xsl:copy-of>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>