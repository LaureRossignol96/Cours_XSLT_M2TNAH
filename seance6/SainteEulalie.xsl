<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- Attention une sortie HTML => exclusion du préfixe tei des résultats -->
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/> <!-- pour éviter les espaces non voulus -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title"/>
                </title>
            </head>
            <body>
                <h1><xsl:value-of select="//body/head"/></h1>
                <span>
                    <a href="{//pb/@facs}">lien vers le manuscrit</a>
                </span> 
                <div>
                    <ul>
                        <head>Liste des personnages</head>
                        <xsl:call-template name="index"/>
                    </ul>
                </div>
                <div>
                    <h2>Transcription facsimilaire</h2>
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="orig"/>
                        </ul>
                    </div>
                </div>
                <div>
                    <h2>Transcription normalisée</h2>
                    <div>
                        <ul><xsl:apply-templates select="//text//div" mode="reg"/></ul>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="l" mode="#all">
        <xsl:element name="li">
            <xsl:attribute name="n">
                <xsl:number count="." format="1"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select=".//orig/text() |
            .//abbr/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select=".//reg/text() |
            .//expan//text()"/>
    </xsl:template>
    
    <xsl:template name="index">
        <xsl:for-each select="//listPerson//persName">
                <li>
                <xsl:value-of select="."/>
                    <xsl:variable name="personne">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> : </xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[replace(@ref, '#', '')=$personne]">
                        <xsl:value-of select="text() | .//reg/text() | .//expan/text()"/>
                        <xsl:text>(v.</xsl:text>
                        <!-- je compte les frères précédents et je fais +1 pour arriver à mon vers; aussi utilisé pour faire des notes numérotées automatiquement dans le html; ici je part du parent, je récupère tous les frères et soeurs et moi-même -->
                        <xsl:value-of select="count(parent::l/preceding-sibling::l) + 1"/>
                        <xsl:text>)</xsl:text>
                        <!-- gestion des virgules ou des points de fin de ligne -->
                        <xsl:if test="position() != last()">, </xsl:if>
                        <xsl:if test="position() = last()">.</xsl:if>
                    </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <!--  call template permet de s'affranchir de la structure xml, à utiliser surtout quand y a des for each, ou quand on est perdu dans le match d'un template; permet d'écrire une xsl modulaire-->
    
</xsl:stylesheet>
