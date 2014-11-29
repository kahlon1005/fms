<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="invoice" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="INVOICE" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <data>
    <systemParameter name="DESTYPE" initialValue="Printer" display="yes"/>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL INVOICE.INV_DATE, INVOICE.CUSTOMER_ID, ORDER_INFO.TRIP_FROM, ORDER_INFO.TRIP_TO, 
ORDER_INFO.DO_DATE, ORDER_INFO.DO_NO, ORDER_INFO.ADD_CHR, 
ORDER_INFO.ORDER_AMOUNT, 'M/S. '||CUSTOMER_INFO.COMPANY_NAME COMPANY_NAME, CUSTOMER_INFO.BILL_CURRENCY, 
ORDER_INFO.TARIFF_CODE, ORDER_INFO.LOAD_DATE, ORDER_INFO.SHIP_TO||'-'|| 
ORDER_INFO.SHIP_TO_NAME SHIP_TO_NAME, ORDER_INFO.EQUIPMENT, INVOICE.INV_NO
FROM INVOICE, CUSTOMER_INFO, ORDER_INFO
WHERE ((INVOICE.CUSTOMER_ID = CUSTOMER_INFO.CUSTOMER_ID)
 AND (ORDER_INFO.CUSTOMER_ID = CUSTOMER_INFO.CUSTOMER_ID)
 AND (INVOICE.INV_NO = ORDER_INFO.INV_NO))
