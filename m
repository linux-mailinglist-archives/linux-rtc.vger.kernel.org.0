Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189B5419AA
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2019 02:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405653AbfFLAse (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 20:48:34 -0400
Received: from mail-eopbgr40050.outbound.protection.outlook.com ([40.107.4.50]:19168
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405413AbfFLAsd (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jun 2019 20:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXWHZF95DwEycl0RUeS6J8fj9rYs9oheuVIRC97732Q=;
 b=aIQeWjHK3pz1EUjr9F817IaKy7ke8SfXJlelf3AREHFZOA3rTWR6yF/xovZfcDirub/sxkTwGnk7IoqaD6/eF4QZpRNQ1Fn0krYDMQj8YHFLsijSn7W1x6KHjKgbJFrl4ARQhKSqanrmuFg6Dz5MvLzFB+yVmILaYksQd95knAY=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3692.eurprd04.prod.outlook.com (52.134.65.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Wed, 12 Jun 2019 00:48:27 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec%5]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 00:48:27 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Trent Piepho <tpiepho@impinj.com>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Peng Fan <peng.fan@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: RE: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Topic: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Index: AQHVIB9el1hRP4OpP0mqPxlvyclbtaaW6UGAgAADuICAAEE6AA==
Date:   Wed, 12 Jun 2019 00:48:27 +0000
Message-ID: <DB3PR0402MB3916A7887EBC63477A5297E6F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
         <20190611063333.48501-2-Anson.Huang@nxp.com>
         <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
 <1560285930.2354.8.camel@impinj.com>
In-Reply-To: <1560285930.2354.8.camel@impinj.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c482f7a8-d7eb-442f-da26-08d6eecfaec2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3692;
x-ms-traffictypediagnostic: DB3PR0402MB3692:
x-microsoft-antispam-prvs: <DB3PR0402MB3692DAF118BEB48CD9548CDAF5EC0@DB3PR0402MB3692.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(366004)(136003)(39860400002)(13464003)(199004)(189003)(6436002)(6506007)(53546011)(11346002)(81166006)(446003)(68736007)(186003)(476003)(14454004)(53936002)(81156014)(55016002)(316002)(305945005)(110136005)(52536014)(229853002)(99286004)(9686003)(486006)(2906002)(7736002)(44832011)(7696005)(54906003)(8936002)(8676002)(102836004)(76176011)(478600001)(71190400001)(3846002)(5660300002)(6116002)(6246003)(66066001)(7416002)(74316002)(71200400001)(2501003)(66476007)(256004)(4326008)(66946007)(73956011)(14444005)(26005)(66446008)(64756008)(66556008)(33656002)(76116006)(25786009)(86362001)(41533002)(21314003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3692;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Sjc5NB7ETkfFBBKs4PNMA64RJvPcXS3qoRu9SKBGwVzz0w25ustbk4HUZjJoM0RqLp0lmjfwRfwUY57rvyhQ9pcSL6eAZa386SA29RXavUrdxgb2euMTiUXCEIcwXzgATvX47QoB9dB1PA1/+yh9q3f623K4yg9alav3ukvjn+H/sSafMtctBwxisuckm+7WLczKBl73/C/gxESvrK2a/DlRNPyHFHCZ7BFdiyeNQr4S4jFDoFu3dq3SN/oPyrNJvrkGVppsxDDAi6v/B/BY9AvWnCz/E2opN9WbJ/aas51NzHc6OgnzPqWaWOzaX+nJc96d8OJDlWHLT/koCP+FBi6866NIxtmnr+eNkmKxa9WOylXDMpTGxy0Wf2bH6wdf8trEZ+65C/lX4r9KnTNO/4FpASMz8D81nUQ8H5xGuMw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c482f7a8-d7eb-442f-da26-08d6eecfaec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 00:48:27.5701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3692
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIEZhYmlvL1RyZW50DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
VHJlbnQgUGllcGhvIDx0cGllcGhvQGltcGluai5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVu
ZSAxMiwgMjAxOSA0OjQ2IEFNDQo+IFRvOiBmZXN0ZXZhbUBnbWFpbC5jb207IEFuc29uIEh1YW5n
IDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiBDYzogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdA
bnhwLmNvbT47IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOw0KPiByb2JoK2R0QGtlcm5l
bC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBsaW51eC0NCj4ga2VybmVs
QHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGEuenVtbW9A
dG93ZXJ0ZWNoLml0OyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgUGVuZyBGYW4NCj4gPHBlbmcuZmFu
QG54cC5jb20+OyBzaGF3bmd1b0BrZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Ow0K
PiB1bGYuaGFuc3NvbkBsaW5hcm8ub3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGxpbnV4LXJ0
Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGUNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAyLzNdIHJ0YzogaW14LXNjOiBNYWtlIGNvbXBhdGlibGUgc3RyaW5nIG1vcmUg
Z2VuZXJpYw0KPiANCj4gT24gVHVlLCAyMDE5LTA2LTExIGF0IDE3OjMyIC0wMzAwLCBGYWJpbyBF
c3RldmFtIHdyb3RlOg0KPiA+IEhpIEFuc29uLA0KPiA+DQo+ID4gT24gVHVlLCBKdW4gMTEsIDIw
MTkgYXQgMzozMSBBTSA8QW5zb24uSHVhbmdAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
RnJvbTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPg0KPiA+ID4gaS5N
WCBzeXN0ZW0gY29udHJvbGxlciBSVEMgZHJpdmVyIGNhbiBzdXBwb3J0IGFsbCBpLk1YIFNvQ3Mg
d2l0aA0KPiA+ID4gc3lzdGVtIGNvbnRyb2xsZXIgaW5zaWRlLCB0aGlzIHBhdGNoIG1ha2VzIHRo
ZSBjb21wYXRpYmxlIHN0cmluZw0KPiA+ID4gbW9yZSBnZW5lcmljIHRvIHN1cHBvcnQgb3RoZXIg
aS5NWCBTb0NzIHdpdGggc3lzdGVtIGNvbnRyb2xsZXINCj4gPiA+IGluc2lkZSwgc3VjaCBhcyBp
Lk1YOFFNIGV0Yy4uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFu
c29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3J0Yy9ydGMtaW14
LXNjLmMgfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1pbXgt
c2MuYyBiL2RyaXZlcnMvcnRjL3J0Yy1pbXgtc2MuYw0KPiA+ID4gaW5kZXggYzkzMzA0NS4uMzhl
ZjNjYSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1pbXgtc2MuYw0KPiA+ID4g
KysrIGIvZHJpdmVycy9ydGMvcnRjLWlteC1zYy5jDQo+ID4gPiBAQCAtMTc4LDcgKzE3OCw3IEBA
IHN0YXRpYyBpbnQgaW14X3NjX3J0Y19wcm9iZShzdHJ1Y3QNCj4gPiA+IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikgIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgaW14X3NjX2R0X2lkc1tdID0gew0KPiA+ID4gLSAgICAgICB7IC5jb21wYXRpYmxlID0gImZz
bCxpbXg4cXhwLXNjLXJ0YyIsIH0sDQo+ID4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNs
LGlteC1zYy1ydGMiLCB9LA0KPiA+DQo+ID4gV2hhdCBpcyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50
IGNvbXBhdGlibGUgc3RyaW5nPw0KDQpOb3RoaW5nIHdyb25nLCBqdXN0IHdhbnQgdG8gbWFrZSBp
dCBhbGlnbmVkIHdpdGggb3RoZXIgU0NVIGRyaXZlcnMsIGxpa2UNClNDVSB3YXRjaGRvZywgU0NV
IHRoZXJtYWwgZXRjLiwgdGhlIGRyaXZlciBPTkxZIGNvbnRhaW5zICJmc2wsaW14LXNjLXh4eCIN
CmNvbXBhdGlibGUgc3RyaW5nLCB0aGVuIGZvciBuZXcgU29DLCB3ZSBjYW4ganVzdCBhZGQgaXQg
YXMgY29tcGF0aWJsZSBvcg0KZmFsbGJhY2sgY29tcGF0aWJsZSBzdHJpbmcsIG5vIG5lZWQgdG8g
ZG8gYW55IGNoYW5nZSBmb3IgZHJpdmVyLiAgDQoNCj4gPg0KPiA+IElmIHlvdSB3YW50IHRvIHN1
cHBvcnQgaS5NWDhRTSBqdXN0IGFkZCBpbiBpdHMgZHRzaToNCj4gPg0KPiA+IGNvbXBhdGlibGUg
PSAiZnNsLGlteDhxbS1zYy1ydGMiLCAiZnNsLGlteDhxeHAtc2MtcnRjIg0KPiA+DQo+ID4gYW5k
IGFkZCBhIGR0LWJpbmRpbmdzIGVudHJ5IGZvciAiZnNsLGlteDhxbS1zYy1ydGMiDQoNCkkgYW0g
T0sgaWYgd2UgY2FuIGp1c3QgdXNlICIgZnNsLGlteDhxeHAtc2MtcnRjIiBhcyBmYWxsYmFjayBj
b21wYXRpYmxlIHN0cmluZw0KZm9yIGxhdGVyIFNvQ3MuDQoNCj4gDQo+IFllcywgSSB0aG91Z2h0
IHRoaXMgaXMgKHdhcz8pIHRoZSByZWNvbW1lbmRlZCBwcmFjdGljZSBmb3IgSVAgYmxvY2tzIGlu
IFNvQ3MNCj4gdGhhdCBkb24ndCBoYXZlIHRoZWlyIG93biB2ZXJzaW9uICh2cyBzb21ldGhpbmcg
bGlrZSBhIFN5bm9wc2lzIGJsb2NrIHVzZWQNCj4gbWFueSBwbGFjZXMpOg0KPiANCj4gKiBVc2Ug
dGhlIGZpcnN0IFNvQyB0byBoYXZlIHRoZSBibG9jayBhcyB0aGUgYmFzZSBjb21wYXRpYmxlIGZv
ciB0aGUgYmxvY2suDQo+ICogQWx3YXlzIGFkZCB0aGUgY3VycmVudCBTb0MsIGluIGFkZGl0aW9u
YWwgdG8gdGhlIGJhc2UsIGluIHRoZSBTb0MncyBkdHMncyBsaXN0DQo+IG9mIGNvbXBhdGlibGVz
LiAgRXZlbiBpZiB1bm5lZWRlZCBhdCB0aGUgcHJlc2VudC4NCj4gKiBUaGUgZHJpdmVyIHdpbGwg
bGlzdCB0aGUgYmFzZSBjb21wYXRpYmxlIGluIHRoZSBtYXRjaCB0YWJsZSwgYW5kIHdpbGwgYWRk
IG5ldw0KPiBvbmVzIGZvciBzcGVjaWZpYyBzb2NzIGlmL3doZW4gdGhlcmUgaXMgYSBuZWVkIGZv
ciBpdC4NCg0KTWFrZSBzZW5zZSwgSSB3YXMgcmVjb21tZW5kZWQgdG8gbWFrZSB0aGUgZmFsbGJh
Y2sgY29tcGF0aWJsZSBzdHJpbmcgYWxpZ25lZA0KZm9yIGFsbCBTQ1UgZHJpdmVycywgZm9yIG1l
LCBJIGFtIE9LIHdpdGggZWl0aGVyIHdheSwgc28gaWYgeW91IHRoaW5rIGl0IGlzIE5PVCBuZWNl
c3NhcnkNCnRvIGRvIGl0LCB3ZSBjYW4gZHJvcCB0aGlzIHNlcmllcy4NCg0KVGhhbmtzLA0KQW5z
b24NCg0K
