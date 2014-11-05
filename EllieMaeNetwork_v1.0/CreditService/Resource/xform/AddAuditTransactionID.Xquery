<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$rEQUEST_GROUP1" element="ns0:REQUEST_GROUP" location="../xsd/EMCRequest.xsd" ::)
(:: pragma bea:global-element-return element="ns0:REQUEST_GROUP" location="../xsd/EMCRequest.xsd" ::)

declare namespace ns0 = "http://www.elliemae.com/service/credit";
declare namespace xf = "http://tempuri.org/EllieMaeNetwork_v1.0/CreditService/Resource/xform/AddAuditTransactionID/";

declare function xf:AddAuditTransactionID($rEQUEST_GROUP1 as element(ns0:REQUEST_GROUP), $trxid as xs:string)
    as element(ns0:REQUEST_GROUP) {
        <ns0:REQUEST_GROUP MISMOVersionID = "{ data($rEQUEST_GROUP1/@MISMOVersionID) }"
                           EMCVersionID = "{ data($rEQUEST_GROUP1/@EMCVersionID) }"
                           TransactionID = "{data($trxid)}">
            <ns0:REQUESTING_PARTY>{ $rEQUEST_GROUP1/ns0:REQUESTING_PARTY/@* , $rEQUEST_GROUP1/ns0:REQUESTING_PARTY/node() }</ns0:REQUESTING_PARTY>
            <ns0:RECEIVING_PARTY>{ $rEQUEST_GROUP1/ns0:RECEIVING_PARTY/@* , $rEQUEST_GROUP1/ns0:RECEIVING_PARTY/node() }</ns0:RECEIVING_PARTY>
            <ns0:SUBMITTING_PARTY>{ $rEQUEST_GROUP1/ns0:SUBMITTING_PARTY/@* , $rEQUEST_GROUP1/ns0:SUBMITTING_PARTY/node() }</ns0:SUBMITTING_PARTY>
            <ns0:REQUEST>{ $rEQUEST_GROUP1/ns0:REQUEST/@* , $rEQUEST_GROUP1/ns0:REQUEST/node() }</ns0:REQUEST>
        </ns0:REQUEST_GROUP>
};

declare variable $rEQUEST_GROUP1 as element(ns0:REQUEST_GROUP) external;
declare variable $trxid as xs:string external;

xf:AddAuditTransactionID($rEQUEST_GROUP1, $trxid)]]></con:xquery>
    <con:dependency location="../xsd/EMCRequest.xsd">
        <con:schema ref="EllieMaeNetwork_v1.0/CreditService/Resource/xsd/EMCRequest"/>
    </con:dependency>
</con:xqueryEntry>