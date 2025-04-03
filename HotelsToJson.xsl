<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>

    <!-- json outer edges -->
    <xsl:template match="/">
    <!-- json preamble -->
        <xsl:text>{
    "Hotels":{
        "Hotel":[</xsl:text>
        <xsl:apply-templates select="/Hotels"/>
    <!-- json epilouge -->
        <xsl:text>
        ]        
    }
}</xsl:text>
    </xsl:template>

    <!-- for all hotels: -->
    <xsl:template match="Hotels">
    <xsl:for-each select="Hotel">
        <xsl:if test="position()>1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>
        {</xsl:text>

            <xsl:text>
            "Name": "</xsl:text>
            <xsl:value-of select="Name" />
            <xsl:text>",</xsl:text>

            <xsl:text>
            "Phone": [
            </xsl:text>
            <xsl:for-each select="Phone">
                <xsl:if test="position()>1"><xsl:text>,</xsl:text></xsl:if>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="." />
                <xsl:text>"</xsl:text>
            </xsl:for-each>
            <xsl:text>],</xsl:text>

            <xsl:text>
            "Address": {
                </xsl:text>
                <xsl:text>"Number": "</xsl:text>
                <xsl:value-of select="Address/Number"/>
                <xsl:text>",
                "Street": "</xsl:text>
                <xsl:value-of select="Address/Street"/>
                <xsl:text>",
                "City": "</xsl:text>
                <xsl:value-of select="Address/City"/>
                <xsl:text>",
                "State": "</xsl:text>
                <xsl:value-of select="Address/State"/>
                <xsl:text>",
                "Zip": "</xsl:text>
                <xsl:value-of select="Address/Zip"/>
                <xsl:text>"</xsl:text>
            <xsl:text>}</xsl:text>

        <xsl:choose>
            <xsl:when test="@Rating">
                <xsl:text>,
            "_Rating": "</xsl:text>
                <xsl:value-of select="@Rating"/>
                <xsl:text>"</xsl:text>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:text>
        }</xsl:text>

    </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>