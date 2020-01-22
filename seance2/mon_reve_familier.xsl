<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0"><!-- pour éviter d'avoir une sortie polluée par les xmlns, on met ce dernier xmlns -->
    <!-- on met le xpath default namespace avec la tei pour éviter d'écrire "tei:" dans notre xpath -->
    
    <!-- 
    <xsl:template match="lg[@type='quatrain']">
        <xsl:text>Ici, il y avait un quatrain!</xsl:text>
    </xsl:template> -->
    
    <!-- avec une balise html
    <xsl:template match="lg[@type='quatrain']">
        <p>Ici, il y avait un quatrain!</p>
    </xsl:template> -->
    
    <!-- une manière plus propre
    <xsl:template match="lg[@type='quatrain']">
        <xsl:element name="p">Ici, il y avait un quatrain!</xsl:element>
    </xsl:template> -->
    
    <!-- 
    <xsl:template match="lg">
        <p type="{@type}">Ici, il y avait mon élément!</p>
        <xsl:apply-templates/>
    </xsl:template> --> <!-- le dernier apply-templates autorise à appliquer les règles à l'intérieur, et on a en plus le txete qui était à l'intérieur des l car apply-templates est équivalent à value-of  -->
    
    <!-- 
    <xsl:template match="lg">
        <p type="{@type}">Ici, il y avait mon élément!
            <xsl:apply-templates/>
        </p>
    </xsl:template> -->
    
    <!-- 
    <xsl:template match="lg/lg">
        <xsl:element name="p">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:text>Ici, il y avait mon élément</xsl:text>
        </xsl:element>
    </xsl:template> -->
    
    <!-- 
    <xsl:template match="lg/lg">
        <xsl:element name="p">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:text>Ici, il y avait mon élément</xsl:text>
            <ly-templates/>
        </xsl:element>
    </xsl:template> -->
    
    <!-- sélectionne uniquement l'élément sans les enfants: utile quand on veut ensuite modifier les enfants
    <xsl:template match="lg/lg">
        <xsl:copy/>
    </xsl:template> -->
    
    <!-- récupère juste le texte des enfants
    <xsl:template match="lg/lg">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template> -->
    
    <!--  c'est strictement équivalent à xsl:value-of select="." à la place du apply templates
    <xsl:template match="l">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template> -->
    
    <!-- sélectionne l'élément, ses attributs et ses enfants: utile quand on sait qu'on veut toute une branche sans en faire de modifs
    <xsl:template match="lg/lg">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- 
    <xsl:template match="lg/lg">
        <xsl:copy select=".">
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="l">
        <xsl:element name="p">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template> -->
    
    <!--
    <xsl:template match="lg/lg">
        <xsl:value-of select="lg[@type='tercet']/l"/>
    </xsl:template> -->
    
    
    <!-- exercice 1 -->
    <!-- 
    <xsl:template match="lg">
        <xsl:element name="lg">
            <xsl:attribute name="n">
                <xsl:number count="lg" level="multiple" format="1"/>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="1.1"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template> -->
    
    
    
</xsl:stylesheet>