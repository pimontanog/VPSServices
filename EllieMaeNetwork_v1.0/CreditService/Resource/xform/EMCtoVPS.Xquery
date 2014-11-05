<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$rEQUEST_GROUP1" element="ns0:REQUEST_GROUP" location="../xsd/EMCRequestExtended.xsd" ::)
(:: pragma bea:global-element-return element="ns1:REQUEST" location="../xsd/VPSEMC.xsd" ::)

declare namespace ns1 = "http://www.elliemae.com/vps/contract";
declare namespace ns0 = "http://www.elliemae.com/service/credit";
declare namespace xf = "http://tempuri.org/EllieMaeNetwork_v1.0/CreditService/Resource/xform/EMCtoVPS/";

declare function xf:EMCtoVPS($rEQUEST_GROUP1 as element(ns0:REQUEST_GROUP))
    as element(ns1:REQUEST) {
        <ns1:REQUEST>
            <ns1:RequestData>{ fn-bea:serialize($rEQUEST_GROUP1) }</ns1:RequestData>
            <ns1:TransactionData>
                <ns1:BranchIdentifier>{ data($rEQUEST_GROUP1/ns0:REQUEST[1]/@RequestingPartyBranchIdentifier) }</ns1:BranchIdentifier>
                <ns1:ClientIdentifier>{ data($rEQUEST_GROUP1/ns0:REQUESTING_PARTY[1]/@_Identifier) }</ns1:ClientIdentifier>
                <ns1:CompanyCode>{ data($rEQUEST_GROUP1/ns0:RECEIVING_PARTY[1]/@_Identifier) }</ns1:CompanyCode>
                <ns1:ConsumerApplication>{ data($rEQUEST_GROUP1/ns0:REQUESTING_PARTY[1]/@_ApplicationName) }</ns1:ConsumerApplication>
                <ns1:LoanUID>{ data($rEQUEST_GROUP1/ns0:REQUEST[1]/ns0:REQUEST_DATA[1]/ns0:CREDIT_REQUEST/ns0:LOAN_APPLICATION/ns0:LOAN_ORIGINATION_SYSTEM/@_LoanIdentifier) }</ns1:LoanUID>
                <ns1:TransUID>{ data($rEQUEST_GROUP1/ns0:REQUESTING_PARTY[1]/@_TransactionIdentifier) }</ns1:TransUID>
                <ns1:UserName>{ data($rEQUEST_GROUP1/ns0:REQUESTING_PARTY[1]/@_UserName) }</ns1:UserName>
                <ns1:VendorEnvironment>{ data($rEQUEST_GROUP1/ns0:RECEIVING_PARTY[1]/@_Environment) }</ns1:VendorEnvironment>
                <ns1:VendorKey>{ data($rEQUEST_GROUP1/ns0:RECEIVING_PARTY[1]/@_VendorKey) }</ns1:VendorKey>
            </ns1:TransactionData>
        </ns1:REQUEST>
};

declare variable $rEQUEST_GROUP1 as element(ns0:REQUEST_GROUP) external;

xf:EMCtoVPS($rEQUEST_GROUP1)]]></con:xquery>
    <con:dependency location="../xsd/EMCRequestExtended.xsd">
        <con:schema ref="EllieMaeNetwork_v1.0/CreditService/Resource/xsd/EMCRequestExtended"/>
    </con:dependency>
    <con:dependency location="../xsd/VPSEMC.xsd">
        <con:schema ref="EllieMaeNetwork_v1.0/CreditService/Resource/xsd/VPSEMC"/>
    </con:dependency>
</con:xqueryEntry>