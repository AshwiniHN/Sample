<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="oramds:/apps/WSDL/generateEnterprise.wsdl"/>
      <rootElement name="retrieveResponse" namespace="urn:enterprise.soap.sforce.com"/>
    </source>
    <source type="WSDL">
      <schema location="../UpsertContactSiebelProvABCSImpl.wsdl"/>
      <rootElement name="ids" namespace="http://SalesforceIntegration/contact_SFIds"/>
      <param name="varIds" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/ContactWSEndPointSiebel/ISG_SF_Contact_Service.wsdl"/>
      <rootElement name="ListOfIsgsfcontactio" namespace="http://www.siebel.com/xml/ISGSFContactIO/Data"/>
    </target>
  </mapTargets>
  <substitutions>
      <sourceSubst substPath="/tns:retrieveResponse/tns:result" substType="ens:Contact"/>
  </substitutions>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [MON DEC 14 23:32:31 MST 2015]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns2="http://SalesforceIntegration/contact_SFIds"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:tns1="http://siebel.com/webservices"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:tns="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:client="http://xmlns.oracle.com/ContactDev/SFToSiebel_Contact/UpsertContactSiebelProvABCSImpl"
                xmlns:ns0="http://siebel.com/CustomUI"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISGSFContactIO/Id"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISGSFContactIO/Query"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:fns="urn:fault.enterprise.soap.sforce.com"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISGSFContactIO/Data"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 soap tns wsdl client plnk fns xsd ens tns1 soapenc ns0 xsdLocal2 xsdLocal3 xsdLocal1 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="varIds"/>
   <xsl:template match="/">
      <xsdLocal1:ListOfIsgsfcontactio>
         <xsdLocal1:Contact>
            <xsl:choose>
               <xsl:when test='$varIds/ns2:ids/ns2:OPIdInSFPayload != ""'>
                  <xsdLocal1:Id>
                     <xsl:value-of select="$varIds/ns2:ids/ns2:OPIdInSFPayload"/>
                  </xsdLocal1:Id>
               </xsl:when>
               <xsl:otherwise>
                  <xsdLocal1:Id>
                     <xsl:text disable-output-escaping="no">'1++1'</xsl:text>
                  </xsdLocal1:Id>
               </xsl:otherwise>
            </xsl:choose>
            <xsdLocal1:Created>
               <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_Created__c"/>
            </xsdLocal1:Created>
            <xsl:if test="$varIds/ns2:ids/ns2:OPAccountId">
               <xsdLocal1:AccountId>
                  <xsl:value-of select="$varIds/ns2:ids/ns2:OPAccountId"/>
               </xsdLocal1:AccountId>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:MobilePhone">
               <xsdLocal1:CellularPhone>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:MobilePhone"/>
               </xsdLocal1:CellularPhone>
            </xsl:if>
           <!-- <xsl:if test="/tns:retrieveResponse/tns:result/ens:Description">
               <xsdLocal1:Comment>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Description"/>
               </xsdLocal1:Comment>
            </xsl:if> -->
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_Created_By__c">
               <xsdLocal1:CreatedByName>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_Created_By__c"/>
               </xsdLocal1:CreatedByName>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Email">
               <xsdLocal1:EmailAddress>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Email"/>
               </xsdLocal1:EmailAddress>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Fax">
               <xsdLocal1:FaxPhone>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Fax"/>
               </xsdLocal1:FaxPhone>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:FirstName">
               <xsdLocal1:FirstName>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:FirstName"/>
               </xsdLocal1:FirstName>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Contact_SAP_ID__c">
               <xsdLocal1:IntegrationId>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Contact_SAP_ID__c"/>
               </xsdLocal1:IntegrationId>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Title">
               <xsdLocal1:JobTitle>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Title"/>
               </xsdLocal1:JobTitle>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastName">
               <xsdLocal1:LastName>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:LastName"/>
               </xsdLocal1:LastName>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Gender__c">
               <xsdLocal1:MF>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Gender__c"/>
               </xsdLocal1:MF>
            </xsl:if>
            <!--xsl:if test="/tns:retrieveResponse/tns:result/ens:Salutation">
               <xsdLocal1:MM>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Salutation"/>
               </xsdLocal1:MM>
            </xsl:if-->
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Partner_Contact_Access_Status__c">
               <xsl:choose>
                  <xsl:when test="/tns:retrieveResponse/tns:result/ens:Partner_Contact_Access_Status__c='Inactive'">
                     <xsdLocal1:NAIPartnerContactStatus>
                        <xsl:text disable-output-escaping="no">Deleted</xsl:text>
                     </xsdLocal1:NAIPartnerContactStatus>
                  </xsl:when>
                  <xsl:when test="/tns:retrieveResponse/tns:result/ens:Partner_Contact_Access_Status__c='Active'">
                     <xsdLocal1:NAIPartnerContactStatus>
                        <xsl:text disable-output-escaping="no">Active</xsl:text>
                     </xsdLocal1:NAIPartnerContactStatus>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:NAIPartnerContactStatus>
                        <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Partner_Contact_Access_Status__c"/>
                     </xsdLocal1:NAIPartnerContactStatus>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:DoNotCall">
               <xsl:choose>
                  <xsl:when test="/tns:retrieveResponse/tns:result/ens:DoNotCall='true'">
                     <xsdLocal1:EloquaCallPermission>
                        <xsl:text disable-output-escaping="no">Y</xsl:text>
                     </xsdLocal1:EloquaCallPermission>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:EloquaCallPermission>
                        <xsl:text disable-output-escaping="no">N</xsl:text>
                     </xsdLocal1:EloquaCallPermission>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Eloqua_Contact_Id__c">
               <xsdLocal1:MFEEloquaContactId>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Eloqua_Contact_Id__c"/>
               </xsdLocal1:MFEEloquaContactId>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:HasOptedOutOfEmail">
               <xsl:choose>
                  <xsl:when test="/tns:retrieveResponse/tns:result/ens:HasOptedOutOfEmail='true'">
                     <xsdLocal1:EloquaEmailPermission>
                        <xsl:text disable-output-escaping="no">Y</xsl:text>
                     </xsdLocal1:EloquaEmailPermission>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:EloquaEmailPermission>
                        <xsl:text disable-output-escaping="no">N</xsl:text>
                     </xsdLocal1:EloquaEmailPermission>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Do_Not_Mail__c">
               <xsl:choose>
                  <xsl:when test="/tns:retrieveResponse/tns:result/ens:Do_Not_Mail__c='true'">
                     <xsdLocal1:EloquaMailPermission>
                        <xsl:text disable-output-escaping="no">Y</xsl:text>
                     </xsdLocal1:EloquaMailPermission>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:EloquaMailPermission>
                        <xsl:text disable-output-escaping="no">N</xsl:text>
                     </xsdLocal1:EloquaMailPermission>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
            <xsl:choose>
               <xsl:when test='dvm:lookupValue("oramds:/apps/dvm/ContactTypeSBLToSF.dvm","SFValue",/tns:retrieveResponse/tns:result/ens:RecordTypeId,"ContactType","End Customer") = "Partner"'>
                  <xsdLocal1:PartnershipContactFlag>
                     <xsl:text disable-output-escaping="no">Y</xsl:text>
                  </xsdLocal1:PartnershipContactFlag>
               </xsl:when>
               <xsl:otherwise>
                  <xsdLocal1:PartnershipContactFlag>
                     <xsl:text disable-output-escaping="no">N</xsl:text>
                  </xsdLocal1:PartnershipContactFlag>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Preferred_Contact_Method__c">
               <xsdLocal1:PreferredCommunications>
                  <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/PreferredCommunications.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Preferred_Contact_Method__c,'Siebel','No Code Found')"/>
               </xsdLocal1:PreferredCommunications>
            </xsl:if>
            <xsl:choose>
               <xsl:when test='dvm:lookupValue("oramds:/apps/dvm/ContactTypeSBLToSF.dvm","SFValue",/tns:retrieveResponse/tns:result/ens:RecordTypeId,"ContactType","End Customer") = "END CUSTOMER"'>
                  <xsl:if test="/tns:retrieveResponse/tns:result/ens:Preferred_Language__c!=''">
                     <xsdLocal1:PreferredLanguageCode>
                        <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/PreferredLangCodeEndCustomerContact.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Preferred_Language__c,'Siebel','ENU')"/>
                     </xsdLocal1:PreferredLanguageCode>
                  </xsl:if>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:if test="/tns:retrieveResponse/tns:result/ens:Preferred_Language__c!=''">
                     <xsdLocal1:PreferredLanguageCode>
                        <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/PreferredLangCodeEndCustomerContact.dvm','Salesforce',/tns:retrieveResponse/tns:result/ens:Preferred_Language__c,'Siebel','ENU')"/>
                     </xsdLocal1:PreferredLanguageCode>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Phone">
               <xsdLocal1:WorkPhone>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Phone"/>
               </xsdLocal1:WorkPhone>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Id">
               <xsdLocal1:ISGSFId>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Id"/>
               </xsdLocal1:ISGSFId>
            </xsl:if>
            <xsdLocal1:ISGSFSyncStatus>
               <xsl:text disable-output-escaping="no">SYNC_ON</xsl:text>
            </xsdLocal1:ISGSFSyncStatus>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedDate!=''">
               <xsdLocal1:ISGSFCreated>
                  <xsl:value-of select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:CreatedDate,'.'),'z')"/>
               </xsdLocal1:ISGSFCreated>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:CreatedById!=''">
               <xsdLocal1:ISGSFCreatedBy>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:CreatedById"/>
               </xsdLocal1:ISGSFCreatedBy>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedDate!=''">
               <xsdLocal1:ISGSFUpdated>
                  <xsl:value-of select="concat(substring-before(/tns:retrieveResponse/tns:result/ens:LastModifiedDate,'.'),'z')"/>
               </xsdLocal1:ISGSFUpdated>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:LastModifiedById!=''">
               <xsdLocal1:ISGSFUpdatedBy>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:LastModifiedById"/>
               </xsdLocal1:ISGSFUpdatedBy>
            </xsl:if>
            <xsdLocal1:ListOfPersonalAddress>               
                  <xsl:choose>
                     <xsl:when test='dvm:lookupValue("oramds:/apps/dvm/ContactTypeSBLToSF.dvm","SFValue",/tns:retrieveResponse/tns:result/ens:RecordTypeId,"ContactType","End Customer") = "END CUSTOMER"   and  /tns:retrieveResponse/tns:result/ens:OtherCity !="" and  /tns:retrieveResponse/tns:result/ens:OtherCountryCode !=""  and /tns:retrieveResponse/tns:result/ens:OtherPostalCode !=""  and /tns:retrieveResponse/tns:result/ens:Other_Address_Street1__c !=""'>					 
					 <xsdLocal1:PersonalAddress>
                  <xsl:choose>
                     <xsl:when test='$varIds/ns2:ids/ns2:CutAddressIdInXREF != ""'>
                        <xsdLocal1:Id>
                           <xsl:value-of select="$varIds/ns2:ids/ns2:CutAddressIdInXREF"/>
                        </xsdLocal1:Id>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsdLocal1:Id>
                           <xsl:text disable-output-escaping="no">'1++1'</xsl:text>
                        </xsdLocal1:Id>
                     </xsl:otherwise >
                  </xsl:choose>					 					 
					    <xsl:if test="/tns:retrieveResponse/tns:result/ens:OtherCity!=''">
                        <xsdLocal1:City>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:OtherCity"/>
                        </xsdLocal1:City>
						 </xsl:if>
						 <xsl:if test="/tns:retrieveResponse/tns:result/ens:OtherCountryCode!=''">
                        <xsdLocal1:Country>
                           <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:OtherCountryCode,'SBL','NoCode')"/>
                        </xsdLocal1:Country>
						</xsl:if>
						 <xsl:if test="/tns:retrieveResponse/tns:result/ens:OtherPostalCode!=''">
                        <xsdLocal1:PostalCode>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:OtherPostalCode"/>
                        </xsdLocal1:PostalCode>
						</xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:OtherState">
						<xsl:choose>
						<xsl:when test="string-length(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:OtherState,'-',/tns:retrieveResponse/tns:result/ens:OtherCountryCode),'SBL','NoCode')) &lt;= 10">
                           <xsdLocal1:State>
                              <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:OtherState,'-',/tns:retrieveResponse/tns:result/ens:OtherCountryCode),'SBL','NoCode')"/>
                           </xsdLocal1:State>
						   </xsl:when>
						   <xsl:otherwise>
						   </xsl:otherwise>
						   </xsl:choose>
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Other_Address_Street1__c">
                        <xsdLocal1:StreetAddress>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Other_Address_Street1__c"/>
                        </xsdLocal1:StreetAddress>
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Other_Address_Street2__c">
                        <xsdLocal1:StreetAddress2>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Other_Address_Street2__c"/>
                        </xsdLocal1:StreetAddress2>
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Other_Address_Street3__c">
                        <xsdLocal1:StreetAddress3>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Other_Address_Street3__c"/>
                        </xsdLocal1:StreetAddress3>
                        </xsl:if>  
					  </xsdLocal1:PersonalAddress>
					 </xsl:when>
                     <xsl:otherwise>
					 <xsl:if test=" /tns:retrieveResponse/tns:result/ens:MailingCity!='' and  /tns:retrieveResponse/tns:result/ens:MailingCountryCode!=''
					  and /tns:retrieveResponse/tns:result/ens:MailingPostalCode!='' and 
                      /tns:retrieveResponse/tns:result/ens:Mailing_Address_Street1__c !=''  and dvm:lookupValue('oramds:/apps/dvm/ContactTypeSBLToSF.dvm','SFValue',/tns:retrieveResponse/tns:result/ens:RecordTypeId,'ContactType','End Customer') != 'END CUSTOMER'   ">					 
					 <xsdLocal1:PersonalAddress>					 
                  <xsl:choose>
                     <xsl:when test='$varIds/ns2:ids/ns2:CutAddressIdInXREF != ""'>
                        <xsdLocal1:Id>
                           <xsl:value-of select="$varIds/ns2:ids/ns2:CutAddressIdInXREF"/>
                        </xsdLocal1:Id>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsdLocal1:Id>
                           <xsl:text disable-output-escaping="no">'1++1'</xsl:text>
                        </xsdLocal1:Id>
                     </xsl:otherwise>
                  </xsl:choose>					 
                         <xsl:if test="/tns:retrieveResponse/tns:result/ens:MailingCity!=''">
                        <xsdLocal1:City>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:MailingCity"/>
                        </xsdLocal1:City>
						</xsl:if>
						  <xsl:if test="/tns:retrieveResponse/tns:result/ens:MailingCountryCode!=''">
                        <xsdLocal1:Country>
                           <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/Country_SFToSBL.dvm','SALESFORCE',/tns:retrieveResponse/tns:result/ens:MailingCountryCode,'SBL','NoCode')"/>
                        </xsdLocal1:Country>
								</xsl:if>
							 <xsl:if test="/tns:retrieveResponse/tns:result/ens:MailingPostalCode!=''">	
                        <xsdLocal1:PostalCode>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:MailingPostalCode"/>
                        </xsdLocal1:PostalCode>
						</xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:MailingState">
						<xsl:choose>
						<xsl:when test="string-length(dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:MailingState,'-',/tns:retrieveResponse/tns:result/ens:MailingCountryCode),'SBL','NoCode')) &lt;= 10">
                           <xsdLocal1:State>
                              <xsl:value-of select="dvm:lookupValue('oramds:/apps/dvm/State_SFToSBL.dvm','SALESFORCE',concat(/tns:retrieveResponse/tns:result/ens:MailingState,'-',/tns:retrieveResponse/tns:result/ens:MailingCountryCode),'SBL','NoCode')"/>
                           </xsdLocal1:State>
						   </xsl:when>
						   <xsl:otherwise>
						   </xsl:otherwise>
						   </xsl:choose>						   
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street1__c">
                        <xsdLocal1:StreetAddress>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street1__c"/>
                        </xsdLocal1:StreetAddress>
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street2__c">
                        <xsdLocal1:StreetAddress2>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street2__c"/>
                        </xsdLocal1:StreetAddress2>
                        </xsl:if>
                        <xsl:if test="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street3__c">						
                        <xsdLocal1:StreetAddress3>
                           <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Mailing_Address_Street3__c"/>
                        </xsdLocal1:StreetAddress3>
                        </xsl:if>
						 </xsdLocal1:PersonalAddress>
						 </xsl:if>
                     </xsl:otherwise>
                  </xsl:choose>              
            </xsdLocal1:ListOfPersonalAddress>	
            <xsl:choose>
               <xsl:when test="/tns:retrieveResponse/tns:result/ens:Source_System__c!='' and /tns:retrieveResponse/tns:result/ens:Source_System__c='User Created'">
                  <xsdLocal1:NAISiintSourceSystem>
                     <xsl:text disable-output-escaping="no">Salesforce</xsl:text>
                  </xsdLocal1:NAISiintSourceSystem>
               </xsl:when>
               <xsl:otherwise>
                  <xsdLocal1:NAISiintSourceSystem>
                     <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Source_System__c"/>
                  </xsdLocal1:NAISiintSourceSystem>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Contact_Type__c">
               <xsdLocal1:ContactType>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Contact_Type__c"/>
               </xsdLocal1:ContactType>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_CreatedById__c">
               <xsdLocal1:CreatedBy>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_CreatedById__c"/>
               </xsdLocal1:CreatedBy>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedDate__c">
               <xsdLocal1:LastUpdated>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedDate__c"/>
               </xsdLocal1:LastUpdated>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedBy__c">
               <xsdLocal1:LastUpdatedByName>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedBy__c"/>
               </xsdLocal1:LastUpdatedByName>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedById__c">
               <xsdLocal1:LastUpdatedBy>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_LastModifiedById__c"/>
               </xsdLocal1:LastUpdatedBy>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Legacy_OwnerId__c">
               <xsdLocal1:PrimaryEmployeeId>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Legacy_OwnerId__c"/>
               </xsdLocal1:PrimaryEmployeeId>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Sales_Role__c">
               <xsdLocal1:ContactRole>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Sales_Role__c"/>
               </xsdLocal1:ContactRole>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Status">
               <xsdLocal1:Status>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Status"/>
               </xsdLocal1:Status>
            </xsl:if>
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Sync_Description__c">
               <xsdLocal1:ISGSFSyncDescription>
                  <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Sync_Description__c"/>
               </xsdLocal1:ISGSFSyncDescription>
            </xsl:if>
            <!-- Contact Designation   ListOfIsgSfEmailDesignation   -->
            <xsl:if test="/tns:retrieveResponse/tns:result/ens:Desginations__c">
               <xsl:choose>
                  <xsl:when test="contains(/tns:retrieveResponse/tns:result/ens:Desginations__c,';')">
                     <xsdLocal1:ListOfIsgSfEmailDesignation>
                        <xsl:call-template name="SubStringByDelimeter">
                           <xsl:with-param name="text"
                                           select="/tns:retrieveResponse/tns:result/ens:Desginations__c"/>
                           <xsl:with-param name="delimiter" select="';'"/>
                           <xsl:with-param name="index" select="1"/>
                        </xsl:call-template>
                     </xsdLocal1:ListOfIsgSfEmailDesignation>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsdLocal1:ListOfIsgSfEmailDesignation>
                        <xsdLocal1:IsgSfEmailDesignation>
                           <xsdLocal1:Id>
                              <xsl:value-of select="concat('1','++','1')"/>
                           </xsdLocal1:Id>
                           <xsdLocal1:Name>
                              <xsl:value-of select="/tns:retrieveResponse/tns:result/ens:Desginations__c"/>
                           </xsdLocal1:Name>
                        </xsdLocal1:IsgSfEmailDesignation>
                     </xsdLocal1:ListOfIsgSfEmailDesignation>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </xsdLocal1:Contact>
      </xsdLocal1:ListOfIsgsfcontactio>
   </xsl:template>
   <xsl:template name="SubStringByDelimeter">
      <xsl:param name="text"/>
      <xsl:param name="delimiter" select="';'"/>
      <xsl:param name="index"/>
      <xsl:choose>
         <xsl:when test="contains($text,$delimiter)">
            <xsdLocal1:IsgSfEmailDesignation>
               <xsdLocal1:Id>
                  <xsl:value-of select="concat('1','++',$index)"/>
               </xsdLocal1:Id>
               <xsdLocal1:Name>
                  <xsl:value-of select="substring-before($text,$delimiter)"/>
               </xsdLocal1:Name>
            </xsdLocal1:IsgSfEmailDesignation>
            <xsl:call-template name="SubStringByDelimeter">
               <xsl:with-param name="text"
                               select="substring-after($text,$delimiter)"/>
               <xsl:with-param name="delimiter" select="$delimiter"/>
               <xsl:with-param name="index" select="$index+1"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsdLocal1:IsgSfEmailDesignation>
               <xsdLocal1:Id>
                  <xsl:value-of select="concat('1','++',$index)"/>
               </xsdLocal1:Id>
               <xsdLocal1:Name>
                  <xsl:value-of select="$text"/>
               </xsdLocal1:Name>
            </xsdLocal1:IsgSfEmailDesignation>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
