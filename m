Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D2E1343E
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 21:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfECT7V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 15:59:21 -0400
Received: from esa3.tennantco.iphmx.com ([68.232.154.86]:12822 "EHLO
        esa3.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfECT7V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 15:59:21 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 May 2019 15:59:20 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3AHubgqxNuUO4agvL5yTEl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0K/z9pMbcNUDSrc9gkEXOFd2Cra4d0qyJ6uu5BTFIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+0oAnMucUanIRvJ6YswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKMSMy/mPKhcxqlK9VoAyvqQFjw4DaY4+VOvhxcKTcfdwGSm?=
 =?us-ascii?q?ROUd1cVzBaDY6mc4cCFfYNMOReooLgp1UOtxy+BQy0Ce3hyj5IgmX53asn2O?=
 =?us-ascii?q?ojFgHH0hIvHtITu3nTotv0NKMSXvqzzKXSzzvDaP1X1in96YXTbhAuv/eMXb?=
 =?us-ascii?q?RqfsrX1UkgCwTFgk+MpoziOjOYz+IAuHWY4ep4Te+jlnIrpg5rrjWgxMogkI?=
 =?us-ascii?q?fEi4EPxl3E9Sh12Js5KNm7RUJhf9KoDJRduzuUOoZ4WM8uXX1ktDoixr0Ip5?=
 =?us-ascii?q?G2fzQGxZEiyhPedvOIb4yF7xf+W+mPPzh1indod6yiiBmu7UStz/fzW8uv31?=
 =?us-ascii?q?lUqCdOj8PCuWoX1xPJ78iKUv59/kC81jmRzw3T8eREIVwslarcNp4h3qY8lp?=
 =?us-ascii?q?oNvkTHGS/7gF34gbOReEk45OSk8vnqbLP4qpOFMI97kR/xPr4pmsyiHeQ3KQ?=
 =?us-ascii?q?8OX3Wd+euhzrHj5Vf5QLJWjvIojqbZrJHaJcMdpqKjBA9Vz5oj6xK4Dzeh09?=
 =?us-ascii?q?QUh2UILFVAeB6fjojpPU/BIOzgAPuin1ihny1nyv/EM7H7DJjALWLPnbfhcL?=
 =?us-ascii?q?pl7k5T0gszzdRR55JODbEBJer+VEHxtdzcFBA5NRa4zeTgCNRzyIwfWXmCAr?=
 =?us-ascii?q?OHP6PUt1+H/OQvI/WQa48SojryN/8l5/v2gX8jhVAdZbWp3YcQaH2gBPtmJ1?=
 =?us-ascii?q?uWYHX2jdcHDGgKpBQxQPbxh1KcVT5TY3GyX6Q95jwgE42mCoDDRpypgLyA2i?=
 =?us-ascii?q?e3BIFZZmdDClqUC3fna52EW+sQaCKVOsJuiCYIVLm8S48k0BGusxT3y6ZgLu?=
 =?us-ascii?q?va5CIYr47j28Zp6O3Tjx0y9CB0BdyH026RV2F0gn8IRzgu0aB7oEx9zEqD0K?=
 =?us-ascii?q?dhj/xCCdxc++hEUhk1NZHC1ex2EdPyVRzbftePVlmmRs+qATYrTtI+kJcyZB?=
 =?us-ascii?q?M3EtGvnhnF0zCnRbUYk7iMAp0c+KXbw3zwIYB2zHOMnP0oi1Q2S81DL2DgjK?=
 =?us-ascii?q?N78w/VBqbDlEKFk6esM68b2Xie2n2EyD+irUVRVkZQVrrITDhLSlrSpNK/xk?=
 =?us-ascii?q?TdQq6GFbkhNAJH1cWFbKBNb4u63h19WP7/NYGGMCqKkGCqCEPQnOneZZf2e2?=
 =?us-ascii?q?gbwCTWAVQFlAZW53udKAwiHXnx8XnGAmloElTiKwP3/O9ypWnzb3d8zhrCLi?=
 =?us-ascii?q?gDn6Gw5gZTgPWdT/0J2bdRlDYlojMyPFGi0sP+F9eGoQNnYK5bJ9g65QQP2A?=
 =?us-ascii?q?=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2F1CgDjmsxc/zcmL2hlg1VQW4EGBAsoCoQGg0cDhTGJT?=
 =?us-ascii?q?5xNAxg8DwEtAoQ+AheCEzgTAQMBAQEEAQEBAQIBAQJpHAELgjoiaTkyAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQI4OQIBAxIRBA0MA?=
 =?us-ascii?q?QERJgEPAgEiAiYCAgIwFRACBA4FIoMAgWsDHQGhHz0CYgILgQEpiF9xfDOCe?=
 =?us-ascii?q?QEBBYR+GFKBPAmBCyeGeIYtP4RhhEMYI4JQgliLEQqCOoZckwUHAoILVpFjJ?=
 =?us-ascii?q?4IOiiuJD4wblGkCBAIEBQIOAQEFgWYigVYzGiODPIEYgQMXg0yKU0ABMYEpj?=
 =?us-ascii?q?nUBgSABAQ?=
X-IronPort-AV: E=Sophos;i="5.60,426,1549951200"; 
   d="scan'208";a="13731132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 May 2019 14:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL5xCmU1qLakNFMD5QbqLNr+8TSz20IqVRa0xB59cPA=;
 b=MwVtsFo6QGyZ2V7uwFdtyWOWmieSBWzo0v3oCgUWyzD06DNFpoYjc6bPVtEJOAHq7zAS/npQm/nMnmCj2gxiI1B+5roBCioVR34PrWZQUOH/guiwKyJiin3OOiEvhigSOMX+6ijb3eA2uegiWnhy5QHzrZtV+d2nbgVhB287uMM=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1624.namprd20.prod.outlook.com (10.171.167.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 19:52:11 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 19:52:10 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Dylan Howey <Dylan.Howey@tennantco.com>
Subject: [PATCH v2 2/4] rtc: pcf2123: port to regmap
Thread-Topic: [PATCH v2 2/4] rtc: pcf2123: port to regmap
Thread-Index: AQHVAemyAdN/LMDpz0WQQihDx54ckA==
Date:   Fri, 3 May 2019 19:52:10 +0000
Message-ID: <20190503195149.31297-2-Dylan.Howey@tennantco.com>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
In-Reply-To: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:91::22) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279c7d2d-c17a-4dc8-69f5-08d6d000d490
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1624;
x-ms-traffictypediagnostic: CY4PR20MB1624:
x-microsoft-antispam-prvs: <CY4PR20MB1624F0A815A1F00A0D558BDAEF350@CY4PR20MB1624.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(186003)(386003)(26005)(486006)(71200400001)(7736002)(11346002)(86362001)(6506007)(14454004)(6436002)(305945005)(71190400001)(1076003)(4326008)(72206003)(102836004)(50226002)(2501003)(52116002)(76176011)(256004)(6916009)(5660300002)(6512007)(81166006)(99286004)(478600001)(446003)(2351001)(68736007)(6486002)(53936002)(6116002)(107886003)(5640700003)(8676002)(2906002)(316002)(3846002)(36756003)(66066001)(81156014)(64756008)(73956011)(66446008)(66946007)(8936002)(66476007)(66556008)(2616005)(25786009)(54906003)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1624;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cV+wqq4gC0nfTcn8SEYsmFa6Yf61h9aVEr7sUKES+L+Assv8tFoOP81USJEMJq1R01ZCD4geRDvlHnHypVgASh3QwGncYKeT8P7lvNnuwjH18L2ixIUoPLvzeWIFuCsQuwxmtWp+HHi+fTDZdnCmpXhMIhqkjWOfvKIKYWfSr0osjdynVj0epzjA2b7xH+5KywQuJHQmx+RdKvuyLtvdBeDWsFEn3HKskB+DfiBvw+XkaUSDt6XmOUySZ6wz62N4zrOnGY8ydzWHm80ZwGD6zaXFOEQqxOJScThKne//K5e+Zotz5rJAl0JK5pLYxCNKSayll9E8I56+LFsgz+YY5Ys2e/XrqghtOZgAmDtz5F8xd2vciOHIi3TYUhLAMC2GQ5y8ItkLpliu+o2i8LCwvtE8hpsSf+Bs6fwplLEaEOc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279c7d2d-c17a-4dc8-69f5-08d6d000d490
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 19:52:10.8128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1624
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

QWxzbyByZW1vdmUgcGNmMjEyM19kZWxheV90cmVjLiBUaGlzIGNsYWltZWQgdG8gYWRkIGEgMzBu
cyBkZWxheSB0byBTUEkNCndyaXRlcywgYnV0IEkgY291bGQgbm90IHNlZSBhbnkgcmVmZXJlbmNl
IHRvIHRoaXMgcmVxdWlyZW1lbnQgaW4gdGhlDQpkYXRhc2hlZXQuIENsb3Nlc3QgdGhpbmcgSSBj
b3VsZCBmaW5kIHRvIGEgcmVxdWlyZW1lbnQgYXJlIHRpbWluZ3MgZm9yIHRoZQ0KU1BJIGNoaXAg
ZW5hYmxlIGxpbmUsIHdoaWNoIGNhbm5vdCBiZSBjb250cm9sbGVkIGJ5IHRoaXMgZHJpdmVyICh0
aGUgbmRlbGF5DQpjYW1lIGFmdGVyIHRoZSBjYWxsIHRvIHNwaV93cml0ZV90aGVuX3JlYWQsIHdo
aWNoIG1lYW5zIGl0IHdvdWxkIHNsZWVwDQphZnRlciBDRSBoYXMgYWxyZWFkeSBnb25lIGluYWN0
aXZlKS4gVGhpbmdzIHNlZW0gdG8gd29yayBmaW5lIHdpdGhvdXQgaXQuDQoNClNpZ25lZC1vZmYt
Ynk6IER5bGFuIEhvd2V5IDxEeWxhbi5Ib3dleUB0ZW5uYW50Y28uY29tPg0KLS0tDQogZHJpdmVy
cy9ydGMvcnRjLXBjZjIxMjMuYyB8IDE0MiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMgYi9kcml2ZXJzL3J0
Yy9ydGMtcGNmMjEyMy5jDQppbmRleCBmYjVjYjgxZjIxNjEuLjMyYmZlZDdlZWZkNCAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMNCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1w
Y2YyMTIzLmMNCkBAIC00NCw2ICs0NCw3IEBADQogI2luY2x1ZGUgPGxpbnV4L3J0Yy5oPg0KICNp
bmNsdWRlIDxsaW51eC9zcGkvc3BpLmg+DQogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KKyNp
bmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCiANCiAvKiBSRUdJU1RFUlMgKi8NCiAjZGVmaW5lIFBD
RjIxMjNfUkVHX0NUUkwxCSgweDAwKQkvKiBDb250cm9sIFJlZ2lzdGVyIDEgKi8NCkBAIC05OCw2
ICs5OSw3IEBADQogI2RlZmluZSBPRkZTRVRfU0lHTl9CSVQJCTYJLyogMidzIGNvbXBsZW1lbnQg
c2lnbiBiaXQgKi8NCiAjZGVmaW5lIE9GRlNFVF9DT0FSU0UJCUJJVCg3KQkvKiBDb2Fyc2UgbW9k
ZSBvZmZzZXQgKi8NCiAjZGVmaW5lIE9GRlNFVF9TVEVQCQkoMjE3MCkJLyogT2Zmc2V0IHN0ZXAg
aW4gcGFydHMgcGVyIGJpbGxpb24gKi8NCisjZGVmaW5lIE9GRlNFVF9NQVNLCQlHRU5NQVNLKDYs
IDApCS8qIE9mZnNldCB2YWx1ZSAqLw0KIA0KIC8qIFJFQUQvV1JJVEUgQUREUkVTUyBCSVRTICov
DQogI2RlZmluZSBQQ0YyMTIzX1dSSVRFCQlCSVQoNCkNCkBAIC0xMDgsNjYgKzExMCwzMyBAQCBz
dGF0aWMgc3RydWN0IHNwaV9kcml2ZXIgcGNmMjEyM19kcml2ZXI7DQogDQogc3RydWN0IHBjZjIx
MjNfcGxhdF9kYXRhIHsNCiAJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YzsNCisJc3RydWN0IHJlZ21h
cCAqbWFwOw0KIH07DQogDQotLyoNCi0gKiBDYXVzZXMgYSAzMCBuYW5vc2Vjb25kIGRlbGF5IHRv
IGVuc3VyZSB0aGF0IHRoZSBQQ0YyMTIzIGNoaXAgc2VsZWN0DQotICogaXMgcmVsZWFzZWQgcHJv
cGVybHkgYWZ0ZXIgYW4gU1BJIHdyaXRlLiAgVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUNCi0gKiBj
YWxsZWQgYWZ0ZXIgRVZFUlkgcmVhZC93cml0ZSBjYWxsIG92ZXIgU1BJLg0KLSAqLw0KLXN0YXRp
YyBpbmxpbmUgdm9pZCBwY2YyMTIzX2RlbGF5X3RyZWModm9pZCkNCi17DQotCW5kZWxheSgzMCk7
DQotfQ0KLQ0KLXN0YXRpYyBpbnQgcGNmMjEyM19yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTgg
cmVnLCB1OCAqcnhidWYsIHNpemVfdCBzaXplKQ0KLXsNCi0Jc3RydWN0IHNwaV9kZXZpY2UgKnNw
aSA9IHRvX3NwaV9kZXZpY2UoZGV2KTsNCi0JaW50IHJldDsNCi0NCi0JcmVnIHw9IFBDRjIxMjNf
UkVBRDsNCi0JcmV0ID0gc3BpX3dyaXRlX3RoZW5fcmVhZChzcGksICZyZWcsIDEsIHJ4YnVmLCBz
aXplKTsNCi0JcGNmMjEyM19kZWxheV90cmVjKCk7DQotDQotCXJldHVybiByZXQ7DQotfQ0KLQ0K
LXN0YXRpYyBpbnQgcGNmMjEyM193cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHU4ICp0eGJ1Ziwg
c2l6ZV90IHNpemUpDQotew0KLQlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpID0gdG9fc3BpX2Rldmlj
ZShkZXYpOw0KLQlpbnQgcmV0Ow0KLQ0KLQl0eGJ1ZlswXSB8PSBQQ0YyMTIzX1dSSVRFOw0KLQly
ZXQgPSBzcGlfd3JpdGUoc3BpLCB0eGJ1Ziwgc2l6ZSk7DQotCXBjZjIxMjNfZGVsYXlfdHJlYygp
Ow0KLQ0KLQlyZXR1cm4gcmV0Ow0KLX0NCi0NCi1zdGF0aWMgaW50IHBjZjIxMjNfd3JpdGVfcmVn
KHN0cnVjdCBkZXZpY2UgKmRldiwgdTggcmVnLCB1OCB2YWwpDQotew0KLQl1OCB0eGJ1ZlsyXTsN
Ci0NCi0JdHhidWZbMF0gPSByZWc7DQotCXR4YnVmWzFdID0gdmFsOw0KLQlyZXR1cm4gcGNmMjEy
M193cml0ZShkZXYsIHR4YnVmLCBzaXplb2YodHhidWYpKTsNCi19DQorc3RhdGljIGNvbnN0IHN0
cnVjdCByZWdtYXBfY29uZmlnIHBjZjIxMjNfcmVnbWFwX2NvbmZpZyA9IHsNCisJLnJlZ19iaXRz
ID0gOCwNCisJLnZhbF9iaXRzID0gOCwNCisJLnJlYWRfZmxhZ19tYXNrID0gUENGMjEyM19SRUFE
LA0KKwkud3JpdGVfZmxhZ19tYXNrID0gUENGMjEyM19XUklURSwNCisJLm1heF9yZWdpc3RlciA9
IFBDRjIxMjNfUkVHX0NURFdOX1RNUiwNCit9Ow0KIA0KIHN0YXRpYyBpbnQgcGNmMjEyM19yZWFk
X29mZnNldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGxvbmcgKm9mZnNldCkNCiB7DQotCWludCByZXQ7
DQotCXM4IHJlZzsNCisJc3RydWN0IHBjZjIxMjNfcGxhdF9kYXRhICpwZGF0YSA9IGRldl9nZXRf
cGxhdGRhdGEoZGV2KTsNCisJaW50IHJldCwgdmFsOw0KKwl1bnNpZ25lZCBpbnQgcmVnOw0KIA0K
LQlyZXQgPSBwY2YyMTIzX3JlYWQoZGV2LCBQQ0YyMTIzX1JFR19PRkZTRVQsICZyZWcsIDEpOw0K
LQlpZiAocmV0IDwgMCkNCisJcmV0ID0gcmVnbWFwX3JlYWQocGRhdGEtPm1hcCwgUENGMjEyM19S
RUdfT0ZGU0VULCAmcmVnKTsNCisJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQogDQorCXZhbCA9
IHNpZ25fZXh0ZW5kMzIoKHJlZyAmIE9GRlNFVF9NQVNLKSwgT0ZGU0VUX1NJR05fQklUKTsNCisN
CiAJaWYgKHJlZyAmIE9GRlNFVF9DT0FSU0UpDQotCQlyZWcgPDw9IDE7IC8qIG11bHRpcGx5IGJ5
IDIgYW5kIHNpZ24gZXh0ZW5kICovDQotCWVsc2UNCi0JCXJlZyA9IHNpZ25fZXh0ZW5kMzIocmVn
LCBPRkZTRVRfU0lHTl9CSVQpOw0KKwkJdmFsICo9IDI7DQogDQotCSpvZmZzZXQgPSAoKGxvbmcp
cmVnKSAqIE9GRlNFVF9TVEVQOw0KKwkqb2Zmc2V0ID0gKChsb25nKXZhbCkgKiBPRkZTRVRfU1RF
UDsNCiANCiAJcmV0dXJuIDA7DQogfQ0KQEAgLTE4NCw2ICsxNTMsNyBAQCBzdGF0aWMgaW50IHBj
ZjIxMjNfcmVhZF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LCBsb25nICpvZmZzZXQpDQogICov
DQogc3RhdGljIGludCBwY2YyMTIzX3NldF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LCBsb25n
IG9mZnNldCkNCiB7DQorCXN0cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGEgPSBkZXZfZ2V0
X3BsYXRkYXRhKGRldik7DQogCXM4IHJlZzsNCiANCiAJaWYgKG9mZnNldCA+IE9GRlNFVF9TVEVQ
ICogMTI3KQ0KQEAgLTIwMywxNiArMTczLDE4IEBAIHN0YXRpYyBpbnQgcGNmMjEyM19zZXRfb2Zm
c2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgbG9uZyBvZmZzZXQpDQogCQlyZWcgfD0gT0ZGU0VUX0NP
QVJTRTsNCiAJfQ0KIA0KLQlyZXR1cm4gcGNmMjEyM193cml0ZV9yZWcoZGV2LCBQQ0YyMTIzX1JF
R19PRkZTRVQsIHJlZyk7DQorCXJldHVybiByZWdtYXBfd3JpdGUocGRhdGEtPm1hcCwgUENGMjEy
M19SRUdfT0ZGU0VULCAodW5zaWduZWQgaW50KXJlZyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgcGNm
MjEyM19ydGNfcmVhZF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y190aW1lICp0
bSkNCiB7DQorCXN0cnVjdCBwY2YyMTIzX3BsYXRfZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRk
YXRhKGRldik7DQogCXU4IHJ4YnVmWzddOw0KIAlpbnQgcmV0Ow0KIA0KLQlyZXQgPSBwY2YyMTIz
X3JlYWQoZGV2LCBQQ0YyMTIzX1JFR19TQywgcnhidWYsIHNpemVvZihyeGJ1ZikpOw0KLQlpZiAo
cmV0IDwgMCkNCisJcmV0ID0gcmVnbWFwX2J1bGtfcmVhZChwZGF0YS0+bWFwLCBQQ0YyMTIzX1JF
R19TQywgcnhidWYsDQorCQkJCXNpemVvZihyeGJ1ZikpOw0KKwlpZiAocmV0KQ0KIAkJcmV0dXJu
IHJldDsNCiANCiAJaWYgKHJ4YnVmWzBdICYgT1NDX0hBU19TVE9QUEVEKSB7DQpAQCAtMjQxLDcg
KzIxMyw4IEBAIHN0YXRpYyBpbnQgcGNmMjEyM19ydGNfcmVhZF90aW1lKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHJ0Y190aW1lICp0bSkNCiANCiBzdGF0aWMgaW50IHBjZjIxMjNfcnRjX3Nl
dF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y190aW1lICp0bSkNCiB7DQotCXU4
IHR4YnVmWzhdOw0KKwlzdHJ1Y3QgcGNmMjEyM19wbGF0X2RhdGEgKnBkYXRhID0gZGV2X2dldF9w
bGF0ZGF0YShkZXYpOw0KKwl1OCB0eGJ1Zls3XTsNCiAJaW50IHJldDsNCiANCiAJZGV2X2RiZyhk
ZXYsICIlczogdG0gaXMgc2Vjcz0lZCwgbWlucz0lZCwgaG91cnM9JWQsICINCkBAIC0yNTEsMjcg
KzIyNCwyNyBAQCBzdGF0aWMgaW50IHBjZjIxMjNfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHJ0Y190aW1lICp0bSkNCiAJCQl0bS0+dG1fbWRheSwgdG0tPnRtX21vbiwg
dG0tPnRtX3llYXIsIHRtLT50bV93ZGF5KTsNCiANCiAJLyogU3RvcCB0aGUgY291bnRlciBmaXJz
dCAqLw0KLQlyZXQgPSBwY2YyMTIzX3dyaXRlX3JlZyhkZXYsIFBDRjIxMjNfUkVHX0NUUkwxLCBD
VFJMMV9TVE9QKTsNCi0JaWYgKHJldCA8IDApDQorCXJldCA9IHJlZ21hcF93cml0ZShwZGF0YS0+
bWFwLCBQQ0YyMTIzX1JFR19DVFJMMSwgQ1RSTDFfU1RPUCk7DQorCWlmIChyZXQpDQogCQlyZXR1
cm4gcmV0Ow0KIA0KIAkvKiBTZXQgdGhlIG5ldyB0aW1lICovDQotCXR4YnVmWzBdID0gUENGMjEy
M19SRUdfU0M7DQotCXR4YnVmWzFdID0gYmluMmJjZCh0bS0+dG1fc2VjICYgMHg3Rik7DQotCXR4
YnVmWzJdID0gYmluMmJjZCh0bS0+dG1fbWluICYgMHg3Rik7DQotCXR4YnVmWzNdID0gYmluMmJj
ZCh0bS0+dG1faG91ciAmIDB4M0YpOw0KLQl0eGJ1Zls0XSA9IGJpbjJiY2QodG0tPnRtX21kYXkg
JiAweDNGKTsNCi0JdHhidWZbNV0gPSB0bS0+dG1fd2RheSAmIDB4MDc7DQotCXR4YnVmWzZdID0g
YmluMmJjZCgodG0tPnRtX21vbiArIDEpICYgMHgxRik7IC8qIHJ0YyBtbiAxLTEyICovDQotCXR4
YnVmWzddID0gYmluMmJjZCh0bS0+dG1feWVhciA8IDEwMCA/IHRtLT50bV95ZWFyIDogdG0tPnRt
X3llYXIgLSAxMDApOw0KLQ0KLQlyZXQgPSBwY2YyMTIzX3dyaXRlKGRldiwgdHhidWYsIHNpemVv
Zih0eGJ1ZikpOw0KLQlpZiAocmV0IDwgMCkNCisJdHhidWZbMF0gPSBiaW4yYmNkKHRtLT50bV9z
ZWMgJiAweDdGKTsNCisJdHhidWZbMV0gPSBiaW4yYmNkKHRtLT50bV9taW4gJiAweDdGKTsNCisJ
dHhidWZbMl0gPSBiaW4yYmNkKHRtLT50bV9ob3VyICYgMHgzRik7DQorCXR4YnVmWzNdID0gYmlu
MmJjZCh0bS0+dG1fbWRheSAmIDB4M0YpOw0KKwl0eGJ1Zls0XSA9IHRtLT50bV93ZGF5ICYgMHgw
NzsNCisJdHhidWZbNV0gPSBiaW4yYmNkKCh0bS0+dG1fbW9uICsgMSkgJiAweDFGKTsgLyogcnRj
IG1uIDEtMTIgKi8NCisJdHhidWZbNl0gPSBiaW4yYmNkKHRtLT50bV95ZWFyIDwgMTAwID8gdG0t
PnRtX3llYXIgOiB0bS0+dG1feWVhciAtIDEwMCk7DQorDQorCXJldCA9IHJlZ21hcF9idWxrX3dy
aXRlKHBkYXRhLT5tYXAsIFBDRjIxMjNfUkVHX1NDLCB0eGJ1ZiwNCisJCQkJc2l6ZW9mKHR4YnVm
KSk7DQorCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KIAkvKiBTdGFydCB0aGUgY291bnRl
ciAqLw0KLQlyZXQgPSBwY2YyMTIzX3dyaXRlX3JlZyhkZXYsIFBDRjIxMjNfUkVHX0NUUkwxLCBD
VFJMMV9DTEVBUik7DQotCWlmIChyZXQgPCAwKQ0KKwlyZXQgPSByZWdtYXBfd3JpdGUocGRhdGEt
Pm1hcCwgUENGMjEyM19SRUdfQ1RSTDEsIENUUkwxX0NMRUFSKTsNCisJaWYgKHJldCkNCiAJCXJl
dHVybiByZXQ7DQogDQogCXJldHVybiAwOw0KQEAgLTI3OSwzMyArMjUyLDMzIEBAIHN0YXRpYyBp
bnQgcGNmMjEyM19ydGNfc2V0X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3Rp
bWUgKnRtKQ0KIA0KIHN0YXRpYyBpbnQgcGNmMjEyM19yZXNldChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQogew0KKwlzdHJ1Y3QgcGNmMjEyM19wbGF0X2RhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0
YShkZXYpOw0KIAlpbnQgcmV0Ow0KLQl1OCAgcnhidWZbMl07DQorCXVuc2lnbmVkIGludCB2YWwg
PSAwOw0KIA0KLQlyZXQgPSBwY2YyMTIzX3dyaXRlX3JlZyhkZXYsIFBDRjIxMjNfUkVHX0NUUkwx
LCBDVFJMMV9TV19SRVNFVCk7DQotCWlmIChyZXQgPCAwKQ0KKwlyZXQgPSByZWdtYXBfd3JpdGUo
cGRhdGEtPm1hcCwgUENGMjEyM19SRUdfQ1RSTDEsIENUUkwxX1NXX1JFU0VUKTsNCisJaWYgKHJl
dCkNCiAJCXJldHVybiByZXQ7DQogDQogCS8qIFN0b3AgdGhlIGNvdW50ZXIgKi8NCiAJZGV2X2Ri
ZyhkZXYsICJzdG9wcGluZyBSVENcbiIpOw0KLQlyZXQgPSBwY2YyMTIzX3dyaXRlX3JlZyhkZXYs
IFBDRjIxMjNfUkVHX0NUUkwxLCBDVFJMMV9TVE9QKTsNCi0JaWYgKHJldCA8IDApDQorCXJldCA9
IHJlZ21hcF93cml0ZShwZGF0YS0+bWFwLCBQQ0YyMTIzX1JFR19DVFJMMSwgQ1RSTDFfU1RPUCk7
DQorCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KIAkvKiBTZWUgaWYgdGhlIGNvdW50ZXIg
d2FzIGFjdHVhbGx5IHN0b3BwZWQgKi8NCiAJZGV2X2RiZyhkZXYsICJjaGVja2luZyBmb3IgcHJl
c2VuY2Ugb2YgUlRDXG4iKTsNCi0JcmV0ID0gcGNmMjEyM19yZWFkKGRldiwgUENGMjEyM19SRUdf
Q1RSTDEsIHJ4YnVmLCBzaXplb2YocnhidWYpKTsNCi0JaWYgKHJldCA8IDApDQorCXJldCA9IHJl
Z21hcF9yZWFkKHBkYXRhLT5tYXAsIFBDRjIxMjNfUkVHX0NUUkwxLCAmdmFsKTsNCisJaWYgKHJl
dCkNCiAJCXJldHVybiByZXQ7DQogDQotCWRldl9kYmcoZGV2LCAicmVjZWl2ZWQgZGF0YSBmcm9t
IFJUQyAoMHglMDJYIDB4JTAyWClcbiIsDQotCQlyeGJ1ZlswXSwgcnhidWZbMV0pOw0KLQlpZiAo
IShyeGJ1ZlswXSAmIENUUkwxX1NUT1ApKQ0KKwlkZXZfZGJnKGRldiwgInJlY2VpdmVkIGRhdGEg
ZnJvbSBSVEMgKDB4JTA4WClcbiIsIHZhbCk7DQorCWlmICghKHZhbCAmIENUUkwxX1NUT1ApKQ0K
IAkJcmV0dXJuIC1FTk9ERVY7DQogDQogCS8qIFN0YXJ0IHRoZSBjb3VudGVyICovDQotCXJldCA9
IHBjZjIxMjNfd3JpdGVfcmVnKGRldiwgUENGMjEyM19SRUdfQ1RSTDEsIENUUkwxX0NMRUFSKTsN
Ci0JaWYgKHJldCA8IDApDQorCXJldCA9IHJlZ21hcF93cml0ZShwZGF0YS0+bWFwLCBQQ0YyMTIz
X1JFR19DVFJMMSwgQ1RSTDFfQ0xFQVIpOw0KKwlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCiAN
CiAJcmV0dXJuIDA7DQpAQCAtMzMyLDYgKzMwNSwxMyBAQCBzdGF0aWMgaW50IHBjZjIxMjNfcHJv
YmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCiAJCXJldHVybiAtRU5PTUVNOw0KIAlzcGktPmRl
di5wbGF0Zm9ybV9kYXRhID0gcGRhdGE7DQogDQorCXBkYXRhLT5tYXAgPSBkZXZtX3JlZ21hcF9p
bml0X3NwaShzcGksICZwY2YyMTIzX3JlZ21hcF9jb25maWcpOw0KKw0KKwlpZiAoSVNfRVJSKHBk
YXRhLT5tYXApKSB7DQorCQlkZXZfZXJyKCZzcGktPmRldiwgInJlZ21hcCBpbml0IGZhaWxlZC5c
biIpOw0KKwkJZ290byBrZnJlZV9leGl0Ow0KKwl9DQorDQogCXJldCA9IHBjZjIxMjNfcnRjX3Jl
YWRfdGltZSgmc3BpLT5kZXYsICZ0bSk7DQogCWlmIChyZXQgPCAwKSB7DQogCQlyZXQgPSBwY2Yy
MTIzX3Jlc2V0KCZzcGktPmRldik7DQotLSANCjIuMTcuMQ0KDQo=
