<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/SOA-INFRA/WSDL/UpsertQuoteSFProvider.wsdl"/>
      <rootElement name="Modified_Quotes" namespace=""/>
    </source>
    <source type="WSDL">
      <schema location="oramds:/apps/SOA-INFRA/WSDL/UpsertQuoteSFProvider.wsdl"/>
      <rootElement name="Params" namespace=""/>
      <param name="VarParams" />
    </source>
    <source type="WSDL">
      <schema location="oramds:/apps/SOA-INFRA/WSDL/XREFMultiLookUp.wsdl"/>
      <rootElement name="xrefinput" namespace="http://xmlns.oracle.com/XREFInterface"/>
      <param name="Invoke_XREFMultiLookup_OutputVariable.XREFOutput" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/WSDL/generateEnterprise.wsdl"/>
      <rootElement name="create" namespace="urn:enterprise.soap.sforce.com"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [TUE JAN 19 11:23:02 CST 2016]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:client="http://xmlns.oracle.com/QuoteIntegration/QuoteIntegrationFromBrokerToSF/UpsertQuoteSFProvider"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns0="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns1="http://schemas.oracle.com/bpel/extension"
                xmlns:ns2="http://xmlns.oracle.com/XREFInterface"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl plnk client wsdl ns0 xsd ns1 ns2 soap tns fns ens xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="VarParams"/>
  <xsl:param name="Invoke_XREFMultiLookup_OutputVariable.XREFOutput"/>
  <xsl:template match="/">
    <tns:create>
      <xsl:variable name="CurrencyCode"
                    select="/Modified_Quotes/Quote_Header/Currency_Code"/>
      <xsl:variable name="QuoteID"
                    select="/Modified_Quotes/Quote_Header/Quote_ID"/>
      <xsl:for-each select="/Modified_Quotes/Quote_Header/LineItems/LineItem">
        <xsl:variable name="index" select="position()"/>
        <xsl:variable name="pricebookID"
                      select="concat(Prod,'++',$CurrencyCode)"/>
        <xsl:choose>
          <xsl:when test="(($index >= $VarParams/Params/Min) and ($index &lt;= $VarParams/Params/Max)) and ($Invoke_XREFMultiLookup_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:refHostRowId=$pricebookID)]/ns2:hostRowId !='')  ">
            <tns:sObjects>
              <xsl:attribute name="xsi:type">
                <xsl:text disable-output-escaping="no">ens:QuoteLineItem</xsl:text>
              </xsl:attribute>
              <!-- Error 
            
             {urn:enterprise.soap.sforce.com}InvalidFieldFault. Client received SOAP Fault from server : INVALID_FIELD: No such column 'Legacy_Id__c' on entity 'QuoteLineItem'
             . If you are attempting to use a custom field, be sure to append the '__c' after the custom field name. Please reference your WSDL or the describe call for the appropriate names -->
              <xsl:if test="Row_Id">
                <ens:Legacy_Id__c>
                  <xsl:value-of select="Row_Id"/>
                </ens:Legacy_Id__c>
              </xsl:if>
              <xsl:if test="$Invoke_XREFMultiLookup_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:refHostRowId=$pricebookID)]/ns2:hostRowId !=''">
                <ens:PricebookEntryId>
                  <xsl:value-of select="$Invoke_XREFMultiLookup_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:refHostRowId=$pricebookID) and (ns2:recType='PRODUCTPRICEB')]/ns2:hostRowId"/>
                </ens:PricebookEntryId>
              </xsl:if>
              <xsl:if test="Quote_Id">
                <ens:QuoteId>
                  <xsl:value-of select="$QuoteID"/>
                </ens:QuoteId>
              </xsl:if>
              <!--  <xsl:choose>
              <xsl:when test="NAI_Hardware_Quantity ='0' or string-length(NAI_Hardware_Quantity)='0'">
                <ens:Quantity>
                  <xsl:value-of select="Quantity"/>
                </ens:Quantity>
                </xsl:when>
                <xsl:otherwise>
                <ens:Quantity>
                  <xsl:value-of select="NAI_Hardware_Quantity"/>
                </ens:Quantity>
                </xsl:otherwise>
              </xsl:choose> -->
              <xsl:if test="Actual_Quantity">
                <ens:Quantity>
                  <xsl:value-of select="Actual_Quantity"/>
                </ens:Quantity>
              </xsl:if>
              <xsl:if test="NAI_PRM_Grant_Number">
                <ens:Grant_Number__c>
                  <xsl:value-of select="NAI_PRM_Grant_Number"/>
                </ens:Grant_Number__c>
              </xsl:if>
              <xsl:if test="Program_Benefit_Request">
                <ens:Program_Benefit_Request__c>
                  <xsl:value-of select="Program_Benefit_Request"/>
                </ens:Program_Benefit_Request__c>
              </xsl:if>
              <xsl:if test="Requested_Delivery_Date">
                <ens:Start_Date__c>
                  <xsl:value-of select="Requested_Delivery_Date"/>
                </ens:Start_Date__c>
              </xsl:if>
              <xsl:if test="end_date">
                <ens:End_Date__c>
                  <xsl:value-of select="end_date"/>
                </ens:End_Date__c>
              </xsl:if>
              <xsl:if test="NAI_Item_Terms_Length">
                <ens:Term_Length__c>
                  <xsl:value-of select="NAI_Item_Terms_Length"/>
                </ens:Term_Length__c>
              </xsl:if>
              <xsl:if test="End_Of_Support_Date">
                <ens:EOL_Date__c>
                  <xsl:value-of select="End_Of_Support_Date"/>
                </ens:EOL_Date__c>
              </xsl:if>
              <xsl:if test="Latest_Serial_Number">
                <ens:Latest_Serial__c>
                  <xsl:value-of select="Latest_Serial_Number"/>
                </ens:Latest_Serial__c>
              </xsl:if>
              <xsl:if test="Original_Serial_Number">
                <ens:Original_Serial__c>
                  <xsl:value-of select="Original_Serial_Number"/>
                </ens:Original_Serial__c>
              </xsl:if>
              <xsl:if test="Quantity">
                <ens:Qty_Software_Support__c>
                  <xsl:value-of select="Quantity"/>
                </ens:Qty_Software_Support__c>
              </xsl:if>
              <xsl:if test="NAI_Hardware_Quantity">
                <ens:Quantity_Hardware__c>
                  <xsl:value-of select="NAI_Hardware_Quantity"/>
                </ens:Quantity_Hardware__c>
              </xsl:if>
              <!--
              QuoteLineItem: bad field names on insert/update call: ProductCode
              xsl:if test="Prod">
                <ens:ProductCode>
                  <xsl:value-of select="Prod"/>
                </ens:ProductCode>
              </xsl:if>
              <xsl:if test="Prod_Desc">
                <ens:Description>
                  <xsl:value-of select="Prod_Desc"/>
                </ens:Description>
              </xsl:if-->
              <!--
              Unable to create/update fields: Product_Type__c. 
              Please check the security settings of this field and verify that it is read/write for your profile or permission set.-->
              <!--xsl:if test="Product_Type">
                <ens:Product_Type__c>
                  <xsl:value-of select="Product_Type"/>
                </ens:Product_Type__c>
              </xsl:if-->
              <xsl:if test="Material_Category">
                <ens:Material_Category__c>
                  <xsl:value-of select="Material_Category"/>
                </ens:Material_Category__c>
              </xsl:if>
              <xsl:if test="Bundled_Product_Flag">
                <xsl:choose>
                  <xsl:when test="Bundled_Product_Flag='Y'">
                    <ens:Bundled_SKU__c>
                      <xsl:text disable-output-escaping="no">true</xsl:text>
                    </ens:Bundled_SKU__c>
                  </xsl:when>
                  <xsl:when test="Bundled_Product_Flag='N'">
                    <ens:Bundled_SKU__c>
                      <xsl:text disable-output-escaping="no">false</xsl:text>
                    </ens:Bundled_SKU__c>
                  </xsl:when>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="List_Price_Associate">
                <ens:Unit_End_User_MSRP__c>
                  <xsl:value-of select="List_Price_Associate"/>
                </ens:Unit_End_User_MSRP__c>
              </xsl:if>
              <xsl:if test="NAI_Program_Type">
                <ens:Program_Type__c>
                  <xsl:value-of select="NAI_Program_Type"/>
                </ens:Program_Type__c>
              </xsl:if>
              <xsl:if test="End_User_Price">
                <ens:Unit_End_User_Price__c>
                  <xsl:value-of select="End_User_Price"/>
                </ens:Unit_End_User_Price__c>
              </xsl:if>
              <xsl:if test="Ttl_End_User_Pric">
                <ens:Total_End_User_Price__c>
                  <xsl:value-of select="Ttl_End_User_Pric"/>
                </ens:Total_End_User_Price__c>
              </xsl:if>
              <xsl:if test="Std_Dist_Cost_Elite">
                <ens:Unit_Standard_Disti_Cost_Platinum__c>
                  <xsl:value-of select="Std_Dist_Cost_Elite"/>
                </ens:Unit_Standard_Disti_Cost_Platinum__c>
              </xsl:if>
              <xsl:if test="Std_Dist_Cost_Premier">
                <ens:Unit_Standard_Disti_Cost_Gold__c>
                  <xsl:value-of select="Std_Dist_Cost_Premier"/>
                </ens:Unit_Standard_Disti_Cost_Gold__c>
              </xsl:if>
              <xsl:if test="Std_Dist_Cost_Assoc">
                <ens:Unit_Standard_Disti_Cost_Silver__c>
                  <xsl:value-of select="Std_Dist_Cost_Assoc"/>
                </ens:Unit_Standard_Disti_Cost_Silver__c>
              </xsl:if>
              <xsl:if test="Ttl_Final_Dist_Cost_Elite">
                <ens:Total_Final_Disti_Cost_Platinum__c>
                  <xsl:value-of select="Ttl_Final_Dist_Cost_Elite"/>
                </ens:Total_Final_Disti_Cost_Platinum__c>
              </xsl:if>
              <xsl:if test="Ttl_Final_Dist_Cost_Premier">
                <ens:Total_Final_Disti_Cost_Gold__c>
                  <xsl:value-of select="Ttl_Final_Dist_Cost_Premier"/>
                </ens:Total_Final_Disti_Cost_Gold__c>
              </xsl:if>
              <xsl:if test="Ttl_Final_Dist_Cost_Assoc">
                <ens:Total_Final_Disti_Cost_Silver__c>
                  <xsl:value-of select="Ttl_Final_Dist_Cost_Assoc"/>
                </ens:Total_Final_Disti_Cost_Silver__c>
              </xsl:if>
              <xsl:if test="UnitPrice">
                <ens:UnitPrice>
                  <xsl:value-of select="UnitPrice"/>
                </ens:UnitPrice>
              </xsl:if>
              <xsl:if test="SiebelRevenueID">
                <ens:OpportunityLineItem_Legacy_Id__c>
                  <xsl:value-of select="SiebelRevenueID"/>
                </ens:OpportunityLineItem_Legacy_Id__c>
              </xsl:if>
              <xsl:if test="SFRevenueID">
                <ens:OpportunityLineItemId__C>
                  <xsl:value-of select="SFRevenueID"/>
                </ens:OpportunityLineItemId__C>
              </xsl:if>

            </tns:sObjects>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </tns:create>
  </xsl:template>
</xsl:stylesheet>
