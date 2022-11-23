Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7158D635716
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 10:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbiKWJhz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 04:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237923AbiKWJhU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 04:37:20 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E80102D;
        Wed, 23 Nov 2022 01:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTFbPP5pzitVDUd/+NRFXdyhZqIJQTqQbM32rDO3JXGiM+pw0DMLb9vbg8+Z78xx6M9pv2l0FE4zic3t9qETe1pw0F5g2TejbL980lY2NKUdmQ7YSx4D11hpE4K6Y4iyH2PNdZQaKba7RhbVi1LzArp8DoAvxkXiwwJosmNfomrA8v+UEOFSgkqD9JDVt4pLqJM222CpYSIQ96hhHHhP+DjKUiMErasqubVnRE9VWLkLnhdFE72c6eWHwv8MsjDbd3e/kmFKB4p6Qgbe0M5BQiEo0o+mjK55rtV6+ul4FMCrlJ3NS7s3kpHuLVLAv5MnerrWgTDeXwnVnsFonmPNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmK1H1OHciOkFW31SOQkk39skqNdf6v5AtLfc5mi1GI=;
 b=lstuqMeL3e8plGpWBOu8j57m9FzFi4UgLVP02XYX9T2DAtUgP7MciAy2akb5T2fnceDOwkqtGiv+mwTSyO5wcVxdEf6VY6/qAZvT/Xbu4EG9B6mwJ6aGIvo4a0Klv4rtFFkH07Q+W76k61epIqwQdqr3/YX/DUeoj5JM2WfBZFUQkTlsrtecrt2XS+lMCzOL2Xpv5gHqKvflpenjobkrE2lWa9VCueq53+C+e0pLw1QdZzqdxo4tE2/BClFfx6LSBTmX90+pRvGrl9eYeXio/HuaX94sVcrmmINJpc938Kb6hT4yQyfFmyQ2Vnhr51L5ANLKf47e0Gfs3JfD8ztNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmK1H1OHciOkFW31SOQkk39skqNdf6v5AtLfc5mi1GI=;
 b=YGbTFDLAFeJyHZyiBk6FdtIf0GApzbYsw0+ZzmJnJfFluJyz7pGISS6UFpiLOrTQHry/7S/cmLDu+pEcK7ehJh384MAfUr0/V9+vEtY+mQJ/8bqTvaFiMRnxAAvl3UMdr8YnnrEs1bpHBTRY/rIjOwJ0HDJbyujG2z9EMtkVLdo=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Wed, 23 Nov
 2022 09:35:13 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:35:13 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Topic: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5LZxEAgAC+uoCAABwCgIAAADSQ
Date:   Wed, 23 Nov 2022 09:35:13 +0000
Message-ID: <AS8PR04MB86429400FE14124C4D562C98870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <166914594571.442076.9834259216884759566.robh@kernel.org>
 <AS8PR04MB8642AB09DB82DE58B60421BA870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <6af753e4-cf4d-cfa1-a339-abafdce2d472@linaro.org>
