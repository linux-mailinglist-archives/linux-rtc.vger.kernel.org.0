Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88ABE1343F
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 21:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfECT7W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 15:59:22 -0400
Received: from esa3.tennantco.iphmx.com ([68.232.154.86]:12822 "EHLO
        esa3.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfECT7V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 15:59:21 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 May 2019 15:59:20 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3Ay2bZkhKI5wozJLK9g9mcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXK/z4rarrMEGX3/hxlliBBdydt6sdzbWP+Pm8BCQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagfL9+Nhe7oRjeusULjoZvKrs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyoBKjU38nzYitZogaxbvhyvugB/zYDXboGbNvVweaLdcs8VS2?=
 =?us-ascii?q?VORctRSzdOD5mgY4YVE+YMP+BVpJT9qVsUqhu+ABGhCu3vyz9MnHD227Ax3e?=
 =?us-ascii?q?YmEQDIwgMhH88FvXPaotT1MKcdS+a1wLPKwzXEYfJZxzf85ZPUch8/p/GMW6?=
 =?us-ascii?q?h/cczNyUYzEAPJlEmfqYvgPz6M0OkGrmaV7+1lVe21im4nrRl8rSW1xsctlI?=
 =?us-ascii?q?nGmJgVxkrC9SpjxYY6O9u1Q1N4b968CJZcqj2WOoRsTs4tQWxkoig3x74ctZ?=
 =?us-ascii?q?O7YSQG0IkryhrcZvCdbYSE/h3uWPyfLDp2nn5pZq6ziwqq/Uiu1OLxVdW43V?=
 =?us-ascii?q?NPoydEj9bDqnQA2hnO5ceZVPRw8EKs1iiS2A/P9u1JJFo7mKjAJJE/xLM7i4?=
 =?us-ascii?q?Advl7ZHiDsnUX7lKqWdkI59ee28+nnebDmpoOEN49zlwH+LrwimsyhDuQ8NQ?=
 =?us-ascii?q?gDR3CV9Pi72rH/40H1WahHgPsonqXAt5DVPtoUqrS+Aw9IzoYs8BG/Dyqg0N?=
 =?us-ascii?q?sFh3UHNEhFeBWbj4f3J17OPPH4DfC5g1i2lzdr2uzGPrnmApXKLXjPiqvufb?=
 =?us-ascii?q?F460JEyQozy85Q545MB70cPP7+VVX9udPaAxMjPQG5wPzrBdVg2o8GXGKAGK?=
 =?us-ascii?q?6ZMKfcsV+S4eIvJvGBaoEVuTb5Mfcl4eTig30+mV4TY6ao3YAaaGymEfRgJU?=
 =?us-ascii?q?WWe3zsgssdHmcNpAYxUOvqiFiaXT5Je3myR7485i08CI++F4jDQp6igbOb0y?=
 =?us-ascii?q?e9A5JWfH5JBkqXHnj2c4WEX/AMaCSTIsJ6iTMEUr+hS5Ml1RGvsg/20aZoLu?=
 =?us-ascii?q?3R+icAr5LsyMB15/HPlRE17TF7Fd6R0mCQT2Fxm2MIQCQ73Lx4oU1z1FiDy7?=
 =?us-ascii?q?R4jOJEGtxT/f9JUxs6P4bGz+NmE9DyRh7BftCRRVaiQ9WmBywxT90oz98Uf0?=
 =?us-ascii?q?ZyB86vjg7M3yW0Gb8Zjb+LC4Iu8qLawXfxI9xxy3Hc1Kku3BEaRZ4FPGmrlq?=
 =?us-ascii?q?d5+xLeQYTEl0GekaeCf6MbwCrM8iGIym/E9BVRVANgWKPJR31ZbEbSqdP/52?=
 =?us-ascii?q?vISLiyDbUhdABGzJjRBLFNb4jFnFFPQr/DP8vTcirlt3a0DBDO5rSTYZvCZ2?=
 =?us-ascii?q?gb2izbFEMD1QsU+CDVZkAFGi69rjeGX3RVHlX1bha0q7MsoW6nTkIy0wCBZl?=
 =?us-ascii?q?Fg0Lzw4BMOmPiAUK1DjKkctnInrDN5VBam0tTaBsDIhjIpfb4UILZfqExCyX?=
 =?us-ascii?q?qfsgV8OpK6KKU3qk8aegIxn0Tx2gRfFohGl8EssHgtigF1LPHQ3Q=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2F1CgDjmsxc/zMmL2hlg1VQW4EGBAsoCoQGg0cDhTGJT?=
 =?us-ascii?q?5xNAxg8DwEtAoQ+AheCEzgTAQMBAQEEAQEBAQIBAQJpHAELgjoiaTkyAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQI4OQIBAxIRBA0MA?=
 =?us-ascii?q?QERJgEPAgEiAiYCAgIwFRACBA4FIoMAgWsDHQGhHz0CYgILgQEpiF9xfDOCe?=
 =?us-ascii?q?QEBBYR+GFKBPAmBCyeGeIYtP4ERg1CEQzuCUIJYjVWEbJR1BwKCC1aRYyeVS?=
 =?us-ascii?q?IwblGkCBAIEBQIOAQEFgWYigVYzGiODPIIbF4NMilNAATGBKY51AYEgAQE?=
X-IronPort-AV: E=Sophos;i="5.60,426,1549951200"; 
   d="scan'208";a="13731133"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-bl2nam02lp2051.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.51])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 May 2019 14:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5bQNQmXQ+O6fNkPSncAUuA2Ze8SV6zTzI5HNudcXB4=;
 b=HozWWzgwEpZyANl3rp7uKPCooSxf4hP+QgThD4hRkXAFQOHzmh7xWqvlcwzMxgrPEZFMJ+xlPZuoI+AIHAogAHCQNbRIgfZ/7AN1IUA1V2V+glMefcmca8VX04UvUgcTzdpG3XVrPVX9ALFOXyjrXXeykhsjo7jlWoj2o+PAZYs=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1624.namprd20.prod.outlook.com (10.171.167.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 19:52:12 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 19:52:12 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Dylan Howey <Dylan.Howey@tennantco.com>
Subject: [PATCH v2 3/4] rtc: pcf2123: add alarm support
Thread-Topic: [PATCH v2 3/4] rtc: pcf2123: add alarm support
Thread-Index: AQHVAemz+aQKVMtb00W1ZVuDbdgjCA==
Date:   Fri, 3 May 2019 19:52:12 +0000
Message-ID: <20190503195149.31297-3-Dylan.Howey@tennantco.com>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
In-Reply-To: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:208:160::40) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12157744-f556-46a3-c480-08d6d000d54f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1624;
x-ms-traffictypediagnostic: CY4PR20MB1624:
x-microsoft-antispam-prvs: <CY4PR20MB162479C4182E2F80D9A1A139EF350@CY4PR20MB1624.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:363;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(186003)(386003)(26005)(486006)(71200400001)(7736002)(11346002)(86362001)(6506007)(14454004)(6436002)(305945005)(71190400001)(1076003)(4326008)(72206003)(14444005)(102836004)(50226002)(2501003)(52116002)(76176011)(256004)(6916009)(5660300002)(6512007)(81166006)(99286004)(478600001)(446003)(2351001)(68736007)(6486002)(53936002)(6116002)(107886003)(5640700003)(8676002)(2906002)(316002)(3846002)(36756003)(66066001)(81156014)(64756008)(73956011)(66446008)(66946007)(8936002)(66476007)(66556008)(2616005)(25786009)(54906003)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1624;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C8t9j0xGjkpSCP+5/XKPJpDDNRmJgCDHlU7a8cGhaeQWMboL3lUQ8sMZYLsLgvC5zWLrldkSaFFRrV32TDlux8/jLTtvahuWNj3DEq6tKsWx6n+hYOi0DPsHVeuNIHCGpzyw+Fos2GEMrIXh87wKaXtsKELhR79kcxifRgGFA/9FfztpkupP4fZtLCYrVyshJ06bapI0SNsq9dRhccdi0uBK39wxWleOuqdhIp36pqkyimf0nDIA53wDJNgY1KE657rKP2NSdTRoDrBIrnIEntFJg9f4/9va6DpKQnJYY7/Wx4FfHlK1VIjuoUeWM32EdmseVCS5M5C/trSw2p7Azb+K64PdKimPm9hRGZNkCvTp65+zdSrKgISXWpITIkCbY40BfQXRrMANeCGBjAMqgLx54Kgu9IolNx6Ta8hwUkI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12157744-f556-46a3-c480-08d6d000d54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 19:52:12.1489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1624
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

