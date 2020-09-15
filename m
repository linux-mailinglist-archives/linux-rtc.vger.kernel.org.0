Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0ACA269C85
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 05:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgIOD0R (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 23:26:17 -0400
Received: from mail-eopbgr20047.outbound.protection.outlook.com ([40.107.2.47]:50502
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725953AbgIOD0N (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 14 Sep 2020 23:26:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebxOzbMeXXHnP015iA+13kdt4A/HKeZE02YUy/JVZz6w0yK/aCJD6NCqAPBhhCMnrfVX7cH6k544XKWSeTdAHNwZMgCjuqWbT6GFcztREEdHG4iQXYQiXBQA+TySQkoyYe1Lv068cOBmnF9h7PhnDWNWqCZTAoJPWMvtx6grdfAGDpRLR7ZeP1wyWJln9/h2oAOgXBDVcFTM3m0I1bmGVk8YaCiGWHlML1W2KZ/6u6a+8AEb9eP9m5SxhWpsiU3UuYTiuk9ZbVw458FQfIaw8EfmpJWrXWZVNLG8IBZ1CaCDUA84sKhd+0EsK5RcQiU23l6biuT1Qj48lt/iCFxenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBMufntkQpisvnVjGbQZeVFf5FmAQmy58GMtwpsdiOo=;
 b=oZ1B9NfKeVm1Vl5bKYXlBqidLkiroOsdE6jk+5xFAWRZ32mDDBfEsi/3FzQlB7hnVz/4tJlcapPYcoBufkc+IaavYz2ODzWgNsqBGqwoSZLR2nbRScTK4qHTfBfFfGC39hdB+2WU+LpOklNCLLuXXHT0EDFTuN8udkoZJRMLlGh/TEc3envUODBNv/6Vf7FRECopZN72GYST/EJYqc+seFEO688C31P4DWp1b6HpwFizPjSALTUVzuBOq2BWLzdcLz7lO0yotuLruva4uZ1WCxAVxZSOdbZFU3r5OHQeZ+wMDNnfFgEOBC9o3gB1Coq8uEfs0kpYfVP2IDp1jZUTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBMufntkQpisvnVjGbQZeVFf5FmAQmy58GMtwpsdiOo=;
 b=iXnZbX0u1nYIQO0nVWnVgCGEwQnpz7oXyxYi/AbjjrVcUXTF7v+EvPNYTD+5Iaco9lYpOpg5seH22g97pFnIaFHnfHO5i8NWC451uJKRsTZLCiCdZd57RVkh52X+Xh7oi+rFe9BAK3W5YAPRZ7gf9G9DK2w7Qs6JVsFIb7eyJSQ=
Received: from DB8PR04MB6763.eurprd04.prod.outlook.com (2603:10a6:10:10b::28)
 by DB7PR04MB5402.eurprd04.prod.outlook.com (2603:10a6:10:8f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 03:26:06 +0000
Received: from DB8PR04MB6763.eurprd04.prod.outlook.com
 ([fe80::7926:bb74:b8fa:4447]) by DB8PR04MB6763.eurprd04.prod.outlook.com
 ([fe80::7926:bb74:b8fa:4447%4]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 03:26:06 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Topic: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Index: AQHWfFOV2mqT9X+P3UaXnJvGvvBfp6lg1ekAgAByYLCAAkefAIAEQfJwgAB+QYCAANZUsA==
Date:   Tue, 15 Sep 2020 03:26:05 +0000
Message-ID: <DB8PR04MB67634AD32DFDB48E48A351BB91200@DB8PR04MB6763.eurprd04.prod.outlook.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
 <20200909202456.GA3019412@bogus>
 <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
 <VE1PR04MB6768F9352B510CB6E873515A91230@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAL_JsqJMnkt0=AKh36bCpsmkACHMoQbVyuh65NL4PXrvt4A+ag@mail.gmail.com>
In-Reply-To: <CAL_JsqJMnkt0=AKh36bCpsmkACHMoQbVyuh65NL4PXrvt4A+ag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18f54c49-2be3-4a0b-8590-08d8592714d5
x-ms-traffictypediagnostic: DB7PR04MB5402:
x-microsoft-antispam-prvs: <DB7PR04MB5402572B7DD2F31CF02CD2C191200@DB7PR04MB5402.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i2BSbNOV0nYuLGN55bzbCol7C0psJsiYEIPqKjg53V8Le9NDjsmn8V53QI/sSJLdj5kKynXOuODvU2Vs6k3cz2JrelNblF5jredKfhe/Lc+YLslb5dKIb6M2627wi/gTrQVmdG3rIZQN7T+Nzh5tgeS/01NvEcXue5ZdrpufCvwKiXQTrYE1uSuwr973xHJc/WdKs6QJBugsoME8bHEUYFrCyEKM+4Gv6cOQCUtv0whfqmWICZD++jVYOqk6Jr7LfUwXwYBWjcAF5Hb0AhYhNegPfzp6l3Ga36LbCZtZu4Qy6ZY1h1Rpplgp6EQRJzDsFwvg1IkfpXDY53kqdVitgqmUbwdaXEzfYRajKnv+BsU4xHOcmXkZtyg79yWrqQkp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6763.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(8676002)(71200400001)(316002)(186003)(52536014)(4326008)(6916009)(33656002)(2906002)(55016002)(6506007)(53546011)(26005)(66556008)(86362001)(76116006)(9686003)(7696005)(8936002)(66446008)(64756008)(66946007)(66476007)(478600001)(5660300002)(83380400001)(44832011)(54906003)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8wAR/YF4bTBjkR2eYctK0TtpqXtY4cjkqar/UCu03opGQ+vtNJzbtCIPAy0pMCbVBLV/XgoglvreUjRdklKzxWaGp9Z9TpydqA1KC/PtkC3/+OReaSH4OgO/Y+Kv/9WQvAx0gNmNjbs03Gj/CUXR+KavLeENwaDzgutMcX/bltXpw1dLkXvilqxDnZ/yTsg59cso0PWhBy5KQTH2z2IUFByGV/EHg4axobadrcfeI+B+ED1jKL6WEDAzDudvZzaYGbjG4yk2lGIBn/13KJXvMYCmKnc9CQBJGGXKYbMTn+6p0OmILiw1MRnnR2L1d8H4ffG6ktnO7GvRCvcKQ9uqcAmpQSrbUdDhGknkNBhWDUS8Cdr5jK4py6ztGKfpgUay1NxOrDI+tC+vlusJegmIMwETlMj4g1CTC4TZ+0fjzY73yk/2tZKmhwRLf7OfVrPrWaDcDkEeLVIP1MfhuAQsczDe3Zd3rnd3DjEN9iNliIVGRj5wVMGDSX/g3Pzn3Ej0gy9RrzE0Ha25INNc5e8/DkBvmElTdsxyKyeWCuvEUv+pKqWoeeNgvVOERCJf9ocC5NqkBdLAT14hllKhDNANgQh1u5QgmH5o8rW/ewGQV/X+HB4NVGmycrfyxHpRsf1qtVZHRaYf5CDQdOjQJife4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6763.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f54c49-2be3-4a0b-8590-08d8592714d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 03:26:05.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJzK54t6F48xpQsXdhhF8N6Z6u6gkLvPvTEHSEfHwt/smyNrxrmiT6EnFL7pVbdIHlVtc2vdhX2jiVxtpFaEhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5402
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCBTZXAgMTQsIDIwMjAgYXQgMjI6MzYsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ55pyIMTTml6UgMjI6MzYN
Cj4gVG86IFFpYW5nIFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNvbT4NCj4gQ2M6IGEuenVtbW9AdG93
ZXJ0ZWNoLml0OyBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbTsNCj4gbGludXgtcnRjQHZn
ZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGR0LWJpbmRpbmdz
OiBydGMtMjEyNzogQWRkIGJpbmRpbmdzIGZvcg0KPiBueHAscnRjLTIxMjcudHh0DQo+IA0KPiA+
ID4gPiA+ID4NCj4gPg0KPiA+IFBsZWFzZSBoZWxwIHRvIHJldmlldyBhcyBiZWxvdywgaWYgaXQg
aXMgb2ssIEkgd2lsbCBzZW5kIHRoZSBuZXcgdmVyc2lvbiBwYXRjaC4NCj4gVGhhbmsgeW91IQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
dGMvbnhwLHBjZjIxMjcueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9ueHAscGNmMjEyNy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwLi44MDlkZDU5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBjZjIxMjcueWFtbA0KPiA+IEBA
IC0wLDAgKzEsMzggQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiANCj4gRHVhbCBsaWNlbnNlIG5ldyBiaW5kaW5ncyBwbGVhc2U6DQo+ID4gKw0KPiA+ICt0aXRs
ZTogUENGIFJUQ3MNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gUWlhbmcgWmhh
byA8cWlhbmcuemhhb0BueHAuY29tPg0KPiA+ICsNCj4gPiArDQo+ID4gKyAgbm8td2F0Y2hkb2c6
DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gbWF4SXRlbXMgaXMgZm9yIGFycmF5cy4gV2hh
dCdzIHRoZSB0eXBlIGhlcmU/IEl0IHNob3VsZCBoYXZlIGEgZGVzY3JpcHRpb24gdG9vLg0KDQpJ
cyBpdCBvayBhcyBiZWxvdz8NCiAgbm8td2F0Y2hkb2c6DQogICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KICAgIGRlc2NyaXB0aW9uOg0KICAgICAgV2l0aCB0
aGlzIHByb3BlcnR5LCB0aGUgZGV2aWNlIHdpbGwgbm90IHJlZ2lzdGVyZWQgYXMgYSB3YXRjaGRv
ZyBkZXZpY2UuDQoNCj4gPiA+DQo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvd3JpdGlu
Zy1zY2hlbWEucnN0IGFuZCBhYm91dCAxMDAwIGV4YW1wbGVzDQo+ID4gPiBpbiB0aGUga2VybmVs
IHRyZWUuDQo+ID4gPg0KPiA+ID4gUm9iDQpCZXN0IFJlZ2FyZHMNClFpYW5nIFpoYW8NCg==
