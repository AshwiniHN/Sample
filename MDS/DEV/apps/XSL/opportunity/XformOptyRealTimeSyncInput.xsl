<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/SFEndpointProcess/apps/WSDL/generateEnterprise.wsdl"/>
      <rootElement name="queryResponse" namespace="urn:enterprise.soap.sforce.com"/>
    </source>
    <source type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/XREFInterface/XREFMultiLookUp.wsdl"/>
      <rootElement name="xrefinput" namespace="http://xmlns.oracle.com/XREFInterface"/>
      <param name="Invoke_XREFMultiLookUp_OutputVariable.XREFOutput" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/OptyWSEndPointSiebelProcess/ISG_SF_Opportunity_WS.wsdl"/>
      <rootElement name="ListOfIsg_Sf_Opportunity_Io" namespace="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [WED FEB 10 11:47:41 CST 2016]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id"
                xmlns:tns1="http://siebel.com/webservices"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://siebel.com/CustomUI"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:client="http://xmlns.oracle.com/LatestCode/XREFInterface/XREFMultiLookUp"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns1="http://schemas.oracle.com/bpel/extension"
                xmlns:ns2="http://xmlns.oracle.com/XREFInterface"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                exclude-result-prefixes="xsi xsl plnk soap tns wsdl client fns xsd ns1 ns2 ens xsdLocal1 xsdLocal2 tns1 soapenc ns0 xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="Invoke_XREFMultiLookUp_OutputVariable.XREFOutput"/>
  <xsl:template match="/">
    <xsl:variable name="accId" select="/tns:queryResponse/tns:result/tns:records/ens:AccountId"/>
    <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
      <xsdLocal1:Opportunity>
        <!--
         <xsl:choose>
       
         <xsl:when test="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId =''">
            <xsl:attribute name="Operation">
               <xsl:text disable-output-escaping="no">insert</xsl:text>
               </xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                <xsl:attribute name="Operation">
               <xsl:text disable-output-escaping="no">update</xsl:text>
               </xsl:attribute>
               </xsl:otherwise>
            </xsl:choose>
            -->
        <xsl:if test="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'ACCOUNT' and ns2:refHostRowId=$accId)]/ns2:hostRowId !=''">
          <xsdLocal1:AccountId>
            <xsl:value-of select='$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = "ACCOUNT" and ns2:refHostRowId=$accId)]/ns2:hostRowId'/>
          </xsdLocal1:AccountId>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Amount!=''">
          <xsdLocal1:BookingsDBValue>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Amount"/>
          </xsdLocal1:BookingsDBValue>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:USDValue!=''">
          <xsdLocal1:MFEForecastedOpportunityUSD>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:USDValue"/>
          </xsdLocal1:MFEForecastedOpportunityUSD>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="/tns:queryResponse/tns:result/tns:records/ens:RFP__c!='' and /tns:queryResponse/tns:result/tns:records/ens:RFP__c='Yes'">
            <xsdLocal1:RFP>
              <xsl:text disable-output-escaping="no">Y</xsl:text>
            </xsdLocal1:RFP>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:RFP>
              <xsl:text disable-output-escaping="no">N</xsl:text>
            </xsdLocal1:RFP>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="string-length(/tns:queryResponse/tns:result/tns:records/ens:Description) >  255">
            <xsdLocal1:Description>
              <xsl:value-of select="substring(/tns:queryResponse/tns:result/tns:records/ens:Description, 1, 255)"/>
            </xsdLocal1:Description>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test='/tns:queryResponse/tns:result/tns:records/ens:Description !=""'>
              <xsdLocal1:Description>
                <xsl:value-of select='/tns:queryResponse/tns:result/tns:records/ens:Description'/>
              </xsdLocal1:Description>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Id!=''">
          <xsdLocal1:ISGSFId>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Id"/>
          </xsdLocal1:ISGSFId>
        </xsl:if>
        <!--
            <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:LeadSource!=''">
               <xsdLocal1:OpportunitySource>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySource.dvm','Salesforce',/tns:queryResponse/tns:result/tns:records/ens:LeadSource,'Siebel','No Code Found')"/>
               </xsdLocal1:OpportunitySource>
            </xsl:if> -->
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Name!=''">
          <xsdLocal1:Name>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Name"/>
          </xsdLocal1:Name>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId !=''">
            <xsdLocal1:Id>
              <xsl:value-of select="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId"/>
            </xsdLocal1:Id>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Id>
              <xsl:text disable-output-escaping="no">1++1</xsl:text>
            </xsdLocal1:Id>
          </xsl:otherwise>
        </xsl:choose>
        <!--
            <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:CurrencyIsoCode!=''">
               <xsdLocal1:CurrencyCode>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/currencycode.dvm','Salesforce',/tns:queryResponse/tns:result/tns:records/ens:CurrencyIsoCode,'Siebel','No Code Found')"/>
                  
               </xsdLocal1:CurrencyCode>
            </xsl:if>  
             
            <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:StageName!=''">
               <xsdLocal1:SalesStage>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunitySTAGE.dvm','Salesforce',/tns:queryResponse/tns:result/tns:records/ens:StageName,'Siebel','No Code Found')"/>
               </xsdLocal1:SalesStage>
            </xsl:if> -->
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Total_Amount__c!=''">
          <xsdLocal1:MFEOpportunityTotal>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Total_Amount__c"/>
          </xsdLocal1:MFEOpportunityTotal>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Upside_Amount__c!=''">
          <xsdLocal1:MFEUpsideAmountLocal>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Upside_Amount__c"/>
          </xsdLocal1:MFEUpsideAmountLocal>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Type!=''">
          <xsdLocal1:NAIOpportunityType>
            <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/OpportunityType_SFToSBL.dvm','Salesforce',/tns:queryResponse/tns:result/tns:records/ens:Type,'Siebel','No Code Found')"/>
          </xsdLocal1:NAIOpportunityType>
        </xsl:if>
        <!-- <xsl:choose>
               <xsl:when test="/tns:queryResponse/tns:result/tns:records/ens:ForecastCategory!='' and /tns:queryResponse/tns:result/tns:records/ens:ForecastCategory='Commit'">
                  <xsdLocal1:PrimaryRevenueCommittedFlag>
                     <xsl:text disable-output-escaping="no">Y</xsl:text>
                  </xsdLocal1:PrimaryRevenueCommittedFlag>
               </xsl:when>
               <xsl:otherwise>
                  <xsdLocal1:PrimaryRevenueCommittedFlag>
                     <xsl:text disable-output-escaping="no">N</xsl:text>
                  </xsdLocal1:PrimaryRevenueCommittedFlag>
               </xsl:otherwise>
            </xsl:choose> -->
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:CloseDate!=''">
          <xsdLocal1:PrimaryRevenueCloseDate>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:CloseDate"/>
          </xsdLocal1:PrimaryRevenueCloseDate>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Promotion_Code__c!=''">
          <xsdLocal1:ISGSFPromoCode>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Promotion_Code__c"/>
          </xsdLocal1:ISGSFPromoCode>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Promotion_End_Date__c!=''">
          <xsdLocal1:ISGSFPromoExpiryDate>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Promotion_End_Date__c"/>
          </xsdLocal1:ISGSFPromoExpiryDate>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:CreatedDate!=''">
          <xsdLocal1:ISGSFCreated>
            <xsl:value-of select="concat(substring-before(/tns:queryResponse/tns:result/tns:records/ens:CreatedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFCreated>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:CreatedById!=''">
          <xsdLocal1:ISGSFCreatedBy>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:CreatedById"/>
          </xsdLocal1:ISGSFCreatedBy>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:LastModifiedDate!=''">
          <xsdLocal1:ISGSFUpdated>
            <xsl:value-of select="concat(substring-before(/tns:queryResponse/tns:result/tns:records/ens:LastModifiedDate,'.'),'z')"/>
          </xsdLocal1:ISGSFUpdated>
        </xsl:if>
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:LastModifiedById!=''">
          <xsdLocal1:ISGSFUpdatedBy>
            <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:LastModifiedById"/>
          </xsdLocal1:ISGSFUpdatedBy>
        </xsl:if>
        <xsdLocal1:ISGSFSyncStatus>
          <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
        </xsdLocal1:ISGSFSyncStatus>
        <!--    Related_Opportunity__c commented for INSALES-4140 <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:Related_Opportunity__c!=''">
               <xsdLocal1:ParentOpportunityName>
                  <xsl:value-of select="/tns:queryResponse/tns:result/tns:records/ens:Related_Opportunity__c"/>
               </xsdLocal1:ParentOpportunityName>
            </xsl:if> -->
        <!-- Line Item Mapping -->
        <xsl:if test="/tns:queryResponse/tns:result/tns:records/ens:OpportunityLineItems">
          <xsdLocal1:ListOfRevenue>
            <xsl:apply-templates select="/tns:queryResponse/tns:result/tns:records/ens:OpportunityLineItems/tns:records"/>
          </xsdLocal1:ListOfRevenue>
        </xsl:if>
        <!-- Line Item Mapping Ends-->

        <!--Partner Mapping Starting -->
        <xsl:if test ="/tns:queryResponse/tns:result/tns:records/ens:Opportunity_Partners__r">
          <xsdLocal1:ListOfOpportunity_Organization>
            <xsl:apply-templates select="/tns:queryResponse/tns:result/tns:records/ens:Opportunity_Partners__r/tns:records"/>
          </xsdLocal1:ListOfOpportunity_Organization>
        </xsl:if>
        <!--Partner Mapping End-->

      </xsdLocal1:Opportunity>
    </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
  </xsl:template>
  <xsl:template name="ConvertSFDateToSiebel">
    <xsl:param name="Date"/>
    <xsl:if test="string-length($Date) != 0">
      <xsl:variable name="Year" select="substring-before ($Date, '-')"/>
      <xsl:variable name="MonthTmp" select="substring-after($Date, '-')"/>
      <xsl:variable name="Month" select="substring-before ($MonthTmp, '-')"/>
      <xsl:variable name="DayTemp" select="substring-after($MonthTmp, '-')"/>
      <xsl:variable name="Day" select="substring-before ($DayTemp,'T')"/>
      <xsl:variable name="TimeTmp" select="substring-after ($DayTemp,'T')"/>
      <xsl:variable name="hrs" select="substring-before ($TimeTmp,':')"/>
      <xsl:variable name="MtsTmp" select="substring-after ($TimeTmp,':')"/>
      <xsl:variable name="Mins" select="substring-before($MtsTmp,':')"/>
      <xsl:variable name="scTmp" select="substring-after($MtsTmp,':')"/>
      <xsl:variable name="scs" select="substring-before($scTmp,'.')"/>
      <xsl:variable name="ModifiedDate"
                    select="concat ($Month , '/', $Day ,'/',$Year,' ',$hrs,':',$Mins,':',$scs)"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="/tns:queryResponse/tns:result/tns:records/ens:OpportunityLineItems/tns:records">
    <xsl:variable name="index" select="position()"/>
    <xsdLocal1:Revenue>
      <xsl:choose>
        <xsl:when test="string-length(ens:Legacy_Id__c)!='0'">

          <xsdLocal1:Id>
            <xsl:value-of select="ens:Legacy_Id__c"/>
          </xsdLocal1:Id>
        </xsl:when>
        <xsl:otherwise>
          <xsdLocal1:Id>
            <xsl:value-of select="concat('1','++',$index)"/>
          </xsdLocal1:Id>
        </xsl:otherwise>
      </xsl:choose>

      <!--xsl:if test="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId !=''">
            <xsdLocal1:ISGSFOptyId>
               <xsl:value-of select="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId"/>
            </xsdLocal1:ISGSFOptyId>
         </xsl:if-->
      <xsl:if test='ens:Program_Benefit__c != ""'>
        <xsdLocal1:ISGSFProgramBenefitRequest>
          <xsl:value-of select="ens:Program_Benefit__c"/>
        </xsdLocal1:ISGSFProgramBenefitRequest>
      </xsl:if>
      <xsl:if test="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId !=''">
        <xsdLocal1:OpportunityId>
          <xsl:value-of select="$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = 'OPPORTUNITY')]/ns2:hostRowId"/>
        </xsdLocal1:OpportunityId>
      </xsl:if>
      <xsl:if test='ens:Description != ""'>
        <xsdLocal1:Comments>
          <xsl:value-of select="ens:Description"/>
        </xsdLocal1:Comments>
      </xsl:if>
      <xsl:if test='ens:CurrencyIsoCode != ""'>
        <xsdLocal1:CurrencyCode3>
          <xsl:value-of select="ens:CurrencyIsoCode"/>
        </xsdLocal1:CurrencyCode3>
      </xsl:if>
      <xsl:if test='ens:Id != ""'>
        <xsdLocal1:ISGSFId>
          <xsl:value-of select="ens:Id"/>
        </xsdLocal1:ISGSFId>
      </xsl:if>
      <xsl:if test='ens:ProductCode != ""'>
        <xsl:choose>
          <xsl:when test="starts-with(ens:ProductCode,'No SKU Selected')">
            <xsdLocal1:Product/>
          </xsl:when>
          <xsl:otherwise>
            <xsdLocal1:Product>
              <xsl:value-of select="ens:ProductCode"/>
            </xsdLocal1:Product>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>

      <xsl:if test='ens:Product_Type__c != ""'>
        <xsdLocal1:NAIProductType>
          <xsl:value-of select="ens:Product_Type__c"/>
        </xsdLocal1:NAIProductType>
      </xsl:if>
      <xsl:if test='ens:Program_Type__c != ""'>
        <xsdLocal1:MFEOpportunityType>
          <xsl:value-of select="ens:Program_Type__c"/>
        </xsdLocal1:MFEOpportunityType>
      </xsl:if>

      <xsl:if test='ens:Quantity != ""'>
        <xsdLocal1:Quantity>
          <xsl:value-of select="ens:Quantity"/>
        </xsdLocal1:Quantity>
      </xsl:if>
      <xsl:if test='ens:UnitPrice != ""'>
        <xsdLocal1:Price>
          <xsl:value-of select="ens:UnitPrice"/>
        </xsdLocal1:Price>
      </xsl:if>
      <xsl:if test='ens:TotalPrice != ""'>
        <xsdLocal1:Revenue2>
          <xsl:value-of select="ens:TotalPrice"/>
        </xsdLocal1:Revenue2>
      </xsl:if>
    </xsdLocal1:Revenue>
  </xsl:template>
  <xsl:template match="/tns:queryResponse/tns:result/tns:records/ens:Opportunity_Partners__r/tns:records">
    <xsl:variable name="sfpartnerAccid" select="ens:Partner_Account_ID__c"/>
    <xsl:choose>
      <xsl:when test='$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = "ACCOUNT" and ns2:refHostRowId =$sfpartnerAccid)]/ns2:hostRowId !=""'>
        <xsdLocal1:Opportunity_Organization>
          <xsl:if test="ens:Primary__c">
            <xsl:choose>
              <xsl:when test="ens:Primary__c = 'true'">
                <xsl:attribute name="IsPrimaryMVG">
                  <xsl:value-of select="'Y'"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="IsPrimaryMVG">
                  <xsl:value-of select="'N'"/>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test='$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = "ACCOUNT" and ns2:refHostRowId =$sfpartnerAccid)]/ns2:hostRowId'>
            <xsdLocal1:Id>
              <xsl:value-of select='$Invoke_XREFMultiLookUp_OutputVariable.XREFOutput/ns2:xrefinput/ns2:operation[(ns2:recType = "ACCOUNT"  and ns2:refHostRowId =$sfpartnerAccid)]/ns2:hostRowId'/>
            </xsdLocal1:Id>
          </xsl:if>
          <xsl:if test="ens:Disti_Locked__c">
            <xsl:choose>
              <xsl:when test="ens:Disti_Locked__c = 'true'">
                <xsdLocal1:ISGSFPartnerDistiLockedFlag>
                  <xsl:value-of select="'Y'"/>
                </xsdLocal1:ISGSFPartnerDistiLockedFlag>
              </xsl:when>
              <xsl:otherwise>
                <xsdLocal1:ISGSFPartnerDistiLockedFlag>
                  <xsl:value-of select="'N'"/>
                </xsdLocal1:ISGSFPartnerDistiLockedFlag>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="ens:Program_Benefit__c">
            <xsdLocal1:ISGSFPartnerPBR>
              <xsl:value-of select="ens:Program_Benefit__c"/>
            </xsdLocal1:ISGSFPartnerPBR>
          </xsl:if>
          <xsl:if test="ens:Partner_Expiration_Date__c">
            <xsdLocal1:ISGSFOptyDealExpDate>
              <xsl:call-template name="ConvertSFDateToSiebelDate">
                <xsl:with-param name="Date"
                                select="ens:Partner_Expiration_Date__c"/>
              </xsl:call-template>
            </xsdLocal1:ISGSFOptyDealExpDate>
          </xsl:if>
          <xsl:if test="ens:Approved_Product_Types__c">
            <xsdLocal1:ISGSFOptyDealApprProducts>
              <xsl:value-of select="ens:Approved_Product_Types__c"/>
            </xsdLocal1:ISGSFOptyDealApprProducts>
          </xsl:if>

          <xsl:if test="ens:PBR_Active__c">
            <xsl:choose>
              <xsl:when test="ens:PBR_Active__c = 'true'">
                <xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                  <xsl:value-of select="'Y'"/>
                </xsdLocal1:ISGSFPartnerPBRApprovedFlag>
              </xsl:when>
              <xsl:otherwise>
                <xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                  <xsl:value-of select="'N'"/>
                </xsdLocal1:ISGSFPartnerPBRApprovedFlag>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsdLocal1:Opportunity_Organization>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="ConvertSFDateToSiebelDate">
    <xsl:param name="Date"/>
    <xsl:if test="string-length($Date) != 0">
      <xsl:variable name="Year" select="substring-before ($Date, '-')"/>
      <xsl:variable name="MonthTmp" select="substring-after($Date, '-')"/>
      <xsl:variable name="Month" select="substring-before ($MonthTmp, '-')"/>
      <xsl:variable name="Day" select="substring-after ($MonthTmp,'-')"/>
      <xsl:variable name="ModifiedDate"
                    select="concat ($Month , '/', $Day ,'/',$Year)"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
