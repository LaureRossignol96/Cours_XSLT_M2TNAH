<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/> <!-- pour éviter les espaces non voulus -->
    
    <xsl:template match="/">
        <xsl:text>
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
        \setline{1}
        
        \beginnumbering
        \stanza
        \setline{
        </xsl:text>
        
        <xsl:value-of select=".//l[1]/@n"/>
        
        <xsl:text>}
        </xsl:text>
        
        <xsl:apply-templates select="//l"/>
        
        <xsl:text>
        \endnumbering
        \end{document}</xsl:text>
    </xsl:template>
    
    <xsl:template match='l'>
        <xsl:value-of select="./text() | .//lem/text()"/>
        <xsl:if test="position() != last()">&amp; </xsl:if>
        <xsl:if test="position() = last()">\&amp;</xsl:if>
    </xsl:template>
    
</xsl:stylesheet>