QWxsb3dzIGFsYXJtIHRvIGJlIGNvbnRyb2xsZWQgdXNpbmcsIGUuZy4sIHRoZSBSVENfV0tBTE1f
U0VUIGlvY3RsLg0KDQpTaWduZWQtb2ZmLWJ5OiBEeWxhbiBIb3dleSA8RHlsYW4uSG93ZXlAdGVu
bmFudGNvLmNvbT4NCi0tLQ0KIGRyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMgfCAxMTYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMTE0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9y
dGMtcGNmMjEyMy5jIGIvZHJpdmVycy9ydGMvcnRjLXBjZjIxMjMuYw0KaW5kZXggMzJiZmVkN2Vl
ZmQ0Li44NjEwYmY2OTBkZTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtcGNmMjEyMy5j
DQorKysgYi9kcml2ZXJzL3J0Yy9ydGMtcGNmMjEyMy5jDQpAQCAtMjUwLDYgKzI1MCw5OSBAQCBz
dGF0aWMgaW50IHBjZjIxMjNfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IHJ0Y190aW1lICp0bSkNCiAJcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBpbnQgcGNmMjEyM19y
dGNfcmVhZF9hbGFybShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfd2thbHJtICphbG0p
DQorew0KKwlzdHJ1Y3QgcGNmMjEyM19wbGF0X2RhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0
YShkZXYpOw0KKwl1OCByeGJ1Zls0XTsNCisJaW50IHJldDsNCisJdW5zaWduZWQgaW50IHZhbCA9
IDA7DQorDQorCXJldCA9IHJlZ21hcF9idWxrX3JlYWQocGRhdGEtPm1hcCwgUENGMjEyM19SRUdf
QUxSTV9NTiwgcnhidWYsDQorCQkJCXNpemVvZihyeGJ1ZikpOw0KKwlpZiAocmV0KQ0KKwkJcmV0
dXJuIHJldDsNCisNCisJYWxtLT50aW1lLnRtX21pbiA9IGJjZDJiaW4ocnhidWZbMF0gJiAweDdG
KTsNCisJYWxtLT50aW1lLnRtX2hvdXIgPSBiY2QyYmluKHJ4YnVmWzFdICYgMHgzRik7DQorCWFs
bS0+dGltZS50bV9tZGF5ID0gYmNkMmJpbihyeGJ1ZlsyXSAmIDB4M0YpOw0KKwlhbG0tPnRpbWUu
dG1fd2RheSA9IGJjZDJiaW4ocnhidWZbM10gJiAweDA3KTsNCisNCisJZGV2X2RiZyhkZXYsICIl
czogYWxtIGlzICVwdFJcbiIsIF9fZnVuY19fLCAmYWxtLT50aW1lKTsNCisNCisJcmV0ID0gcmVn
bWFwX3JlYWQocGRhdGEtPm1hcCwgUENGMjEyM19SRUdfQ1RSTDIsICZ2YWwpOw0KKwlpZiAocmV0
KQ0KKwkJcmV0dXJuIHJldDsNCisNCisJYWxtLT5lbmFibGVkID0gISEodmFsICYgQ1RSTDJfQUlF
KTsNCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgcGNmMjEyM19ydGNfc2V0X2Fs
YXJtKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y193a2Fscm0gKmFsbSkNCit7DQorCXN0
cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQor
CXU4IHR4YnVmWzRdOw0KKwlpbnQgcmV0Ow0KKw0KKwlkZXZfZGJnKGRldiwgIiVzOiBhbG0gaXMg
JXB0UlxuIiwgX19mdW5jX18sICZhbG0tPnRpbWUpOw0KKw0KKwkvKiBFbnN1cmUgYWxhcm0gZmxh
ZyBpcyBjbGVhciAqLw0KKwlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMocGRhdGEtPm1hcCwgUENG
MjEyM19SRUdfQ1RSTDIsIENUUkwyX0FGLCAwKTsNCisJaWYgKHJldCkNCisJCXJldHVybiByZXQ7
DQorDQorCS8qIERpc2FibGUgYWxhcm0gaW50ZXJydXB0ICovDQorCXJldCA9IHJlZ21hcF91cGRh
dGVfYml0cyhwZGF0YS0+bWFwLCBQQ0YyMTIzX1JFR19DVFJMMiwgQ1RSTDJfQUlFLCAwKTsNCisJ
aWYgKHJldCkNCisJCXJldHVybiByZXQ7DQorDQorCS8qIFNldCBuZXcgYWxhcm0gKi8NCisJdHhi
dWZbMF0gPSBiaW4yYmNkKGFsbS0+dGltZS50bV9taW4gJiAweDdGKTsNCisJdHhidWZbMV0gPSBi
aW4yYmNkKGFsbS0+dGltZS50bV9ob3VyICYgMHgzRik7DQorCXR4YnVmWzJdID0gYmluMmJjZChh
bG0tPnRpbWUudG1fbWRheSAmIDB4M0YpOw0KKwl0eGJ1ZlszXSA9IGJpbjJiY2QoYWxtLT50aW1l
LnRtX3dkYXkgJiAweDA3KTsNCisNCisJcmV0ID0gcmVnbWFwX2J1bGtfd3JpdGUocGRhdGEtPm1h
cCwgUENGMjEyM19SRUdfQUxSTV9NTiwgdHhidWYsDQorCQkJCXNpemVvZih0eGJ1ZikpOw0KKwlp
ZiAocmV0KQ0KKwkJcmV0dXJuIHJldDsNCisNCisJLyogRW5hYmxlIGFsYXJtIGludGVycnVwdCAq
Lw0KKwlpZiAoYWxtLT5lbmFibGVkKQl7DQorCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMocGRh
dGEtPm1hcCwgUENGMjEyM19SRUdfQ1RSTDIsDQorCQkJCQkJQ1RSTDJfQUlFLCBDVFJMMl9BSUUp
Ow0KKwkJaWYgKHJldCkNCisJCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCXJldHVybiAwOw0KK30N
CisNCitzdGF0aWMgaXJxcmV0dXJuX3QgcGNmMjEyM19ydGNfaXJxKGludCBpcnEsIHZvaWQgKmRl
dikNCit7DQorCXN0cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRk
YXRhKGRldik7DQorCXN0cnVjdCBtdXRleCAqbG9jayA9ICZwZGF0YS0+cnRjLT5vcHNfbG9jazsN
CisJdW5zaWduZWQgaW50IHZhbCA9IDA7DQorCWludCByZXQgPSBJUlFfTk9ORTsNCisNCisJbXV0
ZXhfbG9jayhsb2NrKTsNCisJcmVnbWFwX3JlYWQocGRhdGEtPm1hcCwgUENGMjEyM19SRUdfQ1RS
TDIsICZ2YWwpOw0KKw0KKwkvKiBBbGFybT8gKi8NCisJaWYgKHZhbCAmIENUUkwyX0FGKSB7DQor
CQlyZXQgPSBJUlFfSEFORExFRDsNCisNCisJCS8qIENsZWFyIGFsYXJtIGZsYWcgKi8NCisJCXJl
Z21hcF91cGRhdGVfYml0cyhwZGF0YS0+bWFwLCBQQ0YyMTIzX1JFR19DVFJMMiwgQ1RSTDJfQUYs
IDApOw0KKw0KKwkJcnRjX3VwZGF0ZV9pcnEocGRhdGEtPnJ0YywgMSwgUlRDX0lSUUYgfCBSVENf
QUYpOw0KKwl9DQorDQorCW11dGV4X3VubG9jayhsb2NrKTsNCisNCisJcmV0dXJuIHJldDsNCit9
DQorDQogc3RhdGljIGludCBwY2YyMTIzX3Jlc2V0KHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQog
CXN0cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7
DQpAQCAtMjg5LDcgKzM4Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnRjX2NsYXNzX29wcyBw
Y2YyMTIzX3J0Y19vcHMgPSB7DQogCS5zZXRfdGltZQk9IHBjZjIxMjNfcnRjX3NldF90aW1lLA0K
IAkucmVhZF9vZmZzZXQJPSBwY2YyMTIzX3JlYWRfb2Zmc2V0LA0KIAkuc2V0X29mZnNldAk9IHBj
ZjIxMjNfc2V0X29mZnNldCwNCi0NCisJLnJlYWRfYWxhcm0JPSBwY2YyMTIzX3J0Y19yZWFkX2Fs
YXJtLA0KKwkuc2V0X2FsYXJtCT0gcGNmMjEyM19ydGNfc2V0X2FsYXJtLA0KIH07DQogDQogc3Rh
dGljIGludCBwY2YyMTIzX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQpAQCAtMjk3LDcg
KzM5MSw3IEBAIHN0YXRpYyBpbnQgcGNmMjEyM19wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3Bp
KQ0KIAlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjOw0KIAlzdHJ1Y3QgcnRjX3RpbWUgdG07DQogCXN0
cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGE7DQotCWludCByZXQ7DQorCWludCByZXQgPSAw
Ow0KIA0KIAlwZGF0YSA9IGRldm1fa3phbGxvYygmc3BpLT5kZXYsIHNpemVvZihzdHJ1Y3QgcGNm
MjEyM19wbGF0X2RhdGEpLA0KIAkJCQlHRlBfS0VSTkVMKTsNCkBAIC0zMzYsNiArNDMwLDI0IEBA
IHN0YXRpYyBpbnQgcGNmMjEyM19wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KIA0KIAlw
ZGF0YS0+cnRjID0gcnRjOw0KIA0KKwkvKiBSZWdpc3RlciBhbGFybSBpcnEgKi8NCisJaWYgKHNw
aS0+aXJxID4gMCkgew0KKwkJcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmc3BpLT5k
ZXYsIHNwaS0+aXJxLCBOVUxMLA0KKwkJCQlwY2YyMTIzX3J0Y19pcnEsDQorCQkJCUlSUUZfVFJJ
R0dFUl9MT1cgfCBJUlFGX09ORVNIT1QsDQorCQkJCXBjZjIxMjNfZHJpdmVyLmRyaXZlci5uYW1l
LCAmc3BpLT5kZXYpOw0KKwkJaWYgKCFyZXQpDQorCQkJZGV2aWNlX2luaXRfd2FrZXVwKCZzcGkt
PmRldiwgdHJ1ZSk7DQorCQllbHNlDQorCQkJZGV2X2Vycigmc3BpLT5kZXYsICJjb3VsZCBub3Qg
cmVxdWVzdCBpcnEuXG4iKTsNCisJfQ0KKw0KKwkvKiBUaGUgUENGMjEyMydzIGFsYXJtIG9ubHkg
aGFzIG1pbnV0ZSBhY2N1cmFjeS4gTXVzdCBhZGQgdGltZXINCisJICogc3VwcG9ydCB0byB0aGlz
IGRyaXZlciB0byBnZW5lcmF0ZSBpbnRlcnJ1cHRzIG1vcmUgdGhhbiBvbmNlDQorCSAqIHBlciBt
aW51dGUuDQorCSAqLw0KKwlwZGF0YS0+cnRjLT51aWVfdW5zdXBwb3J0ZWQgPSAxOw0KKw0KIAly
ZXR1cm4gMDsNCiANCiBrZnJlZV9leGl0Og0KLS0gDQoyLjE3LjENCg0K
