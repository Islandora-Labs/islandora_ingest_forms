<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dc="http://purl.org/dc/terms/"
    xmlns:mads="http://www.loc.gov/mads/v2" exclude-result-prefixes="mads">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/
            http://www.openarchives.org/OAI/2.0/oai_dc.xsd"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
            <dc:title>
<xsl:value-of select="/mads:mads/mads:authority/mads:name/mads:namePart[@type='given']"/> <xsl:value-of
                    select="/mads:mads/mads:authority/mads:name/mads:namePart[@type='family']"/>
            </dc:title>
            <xsl:if test="/mads:mads/mads:fieldOfActivity/text() [normalize-space(.) ]">
                <dc:description>
                    <xsl:value-of select="/mads:mads/mads:fieldOfActivity"/>
                </dc:description>
           </xsl:if>
        </oai_dc:dc>

    </xsl:template>

    <!-- suppress all else:-->

    <xsl:template match="*"/>

</xsl:stylesheet>
