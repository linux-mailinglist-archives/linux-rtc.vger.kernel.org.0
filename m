Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3478EDC7D
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Apr 2019 09:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfD2HCi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 03:02:38 -0400
Received: from mail-eopbgr20060.outbound.protection.outlook.com ([40.107.2.60]:11482
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726589AbfD2HCi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Apr 2019 03:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwpnJVk+iG5QHR1SlFHe5hn8cVeoTjEC4yT8OGrCtxc=;
 b=EMTWwPAssiFscffDmI9e/fDVsN0ka+qONwreM4W+aQcwMiuRpN5G+Z2b4QQvQieiuPhTim1C5de4EuD+U2bNVaQUa/UAPGNTLujnD+RRt+RmSVztt/mL1WNEiUiMhE9d/ZGt1pDVC/fzCOaYVFQi2/Z2j05fkcQnbmj1NNfrILk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3724.eurprd04.prod.outlook.com (52.134.66.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 07:02:33 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 07:02:33 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH] rtc: snvs: Use __maybe_unused instead of #if CONFIG_PM_SLEEP
Thread-Topic: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/lmEml9HNTGs9Ea7jhPERyCyyA==
Date:   Mon, 29 Apr 2019 07:02:33 +0000
Message-ID: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0083.apcprd03.prod.outlook.com
 (2603:1096:203:72::23) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8587ecd-f884-4557-40f2-08d6cc70a73c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3724;
x-ms-traffictypediagnostic: DB3PR0402MB3724:
x-microsoft-antispam-prvs: <DB3PR0402MB37240747D16525118EE14631F5390@DB3PR0402MB3724.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(366004)(346002)(39860400002)(376002)(199004)(189003)(86362001)(71200400001)(6486002)(71190400001)(36756003)(6436002)(5660300002)(68736007)(256004)(14444005)(99286004)(52116002)(50226002)(81166006)(14454004)(316002)(8676002)(81156014)(2501003)(8936002)(305945005)(478600001)(110136005)(7736002)(26005)(4326008)(53936002)(186003)(25786009)(97736004)(66066001)(102836004)(386003)(6506007)(66446008)(6512007)(476003)(64756008)(2616005)(66476007)(66556008)(3846002)(66946007)(73956011)(6116002)(486006)(2201001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3724;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OB6tyzMfPPSSA6++ZZhXNtUIDlbisndGXOfe6msmqw4d1BgLbye8pc8QMyToeoqQVO8blZeOVy+JK1dLHFblpq6KOTW2VcTh+aiL3/KAOP3pNk5hHS6YMO27EiI1SgFio7DzA7mm8IrjttPMP6SWC6CxYT/eNs3ksChY45c73HNnXGk2RAkj2p6r3N4CuC7fzsd8GuazBeaWFNSFmdI2sPDcso9JH5ySuEucSZQyXXl80zkpL4LD9Tmfp/G0INfaaNE6KxZjKQUOLKcsuQtdURA53hhhp1eqtUQsLk1Y9fVuKc/g02N5/WxU/JCYoXlwkJqEkMME/ho6rHBtlObLE4X9RJkSTe5wXmQ0iF1JkqeBsk8RKGlHKsI+4iEfcQE6xkaltLlrDIukN1O+W6MpxuglQxO59sT0nAjtcNxlAWI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8587ecd-f884-4557-40f2-08d6cc70a73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 07:02:33.6833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3724
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VXNlIF9fbWF5YmVfdW51c2VkIGZvciBwb3dlciBtYW5hZ2VtZW50IHJlbGF0ZWQgZnVuY3Rpb25z
DQppbnN0ZWFkIG9mICNpZiBDT05GSUdfUE1fU0xFRVAgdG8gc2ltcGx5IHRoZSBjb2RlLg0KDQpT
aWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvcnRjL3J0Yy1zbnZzLmMgfCAxNiArKystLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3J0Yy9ydGMtc252cy5jIGIvZHJpdmVycy9ydGMvcnRjLXNudnMuYw0KaW5kZXggZTBlZGQ1
OTQuLjJhMmI4ZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtc252cy5jDQorKysgYi9k
cml2ZXJzL3J0Yy9ydGMtc252cy5jDQpAQCAtMzYwLDkgKzM2MCw3IEBAIHN0YXRpYyBpbnQgc252
c19ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJcmV0dXJuIHJldDsN
CiB9DQogDQotI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KLQ0KLXN0YXRpYyBpbnQgc252c19ydGNf
c3VzcGVuZF9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZCBzbnZzX3J0Y19zdXNwZW5kX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogCXN0
cnVjdCBzbnZzX3J0Y19kYXRhICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQpAQCAt
MzcyLDcgKzM3MCw3IEBAIHN0YXRpYyBpbnQgc252c19ydGNfc3VzcGVuZF9ub2lycShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgaW50IHNudnNfcnRjX3Jl
c3VtZV9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBzbnZzX3J0Y19yZXN1bWVfbm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJc3RydWN0
IHNudnNfcnRjX2RhdGEgKmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiANCkBAIC0zODcs
MTQgKzM4NSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzbnZzX3J0Y19wbV9v
cHMgPSB7DQogCS5yZXN1bWVfbm9pcnEgPSBzbnZzX3J0Y19yZXN1bWVfbm9pcnEsDQogfTsNCiAN
Ci0jZGVmaW5lIFNOVlNfUlRDX1BNX09QUwkoJnNudnNfcnRjX3BtX29wcykNCi0NCi0jZWxzZQ0K
LQ0KLSNkZWZpbmUgU05WU19SVENfUE1fT1BTCU5VTEwNCi0NCi0jZW5kaWYNCi0NCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzbnZzX2R0X2lkc1tdID0gew0KIAl7IC5jb21wYXRp
YmxlID0gImZzbCxzZWMtdjQuMC1tb24tcnRjLWxwIiwgfSwNCiAJeyAvKiBzZW50aW5lbCAqLyB9
DQpAQCAtNDA0LDcgKzM5NCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHNudnNfZHRfaWRz
KTsNCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzbnZzX3J0Y19kcml2ZXIgPSB7DQog
CS5kcml2ZXIgPSB7DQogCQkubmFtZQk9ICJzbnZzX3J0YyIsDQotCQkucG0JPSBTTlZTX1JUQ19Q
TV9PUFMsDQorCQkucG0JPSAmc252c19ydGNfcG1fb3BzLA0KIAkJLm9mX21hdGNoX3RhYmxlID0g
c252c19kdF9pZHMsDQogCX0sDQogCS5wcm9iZQkJPSBzbnZzX3J0Y19wcm9iZSwNCi0tIA0KMi43
LjQNCg0K
