Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896FC3C981
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 12:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbfFKK5W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 06:57:22 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:27342
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727278AbfFKK5W (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jun 2019 06:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlVe/9eQ+Z5lazLBd0+UsOdhBiyNOJNCpjks9cLFfH0=;
 b=rPZyIgvlqrCtpluTKXwFwKAT28c4nzokP6xZKT+cc/wTI8eXjOBnd+cKkEHpGPE6ebNDP7p3SDPaZ2poa54HUqJuSYQhxzFS1jkd0whOZwgDnPfII5/xfDNavudAUmzCrhmIjpIWweWCgC0q5rP53XKvSfi7RBziGV3Bx1N0gyc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6625.eurprd04.prod.outlook.com (20.179.255.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 11 Jun 2019 10:57:17 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:57:17 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Topic: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Index: AQHVIB9eLFB8Mq7xjEewJLm6jwQNUKaWSDkw
Date:   Tue, 11 Jun 2019 10:57:17 +0000
Message-ID: <AM0PR04MB4211DC4725A5FEBDC995560680ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
 <20190611063333.48501-2-Anson.Huang@nxp.com>
In-Reply-To: <20190611063333.48501-2-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd4e5133-3369-4a20-9834-08d6ee5b91d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6625;
x-ms-traffictypediagnostic: AM0PR04MB6625:
x-microsoft-antispam-prvs: <AM0PR04MB662591CE4F207D035FAD8AC980ED0@AM0PR04MB6625.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(76116006)(71200400001)(6246003)(73956011)(81156014)(7736002)(66946007)(66066001)(486006)(316002)(26005)(68736007)(476003)(2501003)(110136005)(33656002)(44832011)(14454004)(53936002)(229853002)(74316002)(55016002)(186003)(81166006)(6436002)(8676002)(102836004)(2906002)(76176011)(6116002)(5660300002)(7696005)(2201001)(305945005)(66556008)(66446008)(66476007)(71190400001)(52536014)(25786009)(7416002)(14444005)(8936002)(4744005)(3846002)(9686003)(11346002)(4326008)(64756008)(99286004)(86362001)(6506007)(478600001)(256004)(446003)(41533002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6625;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XK32MEVhbAfX4NvBUcfMH98p3rM6OBgRcGIipMyAlDYDqppy185Prm0RxaexAv7lByfWG5zMaMLb1Ql9aBCxocYRXbBhw3Rr9cOq7N4sD3FOCQrpnJBhNp/vVeXgJw5WQtEGvAdEdYr+QENuZsUCgsnfCPkVSNXaCRzEf0hCPHWLHmRc21GcUnPzEL77Q/O45znpz8upNAbOkPIZtpZDpJ75SX3BSfpYCP5uX1L+Q8SCE0LtdupWwO7kVNGHoAp+apL3PS0upV9rKMp0CvBSIFEIN3Sm5VRZtXfc8HmRMcKxa42SMxRncySLkHrMO0GeiuccxmjMVYSHTD3Dt9qrevM0/ldth7SJz41hdYDc0s1STjwMyEqhLebGFKok9V7at+2e4xZ7xcpv6jgSGtEX7/8DmkMZfQB88+xzrhPEfAs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4e5133-3369-4a20-9834-08d6ee5b91d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:57:17.4092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6625
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIFttYWlsdG86QW5zb24uSHVhbmdAbnhwLmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgSnVuZSAxMSwgMjAxOSAyOjM0IFBNDQo+IA0KPiBpLk1YIHN5c3Rl
bSBjb250cm9sbGVyIFJUQyBkcml2ZXIgY2FuIHN1cHBvcnQgYWxsIGkuTVggU29DcyB3aXRoIHN5
c3RlbQ0KPiBjb250cm9sbGVyIGluc2lkZSwgdGhpcyBwYXRjaCBtYWtlcyB0aGUgY29tcGF0aWJs
ZSBzdHJpbmcgbW9yZSBnZW5lcmljIHRvDQo+IHN1cHBvcnQgb3RoZXIgaS5NWCBTb0NzIHdpdGgg
c3lzdGVtIGNvbnRyb2xsZXIgaW5zaWRlLCBzdWNoIGFzIGkuTVg4UU0gZXRjLi4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KDQpSZXZpZXdl
ZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KRG9u
ZyBBaXNoZW5nDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3J0Yy9ydGMtaW14LXNjLmMgfCAyICstDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtaW14LXNjLmMgYi9kcml2ZXJzL3J0Yy9ydGMtaW14
LXNjLmMgaW5kZXgNCj4gYzkzMzA0NS4uMzhlZjNjYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9y
dGMvcnRjLWlteC1zYy5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1pbXgtc2MuYw0KPiBAQCAt
MTc4LDcgKzE3OCw3IEBAIHN0YXRpYyBpbnQgaW14X3NjX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlDQo+ICpwZGV2KSAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGlteF9zY19kdF9pZHNbXSA9IHsNCj4gLQl7IC5jb21wYXRpYmxlID0gImZzbCxpbXg4
cXhwLXNjLXJ0YyIsIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14LXNjLXJ0YyIsIH0s
DQo+ICAJe30NCj4gIH07DQo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBpbXhfc2NfZHRfaWRz
KTsNCj4gLS0NCj4gMi43LjQNCg0K
