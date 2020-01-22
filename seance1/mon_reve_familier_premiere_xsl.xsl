<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- / est la racine : je sélectionne mon arbre xml depuis la racine -->
    <!-- appliquer dans cet élément toutes les autres règles qui s'appliquent aux enfants de cet élément -->
    <!--
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template> -->
    
    <!-- apply-templates renvoie le texte des enfants, l'équivalent est ce qui suit-->
    <!-- 
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template> -->
    
    <!-- copy-of renvoie tous les attributs disponibles dans tei, même ceux par défaut; copie l'élément en rajoutant même ce qui était implicite -->
    <!--
    <xsl:template match="/">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 1 -->
    <!-- 
    <xsl:template match="tei:lg">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 2 -->
    <!--
    <xsl:template match="tei:lg[@type='quatrain']">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!--  question 3 -->
    <!--
    <xsl:template match="tei:lg/tei:l[3]">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 4 -->
    <!-- 
    <xsl:template match="tei:lg[@type='tercet'][2]/tei:l[3]">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 5 -->
    <!-- 
    <xsl:template match="tei:lg[1]">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 6 -->
    <!-- 
    <xsl:template match="tei:lg[position()&lt;2]">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!-- question 7 -->
    <!-- 
    <xsl:template match="tei:lg[position()&gt;2]">
        <xsl:copy-of select="."/>
    </xsl:template> -->
    
    <!--  question 8 -->
    <!-- (//l) veut dire n'importe quel enfant l du poeme pour que le prédicat porte sur toute l'expression //tei:l donc dans tout le fichier tei je veux le vers numéro 3 -->
    <xsl:template match="(//tei:l)[3]">
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:stylesheet>