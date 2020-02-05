<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"     xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- récupérer les leçons (rdg), copier que ceux qui ont un wit P dans l'ensemble de leurs wit: utiliser la focntion xpath contains(element_a_verifier, chaine_qui_minteresse) donc contains(@wit, 'P') -->
    
    <xsl:template match="rdg">
        <xsl:if test="contains(@wit, 'P')">
            <xsl:copy-of select="."/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>