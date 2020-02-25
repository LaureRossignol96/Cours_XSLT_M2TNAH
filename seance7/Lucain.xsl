<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document href="{concat($witfile, '.tex')}"> 
            \documentclass[12pt, a4paper]{report}
            \usepackage[utf8x]{inputenc}
            \usepackage[T1]{fontenc}
            \usepackage{lmodern}
            \usepackage[french]{babel}
            \usepackage{reledmac}
            
            \setstanzaindents{0,1}
            \setcounter{stanzaindentsrepetition}{1}        
            
            \Xarrangement[A]{paragraph}
            \Xparafootsep{$\parallel$~}
            
            \begin{document}
            
            \firstlinenum{5}
            \linenumincrement{5}
            \linenummargin{right}
            \setline{<xsl:value-of select="//lg/l[1]/@n"/>}
            
            \beginnumbering
            \stanza 
            <xsl:call-template name="verse"/>
            \endnumbering
            \end{document}
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template name="verse">
        <xsl:for-each select="//l">
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="position() = last()"><xsl:text> \&amp; </xsl:text></xsl:when>
                <xsl:otherwise><xsl:text> &amp; </xsl:text></xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="app">
        <xsl:text>\edtext{</xsl:text><xsl:value-of select="lem/text()"/><xsl:text>}{\Afootnote</xsl:text><xsl:for-each select="rdg"><xsl:text>{</xsl:text><xsl:choose><xsl:when test="parent::app//@type='om'"><xsl:value-of select="text()"/><xsl:text>(omisit)</xsl:text></xsl:when><xsl:when test="parent::app//@type='rasura'"><xsl:value-of select="text()"/><xsl:text>(rasura)</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise></xsl:choose>,<xsl:value-of select="replace(@wit, '#', '')"/><xsl:text>}</xsl:text></xsl:for-each><xsl:text>}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>