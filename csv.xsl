<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <xsl:variable name="delimiter" select="','" />

  <!-- define an array containing the fields we are interested in -->
  <xsl:variable name="fieldArray">
    <field>artist</field>
    <field>title</field>
    <field>year</field>
    <field>condition</field>
  </xsl:variable>
  <xsl:param name="fields" select="document('')/*/xsl:variable[@name='fieldArray']/*" />

  <xsl:template match="/">

    <!-- output the header row -->
    <xsl:for-each select="$fields">
      <xsl:if test="position() != 1">
        <xsl:value-of select="$delimiter"/>
      </xsl:if>
      <xsl:value-of select="." />
    </xsl:for-each>

    <!-- output newline -->
    <xsl:text>
</xsl:text>

    <xsl:apply-templates select="collection/record"/>
  </xsl:template>

  <xsl:template match="record">
    <xsl:variable name="currNode" select="." />

    <!-- output the data row -->
    <!-- loop over the field names and find the value of each one in the xml -->
    <xsl:for-each select="$fields">
      <xsl:if test="position() != 1">
        <xsl:value-of select="$delimiter"/>
      </xsl:if>
      <xsl:value-of select="$currNode/*[name() = current()]" />
    </xsl:for-each>

    <!-- output newline -->
    <xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>