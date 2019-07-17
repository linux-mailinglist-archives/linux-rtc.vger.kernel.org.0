Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0226BABF
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 12:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732437AbfGQKyK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 06:54:10 -0400
Received: from mail-eopbgr150059.outbound.protection.outlook.com ([40.107.15.59]:11357
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732444AbfGQKyK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 06:54:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVBoi0Y6U6xpmbWrzryyv5RDxm6xOeSBhOAm2AjkkQXRtTAg7RGNokQ/QvFpudGz/qfjDR7gs0JIspCrMLnTZ3xFGiNq91lGx+LmbyXqKo/Gvn8OLxIupEVlvWgV1ncmt1Iut1zuVzuBkn5DgkE9v5XzySaZZIDCdGeVvOluuvD5Dt9zR8AVbG+mky2AVPQ5J1h6GuUBcOVFuYyG2nxJBrIL7qLh0IeiFLaswtFT2l0q4dny8HZf+fUzaldkvqGOGdk6gIoAZZTDoUm7G21Nw3yTUg97vPxDbPZNARY8riYIc3vIHcOC2hnFqBzAA04sWtRxs7Jl50feq5zm45CnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkzfKilvvJBKmzjwz1nIiNeWacGq6WRZTFbyPuYikrg=;
 b=jvn347VaIoVyyTjgRHHoYniHZ+c0T/fxE0S951Q/jekDBFtCkR/iNjSFYjtLER3cCqstBGheCDGY7lHpS049qhRnHUFV0DB3azkvgb6B7Jb+8j/IF8mcFaQ1cWju3cubqwE3p3ePetZLLDWAH+KGefQ98HAnR/Yyhfx3mD7h3XQADk5dqXZHOsN6YpJqtFbVkkca9uDcuOt0nYIJ+vgLpCn2aKpP6bKPnPe4hn1LelSsKTXGHCYpERFGKGCydncTtrvRBsvCN/qXTa9VRiSc2n3R412146UXRjYzeCF9p1xH5v8prFW6vRMq7AQbOtJxuneJ4RMPPvj2T9KcbCQevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkzfKilvvJBKmzjwz1nIiNeWacGq6WRZTFbyPuYikrg=;
 b=Wiewj6GEzEQ66yZx8R2kOPZI5lwbqIKXIQI47ABWpgY9ujLvj3koNd7b+Uhu5UByRJ8ZSXYL1uP/svr/F4yVwpYEeZV7jXnqAAPQ4X6o38vTISB7clVpdrIj3sB/b2k8lPtnPXJHPeklRTuO+dSJ7CqRYREbrbW0MOPv92pV5CI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4449.eurprd04.prod.outlook.com (52.135.148.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 10:54:07 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:54:07 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gHMxHdHnXuaUKbGcyVjkrm8qbOo7lw
Date:   Wed, 17 Jul 2019 10:54:06 +0000
Message-ID: <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
In-Reply-To: <20190716071858.36750-1-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 343873ac-6183-4993-e644-08d70aa51724
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4449;
x-ms-traffictypediagnostic: AM0PR04MB4449:
x-microsoft-antispam-prvs: <AM0PR04MB44494D10ED00B27E3FADC24480C90@AM0PR04MB4449.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(9686003)(55016002)(316002)(110136005)(71190400001)(33656002)(25786009)(71200400001)(478600001)(52536014)(256004)(186003)(99286004)(6246003)(102836004)(26005)(6116002)(81166006)(53936002)(3846002)(7696005)(6436002)(14454004)(66476007)(66946007)(76116006)(8676002)(2501003)(66556008)(446003)(66446008)(44832011)(74316002)(486006)(305945005)(7736002)(11346002)(2906002)(86362001)(64756008)(68736007)(476003)(66066001)(76176011)(229853002)(5660300002)(4326008)(8936002)(6506007)(81156014)(2201001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4449;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +vbuo+o7N413FoGwsc32gq6hj/z8ljjp+XaTXm1QVyJLGIm9dhu550PRIEY781YL4VmdVbWMeS7f4zldXSb3WECbQp7uOxXEqe8Lp6pJcMcZJJi41jrT2WdkhvY/Nw56K1Xc4vO2z5/lK/mPsfbBd5EN8DTSSnCVdvik6AggZFWS6qY+UjiQbx455AL8ExZvFJXSTBhd7WEufkNpscN1BxnH50YiU/9oEN7MCeAOQk0JKzthr0c2UfyiHGdWFxsoGE5RkSQqHsvykZipzhgGmPi1AEdDiNr5S3I0KV61ohARObBoDhh0VyY0tsq/uTcZBomYVmCtK9nA/+HvQk90XKsx+0Z6/CKGFbB98mnhjoD/kE4MOEcIC9gh5VNL9mMstJjnmt4l/20nvGDydj32OdvfFf8RgD0oZ1v9sRYiKok=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343873ac-6183-4993-e644-08d70aa51724
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:54:06.8371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4449
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBKdWx5IDE2LCAyMDE5IDM6MTkgUE0NCj4gDQo+IFRoZSBSVEMgSVJRIGlzIHJl
cXVlc3RlZCBiZWZvcmUgdGhlIHN0cnVjdCBydGNfZGV2aWNlIGlzIGFsbG9jYXRlZCwgdGhpcyBt
YXkNCj4gbGVhZCB0byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBJUlEgaGFuZGxlci4N
Cj4gDQo+IFRvIGZpeCB0aGlzIGlzc3VlLCBhbGxvY2F0aW5nIHRoZSBydGNfZGV2aWNlIHN0cnVj
dCBiZWZvcmUgcmVxdWVzdGluZyB0aGUgUlRDIElSUQ0KPiB1c2luZyBkZXZtX3J0Y19hbGxvY2F0
ZV9kZXZpY2UsIGFuZCB1c2UgcnRjX3JlZ2lzdGVyX2RldmljZSB0byByZWdpc3RlciB0aGUNCj4g
UlRDIGRldmljZS4NCj4gDQoNCkkgc2F3IG90aGVyIHJ0YyBkcml2ZXJzIGRpZCB0aGUgc2FtZSB3
YXkgYXMgdXMsIHNvIHRoaXMgbG9va3MgbGlrZSBhIGNvbW1vbiBwcm9ibGVtLg0KTXkgcXVlc3Rp
b24gaXMgaWYgd2UgY2FuIGNsZWFyIGludGVycnVwdCBzdGF0dXMgYmVmb3JlIHJlZ2lzdGVyIHRv
IGF2b2lkIHRoaXMgaXNzdWUgYXMNCm90aGVyIHJ0YyBkcml2ZXJzPw0KDQpSZWdhcmRzDQpBaXNo
ZW5nDQoNCj4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLXNudnMuYyB8IDExICsrKysrKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1zbnZzLmMgYi9kcml2ZXJzL3J0Yy9ydGMtc252cy5j
IGluZGV4DQo+IDdlZTY3M2EyLi40ZjlhMTA3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9y
dGMtc252cy5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zbnZzLmMNCj4gQEAgLTI3OSw2ICsy
NzksMTAgQEAgc3RhdGljIGludCBzbnZzX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
DQo+ICpwZGV2KQ0KPiAgCWlmICghZGF0YSkNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+IA0KPiAr
CWRhdGEtPnJ0YyA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+ZGV2KTsNCj4gKwlp
ZiAoSVNfRVJSKGRhdGEtPnJ0YykpDQo+ICsJCXJldHVybiBQVFJfRVJSKGRhdGEtPnJ0Yyk7DQo+
ICsNCj4gIAlkYXRhLT5yZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKHBk
ZXYtPmRldi5vZl9ub2RlLA0KPiAicmVnbWFwIik7DQo+IA0KPiAgCWlmIChJU19FUlIoZGF0YS0+
cmVnbWFwKSkgew0KPiBAQCAtMzQzLDEwICszNDcsOSBAQCBzdGF0aWMgaW50IHNudnNfcnRjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJCWdvdG8gZXJyb3JfcnRj
X2RldmljZV9yZWdpc3RlcjsNCj4gIAl9DQo+IA0KPiAtCWRhdGEtPnJ0YyA9IGRldm1fcnRjX2Rl
dmljZV9yZWdpc3RlcigmcGRldi0+ZGV2LCBwZGV2LT5uYW1lLA0KPiAtCQkJCQkmc252c19ydGNf
b3BzLCBUSElTX01PRFVMRSk7DQo+IC0JaWYgKElTX0VSUihkYXRhLT5ydGMpKSB7DQo+IC0JCXJl
dCA9IFBUUl9FUlIoZGF0YS0+cnRjKTsNCj4gKwlkYXRhLT5ydGMtPm9wcyA9ICZzbnZzX3J0Y19v
cHM7DQo+ICsJcmV0ID0gcnRjX3JlZ2lzdGVyX2RldmljZShkYXRhLT5ydGMpOw0KPiArCWlmIChy
ZXQpIHsNCj4gIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIHJ0Yzog
JWRcbiIsIHJldCk7DQo+ICAJCWdvdG8gZXJyb3JfcnRjX2RldmljZV9yZWdpc3RlcjsNCj4gIAl9
DQo+IC0tDQo+IDIuNy40DQoNCg==
