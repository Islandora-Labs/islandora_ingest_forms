<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
version="1.0"> 

    <xsl:output encoding="utf-8" indent="yes" method="xml"/> 

    <xsl:template match="/"> 
        <xsl:copy-of select="/" /> 
    </xsl:template> 
</xsl:stylesheet>