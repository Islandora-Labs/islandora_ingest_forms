<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : fgdc_to_dc.xsl
    Created on : July 7, 2011, 7:11 AM
    Author     : nbanks
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <dc:title>Default Title</dc:title>
            <dc:identifier>default:pid</dc:identifier>
        </oai_dc:dc>
    </xsl:template>
</xsl:stylesheet>
