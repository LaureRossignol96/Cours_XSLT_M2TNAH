<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="TEI">
        <xsl:element name="TEI">
            <xsl:copy-of select="teiHeader"/>
            <xsl:apply-templates select="text"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:text>play</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body/div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="pb | milestone"/>
    
    <!-- @* syntaxe pour forcer la récupération sur copy des attributs -->
    <xsl:template match="sp | @*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="gap|del">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="body/div/div">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:text>act</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="body/div/div" level="multiple" format="1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="1"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name[@type='person']">
        <xsl:element name="persName">
            <xsl:attribute name="ref">
                <xsl:value-of select=".//@ref"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="speaker">
        <!-- création d'une variable ref contenant la ref venant du sp[@who] parent, en supprimant le # -->
        <xsl:variable name="ref">
            <xsl:value-of select="parent::sp/replace(@who, '#', '')"/>
        </xsl:variable>
        <!-- création du speaker -->
        <xsl:element name="speaker">
            <!-- insertion d'un persName avec ref pour chaque speaker -->
            <xsl:element name="persName">
                <xsl:attribute name="ref">
                    <xsl:value-of select="parent::sp/@who"/>
                </xsl:attribute>
                <!-- insertion de la valeur du who réconcilié avec le xml:id du teiHeader correspondant -->            <xsl:value-of select="ancestor::TEI//listPerson/person[@xml:id=$ref]/persName/text()"/>
            </xsl:element>
            <!-- application des règles pour name -->
            <xsl:apply-templates select="name"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>