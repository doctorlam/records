<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/collection">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="records.css" />
		<script src="sorttable.js"></script>

		<!-- Javascript library for sorting comes from http://www.kryogenix.org/code/browser/sorttable/ -->

	</head>
<body>
	<table class = "sortable" border= "1">
			<tr class = "first-row">
				<th>Artist</th>
				<th>Title</th>
				<th>Year</th>
				<th>Condition</th>
			</tr>
		<xsl:for-each select="record">
			<xsl:sort select="artist"/>
			<tr>
				<td><xsl:value-of select="artist" /></td>
				<td><xsl:value-of select="title" /></td>
				<td class="center-text"><xsl:value-of select="year" /></td>
				<td class="center-text"><xsl:value-of select="condition" /></td>
			</tr>
		</xsl:for-each>
	</table>


</body>
</html>

</xsl:template>
</xsl:stylesheet>