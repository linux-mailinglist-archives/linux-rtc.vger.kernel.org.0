Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C20AE202
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2019 03:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfIJBlp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Sep 2019 21:41:45 -0400
Received: from mail-eopbgr130051.outbound.protection.outlook.com ([40.107.13.51]:35056
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726482AbfIJBlp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 9 Sep 2019 21:41:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzccH3tx1iSUC6rqC7nTv14mGh2IEieuQTgeQaQZ+izPq44QKkwVFQi607vfReSm/OUl92QDqfSPDqgAT2BehDfJ5VbtR93dSd/G7/W+rV4zI3PO7co7RTU+9p6BNGg8jT7urhXM82I0SD+FAvsRpOnGDwllVb5xyuUopeEYNVpjw7yrziiBiW+DSPKTSVUvBExyScE0gSmJ9t6p8ftqhrPAeoYQI7HZowmLj2BNlDygaKc0Of2oRMypK2uINOyORf9tzaTlJV23vkG7waw099sP2MQqkgRVaSGckN5UUdBJKIP4/FAVbWBDzysBimQgq1FzXeidZNiQv2DEx9BojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooo5znk0qFssS3wXHpbr/wkpPKNZEyPUlnuoRuzeKbI=;
 b=VVmfoRhIeffdCXzDUWAA60+4Q7ZGrWERUJZHbfbrrefH0ky1Un4fH7bBI6YfM+j8bZZrV58LyfNmprUDoRp/O32gTU+97+LQRF5Y0X7YNSLgISfS2efNL4xuAjFo1xqXhAZR2/Gp5GTkCwoo90TY7sUq37x4dj8E7pHwBQiffJD31X85D2iCF34GdTvo1PY4G5AI5aeTh8ffgDo7uAzsUtmF9Y5B8j0C2NfrtCgFeRZ8ltMMTM3SCadFIERcC8It1qODfZb9GQg0ZqWoQhr8mjezAR7qd+EDNXXzS0Bpc6piVEOE0tdeXRRqDlZgXUCtf4CZU6xQYz+tOqnWOeyxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooo5znk0qFssS3wXHpbr/wkpPKNZEyPUlnuoRuzeKbI=;
 b=q21twCwSAo17Ku2P9dtZR8kzna+thd6c41HXtplGF+JOtb6NqLoWVOmgZQebgyraY7moQqkE1dEbKpKIzJF4fAvRf1Ip7kcixqYVA/5jTtImhyeAhEYRzunsTXxxe9dKjcUvBfLIL7mAMOdF8esteT+6V/9PAxzBSXdGSUQ+9pg=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4153.eurprd04.prod.outlook.com (52.134.111.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 01:41:40 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 01:41:40 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     'Martin Fuzzey' <martin.fuzzey@flowbird.group>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Leo Li <leoyang.li@nxp.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: RE: [EXT] Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Topic: [EXT] Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Index: AQHVYiDislXlKba5R0W8Eh4TiH+l96cZsgSAgASsY5A=
Date:   Tue, 10 Sep 2019 01:41:39 +0000
Message-ID: <DB7PR04MB4490B81B55B223555181D1808FB60@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190903061853.19793-1-biwen.li@nxp.com>
 <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
In-Reply-To: <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd75802d-5310-44ac-401b-08d7359006cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4153;
x-ms-traffictypediagnostic: DB7PR04MB4153:|DB7PR04MB4153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB415313A1D029EED048C9F22A8FB60@DB7PR04MB4153.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(8676002)(102836004)(54906003)(11346002)(478600001)(446003)(55016002)(76116006)(5660300002)(7696005)(6636002)(6246003)(76176011)(52536014)(53936002)(229853002)(9686003)(110136005)(2501003)(6436002)(99286004)(4326008)(186003)(33656002)(316002)(14454004)(66556008)(71190400001)(71200400001)(66446008)(64756008)(6116002)(66476007)(3846002)(2906002)(7736002)(8936002)(476003)(25786009)(53546011)(86362001)(66066001)(26005)(81166006)(81156014)(66946007)(256004)(486006)(305945005)(74316002)(44832011)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4153;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M2ZmFBvBqSlev1A7Cx7V08ju1wIqbGTC7wz0U9eL47jNXUT+4OMi7AZeiAKCknrnFv1Mktw+Xr/exKKJ37PX2nIUX/RdudlcyJQUXA69L34dYRNh+JMGlJyCGs6fJ5B/fQ1GuA5/x4Gb9Gb46nOvh6d5LHIaYj/6I8K7nILR9LSi0mSoDocvuMpLueA0pkhcUOPkeG5O5IIxbRcTpsAqH3hw0dRSlbH++MRODbPJ6rKusWPsPl8uzVLApYhzmkQvA1B6j+ChYfce5xxJNRTAp39iAiQXYx/PSL1G8+MG9zh0wE3PU2DOoWB7PK4nQiOaqQcUV6dSNVAFMyHpq3e8+6TRNL993Lk09N7F3v2wuo9SgJpL9/e0olb1T5TOyHFs32CJr6Vq/sirmFFMkbCHKI9O0FhvpdCiKyY8WDlVRlI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd75802d-5310-44ac-401b-08d7359006cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 01:41:40.0207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4ihDpBRgN/cePUMo48/+3kqgXKe2eNBz+lqbgyP5vGtpi45drLWL9NKWyGSReOkthLSiI2UBqV2oAMxyMM3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4153
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gT24gMDMvMDkvMjAxOSAwODoxOCwgQml3ZW4gTGkgd3JvdGU6DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcGNmODUzNjMudHh0DQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3BjZjg1MzYzLnR4dA0K
PiA+IGluZGV4IDk0YWRjMWNmOTNkOS4uNTg4ZjY4OGIzMGQxIDEwMDY0NA0KPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcGNmODUzNjMudHh0DQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9wY2Y4NTM2My50eHQNCj4g
PiBAQCAtOCwxMCArOCwzOSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICAgT3B0aW9uYWwg
cHJvcGVydGllczoNCj4gPiAgIC0gaW50ZXJydXB0czogSVJRIGxpbmUgZm9yIHRoZSBSVEMgKG5v
dCBpbXBsZW1lbnRlZCkuDQo+ID4NCj4gPiArLSBpbnRlcnJ1cHQtb3V0cHV0LXBpbjogVGhlIGlu
dGVycnVwdCBvdXRwdXQgcGluIG11c3QgYmUNCj4gPiArICAiSU5UQSIgb3IgIklOVEIiLCBkZWZh
dWx0IHZhbHVlIGlzICJJTlRBIg0KPiA+ICsNCj4gDQo+IA0KPiBUaGUgaGFyZHdhcmUgaGFzIDIg
aW50ZXJydXB0IHBpbnMgd2hpY2ggY2FuIGJlIG1hcHBlZCB0byB2YXJpb3VzIGludGVycnVwdA0K
PiBzb3VyY2VzIChhbGFybTEsIGFsYXJtMiwgcGVyaW9kaWMsIC4uLikNCj4gDQo+IEN1cnJlbnRs
eSB0aGUgZHJpdmVyIG9ubHkgc3VwcG9ydHMgYWxhcm0xLg0KPiANCj4gSXQgaXMgZXZlbiBwb3Nz
aWJsZSB0byB1c2UgYm90aCBwaW5zIGZvciB0aGUgc2FtZSBpbnRlcnJ1cHQgKGVnIGlmIElOVEEg
d2VyZQ0KPiB3aXJlZCB0byB0aGUgU29DLCBJTlRCIHRvIGEgUE1JQyBhbmQgYm90aCB1c2VkIGZv
ciBhbGFybS4uLikNCj4gDQo+IA0KPiBTbyBtYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2
ZQ0KPiANCj4gYWxhcm0xLWludGVycnVwdC1vdXRwdXQtcGluOiBUaGUgaW50ZXJydXB0IG91dHB1
dCBwaW4gdXNlZCBmb3IgdGhlIGFsYXJtDQo+IGZ1bmN0aW9uLiBNdXN0IGJlICJJTlRBIiwgIklO
VEIiIG9yICJCT1RIIg0KSSB3aWxsIGZpeCBpdCBpbiB2NC4NCj4gDQo+IFRoZW4sIGlmIGFuZCB3
aGVuIG90aGVyIHR5cGVzIG9mIGludGVycnVwdHMgYXJlIHN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
IG5ldw0KPiBwcm9wZXJ0aWVzIGNvdWxkIGJlIGFkZGVkIGZvciB0aGVtLg0KPiANCj4gDQo+IA0K
PiA+ICstIHF1YXJ0ei1sb2FkLWZlbXRvZmFyYWRzOiBUaGUgaW50ZXJuYWwgY2FwYWNpdG9yIHRv
IHNlbGVjdCBmb3IgdGhlIHF1YXJ0ejoNCj4gPiArICAgICBQQ0Y4NTI2M19RVUFSVFpDQVBfN3BG
ICAgICAgICAgIFswXQ0KPiA+ICsgICAgIFBDRjg1MjYzX1FVQVJUWkNBUF82cEYgICAgICAgICAg
WzFdDQo+ID4gKyAgICAgUENGODUyNjNfUVVBUlRaQ0FQXzEycDVwRiAgICAgICBbMl0gREVGQVVM
VA0KPiA+ICsNCj4gDQo+IA0KPiBUaGUgc3RhbmRhcmQgRFQgcHJvcGVydHkgInF1YXJ0ei1sb2Fk
LWZlbXRvZmFyYWRzIiB0YWtlcyB0aGUgcmVhbCBwaHlzaWNhbA0KPiB2YWx1ZSBpbiBmZW10byBG
YXJhZHMgaWUgdmFsdWVzIHNob3VsZCBiZSA3MDAwLCA2MDAwLCAxMjUwMCB3aXRob3V0DQo+IGRl
ZmluZXMuDQoNCk9rLCBJIHdpbGwgcmVtb3ZlIHRoZXNlIGRlZmluZXMgaW4gdjQuDQo+IA0KPiAN
Cj4gPiArLSBueHAscXVhcnR6LWRyaXZlLXN0cmVuZ3RoOiBEcml2ZSBzdHJlbmd0aCBmb3IgdGhl
IHF1YXJ0ejoNCj4gPiArICAgICBQQ0Y4NTI2M19RVUFSVFpEUklWRV8xMDBrbyAgICAgIFswXSBE
RUZBVUxUDQo+ID4gKyAgICAgUENGODUyNjNfUVVBUlRaRFJJVkVfNjBrbyAgICAgICBbMV0NCj4g
PiArICAgICBQQ0Y4NTI2M19RVUFSVFpEUklWRV81MDBrbyAgICAgIFsyXQ0KPiA+ICsNCj4gDQo+
IA0KPiBOb3Qgc3VyZSBhYm91dCB0aGlzLg0KPiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRv
IGVpdGhlciB1c2UgYSByZWFsIGltcGVkZW5jZSB2YWx1ZSBpbiBvaG1zIChsaWtlIGxvYWQNCj4g
cHJvcGVydHkgYWJvdmUsIGV2ZW4gdGhvdWdoIGl0IGlzIGEgdmVuZG9yIHNwZWNpZmljIHZhbHVl
KSByYXRoZXIgdGhhbiBhDQo+IGRlZmluZSwgb3IgZGVmaW5lcyBmb3IgIkxvdywgTWVkaXVtLCBI
aWdoIj8NCk9rLCBJIHdpbGwgcmVwbGFjZSBkZWZpbmVzIHdpdGggYSByZWFsIGltcGVkZW5jZSB2
YWx1ZSBpbiB2NC4NCj4gDQo+IA0KPiBNYXJ0aW4NCj4gDQoNCg==
