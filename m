Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA1486C735
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2019 05:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390235AbfGRDI1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 23:08:27 -0400
Received: from mail-eopbgr150079.outbound.protection.outlook.com ([40.107.15.79]:56637
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390726AbfGRDI0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 23:08:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naNRTf0MF7d8vAowc3xxdJqIXVKi1/ZRxTbkoXkHlLv/LS/3ZHg0ATPXWm//c4F8KfwBRK58nUZoatqm7Ka4EOapXuPHmK0C+U/empF4iPf8g+Jm7iVWYtgZOS5kmFUK1sfzf8+gEZjfRRwi4c6H1ABEcMqftdD1zIrFn8QfNKTnKWwjazpYWpirk/iP4sqPpmMLuCWDq6Rkrh9kFd76EUrqjLOvBz4h3zo74CpWC5wRZGCQzToI5gMmFrAlgDYAKwHUt6UBPbMpntUf14Ko4U30WPkGGoFczdqe+g73wCSK8tUCzn7KASBx7iBDLtZPnPXfUftNflPBGD3dLUoczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5Wi67jxuxarZ8dvPAmDtWkKkhBBQBCw/I+PxHGWy/w=;
 b=Mns/FR6TE4KUIRxg18EUs/BSOGDFAWhTnDk1d0CkOgSUe0XnKtkj2YngNR0LLKll+6qX7egq1ymdmRHul6w7S9ipPlmiCpVDGWTiqK4WbjPm/BbvvA2xNoGitZUW1nzT4/+SGvPpIGdNiIpuG9jLE2WJgpkjTS/UufCIxpk5SN5WjAHhOmEdPlr2Vaz0MskfzmjHWI/FEcJ7XmTKU/VTEkMo9Qp2F/9e9qf2NYMT7a/UKuxm2Pv7vLfhQoySTQJDh2amkJxOeAwrsdk5TPgAFqSHst7l5jiaHj2QeFYSuDTgxcPnSVQxn8SJl+YhYxzMqYdzmVmHBZlGyVJnF74DeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5Wi67jxuxarZ8dvPAmDtWkKkhBBQBCw/I+PxHGWy/w=;
 b=m7rb0cQ+BNDpHOOKRuBU5hJ2I+BP+9nRqhBo9zR7518l3Pj7m9OV+A00WDIv1jJcicXxbZH4jmD98klC4XXY3vMANfYHQmI2A/0uGd0hifhyehlFJHup6UQq2cDwk4ax1tGxVlPOAkJHRgR6guVkN8j3yTMMo04fOUsNvK6atXg=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5953.eurprd04.prod.outlook.com (20.178.112.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 03:08:23 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 03:08:23 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gHMxHdHnXuaUKbGcyVjkrm8qbOo7lwgAA0LoCAANxVEA==
Date:   Thu, 18 Jul 2019 03:08:23 +0000
Message-ID: <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
 <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63865b9f-7071-4c02-c00e-08d70b2d31c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5953;
x-ms-traffictypediagnostic: AM0PR04MB5953:
x-microsoft-antispam-prvs: <AM0PR04MB5953134A874E93D17AC64F5180C80@AM0PR04MB5953.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(2501003)(53936002)(26005)(2906002)(76176011)(25786009)(102836004)(86362001)(6506007)(7696005)(66946007)(64756008)(305945005)(66476007)(6246003)(52536014)(71200400001)(4326008)(2201001)(66446008)(5660300002)(14454004)(186003)(76116006)(71190400001)(11346002)(446003)(66556008)(74316002)(229853002)(8676002)(55016002)(7736002)(6116002)(81166006)(256004)(66066001)(81156014)(8936002)(14444005)(110136005)(44832011)(99286004)(486006)(316002)(33656002)(476003)(9686003)(478600001)(6436002)(3846002)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5953;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hUWcTHacpmHuW6Zg8q5Z+XibDx3pR2nWMVrNzMDrCmEZgKBbr3ygh46qYgX5Ym1p67zaZXFCzB7CSCTOO/H2Fwb1EZEgFJeLyfhHA8ObtG4Pdl/C5oDVFnfUO7gYCTAlEZt/tkC4xEk6MuXurhagPs3H6sDFaVx9JbQkHb/3z4zOPL269m5kqRAOgrNFuzJcSWlgcjjINqQUxi0UknfHulW9UZWVe3Xn01oE63AaLy74zKBhyeOospjzx648YAB/cqW6ZZyox6q+tYgRsZdBwT3sUeV/7NhWUApqNJsBXPW/A/fHXYgH4QE1/4XY3gDT1ZNV5lY1/JjnISpcgQoPTPB4xfMbXr4ig8hVkI1rlDSda90z3kUFF+HvU6QwHNHmzorlRCCtLy0O6m31KvLjC2xzr1/CMBYLJrxV+FQnTzc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63865b9f-7071-4c02-c00e-08d70b2d31c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 03:08:23.1462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5953
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkgOTo1
OCBQTT4gDQo+IEhpLCBBaXNoZW5nDQo+IA0KPiA+ID4gRnJvbTogQW5zb24uSHVhbmdAbnhwLmNv
bSA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMTYsIDIw
MTkgMzoxOSBQTQ0KPiA+ID4NCj4gPiA+IFRoZSBSVEMgSVJRIGlzIHJlcXVlc3RlZCBiZWZvcmUg
dGhlIHN0cnVjdCBydGNfZGV2aWNlIGlzIGFsbG9jYXRlZCwNCj4gPiA+IHRoaXMgbWF5IGxlYWQg
dG8gYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gSVJRIGhhbmRsZXIuDQo+ID4gPg0KPiA+
ID4gVG8gZml4IHRoaXMgaXNzdWUsIGFsbG9jYXRpbmcgdGhlIHJ0Y19kZXZpY2Ugc3RydWN0IGJl
Zm9yZQ0KPiA+ID4gcmVxdWVzdGluZyB0aGUgUlRDIElSUSB1c2luZyBkZXZtX3J0Y19hbGxvY2F0
ZV9kZXZpY2UsIGFuZCB1c2UNCj4gPiA+IHJ0Y19yZWdpc3Rlcl9kZXZpY2UgdG8gcmVnaXN0ZXIg
dGhlIFJUQyBkZXZpY2UuDQo+ID4gPg0KPiA+DQo+ID4gSSBzYXcgb3RoZXIgcnRjIGRyaXZlcnMg
ZGlkIHRoZSBzYW1lIHdheSBhcyB1cywgc28gdGhpcyBsb29rcyBsaWtlIGENCj4gPiBjb21tb24g
cHJvYmxlbS4NCj4gPiBNeSBxdWVzdGlvbiBpcyBpZiB3ZSBjYW4gY2xlYXIgaW50ZXJydXB0IHN0
YXR1cyBiZWZvcmUgcmVnaXN0ZXIgdG8NCj4gPiBhdm9pZCB0aGlzIGlzc3VlIGFzIG90aGVyIHJ0
YyBkcml2ZXJzPw0KPiANCj4gSSB0aGluayB3ZSBjYW4gTk9UIHByZWRpY3Qgd2hlbiB0aGUgSVJR
IHdpbGwgYmUgcGVuZGluZywgSVJRIGNvdWxkIGFycml2ZSBhdA0KPiBhbnkgdGltZSwgdGhlIG1v
c3Qgc2FmZSB3YXkgaXMgdG8gcHJlcGFyZSBldmVyeXRoaW5nIGJlZm9yZQ0KPiByZXF1ZXN0aW5n
L2VuYWJsaW5nIElSUS4NCj4gVGhlcmUgaXMgYWxzbyBwYXRjaCB0byBmaXggc2ltaWxhciBpc3N1
ZToNCj4gDQoNCkkganVzdCBmZWVsIGxpa2UgaXQncyBjb21tb24gaXNzdWUuIEJ1dCBzZWVtcyBj
b21tdW5pdHkgYWxyZWFkeSBkaWQgdGhlIHNhbWUgdGhpbmcuDQpTbzoNClJldmlld2VkLWJ5OiBE
b25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoN
Cj4gY29tbWl0IDA2MDcxMWY1Mjc0ZGZjMmQ3NmE1YjJjZDY1YWJmNmNjYmYwNjFlNDANCj4gQXV0
aG9yOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+
IERhdGU6ICAgVHVlIEFwciAzMCAxMTozMjowOSAyMDE5ICswMjAwDQo+IA0KPiAgICAgcnRjOiBk
aWdpY29sb3I6IGZpeCBwb3NzaWJsZSByYWNlIGNvbmRpdGlvbg0KPiANCj4gQW5zb24NCg0K
