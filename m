Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B44709C5A
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 18:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjESQYa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 May 2023 12:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjESQY2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 12:24:28 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6E790;
        Fri, 19 May 2023 09:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGC02Ov50tUHyHkdHOKxuYm94e2nwJFEXSs0oVdgnfZ7hoQxWOjjK86vNHwJr9n7h/r3VDjsyxHJ2YwW2HF/37ltleKbREKjQ2yE8pS9sAZ14Ty+fmr6oZwlOdUC2Oj6LTodQkJ2YeSPLSxRDew3tkRfOK/E7nGg9WW5RcsehxnTaCfFc5ECYa5traK2gWodVasKiNsQ/ZBfGI2yYaeytf8hepExgjxFAH6vjYDXtjz7x/HtZ3Pnb+WDW6s1BZ6fz5N6GLGZf/pZLkRGi5Ng7MFtwxe2Kz9njMCAenDEM2QrxRbSSKOHj+ERX8evS/W3raMCZ1zPxfLUbjTcRd7SMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThSEwTjBWIghT3mopaolMhvGoQPoskgmxunYovX5WHQ=;
 b=Rg9jYToE6QXL85fEP3jfLF1nDwLK5XbwsdbhHoyKS8tPLWsOtqc+kQmSn5WPJfTC+XQH/l4KNlvuEGJYPvxeb36WF05VdttxKW2+SWIgal7Z0sboRb1CGc1w2PlqzzH1QiBPtpMtSZ5LDgkeMUbo20IIl+/HanlTHqMbiHLUoEgizGt3W6r9YoHKPGJIKIAe7Wwf0ghFvlDxPlLnUzcl7HHf/iwnyPvg46dzNIqmCz18sTZraGNtFBixpn55jB//A7NZP8X4hTU5NT/l+li4n849OoThjTSF6ngndpCmMVLLdMc3RIeavIslEMAq2SMNqBDmV/6YCx0pnDIFrgDRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThSEwTjBWIghT3mopaolMhvGoQPoskgmxunYovX5WHQ=;
 b=K54k5oOWx0W0kQMVD7HLsdjLkw8KmS0zFSjB/18S2Zk7kFwAKJqu8jEWR+aoVuDGmaYIUS2zs3K9P4ovr9QzfN4Cd411UeV4la8IXDFNn9R3tq2vk/2WiHZPLSoP6qauqG+uVAtSoDcqULX8ny2ErIs9R00wBKRdo+EX7v6e8Nw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9547.jpnprd01.prod.outlook.com (2603:1096:604:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 16:24:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:24:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Topic: [PATCH v4 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Index: AQHZiX0bDZG5wU71bUCgUKB2s4QGCq9hjXiAgAA7Z/A=
Date:   Fri, 19 May 2023 16:24:24 +0000
Message-ID: <OS0PR01MB5922CCDFB18AD13BDC990B1B867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW73f4TYVTNFnXpKZS6azqJnLP06uhh7XnXa=3YG-o+Cg@mail.gmail.com>
In-Reply-To: <CAMuHMdW73f4TYVTNFnXpKZS6azqJnLP06uhh7XnXa=3YG-o+Cg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9547:EE_
x-ms-office365-filtering-correlation-id: cf2455b3-e6e3-40fd-9fbb-08db58858244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VbbRXMhkeWo1uBPKC5MPNZYT2pgtdJIV75tm02Y4vcWIiCBlXDQNd7xYMzwxyTtwcviUr57oozZkLQqVAghWREeuwuryBCMqhbf9yW3mMk8z7nwpY1bChpdCF9yhA75Lza4JEhU3Y1mXFi8z/32V2NP9vcnpLQnA72rgBnPHMQe475GVHZWMW8yl3Bsim6AEAEon14iztX55jsk0jwAY9YIzZFutM+7LjkVfh3f908Erg1cevyO2yG1/6wOYTveHhwHnKdhPDaFZgZoCHm+NcBlsU3trlVPRGr4P0QmI6pXbgFNdAAY8cawGuyfD3UB/jiBWlgaNOd+o1Na7ugDX5FVvu0TNNhdxI0dlcg+SWqAy838ItF9Gp9s8vVMyYejRQCnw2IIXMHPpAG7C9V7z2ZDZC2XjWcf7dWK1cBvqSWyw7cWDGTyjvreDdtHWgPG8dZ+F77XIIghXIOqCviYO5zuXqxDQpNoQrLLJvzWXA9LdbH3HE188ajgtEBONuX/XKTR5HtHYq1pVJdeYnHq9tZxvA8xrGXWLZb3Jybgqrj/g0N6pKDubYy/DTSWSufg3i+Ih1cCeCCGSRCj/Qz2uSgOozVGHVBpuKxnFKoI6mWg6TB9y4FjVSJnYvKd2mFMU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(38070700005)(122000001)(38100700002)(55016003)(33656002)(86362001)(5660300002)(52536014)(6506007)(9686003)(26005)(53546011)(8936002)(8676002)(83380400001)(2906002)(186003)(478600001)(54906003)(41300700001)(7696005)(66556008)(64756008)(66446008)(66476007)(71200400001)(66946007)(76116006)(316002)(4326008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z01FQk5WcjlsOU9zTXB0ZXUrTFREY2FnUTlIaE5DanVKZU5nK0NlUlhUeFla?=
 =?utf-8?B?akNIN1ZTWmNZWjB6RFdnekZUdmFrNzgrRkRsUHp5a1IzeFlxWXgwOGROaVFS?=
 =?utf-8?B?T2NYMTJyTm9TelBhSXE1ZTRaMUQxdmpVSStMbkVDNzlYaCswYTVRdnQ2OGxp?=
 =?utf-8?B?L2U1aEl3REFTSHIxWCtJSVZySnFVUmI2KzlZeklWSzd0T0U4ak4rUGJCK0JM?=
 =?utf-8?B?b1lsYkxJZnJ6aWtZK0Nqalh5SUxWWXNEVnNSczNYcFVDMGNUTWVKcEtjaHpC?=
 =?utf-8?B?NW9mVmk2ZUgwN0dMT0tDWnIvYnAxY1ZaZXNsRCtGN3pDWnRpRzdmOUhwaERN?=
 =?utf-8?B?TWZvcWVvWnVMc2FjeHNzcGZzZjJDcUpQamx0eWZxeGNMZ2V1T1laK1JXQ3dT?=
 =?utf-8?B?MjZOSmxacEc4U09ZZGh1dWFROHZNZWdvTTk3NEFraUZWZTNabzJvZVc0SVoz?=
 =?utf-8?B?RVhaeG9kMHBPMTBKTm1ITyt4dEJ6VUkrdFE5djFNUGJ5QW9SWXNVNVV6WWlo?=
 =?utf-8?B?RlJlcENobnlOcHRiUThKRTIwZytyNUhDYUdMWWx6UHJJS3ZxR1NnN3hCRGpQ?=
 =?utf-8?B?YnUrdGJJck9Iek5sUXVsRzFTemxqRDZUY2NYWHgyT0x1N2FIeHVBVHVVbC9G?=
 =?utf-8?B?MG9sZmowMmZLc01JWktaejN4YzdMZUhzeVhzV2JQLytUTDNPOEk2MUVJY1Bw?=
 =?utf-8?B?ci9vMzZoZWM3b3FTcDkvNGgwdFZQQkYxSWJtNXcwaGQyeVB5VmZHVVdpMnkv?=
 =?utf-8?B?STd3bHZMM3Y0SldnWFBXOE9CM2pPMFpGSEhadjFLNHRsb09ydFhxUk5hazZW?=
 =?utf-8?B?b2ZRTzFZTjAxYVBINFlEV0Nzb1lNUHJ5OEVQK090OC8ydVV0V2JSdi9zRFZ1?=
 =?utf-8?B?QlNuVG5ZdXphcDhzeUFiQXZQcHpBVm5DbDJMZFRmZXlOVzF3MWM2M2E2WmtL?=
 =?utf-8?B?Ym1HdUlLenlWaVQ4RDJsRHdkNWs2TUZLSVFoWmRqaFFISzRkNFhQMEVRaU1o?=
 =?utf-8?B?TzVTNmFhdWw5dGxQdk05TytsOVFyRTJpeGJERmdXMmpmcE1LZGlIUUhKVm0r?=
 =?utf-8?B?NkJENXozOHcrbFlwRG8xeGxHdkJsaEpTc2RVRGlIdE5IdVhlRHAvMkY3Qkdy?=
 =?utf-8?B?ZXFjUVowZlpYNDdiRjBJUkNIb2xNbHE3a0t5VFRyb0twcnJSb2R1cDMrWWRr?=
 =?utf-8?B?RlNrN2JraVBtbVlBOWwraWtJaGR5cjhONFU2cXdkckRReWpEZTZKaWFDU2ow?=
 =?utf-8?B?bUxNZUxaMGFPUWhrSDBQNXZyZTJ4L3BPZnBMaGJLRGhjWGNKenJEN0hVQXFs?=
 =?utf-8?B?bnc5RG9DS2pzUGgrNUxIVWpCQXhEQzVjdUY5NjNqU0V5WHd0Y05SWWJtWC9V?=
 =?utf-8?B?cHVReVhWUUw3VWVGU1FCQ1o5cGpLRGhFbU5CeDh2NW1uMUhQV2pxMFBkeDlB?=
 =?utf-8?B?c0JtdndoWk9iU3dHY3VUeklVVXhpcWRhdkJtM0VOV3UzeUpydnYxNEZsY0xN?=
 =?utf-8?B?dXpSaExtTC9HOVZRQWZrbWFTT3FXb3l4M29FOVVEWnBmTU1Ld2lUZzk3d3lZ?=
 =?utf-8?B?ZmQ5a1RlUmUvdkswd0w0TmF6QXJoclgxb2xoNE9lL1lBcllOQXJlMno4WjA1?=
 =?utf-8?B?QTFGaXVXT2pWY244WlRRMW9mMUVFc2NqTnIzU1psTk5oc2xRbU1HYTRCWmJZ?=
 =?utf-8?B?T2RDYUJ4UUIybkM1dS94MU13eGZ4Uk1qbjcva2NTN3dUdkZqbDNQT3NUeTJI?=
 =?utf-8?B?MHFRZ3U1MUdqbmxBZ3pxZE1US2dTNnNKZU5VWlRhTXVtRWdIQWdNd2NucktO?=
 =?utf-8?B?ZDQ4enVYMXF6akVMbnpmRVlFd1VwUXNlUE1RZDk5V0hrdjFaMGJvZVgrdGQw?=
 =?utf-8?B?SFRpTG04Q09DemZuUURPMEVWZmF6N3VSMjF0cjRpYzl5NWVSUVRTeFNKSnhS?=
 =?utf-8?B?dXdiTUFudEh2a1Avc0JDUHRLRXRvV01vdGNCOXpBRjRVOGMzc3pwK0MwYW5l?=
 =?utf-8?B?M3VYcnRPNjFRUngwL3pBRlhKUEwzN3JDaTlBT2Rwak5QZ1RGeHpxRE9uRjZC?=
 =?utf-8?B?R3NMcWJ0RUpxaVNPZWFmanIvZ3dBVTczdk5nbENsNi9DMkZWTnBucy9ER3Zn?=
 =?utf-8?Q?/J0XH4ycoTz90itjb3YVg7nlN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2455b3-e6e3-40fd-9fbb-08db58858244
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:24:24.2470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfpdLmENPph7C5RUSee7RAilmPn0KkF3y0YKUe7LDet+gbYUZva9YmaT061LfduErEjxaHiSt8cusUGz2th/lV3Rmibnapu6n5qVquDtiLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9547
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDcvMTFdIHJ0YzogaXNsMTIwODogQWRkIGlzbDEyMDhfc2V0X3h0b3NjYigpDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMTozN+KAr1BNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQXMgcGVy
IHRoZSBIVyBtYW51YWwsIHNldHRpbmcgb2YgWFRPU0NCIGJpdCBhcyBmb2xsd3MNCj4gDQo+IC4u
LiBzZXQgdGhlIFhUT1NDQiBiaXQgYXMgZm9sbG93czoNCg0KT29wcy4gV2lsbCBmaXguDQoNCj4g
DQo+ID4gSWYgdXNpbmcgYW4gZXh0ZXJuYWwgY2xvY2sgc2lnbmFsLCBzZXQgdGhlIFhUT1NDQiBi
aXQgYXMgMSB0byBkaXNhYmxlDQo+ID4gdGhlIGNyeXN0YWwgb3NjaWxsYXRvci4NCj4gPg0KPiA+
IElmIHVzaW5nIGFuIGV4dGVybmFsIGNyeXN0YWwsIHRoZSBYVE9TQ0IgYml0IG5lZWRzIHRvIGJl
IHNldCBhdCAwIHRvDQo+ID4gZW5hYmxlIHRoZSBjcnlzdGFsIG9zY2lsbGF0b3IuDQo+ID4NCj4g
PiBBZGQgaXNsMTIwOF9zZXRfeHRvc2NiKCkgdG8gc2V0IFhUT1NDQiBiaXQgYmFzZWQgb24gdGhl
IGNsb2NrLW5hbWVzDQo+ID4gcHJvcGVydHkuIEZhbGxiYWNrIGlzIGVuYWJsaW5nIHRoZSBpbnRl
cm5hbCBjcnlzdGFsIG9zY2lsbGF0b3IuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgaW50cm9kdWNl
IGEgdmFyaWFibGUgInNyIiBmb3IgcmVhZGluZyBzdGF0dXMgcmVnaXN0ZXINCj4gDQo+IHRoZSBz
dGF0dXMgcmVnaXN0ZXINCg0KT2suDQoNCj4gDQo+ID4gaW4gcHJvYmUoKSBhcyBpdCBpcyByZXVz
ZWQgZm9yIHdyaXRpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjQ6DQo+ID4gICogTmV3IHBhdGNo
Lg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3J0
Yy9ydGMtaXNsMTIwOC5jDQo+ID4gKysrIGIvZHJpdmVycy9ydGMvcnRjLWlzbDEyMDguYw0KPiAN
Cj4gPiBAQCAtODM3LDYgKzg1MiwxMyBAQCBpc2wxMjA4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpDQo+ID4gICAgICAgICAgICAgICAgIGlzbDEyMDgtPmNvbmZpZyA9IChzdHJ1Y3Qg
aXNsMTIwOF9jb25maWcgKilpZC0NCj4gPmRyaXZlcl9kYXRhOw0KPiA+ICAgICAgICAgfQ0KPiA+
DQo+ID4gKyAgICAgICB4aW4gPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAieGluIik7DQo+
ID4gKyAgICAgICBpZiAoSVNfRVJSKHhpbikpIHsNCj4gPiArICAgICAgICAgICAgICAgY2xraW4g
PSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAiY2xraW4iKTsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKCFJU19FUlIoY2xraW4pKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludF9v
c2NfZW4gPSBmYWxzZTsNCj4gPiArICAgICAgIH0NCj4gDQo+IGRldm1fY2xrX2dldF9vcHRpb25h
bCgpDQoNCk9LLCBXaWxsIHVzZSBvcHRpb25hbCB2YXJpYW50Lg0KDQo+IChkb2Vzbid0IGRldm1f
Y2xrX2dldCgpIHByaW50IGFuIGVycm9yIG1lc3NhZ2U/KQ0KSSB3aWxsIGRvdWJsZSBjaGVjay4g
SWYgSSByZW1lbWJlciBjb3JyZWN0bHkgaXQgZGlkbid0IHRocm93IGFueSBwcnRpbnRzLg0KDQo+
IA0KPiBBbmQgY2hlY2sgZm9yIE5VTEwgdG8gZmluZCBvdXQgaWYgYSBjbG9jayBpcyBwcmVzZW50
Lg0KDQpPSy4NCg0KPiBJU19FUlIoKSBpcyBhIHJlYWwgZXJyb3IgY29uZGl0aW9uIHRvIGJlIHBy
b3BhZ2F0ZWQuDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0K