ORDER BY INVOICE.INV_NO ASC, 
ORDER_INFO.DO_DATE ASC,ORDER_INFO.EQUIPMENT ASC,  
ORDER_INFO.TARIFF_CODE ASC]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_INV_NO">
        <displayInfo x="0.79138" y="1.94995" width="2.41736" height="2.13965"
        />
        <dataItem name="INV_NO" oracleDatatype="number" columnOrder="11"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Invoice No">
          <dataDescriptor expression="INVOICE.INV_NO"
           descriptiveExpression="INV_NO" order="15" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CUSTOMER_ID" oracleDatatype="number" columnOrder="13"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Customer Id">
          <dataDescriptor expression="INVOICE.CUSTOMER_ID"
           descriptiveExpression="CUSTOMER_ID" order="2"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="COMPANY_NAME" datatype="vchar2" columnOrder="20"
         width="35" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Company Name">
          <dataDescriptor
           expression="&apos;M/S. &apos; || CUSTOMER_INFO.COMPANY_NAME"
           descriptiveExpression="COMPANY_NAME" order="9" width="35"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="BILL_CURRENCY" datatype="vchar2" columnOrder="21"
         width="3" defaultWidth="30000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Currency">
          <dataDescriptor expression="CUSTOMER_INFO.BILL_CURRENCY"
           descriptiveExpression="BILL_CURRENCY" order="10" width="3"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="INV_DATE" datatype="date" oracleDatatype="date"
         columnOrder="12" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Date">
          <dataDescriptor expression="INVOICE.INV_DATE"
           descriptiveExpression="INV_DATE" order="1" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <summary name="SumORDER_AMOUNTPerINV_NO" source="ORDER_AMOUNT"
         function="sum" width="22" precision="8" scale="2" reset="G_INV_NO"
         compute="report" defaultWidth="100000" defaultHeight="10000"
         columnFlags="520" defaultLabel="Total:">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
        <summary name="SumADD_CHRPerINV_NO" source="ADD_CHR" function="sum"
         width="22" precision="4" reset="G_INV_NO" compute="report"
         defaultWidth="60000" defaultHeight="10000" columnFlags="520"
         defaultLabel="Total:">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
        <formula name="CF_INV_G_TOTAL" source="cf_inv_g_total"
         datatype="number" width="20" precision="10" defaultWidth="120000"
         defaultHeight="10000" columnFlags="16" defaultLabel="Cf Inv G Total"
         breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
        <formula name="CF_AMT_WORD" source="cf_amt_wordformula"
         datatype="character" width="200" precision="10" defaultWidth="100000"
         defaultHeight="10000" columnFlags="16" defaultLabel="Cf Amt Word"
         breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
      </group>
      <group name="G_INV_DATE">
        <displayInfo x="3.84009" y="1.81201" width="1.61169" height="2.48145"
        />
        <dataItem name="SHIP_TO_NAME" datatype="vchar2" columnOrder="25"
         width="51" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Order Info Ship To Order Info">
          <xmlSettings xmlTag="ORDER_INFO_SHIP_TO_ORDER_INFO_"/>
          <dataDescriptor
           expression="ORDER_INFO.SHIP_TO || &apos;-&apos; || ORDER_INFO.SHIP_TO_NAME"
           descriptiveExpression="SHIP_TO_NAME" order="13" width="51"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="EQUIPMENT" datatype="vchar2" columnOrder="24"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Equipment">
          <dataDescriptor expression="ORDER_INFO.EQUIPMENT"
           descriptiveExpression="EQUIPMENT" order="14" width="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="LOAD_DATE" datatype="date" oracleDatatype="date"
         columnOrder="23" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Load Date">
          <dataDescriptor expression="ORDER_INFO.LOAD_DATE"
           descriptiveExpression="LOAD_DATE" order="12" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TRIP_FROM" datatype="vchar2" columnOrder="14"
         width="5" defaultWidth="50000" defaultHeight="10000" columnFlags="33"
         defaultLabel="From">
          <dataDescriptor expression="ORDER_INFO.TRIP_FROM"
           descriptiveExpression="TRIP_FROM" order="3" width="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TRIP_TO" datatype="vchar2" columnOrder="15" width="5"
         defaultWidth="50000" defaultHeight="10000" columnFlags="33"
         defaultLabel="To">
          <dataDescriptor expression="ORDER_INFO.TRIP_TO"
           descriptiveExpression="TRIP_TO" order="4" width="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DO_NO" datatype="vchar2" columnOrder="17" width="20"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Do No">
          <dataDescriptor expression="ORDER_INFO.DO_NO"
           descriptiveExpression="DO_NO" order="6" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DO_DATE" datatype="date" oracleDatatype="date"
         columnOrder="16" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Do Date">
          <dataDescriptor expression="ORDER_INFO.DO_DATE"
           descriptiveExpression="DO_DATE" order="5" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ORDER_AMOUNT" oracleDatatype="number" columnOrder="19"
         width="22" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Rate">
          <dataDescriptor expression="ORDER_INFO.ORDER_AMOUNT"
           descriptiveExpression="ORDER_AMOUNT" order="8"
           oracleDatatype="number" width="22" scale="2" precision="8"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TARIFF_CODE" datatype="vchar2" columnOrder="22"
         width="5" defaultWidth="50000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Tariff">
          <dataDescriptor expression="ORDER_INFO.TARIFF_CODE"
           descriptiveExpression="TARIFF_CODE" order="11" width="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ADD_CHR" oracleDatatype="number" columnOrder="18"
         width="22" defaultWidth="60000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Exit Fee">
          <dataDescriptor expression="ORDER_INFO.ADD_CHR"
           descriptiveExpression="ADD_CHR" order="7" oracleDatatype="number"
           width="22" precision="4"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <summary name="CS_SNO" source="ORDER_AMOUNT" function="count"
         width="20" precision="10" reset="G_INV_NO" compute="report"
         defaultWidth="0" defaultHeight="0" columnFlags="8"
         defaultLabel="Cs Sno">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
      </group>
    </dataSource>
    <summary name="SumORDER_AMOUNTPerReport" source="ORDER_AMOUNT"
     function="sum" width="22" precision="8" scale="2" reset="report"
     compute="report" defaultWidth="100000" defaultHeight="10000"
     columnFlags="552" defaultLabel="Total:">
      <displayInfo x="0.00000" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="SumADD_CHRPerReport" source="ADD_CHR" function="sum"
     width="22" precision="4" reset="report" compute="report"
     defaultWidth="60000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Total:">
      <displayInfo x="0.79993" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body width="8.18750" height="10.87500">
      <location x="0.12500" y="0.00000"/>
      <repeatingFrame name="R_G_INV_NO" source="G_INV_NO"
       printDirection="down" minWidowRecords="1" columnMode="no">
        <geometryInfo x="0.12500" y="0.00000" width="8.00000"
         height="10.87500"/>
        <field name="F_INV_NO" source="INV_NO" minWidowLines="1" spacing="0"
         alignment="end">
          <font face="Book Antiqua" size="11"/>
          <geometryInfo x="7.43750" y="0.18750" width="0.43750"
           height="0.25000"/>
          <generalLayout pageBreakAfter="yes" pageProtect="yes"
           verticalElasticity="expand"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
        </field>
        <field name="F_INV_DATE" source="INV_DATE" minWidowLines="1"
         spacing="0" alignment="end">
          <font face="Book Antiqua" size="11"/>
          <geometryInfo x="6.95300" y="0.50000" width="0.92200"
           height="0.25000"/>
          <generalLayout verticalElasticity="expand"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
        </field>
        <field name="F_BILL_CURRENCY" source="BILL_CURRENCY" minWidowLines="1"
         spacing="0" alignment="end">
          <font face="Book Antiqua" size="11"/>
          <geometryInfo x="7.37500" y="0.87500" width="0.50000"
           height="0.25000"/>
          <generalLayout verticalElasticity="expand"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
        </field>
        <text name="B_BILL_CURRENCY" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="6.75000" y="0.87500" width="0.81250"
           height="0.25000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Currency :]]>
            </string>
          </textSegment>
        </text>
        <field name="F_COMPANY_NAME" source="COMPANY_NAME" minWidowLines="1"
         spacing="0" alignment="start">
          <font face="Book Antiqua" size="14" bold="yes"/>
          <geometryInfo x="0.12500" y="1.06250" width="4.56250"
           height="0.25000"/>
          <generalLayout verticalElasticity="expand"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
        </field>
        <frame name="M_G_INV_DATE_GRPFR">
          <geometryInfo x="0.12500" y="1.43750" width="7.75000"
           height="6.68750"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings linePattern="solid"/>
          <repeatingFrame name="R_G_INV_DATE" source="G_INV_DATE"
           printDirection="down" minWidowRecords="1" columnMode="no">
            <geometryInfo x="0.12500" y="1.68750" width="7.75000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings linePattern="solid"/>
            <field name="F_EQUIPMENT" source="EQUIPMENT" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="0.43750" y="1.68750" width="0.68750"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_TRIP_FROM" source="TRIP_FROM" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="5.25000" y="1.68750" width="0.62500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_TRIP_TO" source="TRIP_TO" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="5.87500" y="1.68750" width="0.68750"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_DO_NO" source="DO_NO" minWidowLines="1" spacing="0"
             alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="4.62500" y="1.68750" width="0.62500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_DO_DATE" source="DO_DATE" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="1.12500" y="1.68750" width="0.81250"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_SHIP_TO_NAME" source="SHIP_TO_NAME"
             minWidowLines="1" spacing="0" alignment="start">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="2.00000" y="1.68750" width="2.62500"
               height="0.18750"/>
            </field>
            <field name="F_ORDER_AMOUNT" source="ORDER_AMOUNT"
             minWidowLines="1" formatMask="NNN,NN0" spacing="0"
             alignment="end">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="7.00000" y="1.68750" width="0.50000"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_TARIFF_CODE" source="TARIFF_CODE" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="6.56250" y="1.68750" width="0.43750"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings linePattern="solid"/>
            </field>
            <field name="F_ADD_CHR" source="ADD_CHR" minWidowLines="1"
             spacing="0" alignment="end">
              <font face="Book Antiqua" size="10"/>
              <geometryInfo x="7.50000" y="1.68750" width="0.37500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
            </field>
            <field name="F_1" source="CS_SNO" minWidowLines="1" spacing="0"
             alignment="end">
              <font face="Book Antiqua" size="11"/>
              <geometryInfo x="0.12500" y="1.68750" width="0.31250"
               height="0.18750"/>
            </field>
          </repeatingFrame>
          <frame name="M_G_INV_DATE_HDR">
            <geometryInfo x="0.12500" y="1.43750" width="7.75000"
             height="0.25000"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings linePattern="solid"/>
            <text name="B_EQUIPMENT" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="0.43750" y="1.43750" width="0.68750"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Truck]]>
                </string>
              </textSegment>
            </text>
            <text name="B_TRIP_FROM" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="5.25000" y="1.43750" width="0.62500"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[From]]>
                </string>
              </textSegment>
            </text>
            <text name="B_TRIP_TO" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="5.87500" y="1.43750" width="0.68750"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[To]]>
                </string>
              </textSegment>
            </text>
            <text name="B_DO_NO" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="4.62500" y="1.43750" width="0.62500"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Do No]]>
                </string>
              </textSegment>
            </text>
            <text name="B_DO_DATE" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="1.12500" y="1.43750" width="0.81250"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Do Date]]>
                </string>
              </textSegment>
            </text>
            <text name="B_SHIP_TO_NAME" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="1.93750" y="1.43750" width="2.68750"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Ship To]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ORDER_AMOUNT" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="7.00000" y="1.43750" width="0.50000"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Rate]]>
                </string>
              </textSegment>
            </text>
            <text name="B_TARIFF_CODE" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="6.56250" y="1.43750" width="0.43750"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Tariff]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ADD_CHR" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="7.50000" y="1.43750" width="0.37500"
               height="0.25000"/>
              <visualSettings linePattern="solid"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[Oth]]>
                </string>
              </textSegment>
            </text>
            <text name="B_EQUIPMENT1" minWidowLines="1">
              <textSettings justify="end" spacing="0"/>
              <geometryInfo x="0.12500" y="1.43750" width="0.31250"
               height="0.25000"/>
              <textSegment>
                <font face="Book Antiqua" size="11"/>
                <string>
                <![CDATA[S#]]>
                </string>
              </textSegment>
            </text>
          </frame>
        </frame>
        <frame name="M_G_INV_DATE_FTR1">
          <geometryInfo x="0.12500" y="8.12500" width="7.75000"
           height="0.31250"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings linePattern="solid"/>
          <field name="F_SumORDER_AMOUNTPerINV_NO1"
           source="SumORDER_AMOUNTPerINV_NO" minWidowLines="1"
           formatMask="NNN,NN0" spacing="0" alignment="end">
            <font face="Book Antiqua" size="11"/>
            <geometryInfo x="7.00000" y="8.12500" width="0.50000"
             height="0.31250"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings linePattern="solid"/>
          </field>
          <field name="F_SumADD_CHRPerINV_NO1" source="SumADD_CHRPerINV_NO"
           minWidowLines="1" spacing="0" alignment="end">
            <font face="Book Antiqua" size="11"/>
            <geometryInfo x="7.50000" y="8.12500" width="0.37500"
             height="0.31250"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_Total_1" minWidowLines="1">
            <textSettings justify="end" spacing="0"/>
            <geometryInfo x="6.31250" y="8.12500" width="0.43750"
             height="0.31250"/>
            <textSegment>
              <font face="Book Antiqua" size="11"/>
              <string>
              <![CDATA[Total :]]>
              </string>
            </textSegment>
          </text>
        </frame>
        <frame name="M_G_INV_DATE_FTR">
          <geometryInfo x="0.12500" y="8.43750" width="7.75000"
           height="0.31250"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings linePattern="solid"/>
          <field name="F_INV_G_TOT" source="CF_INV_G_TOTAL" minWidowLines="1"
           formatMask="NNN,NN0" spacing="0" alignment="end">
            <font face="Book Antiqua" size="11"/>
            <geometryInfo x="7.12500" y="8.43750" width="0.75000"
             height="0.31250"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_Total_" minWidowLines="1">
            <textSettings justify="end" spacing="0"/>
            <geometryInfo x="6.00000" y="8.43750" width="1.00000"
             height="0.31250"/>
            <textSegment>
              <font face="Book Antiqua" size="11"/>
              <string>
              <![CDATA[Grand Total :]]>
              </string>
            </textSegment>
          </text>
          <field name="F_INV_IN_WORD" source="CF_AMT_WORD" minWidowLines="1"
           spacing="single" alignment="start">
            <font face="Book Antiqua" size="11"/>
            <geometryInfo x="0.12500" y="8.43750" width="6.06250"
             height="0.31250"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="firstPage"
             basePrintingOn="enclosingObject"/>
          </field>
        </frame>
        <text name="B_5" minWidowLines="1">
          <textSettings spacing="single"/>
          <geometryInfo x="0.12500" y="8.81250" width="4.41663"
           height="0.16663"/>
          <textSegment>
            <font face="Book Antiqua" size="10"/>
            <string>
            <![CDATA[Note: Prepare Cheque in favor of Mr. BIKRAMJIT SINGH]]>
            </string>
          </textSegment>
        </text>
        <text name="B_6" minWidowLines="1">
          <textSettings spacing="single"/>
          <geometryInfo x="0.12500" y="9.00000" width="1.51038"
           height="0.17712"/>
          <textSegment>
            <font face="Book Antiqua" size="10"/>
            <string>
            <![CDATA[Payment Period: 30 Days]]>
            </string>
          </textSegment>
        </text>
        <text name="B_7" minWidowLines="1">
          <textSettings spacing="single"/>
          <geometryInfo x="0.12500" y="9.93750" width="1.12500"
           height="0.23962"/>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Receiver Sign]]>
            </string>
          </textSegment>
        </text>
        <text name="B_8" minWidowLines="1">
          <textSettings justify="end" spacing="single"/>
          <geometryInfo x="7.00000" y="9.93750" width="0.89587"
           height="0.23962"/>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Signature]]>
            </string>
          </textSegment>
        </text>
        <text name="B_INV_NO" minWidowLines="1">
          <textSettings justify="end" spacing="0"/>
          <geometryInfo x="7.06250" y="0.18750" width="0.37500"
           height="0.25000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[No :]]>
            </string>
          </textSegment>
        </text>
        <text name="B_INV_DATE" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="6.62500" y="0.50000" width="0.43750"
           height="0.25000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Date :]]>
            </string>
          </textSegment>
        </text>
        <text name="B_3" minWidowLines="1">
          <textSettings spacing="single"/>
          <geometryInfo x="0.12500" y="0.18750" width="2.91663"
           height="1.00000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="enclosingObject"/>
          <textSegment>
            <font face="Book Antiqua" size="12"/>
            <string>
            <![CDATA[Mr. BIKRAMJIT SINGH]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Tel: +971-50-6457231, +968-99332924
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[Fax: +971-6-5312645
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="Book Antiqua" size="11"/>
            <string>
            <![CDATA[PO Box:31065, Sharjah, UAE.]]>
            </string>
          </textSegment>
        </text>
        <text name="B_4" minWidowLines="1">
          <textSettings justify="center" spacing="0"/>
          <geometryInfo x="3.25000" y="0.25000" width="1.68750"
           height="0.50000"/>
          <textSegment>
            <font face="Book Antiqua" size="24" bold="yes"/>
            <string>
            <![CDATA[INVOICE]]>
            </string>
          </textSegment>
        </text>
      </repeatingFrame>
    </body>
  </section>
  </layout>
  <programUnits>
    <function name="cf_inv_g_total" returnType="number">
      <textSource>
      <![CDATA[function CF_INV_G_Total return Number is
begin
  return :SumORDER_AMOUNTPerINV_NO+:SumADD_CHRPerINV_NO;
end;]]>
      </textSource>
    </function>
    <function name="cf_amt_wordformula" returnType="character">
      <textSource>
      <![CDATA[function CF_AMT_WORDFormula return Char is
 m_word varchar2(200);
begin
  select 'Amount in words ('||:BILL_CURRENCY ||'): '||initcap((to_char(to_date(:CF_INV_G_TOTAL,'j'), 'jsp')))||' Only' into m_word from DUAL;
  return m_word;
end;]]>
      </textSource>
    </function>
  </programUnits>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName=""/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 9i Reports Developer"/>
<title> Your Title </title>



</head>


<body>

<!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGINVNOGRPFR2">
<rw:foreach id="RGINVNO21" src="G_INV_NO">
<!-- Start GetGroupHeader/n --> <table>
 <caption>  <br>Invoice No <rw:field id="F_INV_NO" src="INV_NO" breakLevel="RGINVNO21" breakValue="&nbsp;"> F_INV_NO </rw:field><br>
Customer Id <rw:field id="F_CUSTOMER_ID" src="CUSTOMER_ID" breakLevel="RGINVNO21" breakValue="&nbsp;"> F_CUSTOMER_ID </rw:field><br>
Company Name <rw:field id="F_COMPANY_NAME" src="COMPANY_NAME" breakLevel="RGINVNO21" breakValue="&nbsp;"> F_COMPANY_NAME </rw:field><br>
Currency <rw:field id="F_BILL_CURRENCY" src="BILL_CURRENCY" breakLevel="RGINVNO21" breakValue="&nbsp;"> F_BILL_CURRENCY </rw:field><br>
Date <rw:field id="F_INV_DATE" src="INV_DATE" breakLevel="RGINVNO21" breakValue="&nbsp;"> F_INV_DATE </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <table summary="">
     <!-- Header -->
     <thead>
      <tr>
       <th <rw:id id="HBEQUIPMENT2" asArray="no"/>> Equipment </th>
       <th <rw:id id="HBLOADDATE2" asArray="no"/>> Load Date </th>
       <th <rw:id id="HBTRIPFROM2" asArray="no"/>> From </th>
       <th <rw:id id="HBTRIPTO2" asArray="no"/>> To </th>
       <th <rw:id id="HBDONO2" asArray="no"/>> Do No </th>
       <th <rw:id id="HBDODATE2" asArray="no"/>> Do Date </th>
       <th <rw:id id="HSHIPTO2" asArray="no"/>>  </th>
       <th <rw:id id="HBSHIPTONAME2" asArray="no"/>> Ship To </th>
       <th <rw:id id="HBORDERAMOUNT2" asArray="no"/>> Rate </th>
       <th <rw:id id="HBTARIFFCODE2" asArray="no"/>> Tariff </th>
       <th <rw:id id="HBADDCHR2" asArray="no"/>> Exit
 </th>
      </tr>
     </thead>
     <!-- Body -->
     <tbody>
      <rw:foreach id="RGINVDATE21" src="G_INV_DATE">
       <tr>
        <td <rw:headers id="HFEQUIPMENT2" src="HBEQUIPMENT2"/>><rw:field id="FEQUIPMENT2" src="EQUIPMENT" nullValue="&nbsp;"> F_EQUIPMENT </rw:field></td>
        <td <rw:headers id="HFLOADDATE2" src="HBLOADDATE2"/>><rw:field id="FLOADDATE2" src="LOAD_DATE" nullValue="&nbsp;"> F_LOAD_DATE </rw:field></td>
        <td <rw:headers id="HFTRIPFROM2" src="HBTRIPFROM2"/>><rw:field id="FTRIPFROM2" src="TRIP_FROM" nullValue="&nbsp;"> F_TRIP_FROM </rw:field></td>
        <td <rw:headers id="HFTRIPTO2" src="HBTRIPTO2"/>><rw:field id="FTRIPTO2" src="TRIP_TO" nullValue="&nbsp;"> F_TRIP_TO </rw:field></td>
        <td <rw:headers id="HFDONO2" src="HBDONO2"/>><rw:field id="FDONO2" src="DO_NO" nullValue="&nbsp;"> F_DO_NO </rw:field></td>
        <td <rw:headers id="HFDODATE2" src="HBDODATE2"/>><rw:field id="FDODATE2" src="DO_DATE" nullValue="&nbsp;"> F_DO_DATE </rw:field></td>
        <td <rw:headers id="HFSHIPTO2" src="HSHIPTO2"/>><rw:field id="FSHIPTO2" src="SHIP_TO" nullValue="&nbsp;"> F_SHIP_TO </rw:field></td>
        <td <rw:headers id="HFSHIPTONAME2" src="HBSHIPTONAME2"/>><rw:field id="FSHIPTONAME2" src="SHIP_TO_NAME" nullValue="&nbsp;"> F_SHIP_TO_NAME </rw:field></td>
        <td <rw:headers id="HFORDERAMOUNT2" src="HBORDERAMOUNT2"/>><rw:field id="FORDERAMOUNT2" src="ORDER_AMOUNT" nullValue="&nbsp;"> F_ORDER_AMOUNT </rw:field></td>
        <td <rw:headers id="HFTARIFFCODE2" src="HBTARIFFCODE2"/>><rw:field id="FTARIFFCODE2" src="TARIFF_CODE" nullValue="&nbsp;"> F_TARIFF_CODE </rw:field></td>
        <td <rw:headers id="HFADDCHR2" src="HBADDCHR2"/>><rw:field id="FADDCHR2" src="ADD_CHR" nullValue="&nbsp;"> F_ADD_CHR </rw:field></td>
       </tr>
      </rw:foreach>
     </tbody>
     <tr>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <td <rw:headers id="HFSumORDERAMOUNTPerINVNO2" src="HBORDERAMOUNT2"/>>Total: <rw:field id="FSumORDERAMOUNTPerINVNO2" src="SumORDER_AMOUNTPerINV_NO" nullValue="&nbsp;"> F_SumORDER_AMOUNTPerINV_NO </rw:field></td>
      <th> &nbsp; </th>
      <td <rw:headers id="HFSumADDCHRPerINVNO2" src="HBADDCHR2"/>>Total: <rw:field id="FSumADDCHRPerINVNO2" src="SumADD_CHRPerINV_NO" nullValue="&nbsp;"> F_SumADD_CHRPerINV_NO </rw:field></td>
     </tr>
     <tr>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table summary="">
 <tr>
  <th> Total: <rw:field id="F_SumORDER_AMOUNTPerReport" src="SumORDER_AMOUNTPerReport" nullValue="&nbsp;"> F_SumORDER_AMOUNTPerReport </rw:field></th>
  <th> Total: <rw:field id="F_SumADD_CHRPerReport" src="SumADD_CHRPerReport" nullValue="&nbsp;"> F_SumADD_CHRPerReport </rw:field></th>
 </tr>
</table>
</rw:dataArea> <!-- id="MGINVNOGRPFR2" -->
<!-- End of Data Area Generated by Reports Developer -->




</body>
</html>

<!--
</rw:report> 
-->
