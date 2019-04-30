Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1032AEE1F
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 03:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729518AbfD3BHO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 21:07:14 -0400
Received: from mail-eopbgr20047.outbound.protection.outlook.com ([40.107.2.47]:26371
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729238AbfD3BHO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Apr 2019 21:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/1PCMfXEn+Nurn/lmS0nR77BP/Q6XGjj1TLePFj+Qg=;
 b=fx/u46ZYCHAxb9PlpS/zfdj2a1QkLPQDoiNOaTh8egCKbY+zaQCCmmfWJQC7iuJirlCpHOO16aQ9IzQfiw/uGtweq6aXkLda5BLh4wvSAsViDQo1sUE8Fa71BbR200Wj+6/h+K41FXrwErrDSbTnEDIXhsL49F6BxwzGekGF/bM=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3866.eurprd04.prod.outlook.com (52.134.71.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 01:07:09 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 01:07:08 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH V2] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH V2] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/vEI6nnEEqbXYkOGPkXKkx7aOA==
Date:   Tue, 30 Apr 2019 01:07:08 +0000
Message-ID: <1556586144-7070-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:2e::19) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a48f8be-7c3b-4802-9c9b-08d6cd082b1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3866;
x-ms-traffictypediagnostic: DB3PR0402MB3866:
x-microsoft-antispam-prvs: <DB3PR0402MB3866C9F757E4AE88167C5266F53A0@DB3PR0402MB3866.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(8676002)(7736002)(305945005)(66946007)(50226002)(71200400001)(73956011)(25786009)(71190400001)(4326008)(2906002)(66556008)(256004)(66446008)(99286004)(2616005)(486006)(476003)(14444005)(97736004)(52116002)(14454004)(64756008)(81156014)(81166006)(66476007)(478600001)(68736007)(6486002)(86362001)(102836004)(3846002)(6116002)(5660300002)(386003)(2201001)(316002)(6436002)(53936002)(6512007)(8936002)(66066001)(26005)(110136005)(36756003)(2501003)(6506007)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3866;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4UawIbJ+ZhjF7WPJixFQa74+CnLPJwLKvS1ScNmqkpv10mIx9r1iTSEanRshKhaeYiHZKxGhz+viVCtszNOZlthD5kVyoAvZfTUKbbvrTvJpsiiK0ay0oHdxZr7h8K6rD9VqT6lkLAu0R3OyFzD1wyJhXOV3oTQdU1RHKI5EMRzA8HU5a3hbNUI7nxkw2XFuW8kCp1bI+3JcetRHZSkCedeHvIWHB8ho7/arcw28mE2k+ctYqiJHW3WxU03P7piYxySqF06hOAl/2kepD1wheUCQkrog/IhikalVbEAAqQlWLKjl1OU5OloVfpsAXkNlwsLYsL+sK14AIqyDWYsemM9vMgelHrUW4f7UYr3TZivvX7n6MrQvZUMWD5MhqW3TmLIPvACaiHRYJlQOxkUrfGjI8VxARHALe7NzF41vXXg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a48f8be-7c3b-4802-9c9b-08d6cd082b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 01:07:08.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3866
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VXNlIF9fbWF5YmVfdW51c2VkIGZvciBwb3dlciBtYW5hZ2VtZW50IHJlbGF0ZWQgZnVuY3Rpb25z
DQppbnN0ZWFkIG9mICNpZiBDT05GSUdfUE1fU0xFRVAgdG8gc2ltcGx5IHRoZSBjb2RlLg0KDQpT
aWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NClJldmlld2Vk
LWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KLS0tDQpDaGFuZ2VzIHNp
bmNlIFYxOg0KCS0gdXNlIFNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKCkgdG8gbWFrZSBz
dXJlIHNudnNfcnRjX3BtX29wcyBpcyBlbXB0eSB3aGVuIFBNIGlzIG9mZi4NCi0tLQ0KIGRyaXZl
cnMvcnRjL3J0Yy1zbnZzLmMgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3J0Yy9ydGMtc252cy5jIGIvZHJpdmVycy9ydGMvcnRjLXNudnMuYw0KaW5kZXggZTBlZGQ1
OTQuLjdlZTY3M2EyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ydGMvcnRjLXNudnMuYw0KKysrIGIv
ZHJpdmVycy9ydGMvcnRjLXNudnMuYw0KQEAgLTM2MCw5ICszNjAsNyBAQCBzdGF0aWMgaW50IHNu
dnNfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCXJldHVybiByZXQ7
DQogfQ0KIA0KLSNpZmRlZiBDT05GSUdfUE1fU0xFRVANCi0NCi1zdGF0aWMgaW50IHNudnNfcnRj
X3N1c3BlbmRfbm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQ0KK3N0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgc252c19ydGNfc3VzcGVuZF9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlz
dHJ1Y3Qgc252c19ydGNfZGF0YSAqZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KIA0KQEAg
LTM3Miw3ICszNzAsNyBAQCBzdGF0aWMgaW50IHNudnNfcnRjX3N1c3BlbmRfbm9pcnEoc3RydWN0
IGRldmljZSAqZGV2KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBzbnZzX3J0Y19y
ZXN1bWVfbm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQ0KK3N0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQgc252c19ydGNfcmVzdW1lX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogCXN0cnVj
dCBzbnZzX3J0Y19kYXRhICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQpAQCAtMzgz
LDE4ICszODEsOSBAQCBzdGF0aWMgaW50IHNudnNfcnRjX3Jlc3VtZV9ub2lycShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQogfQ0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzbnZzX3J0
Y19wbV9vcHMgPSB7DQotCS5zdXNwZW5kX25vaXJxID0gc252c19ydGNfc3VzcGVuZF9ub2lycSwN
Ci0JLnJlc3VtZV9ub2lycSA9IHNudnNfcnRjX3Jlc3VtZV9ub2lycSwNCisJU0VUX05PSVJRX1NZ
U1RFTV9TTEVFUF9QTV9PUFMoc252c19ydGNfc3VzcGVuZF9ub2lycSwgc252c19ydGNfcmVzdW1l
X25vaXJxKQ0KIH07DQogDQotI2RlZmluZSBTTlZTX1JUQ19QTV9PUFMJKCZzbnZzX3J0Y19wbV9v
cHMpDQotDQotI2Vsc2UNCi0NCi0jZGVmaW5lIFNOVlNfUlRDX1BNX09QUwlOVUxMDQotDQotI2Vu
ZGlmDQotDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc252c19kdF9pZHNbXSA9
IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJmc2wsc2VjLXY0LjAtbW9uLXJ0Yy1scCIsIH0sDQogCXsg
Lyogc2VudGluZWwgKi8gfQ0KQEAgLTQwNCw3ICszOTMsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBzbnZzX2R0X2lkcyk7DQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc252c19y
dGNfZHJpdmVyID0gew0KIAkuZHJpdmVyID0gew0KIAkJLm5hbWUJPSAic252c19ydGMiLA0KLQkJ
LnBtCT0gU05WU19SVENfUE1fT1BTLA0KKwkJLnBtCT0gJnNudnNfcnRjX3BtX29wcywNCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IHNudnNfZHRfaWRzLA0KIAl9LA0KIAkucHJvYmUJCT0gc252c19ydGNf
cHJvYmUsDQotLSANCjIuNy40DQoNCg==
