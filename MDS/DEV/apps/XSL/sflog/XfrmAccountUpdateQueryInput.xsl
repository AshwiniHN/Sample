<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../pollSourceObj.wsdl"/>
      <rootElement name="SFLogObjectEvents" namespace="http://insecg-salesforce/sflogeventsobjects"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/SFEndpointProcess/SFEndpointProcess.wsdl"/>
      <rootElement name="process" namespace="http://SalesforceProject/SFEndpointProcess"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [MON FEB 29 16:46:04 CST 2016]. -->
?>
<xsl:stylesheet version="2.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/getSFLogEvents"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:ns3="http://insecg-salesforce/sflogeventsobjects"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:ns1="http://SFLogQueryStrings"
                xmlns:client="http://SalesforceProject/SFEndpointProcess"
                xmlns:ns5="http://paramsvar"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:ns4="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/SalesforceProject/ProcessSFLogEvents/pollSourceObj"
                xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/pollSourceObj"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:ns0="http://SFEndpoint/url"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 ns3 ns1 ns5 plt ns4 wsdl tns top xsd client plnk ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:template match="/">
    <xsl:variable name="separator">','</xsl:variable>
    <xsl:variable name="sq">'</xsl:variable>
    <client:process>
      <xsl:variable name="ids"
                    select="string-join(/ns3:SFLogObjectEvents/ns3:accountUpdateEvents/ns3:OBJECTID,$separator)"/>     
      <client:CallerID>
        <xsl:text disable-output-escaping="no">ProcessSFLogEvents</xsl:text>
      </client:CallerID>
       <client:Operation>
        <xsl:text disable-output-escaping="no">Query</xsl:text>
      </client:Operation>
      <client:queryString>
        <xsl:value-of select="concat('select AccountSource,Account_Currency__c,Account_DUNS__c,Account_Segment__c,Account_UCN__c,Alias__c,AnnualRevenue,BillingAddress,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingPostalCode,BillingCountryCode,BillingState,BillingStreet,Confidential__c,CreatedById,CreatedDate,CurrencyIsoCode,Customer_Account_Group__c,Description,Diversity_Option__c,Domestic_Ultimate_DUNS__c,Fax,Global_Parent__c,Global_Total_AV_Account_Nodes__c,Global_UCN__c,Global_Ultimate_DUNS__c,Id,Industry,IsDeleted,IsPartner,RecordType.DeveloperName,Jigsaw,JigsawCompanyId,Language__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LDR_Call_Flag__c,Legacy_Id__c,Legacy_MDM_ID__c,MasterRecordId,MSP_Flag__c,Name,NameLocal,NumberOfEmployees,OwnerId,ParentId,Parent_DUNS__c,Parent_UCN__c,Partnership_Status__c,Partner_Type__c,Phone,PhotoUrl,Price_Band_Agreement__c,Publicly_Traded_Company__c,RecordTypeId,Geo__c,Resell_Level__c,Rewards_Approval__c,SAP_Customer_Number__c,Site_Designation__c,ShippingAddress,ShippingCity,ShippingCountry,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,SicDesc,Source_System__c,SystemModstamp,Tax_ID_Number__c,Total_AV_Account_Nodes__c,Total_Global_Employee__c,
       Total_Site_Employee__c,Vertical_Market_Focus__c,Type,Website,Year_Established__c,Billing_Address_Street1__c,Billing_Address_Street2__c,Billing_Address_Street3__c,(select Email_Address__c,Type__c from Account_Emails__r) from Account where Id in(',$sq,$ids,$sq,')')"/>
      </client:queryString>
      <client:allOrNoneFlg>
        <xsl:text disable-output-escaping="no"></xsl:text>
      </client:allOrNoneFlg>
      <client:upsertFieldName>
        <xsl:text disable-output-escaping="no"></xsl:text>
      </client:upsertFieldName>
    </client:process>
  </xsl:template>
</xsl:stylesheet>