In-Reply-To: <6af753e4-cf4d-cfa1-a339-abafdce2d472@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DB8PR04MB6907:EE_
x-ms-office365-filtering-correlation-id: 5172bfd1-d97f-4720-3abb-08dacd3605ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1w1S6s4Qn5R/nN9ZeFWTV2Aeum20R9AQ44SLiJqS6TlRFka05fZfUsxeTdXq74DPddXmJpTVS4UOWtUweCt0Lc54Nd0OZc5NY8ydSX0ilJGRMIFkepg5KFdsHqCcoBGNxpfYPi4Y6EO2Gi7SZpmZLrwywftzgoHKbKQTm6zSH41Jp0IcZAqdRqGJhaTfw4BFAMVpekETMBtTijjUW6tvSIWpiDBSDiBecyyVsjjXKfTqsKAGJfWHsPABiBp9qPjKNFi56KnwU3c7z7u3P/QOSU3F+NbkAbhqWiL3jnFBhyakcQv4N/37rF95czX7KjkQ9ivjotap/RzyPCuCark0l1KiMMscXGFV4nxWrgtr0g4EF+X7x48hias7zwaQye6OwINvwVX6SzqJK0Gf0uU7BZmZOEvx2W6i+qzBfFBnSxVVkJxovenMQ1vFgQSBDxlbp2cXGcp2yoshoR3/naGI51AF168kDiUE202qaLcpJ67EsMAKP1bw7vpPMQ89n4b4G+nClAcrNcAmM7Gp7bO2wEuKHg8cUjXQ8GB4CRsiuo35o916KWZqX3PH5Kz32MWGWU/pQ2iUKWsvZ+vbFPY4xXtsInboY7DoYKqvAjrHkINaCy+mRg+Fu2WrfX5LE0uD7aofRyX6pzXHDc0mIU2zux1BE2sahOl6QfPdZsHSzkcBHAU5KM4eWtzZW7tyXJzldd2rBQ98PcAqKy16oYE3yw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(26005)(110136005)(54906003)(316002)(8936002)(52536014)(2906002)(83380400001)(5660300002)(7416002)(66476007)(9686003)(76116006)(66446008)(55016003)(66556008)(4326008)(64756008)(66946007)(8676002)(33656002)(186003)(41300700001)(38070700005)(86362001)(7696005)(6506007)(478600001)(38100700002)(53546011)(122000001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VElqMmh4OEJQU1pLMUVpQUJOalRINVVaa1M4RitwMWgzVEdjZzcyUHcweEVv?=
 =?utf-8?B?VWJ4U0pySmlsdTF1N0dEak03eXNjR1V5NjExTUNMNXMrNnkxUzVCV1ZGenF4?=
 =?utf-8?B?ZXFrK0NjU0F4amN6YlZMN0V4c0UyeUVURUJjbm9RMG1mSnB3UmZWaEhZcWpF?=
 =?utf-8?B?Y1p1V3B1Y0FpZVRPMFdEV2JabHZWT2p0ZkJialV6ZnZvamZadnMxS3Q2Tzg2?=
 =?utf-8?B?REdNalk5OVV3K2YzbzdMTllzbnA4cFhzajhkQTJuREdQR2QvUEkxZm5yUjRV?=
 =?utf-8?B?dFVBYmZBMUJhN2ZDV0RNL0hQNldNdUQwcEFhOFkyWHpOeHhBdDl4SFkvdlkw?=
 =?utf-8?B?SEs4LzVtUU15dHkra09QRys5ZThGYzJVK3JyWktkY1dBS1lWRnIwaHBRKzh4?=
 =?utf-8?B?NG02cUgybWdlWkZTUFFreVBxY2thS0NDd2ZBcWpMZ0NVM1k4aGtybmdtMW1G?=
 =?utf-8?B?L2ZuSUxNL1I5eTRhbzlpcEprNVdraG1WSXZjUkJrWEs1aWRnUCs2SnRaUCt4?=
 =?utf-8?B?eGhHWHZRbUM4UGZ4dk9WbXArMXpoWnVSb0VSVUhwQmplbTVDZjh0NkZOdnd5?=
 =?utf-8?B?UjgyTXJGNndWeE9WMU1CTWI5VDc2d2JCY255dGF2YXdNbG5RWEN6bUdEQ1h2?=
 =?utf-8?B?bDRoNUsyeTZiZlBUdEIrOEhmNVZKUVV2Zkw1UGhLV2RrSXJ6eWxLSlFQSzBa?=
 =?utf-8?B?SENWb0pZdXFQdW9lSkY1SjVJd2oxSCs5Yi83NFBwYjIyWHJaK1NjaEFQaGNZ?=
 =?utf-8?B?MHlBUlI4RkNxL1B2a2JVMkgxbDFZZXUrd0NsZ2VHbFN1RFRyS3g4ZUM3R1Zx?=
 =?utf-8?B?ZFVkeXJPNTlSM3hDd1hsVVFaZmhHZG1rSVJFL2lQODdUNFI5R3NqU0Q1RlRz?=
 =?utf-8?B?T0dNemd2Wk1BR3FPLzhmTXlyaFVONkxkOFhhM0NtU1ZrYTNjalhiYlJtbURF?=
 =?utf-8?B?aU5wb0FmakxvbVhkeUJKdFQ2OFhYbVhFRmI3T3lMcEZuZFp1R2dpSklZamI5?=
 =?utf-8?B?b3dWWkY4Tm9NWGhuMnBiQXRXU0xnMVhKRjZKRzFoZVVXUmFHMWNhKzVsRzlQ?=
 =?utf-8?B?SXVhZDdmQzIreUdhR0llU2JsTkE1THVDbUdBRGRIdnJuVE9FQm9ocVVRRENF?=
 =?utf-8?B?clNNYklNSFkzeDB6YjRNRm9SK3dKNlpTZm1WSCtDdForSzFiZWpTd1RuUlpU?=
 =?utf-8?B?QTA3aXBsbHVaU3JxbEYxU3c2WHBZbUl3bUxvUjBrZHdJZzg4d1Y1WjZCZ3Fx?=
 =?utf-8?B?WE03eDZrZXdpa1pYMTgwUEIwcjBEd1RIbUE1aGNrYTVDUjI2c2hMZWlKYmJk?=
 =?utf-8?B?bjNobG4veEJiZUgvNzFqdHpJd242aHJqU2pTN1ZQSS9ORlJ0QXhGTUVwd096?=
 =?utf-8?B?RnhZZEtYQ0VzaERmRXJBaTc3UDc0SmgyZjF4NUlMdVVhMVFXLytlV2Zadmcr?=
 =?utf-8?B?TVJVM3BqVU5kWWNTNzVvMzM5M1F4Q0lOVkw2OExoRWorUEo3bnlrU3BmeS8x?=
 =?utf-8?B?OUZkcmt4eHRtT0Q5QlFWV0pGQ2x0V2QzSzd3OWFqU3hUKzB0RE1LRDJXdHhU?=
 =?utf-8?B?TGhzaWgxQ1ROWFpRRG9nUW9uNzB0bUQwTHBCcVBoeXN0M2Z1R3dKU0NRRkJw?=
 =?utf-8?B?SEJuUkJiMFg1cW9HaDVORC9nME52TWVmVTFJenBTdVZJZDB4SkRQOXVqaTI3?=
 =?utf-8?B?TVFTTitiTmZwTkxRc2pzWjlISDJtdHc0RXJieVZMUHFnemRQRFljWnJObGEx?=
 =?utf-8?B?Q0w3Q1dmL05CUkRWM09Hb3pzT3NJL085eEF5bEx2TjFJYzhEMXFkU0RHRWJp?=
 =?utf-8?B?YzdJeStDRFBvaW9ncVIvV1h6TnhkQURteVpRVjU5WkNoL0hyMmRTNVU3b1N3?=
 =?utf-8?B?WlVLZzJkNEdxRFFNazBaeXpRY0YzMUxjZ2c2eUtmanp4T2VVNjVzc2RNRFhW?=
 =?utf-8?B?YmZxb1N1OW1BdU10L0o5VzlBLzgwUjZmUlR5RHN6N3NzRzhkTjViUzFxbXdN?=
 =?utf-8?B?MjRvaXlCL1FMM01PMEFuQytJZDhCVUlNRXQzdW81MXdUWUJ1M0UyZTNRcXl3?=
 =?utf-8?B?K3lDcjdOYnJ3TXJhcFdZVEVvWTRJSWZRbmxNRVZVTm8zV1UzaktpbE1EVkJN?=
 =?utf-8?Q?XFVE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5172bfd1-d97f-4720-3abb-08dacd3605ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 09:35:13.3739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rLOGiE9oWIIAZpU+7VUf8Qu3jKQAVQ0JpL9KSE1JaV7TmjBU5THSgMA3cctRwh7SGgZu4j9q1Y5bdGcwLquFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gZHQtYmluZGluZ3M6IG1mZDogbnhwLGJibnNtOiBB
ZGQgYmluZGluZyBmb3IgbnhwDQo+IGJibnNtDQo+IA0KPiBPbiAyMy8xMS8yMDIyIDA4OjU0LCBK
YWNreSBCYWkgd3JvdGU6DQo+ID4gSGkgUm9iLA0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMS80XSBkdC1iaW5kaW5nczogbWZkOiBueHAsYmJuc206IEFkZCBiaW5kaW5nIGZvcg0KPiA+
PiBueHAgYmJuc20NCj4gPj4NCj4gPj4NCj4gPj4gT24gTW9uLCAyMSBOb3YgMjAyMiAxNDo1MTo0
MSArMDgwMCwgSmFja3kgQmFpIHdyb3RlOg0KPiA+Pj4gQWRkIGJpbmRpbmcgZm9yIE5YUCBCQk5T
TShCYXR0ZXJ5LUJhY2tlZCBOb24tU2VjdXJlIE1vZHVsZSkuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL254cCxiYm5zbS55YW1sICAgIHwgMTAzDQo+ID4+
ICsrKysrKysrKysrKysrKysrKw0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9u
cygrKQ0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9ueHAsYmJuc20ueWFtbA0KPiA+Pj4NCj4gPj4NCj4gPj4gTXkg
Ym90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0NCj4gPj4g
ZHRfYmluZGluZ19jaGVjaycNCj4gPj4gb24geW91ciBwYXRjaCAoRFRfQ0hFQ0tFUl9GTEFHUyBp
cyBuZXcgaW4gdjUuMTMpOg0KPiA+Pg0KPiA+PiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+
ID4+DQo+ID4+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+ID4+IEVycm9yOg0KPiA+
Pg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL254cCxiYm5zbS5leGFt
cGxlLmR0czoyOC4yNy0yOA0KPiA+PiBzeW50YXggZXJyb3IgRkFUQUwgRVJST1I6IFVuYWJsZSB0
byBwYXJzZSBpbnB1dCB0cmVlDQo+ID4+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5s
aWI6NDA2Og0KPiA+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL254cCxi
Ym5zbS5leGFtcGxlLmR0Yl0gRXJyb3IgMQ0KPiA+PiBtYWtlWzFdOiAqKiogV2FpdGluZyBmb3Ig
dW5maW5pc2hlZCBqb2JzLi4uLg0KPiA+PiBtYWtlOiAqKiogW01ha2VmaWxlOjE0OTI6IGR0X2Jp
bmRpbmdfY2hlY2tdIEVycm9yIDINCj4gPj4NCj4gPg0KPiA+IFRoaXMgZXJyb3Igc2hvdWxkIGJl
IHJlbGF0ZWQgdG8gdGhlICdpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzMNCj4gSVJRX1RZUEVfTEVW
RUxfSElHSD47Jw0KPiA+IERvIHdlIG5lZWQgdG8gY2hhbmdlIGl0IGEgbWFnaWMgbnVtYmVyIGRl
ZmluZT8NCj4gDQo+IFlvdSBzaG91bGQgaW5jbHVkZSBhIHByb3BlciBoZWFkZXIuIExvb2sgYXQg
b3RoZXIgYmluZGluZ3MuDQo+IA0KDQpHcmVhdCB0aHguIEkgbWlzc2VkIHRoZSBoZWFkZXIgZmls
ZSBpbmNsdWRpbmcgLiBXaWxsIGZpeCBpbiBWMi4gXl9eDQoNCkJSDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQoNCg==
