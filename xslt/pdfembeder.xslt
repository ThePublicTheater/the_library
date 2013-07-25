<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:Stylesheet [ <!ENTITY nbsp " "> ]>
<xsl:stylesheet 
        version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:msxml="urn:schemas-microsoft-com:xslt"
        xmlns:umbraco.library="urn:umbraco.library"
        exclude-result-prefixes="msxml umbraco.library">

<xsl:output method="xml" omit-xml-declaration="yes" />
<xsl:param name="currentPage"/>
<xsl:param name="pdf" select="/macro/pdfFile"/>

  <xsl:template match="/">
    <embed width="100%" height="500"> 
      <xsl:attribute name="src">
        <xsl:value-of select="$pdf" />
      </xsl:attribute>
    </embed>
  </xsl:template>      

</xsl:stylesheet>