<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>

<!--
    *                                                                         *
    *    NOTES AND GUIDLEINES FOR USING DISTRIBUTION XSL TRANSFORMATIONS      *
    *                                                                         *
    * This XSL file is used to transform user defined custom tags in          *
    * the distribution.xml file to a format required by Reports Runtime.      *
    * Reports can understand only the generic "destype" tag structure for any *
    * pluggable destination. The user can specify the custome destination in  *
    * accordance with the generic destype tag structure for a pluggable       *
    * destination. Alternatively, for ease of use, the user can specify a     *
    * custom / more specific tag structure. These tags are unknown to the     *
    * distribution dtd, so they need to be mapped to the generic destype tag  *
    * structure as specified in the distribution.dtd.                         *
    *                                                                         *
    * The following is an illustration for a sample FAX destination:          *
    *  The user can specify the destination as per the generic tag structure  *
    * in the distribution.xml file as shown below                             *
    *                                                                         *
    *          illustration 1.0                                               *
    *                                                                         *         
    *    <destype id="FAXDEST" name="fax" >                                   *
    *      <property name="number" value="123456789"/>                        *
    *         <include src="report"/>                                         *
    *    </destype>                                                           *
    *                                                                         *
    *   or a more user-friendly entry such as                                 *
    *                                                                         * 
    *       illustration 1.1                                                  *
    *                                                                         *     
    *    <fax id="FAXDEST" number="123456789">                                *
    *      <include src="report"/>                                            *
    *    </fax>                                                               *  
    *                                                                         *
    * Reports Runtime cannot process the above FAX tag structure as is, since *
    * FAX tag is not a standard destination specified in the distribution.dtd.* 
    * The following tag structure must therefore be converted to the generic  *
    * format as shown in illustration 1.0                                     *      
    *  To achive this, a template for the FAX destination must be specified   *
    * in this file. The template would convert the specific FAX tag structure * 
    * to the generic destype structure.                                       *
    *                                                                         *  
    * See below for a sample transformation to convert the FAX tag structure  *
    * to DESTYPE tag structure.                                               *
     
-->
 
<xsl:output doctype-system="distribution.dtd"/>

<xsl:template match = "/">
 <xsl:apply-templates match = "destinations" /> 
</xsl:template>

<xsl:template match="destinations">
  <destinations>
  
     <!-- 
          The Standard mail/file/printer/destype and foreach must be copied 
          to the transformed xml. The foreach tag must be copied only if it 
          is specified with file/mail/printer/destype tags.
      -->
      
     <xsl:copy-of select="mail"/>
     <xsl:copy-of select="file"/>
     <xsl:copy-of select="printer"/>
     <xsl:copy-of select="destype"/>
     <xsl:copy-of select="foreach"/>
     
     <!-- apply template for the sample FAX destination -->
     <xsl:apply-templates select="fax" /> 
     
  </destinations>
</xsl:template>

<!-- 
     Sample Transformation Template for a FAX destination specified in  
     the distribution.xml file
     
     <fax id="FAXDEST" number="123456789">
       <include src="report"/>
     </fax>
-->

<xsl:template match="fax">
  <!-- create a new destype element -->
  <xsl:element name="destype">
    <!-- 
         create an ID attribute and copy the value from the ID given 
         for the fax destination
     -->
    <xsl:attribute name="id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
   
    <!-- create a Name attribute with fax as it's value -->
    <xsl:attribute name="name">fax</xsl:attribute>
    <!-- 
         create a Property element with name / value attribute pairs
         property tag is created for number attribute.
         Similarly create more property tags for any other attribute 
         you add to the FAX destination
     -->
    <xsl:element name="property">
      <xsl:attribute name="name">number</xsl:attribute>
      <xsl:attribute name="value">
        <xsl:value-of select="@number"/>
      </xsl:attribute>
    </xsl:element>
    
    <!-- copy the include tag as it is -->    
    <xsl:copy-of select="include"/>
  </xsl:element> 
  <!-- end of template -->
</xsl:template>

</xsl:stylesheet>

