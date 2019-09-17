Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7221BB48DF
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2019 10:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404584AbfIQILK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Sep 2019 04:11:10 -0400
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]:56449
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730211AbfIQILK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Sep 2019 04:11:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvlQMCui9WxCjfZ8X8H3i2w/EenOUnjHldMeyvWxnPi+O5jc4kFH5YVcZfaYbWlFghJJy8iSHN1Wudzdg2sRyBC8bHmSIK+IA0YUBvu1c00RTdpUCFuwll8CLeE/5GwuZGU76hoLy5TE4WDdbcWLGDc8NaI0mY0EZ8ZSOu7asiZWNpOK3UlKVHo5I2Gexp3wi/XgNSfIkHQ4/15F+6PtkwxRWEFf/AsMSXpz1pFOlxkPVFfNXDoaRxmlw+chdGXvlXpXRhFuxo/smZaFzTpXndp+bHttii9aQJuvBaMJZXWjdPIEyuPtSFoBAA+DSXghuSxnSansbLgZbuNd7CleCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2etxUatfFowA4b15t3FfmPK37lBsSwFwSg/4EU0k/8c=;
 b=AAkOyyQofyrKPrRLTUWV7f6aLCmya2xMvsdSdkfCa4KY8wtxnoaxlRmGBqLpDZev1VRYvWRVQkAFsBT/yw8WSABQGwP8XYOW9xHiLGBo5/sOp4f8Bczpv3AejnFj+jtyvHs8emVLaWcAVfwqq6rxvzolY7L3shryVjdzrQUKDosCCMQTCJ7SrJRpK68VCg41YSIvAG6DydyoD5XGmvWzo0jb7OpiW3Bz64A21RIQBLmIjgqjgGjvfqo7v+YntU/8PKmZGBCa/DZj46CbqRNVrb+w7Kzp/R0HJ2ao0UYasXO0GxtMEBtQ1bDbnkciEkZCGe8ueDnQFUdoGXEGV5Xgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2etxUatfFowA4b15t3FfmPK37lBsSwFwSg/4EU0k/8c=;
 b=hMNxjybGjUUb1XUpb7czWAJNYYBV6SGI4nQZYq7R60aCrKUSb3h3SuqfPjlfXt2k8GhpzPKJJwaj5/ObaWtq6UsfeORhRXGnCLyK298iQZfVzkxRRToq4L1d6n22b/fFeVd1LRJLdizruRRK0kxRNFxkn9E5AMm8FZ3p6SgKIEM=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4777.eurprd04.prod.outlook.com (20.176.233.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 08:11:05 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 08:11:05 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     'Rob Herring' <robh+dt@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Leo Li <leoyang.li@nxp.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: RE: [EXT] Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Topic: [EXT] Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Index: AQHVZ8X8UjQb5r8clUyaZIC1mhn5L6cvGpMAgABv3JA=
Date:   Tue, 17 Sep 2019 08:11:05 +0000
Message-ID: <DB7PR04MB4490CBB93B931D508E0AFC028F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190910104247.13142-1-biwen.li@nxp.com>
 <CAL_JsqL=37HL3BnxZTxJXQTBaKoFs1_=vt4hfLqkxXkWedmPYA@mail.gmail.com>
In-Reply-To: <CAL_JsqL=37HL3BnxZTxJXQTBaKoFs1_=vt4hfLqkxXkWedmPYA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 453a0786-8475-44b9-e409-08d73b469664
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB7PR04MB4777;
x-ms-traffictypediagnostic: DB7PR04MB4777:|DB7PR04MB4777:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4777131D19504BD4E64E30AF8F8F0@DB7PR04MB4777.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(4326008)(476003)(2906002)(5660300002)(52536014)(486006)(66946007)(66446008)(76176011)(64756008)(66556008)(66476007)(7696005)(81156014)(8676002)(33656002)(9686003)(14454004)(86362001)(478600001)(446003)(11346002)(6436002)(966005)(229853002)(81166006)(256004)(71190400001)(25786009)(6116002)(71200400001)(6246003)(3846002)(74316002)(44832011)(8936002)(14444005)(6506007)(76116006)(54906003)(6306002)(55016002)(99286004)(66066001)(7736002)(316002)(26005)(305945005)(53546011)(186003)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4777;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OtA2BR2nV4yMRokGYySsX6xKYAplHNdDdgVeEbiuP1LMK0eLMWEdcPzQ2MfAOLhfj5iAQadr8MRgpc/hzJ5TzsjP/w/n8ywpDISIZXs3fJ+yVdCkxWp4Zm7Yi1+JJ0ghrPizhitvaT/PXNdWpucz8dMcu67nEELWCXkoY4XzozBul2JZROLcsR1omRP1fJIRLkGO1I8MaNmEV2V9xjW8d2e6PfucIMs74KG2s46VXiv1tm7okULvEk2s8EIV/VMfOKyYOD7jeZ7W/DTvC4DH/QTO29EXcqv/r1iKyilMbQacHKH2lnfik/K57iLo6uGtWTHPXTZoDnNchNtM5XIe6C3a44TxIscg5/8cKW0jcPGVSBZ0I2t7lYgyjSJ20FMWnLtyhNLzt9OSTsvY+QXS2lmwHlT1vbisFxtl5fEwRbo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453a0786-8475-44b9-e409-08d73b469664
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 08:11:05.2688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJUs2t4I7/CL8GlGr2fmUKOMklikmOeG2/UGWS2mrYC8qND68+wl3blADg/ZN+rHtk7cXSi1g8vfq4P9G5vSEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4777
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBUdWUsIFNlcCAxMCwgMjAxOSBhdCA1
OjUzIEFNIEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEFkZCBz
b21lIHByb3BlcnRpZXMgZm9yIHBjZjg1MjYzL3BjZjg1MzYzIGFzIGZvbGxvd3M6DQo+ID4gICAt
IG54cCxydGMtaW50ZXJydXB0LXR5cGU6IGludGVnZXIgdHlwZQ0KPiA+ICAgLSBueHAscnRjLWlu
dGVycnVwdC1vdXRwdXQtcGluOiBzdHJpbmcgdHlwZQ0KPiA+ICAgLSBxdWFydHotbG9hZC1mZW10
b2ZhcmFkczogaW50ZWdlciB0eXBlDQo+ID4gICAtIG54cCxxdWFydHotZHJpdmUtc3RyZW5ndGg6
IGludGVnZXIgdHlwZQ0KPiA+ICAgLSBueHAscXVhcnR6LWxvdy1qaXR0ZXI6IGJvb2wgdHlwZQ0K
PiA+ICAgLSB3YWtldXAtc291cmNlOiBib29sIHR5cGUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1hcnRpbiBGdXp6ZXkgPG1mdXp6ZXlAcGFya2Vvbi5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Qml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlIGluIHY0Og0K
PiA+ICAgICAgICAgLSBEcm9wIHJvYnVzdCBkZWZpbmVzIGluIGluY2x1ZGUvZHQtYmluZGluZ3Mv
cnRjL3BjZjg1MzYzLmgNCj4gPiAgICAgICAgIC0gQWRkIG54cCxydGMtaW50ZXJydXB0LXR5cGUg
cHJvcGVydHkNCj4gPiAgICAgICAgIC0gUmVwbGFjZSBpbnRlcnJ1cHQtb3V0cHV0LXBpbiB3aXRo
DQo+ID4gbnhwLHJ0Yy1pbnRlcnJ1cHQtb3V0cHV0LXBpbg0KPiA+DQo+ID4gQ2hhbmdlIGluIHYz
Og0KPiA+ICAgICAgICAgLSBOb25lDQo+ID4NCj4gPiBDaGFuZ2UgaW4gdjI6DQo+ID4gICAgICAg
ICAtIFJlcGxhY2UgcHJvcGVydGllcyBuYW1lDQo+ID4gICAgICAgICAgIHF1YXJ0ei1sb2FkLWNh
cGFjaXRhbmNlIC0+IHF1YXJ0ei1sb2FkLWZlbXRvZmFyYWRzDQo+ID4gICAgICAgICAgIHF1YXJ0
ei1kcml2ZS1zdHJlbmd0aCAtPiBueHAscXVhcnR6LWRyaXZlLXN0cmVuZ3RoDQo+ID4gICAgICAg
ICAgIHF1YXJ0ei1sb3ctaml0dGVyIC0+IG54cCxxdWFydHotbG93LWppdHRlcg0KPiA+ICAgICAg
ICAgLSBSZXBsYWNlIGRyaXZlIHN0cmVuZ3RoIG5hbWUNCj4gPiAgICAgICAgICAgUENGODUyNjNf
UVVBUlRaRFJJVkVfTk9STUFMIC0+DQo+IFBDRjg1MjYzX1FVQVJUWkRSSVZFXzEwMGtvDQo+ID4g
ICAgICAgICAgIFBDRjg1MjYzX1FVQVJUWkRSSVZFX0xPVyAtPg0KPiBQQ0Y4NTI2M19RVUFSVFpE
UklWRV82MGtvDQo+ID4gICAgICAgICAgIFBDRjg1MjYzX1FVQVJUWkRSSVZFX0hJR0ggLT4NCj4g
UENGODUyNjNfUVVBUlRaRFJJVkVfNTAwa28NCj4gPiAgICAgICAgIC0gU2V0IGRlZmF1bHQgaW50
ZXJydXB0LW91dHB1dC1waW4gYXMgIklOVEEiDQo+ID4NCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcnRjL3BjZjg1MzYzLnR4dCAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrLQ0KPiA+
ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3J0Yy9wY2Y4NTM2My5oICAgICAgICAgICAgfCAxNCArKysr
KysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBpbmNsdWRlL2R0LWJpbmRpbmdzL3J0Yy9wY2Y4NTM2
My5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9wY2Y4NTM2My50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ydGMvcGNmODUzNjMudHh0DQo+ID4gaW5kZXggOTRhZGMxY2Y5M2Q5Li5mYzE1Nzk0NjM2
NTcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0
Yy9wY2Y4NTM2My50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcnRjL3BjZjg1MzYzLnR4dA0KPiA+IEBAIC04LDEwICs4LDUyIEBAIFJlcXVpcmVkIHByb3Bl
cnRpZXM6DQo+ID4gIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ID4gIC0gaW50ZXJydXB0czogSVJR
IGxpbmUgZm9yIHRoZSBSVEMgKG5vdCBpbXBsZW1lbnRlZCkuDQo+ID4NCj4gPiArLSBueHAscnRj
LWludGVycnVwdC10eXBlOiBpbnRlZ2VyIHByb3BlcnR5LCByZXByZXNlbnQgdGhlIGludGVycnVw
dCdzDQo+ID4gKyAgdHlwZS4gVmFsaWQgdmFsdWVzIGFyZQ0KPiA+ICsgIElOVF9QSUUocGVyaW9k
aWMgaW50ZXJydXB0IGVuYWJsZSksDQo+ID4gKyAgSU5UX09JRShvZmZzZXQgY29ycmVjdGlvbiBp
bnRlcnJ1cHQgZW5hYmxlKSwNCj4gPiArICBJTlRfQTFJRShhbGFybTEgaW50ZXJydXB0IGVuYWJs
ZSksDQo+ID4gKyAgSU5UX0EySUUoYWxhcm0yIGludGVycnVwdCBlbmFibGUpLA0KPiA+ICsgIElO
VF9UU1JJRSh0aW1lc3RhbXAgcmVnaXN0ZXIgaW50ZXJydXB0IGVuYWJsZSkNCj4gPiArICBJTlRf
QlNJRShiYXR0ZXJ5IHN3aXRjaCBpbnRlcnJ1cHQgZW5hYmxlKSwNCj4gPiArICBJTlRfV0RJRShX
YXRjaERvZyBpbnRlcnJ1cHQgZW5hYmxlLGFuZA0KPiA+ICsgIGNvbXBvc2UgdGhlc2UgdmFsdWVz
IHN1Y2ggYXM6IElOVF9BMUlFIHwgSU5UX0EySUUsDQo+ID4gKyAgYnV0IGN1cnJlbnRseSBvbmx5
IHN1cHBvcnQgSU5UX0ExSUUsIGRlZmF1bHQgdmFsdWUgaXMgSU5UX0ExSUUuDQo+ID4gKyAgVGhl
IHByb3BlcnR5IGFuZCBwcm9wZXJ0eSBueHAscnRjLWludGVycnVwdC1vdXRwdXQtcGluDQo+ID4g
KyAgd29yayB0b2dldGhlciB0byBnZW5lcmF0ZSBzb21lIGludGVycnVwdHMgb24gc29tZSBwaW5z
Lg0KPiA+ICsNCj4gPiArLSBueHAscnRjLWludGVycnVwdC1vdXRwdXQtcGluOiBUaGUgaW50ZXJy
dXB0IG91dHB1dCBwaW4gbXVzdCBiZQ0KPiA+ICsgICJJTlRBIiBvciAiSU5UQiIsIGRlZmF1bHQg
dmFsdWUgaXMgIklOVEEiLiBUaGUgcHJvcGVydHkgYW5kDQo+ID4gK3Byb3BlcnR5DQo+ID4gKyAg
bnhwLHJ0Yy1pbnRlcnJ1cHQtdHlwZSB3b3JrIHRvZ2V0aGVyIHRvIGdlbmVyYXRlIHNvbWUgaW50
ZXJydXB0cyBvbg0KPiA+ICsgIHNvbWUgcGlucy4NCj4gPiArDQo+ID4gKy0gcXVhcnR6LWxvYWQt
ZmVtdG9mYXJhZHM6IFRoZSBpbnRlcm5hbCBjYXBhY2l0b3IgdG8gc2VsZWN0IGZvciB0aGUNCj4g
PiArcXVhcnR6LA0KPiA+ICsgIGV4cHJlc3NlZCBpbiBmZW10byBGYXJhZCAoZkYpLiBWYWxpZCB2
YWx1ZXMgYXJlIDYwMDAsIDcwMDAgYW5kIDEyNTAwLg0KPiA+ICsgIERlZmF1bHQgdmFsdWUgaXMg
MTI1MDBmRi4NCj4gPiArDQo+ID4gKy0gbnhwLHF1YXJ0ei1kcml2ZS1zdHJlbmd0aDogRHJpdmUg
c3RyZW5ndGggZm9yIHRoZSBxdWFydHosDQo+ID4gKyAgZXhwcmVzc2VkIGluIGtpbG8gb2htcyAo
a09obSkgVmFsaWQgdmFsdWVzIGFyZSA2MCwgMTAwIGFuZCA1MDAuDQo+ID4gKyAgRGVmYXVsdCB2
YWx1ZSBpcyAxMDBrT2htLg0KPiANCj4gVGhpcyBuZWVkcyBhIHVuaXQgYXMgZGVmaW5lZCBpbiBw
cm9wZXJ0eS11bml0cy50eHQuDQpPaywgZ290IGl0LCBJIHdpbGwgcmVwbGFjZSBpdCB3aXRoIG54
cCxxdWFydHotZHJpdmUtc3RyZW5ndGgta29obXMgaW4gdjUuDQpJIGFkZGVkIGEgbmV3IHVuaXQg
J2tvaG1zJyB0byBwcm9wZXJ0eS11bml0cy50eHQsDQpwbGVhc2UgcmV2aWV3IHRoZSBwYXRjaCBo
dHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTE2MzIxNC8gLA0KdGhhbmtzLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpCaXdlbiBMaQ0KPiANCj4gPiArDQo+ID4gKy0gbnhwLHF1YXJ0ei1sb3ct
aml0dGVyOiBCb29sZWFuIHByb3BlcnR5LCBpZiBwcmVzZW50IGVuYWJsZXMgbG93DQo+ID4gK2pp
dHRlciBtb2RlDQo+ID4gKyAgd2hpY2ggcmVkdWNlcyBqaXR0ZXIgYXQgdGhlIGNvc3Qgb2YgaW5j
cmVhc2VkIHBvd2VyIGNvbnN1bXB0aW9uLg0KPiA+ICsNCj4gPiArLSB3YWtldXAtc291cmNlOiBC
b29sZWFuIHByb3BlcnR5LCBQbGVhc2UgcmVmZXIgdG8NCj4gPiArICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcG93ZXIvd2FrZXVwLXNvdXJjZS50eHQNCj4gPiArDQo+ID4gIEV4
YW1wbGU6DQo+ID4NCj4gPiAgcGNmODUzNjM6IHBjZjg1MzYzQDUxIHsNCj4gPiAgICAgICAgIGNv
bXBhdGlibGUgPSAibnhwLHBjZjg1MzYzIjsNCj4gPiAgICAgICAgIHJlZyA9IDwweDUxPjsNCj4g
PiAtfTsNCj4gPg0KPiA+ICsgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzE+Ow0KPiA+
ICsgICAgICAgaW50ZXJydXB0cyA9IDwxOCBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KPiA+ICsN
Cj4gPiArICAgICAgIHdha2V1cC1zb3VyY2U7DQo+ID4gKyAgICAgICBueHAscnRjLWludGVycnVw
dC1vdXRwdXQtcGluID0gIklOVEEiOw0KPiA+ICsgICAgICAgbnhwLHJ0Yy1pbnRlcnJ1cHQtdHlw
ZSA9IDxJTlRfQTFJRT47DQo+ID4gKyAgICAgICBxdWFydHotbG9hZC1mZW10b2ZhcmFkcyA9IDwx
MjUwMD47DQo+ID4gKyAgICAgICBueHAscXVhcnR6LWRyaXZlLXN0cmVuZ3RoID0gPDYwPjsNCj4g
PiArICAgICAgIG54cCxxdWFydHotbG93LWppdHRlcjsNCj4gPiArfTsNCj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9ydGMvcGNmODUzNjMuaA0KPiA+IGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9ydGMvcGNmODUzNjMuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi42MzQwYmYyZGE4ZjUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9ydGMvcGNmODUzNjMuaA0KPiA+IEBAIC0wLDAgKzEsMTQg
QEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8gI2lmbmRlZg0K
PiA+ICtfRFRfQklORElOR1NfUlRDX1BDRjg1MzYzX0ggI2RlZmluZQ0KPiBfRFRfQklORElOR1Nf
UlRDX1BDRjg1MzYzX0gNCj4gPiArDQo+ID4gKy8qIEludGVycnVwdCB0eXBlICovDQo+ID4gKyNk
ZWZpbmUgSU5UX1dESUUgICAgICAgKDEgPDwgMCkNCj4gPiArI2RlZmluZSBJTlRfQlNJRSAgICAg
ICAoMSA8PCAxKQ0KPiA+ICsjZGVmaW5lIElOVF9UU1JJRSAgICAgICgxIDw8IDIpDQo+ID4gKyNk
ZWZpbmUgSU5UX0EySUUgICAgICAgKDEgPDwgMykNCj4gPiArI2RlZmluZSBJTlRfQTFJRSAgICAg
ICAoMSA8PCA0KQ0KPiA+ICsjZGVmaW5lIElOVF9PSUUgICAgICAgICAgICAgICAgKDEgPDwgNSkN
Cj4gPiArI2RlZmluZSBJTlRfUElFICAgICAgICAgICAgICAgICgxIDw8IDYpDQo+ID4gKw0KPiA+
ICsjZW5kaWYgLyogX0RUX0JJTkRJTkdTX1JUQ19QQ0Y4NTM2M19IICovDQo+ID4gLS0NCj4gPiAy
LjE3LjENCj4gPg0K
