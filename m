Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E20961343D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 21:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfECT7U (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 15:59:20 -0400
Received: from esa3.tennantco.iphmx.com ([68.232.154.86]:12822 "EHLO
        esa3.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfECT7U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 15:59:20 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 May 2019 15:59:20 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3A7G+o+hOKKVdt/nm7tOsl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0K/zyosbcNUDSrc9gkEXOFd2Cra4d0qyJ6uu5BTFIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+0oAnMucUanIRvJ6YswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKMSMy/mPKhcxqlK9VoAyvqQFjw4DaY4+bM/t+cb/Sc9wVXm?=
 =?us-ascii?q?dBQt1eWjZdDo6mc4cCDewMNvtYoYnnoFsOqAOzCwesBePr0DBIgGL906890+?=
 =?us-ascii?q?UvDw7H3BErEtUAvnXUqNX6LqESXfq3wqnPwzTMcfNX1Czh6IfWdBAhp+uDXb?=
 =?us-ascii?q?RsccXNzkkjDR/KjlKVqYH8OT6ey+oDs2+e7+V6VOKvjXYqpBttojiz3McgkI?=
 =?us-ascii?q?/JiZgQyl/a8yhy3YU7JcWgRUJmfdKpH4Fcui6YOodsTM4vQHtktSY6x7EepJ?=
 =?us-ascii?q?K2eCsHxI45yxLDZPGLaYaF7xz5WOqPPTt0mGppeLyhiBux7UStz+jxW8ip31?=
 =?us-ascii?q?lWqidIl8TDuW4T2BHd78WIVOZy8Vu91TuKzQ/e6PpLLl4ymKHGMZAu2KQwmY?=
 =?us-ascii?q?AWsUnbGy/2n1j5g7GOe0U//+io9/znYrL7pp+AL4N0ih/xMqApmsGnGeo1Lg?=
 =?us-ascii?q?8AU3SF9eilybDt+1P1TKxNjvItjKbVqpfaJdkHpqGiBA9Vz4Aj5AulAze+yt?=
 =?us-ascii?q?QYmmUHI0xZdxKbjojpPFfOLOr/Dfein1SslDBrx/fFPrH7HprNKX3DnK/gfb?=
 =?us-ascii?q?Z79UFc1BI+wc1D659bEL0ML/D+VlX/udHbFBM0Mwy5z/7iCNpn14MeXWyPAr?=
 =?us-ascii?q?WeMKPXqVKG6OIuI+2Wa48TojrzKf8l5vDwgn45glIdYbem3Z0RaH+iGPRmP1?=
 =?us-ascii?q?mWYX32jtgdFmcKuxIyTPb2h12aTT5Te3GyUrom6TE/Fo2nAp3MRoawj7ybwi?=
 =?us-ascii?q?i3BIZZaX5CClCIFnfocYSEVuwXZyKVJc9hjjgEVbmnS4M7yR6uswr6waJ9Lu?=
 =?us-ascii?q?XI4i0YqY7j1N9t6uLJjx0z9CF0D8GY02GKVGx0gmQIRjEo06BlvUxy1EuM0a?=
 =?us-ascii?q?hij/xZCdxZ/+lJXRsiNZ7A0+x6DMj/WgbAftePVVanTcyqASstTt0t2NIOfU?=
 =?us-ascii?q?l9FMu4jhzZ3CqlHaUVl7qVC5ww6K7c2GLxJ8kug0rBgeMoi1Q2S81DL2DgjK?=
 =?us-ascii?q?N78w/VBqbDlEKFk6esM68b2WSFoG6HwHqHuk1CXUh6XKHBWnYeTkHRqsj950?=
 =?us-ascii?q?WERLirX+cJKAxEnOKTLqJMIv3uklhXDKPPKdDXZSSRnHi9FD6Uy7WKZYz2cG?=
 =?us-ascii?q?Jb1yLYXhtX2zsP9GqLYFBtThyqpHjTWWQ0TwDmfl/s/O9iqXiyUk4zyUSQYl?=
 =?us-ascii?q?Z806aupE5HnuSSHvUU2L9M+DwsrTl5Bh6c55rXEJLBwmgpZ6BAeZU46VZD23?=
 =?us-ascii?q?jesllRL5ipKeZCgUETYixrskXo3hNrAYIGms8v/zsn?=
X-IPAS-Result: =?us-ascii?q?A2GdDmbjmsxc/zcmL2hlg1VQWxF1BAsoCoQGg0cDhTGJT?=
 =?us-ascii?q?5Fbhn8Zg1oDGDwPARsSAoQ+GVEBgUE4EwEDAQEBBAEBAQECAQECaRwBC4IuD?=
 =?us-ascii?q?CJcDTkFAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEVAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCMwUhGhYRBA0MAQERJgERASICJgIEM?=
 =?us-ascii?q?BUSBA4FIoMAAYFqAx0BoR89AmICC4EBKYhfcXwzgnkBAQV1hAkYUoE8CYELJ?=
 =?us-ascii?q?4Z4hi0/gRGDUIRDGCOCUIJYixuCOoRslHUHAoILVoVCjCEngm+SWYwbkRqDT?=
 =?us-ascii?q?wIEAgQFAg4BAQWBZiKBVjMaI4M8CYV1hFGCQINCQAExgSmOdQGBIAEB?=
X-IronPort-AV: E=Sophos;i="5.60,426,1549951200"; 
   d="scan'208";a="13731131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 May 2019 14:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87cmkqj2gVWObjudDV5Lp+2731KGXpTbseUS3Vf1APU=;
 b=aASkUipOf00dbcvV9BTMjQDMRS6aREmNtHRWZjrc/szj+o8AxOetJ7NlDm692qeTuH87rs/0N50K90ALM7KaFCMckTtgpT6rAKAvorGNea3zacoVDDonWSgXAcJyb90u1F8YFydCR3SOK5pBDwtRWMeowZosEqJIXOAqlqJuXH4=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1624.namprd20.prod.outlook.com (10.171.167.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 19:52:09 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 19:52:09 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Dylan Howey <Dylan.Howey@tennantco.com>
Subject: [PATCH v2 1/4] rtc: pcf2123: remove sysfs register view
Thread-Topic: [PATCH v2 1/4] rtc: pcf2123: remove sysfs register view
Thread-Index: AQHVAemx0KfSEvpbCEmONoHwczY0PQ==
Date:   Fri, 3 May 2019 19:52:08 +0000
Message-ID: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:208:160::17) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9b42aed-73e1-44b9-d41c-08d6d000d33f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1624;
x-ms-traffictypediagnostic: CY4PR20MB1624:
x-microsoft-antispam-prvs: <CY4PR20MB1624D91D499A9B959AF95833EF350@CY4PR20MB1624.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(186003)(386003)(26005)(486006)(71200400001)(7736002)(86362001)(6506007)(14454004)(6436002)(305945005)(71190400001)(1076003)(4326008)(72206003)(102836004)(50226002)(2501003)(52116002)(256004)(6916009)(5660300002)(6512007)(81166006)(99286004)(478600001)(2351001)(68736007)(6486002)(53936002)(6116002)(107886003)(5640700003)(8676002)(2906002)(316002)(3846002)(36756003)(66066001)(81156014)(64756008)(73956011)(66446008)(66946007)(8936002)(66476007)(66556008)(2616005)(25786009)(54906003)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1624;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VINeyociJczKvw9pd6evVdhPNDKvmSGdpJktOolKaLMTFtAirtQGvIJuJ7Wl6DN8HcpKiHpqVK7JhZt33LAbadUwFqmfey7RUX3xXAQKHKqVzZWFBBhw3sNuNyaHSDjrePP1FDVzhmQsQKeXXpUchgIp4dJbV+rE7nNBCV4cQGYG71Xsol2w6rgu4TTJbQjcKV7yb76a3dGxRe3tLtQ1rLaNS7OMBoshS038rfFQtytFhWyQuEHOpT4JZht6ZR2s+gP9G1wf/YiDrq9/NjCh7jSrJZwnAgoXTSBMO9fKgd/43edRrl3D92EMyIDY2jKoJLQEW56agv8BkyD1FxFowV2PzqfFMnoVhTmqlrAdIgG8VsYT0CdZUr2PRZEtSqv0EUCdb8olGRjcfM23JRAt5c3Ndsq9krnUAsLzQCvsnvk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b42aed-73e1-44b9-d41c-08d6d000d33f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 19:52:08.9122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1624
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VXNlIHJlZ21hcCBkZWJ1Z2ZzIHJlZ2lzdGVyIHZpZXcgaW5zdGVhZC4NCg0KU2lnbmVkLW9mZi1i
eTogRHlsYW4gSG93ZXkgPER5bGFuLkhvd2V5QHRlbm5hbnRjby5jb20+DQotLS0NCiBkcml2ZXJz
L3J0Yy9ydGMtcGNmMjEyMy5jIHwgOTAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4OSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMgYi9kcml2ZXJzL3J0Yy9y
dGMtcGNmMjEyMy5jDQppbmRleCAzOWRhOGIyMTQyNzUuLmZiNWNiODFmMjE2MSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMNCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1wY2Yy
MTIzLmMNCkBAIC00NCw3ICs0NCw2IEBADQogI2luY2x1ZGUgPGxpbnV4L3J0Yy5oPg0KICNpbmNs
dWRlIDxsaW51eC9zcGkvc3BpLmg+DQogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KLSNpbmNs
dWRlIDxsaW51eC9zeXNmcy5oPg0KIA0KIC8qIFJFR0lTVEVSUyAqLw0KICNkZWZpbmUgUENGMjEy
M19SRUdfQ1RSTDEJKDB4MDApCS8qIENvbnRyb2wgUmVnaXN0ZXIgMSAqLw0KQEAgLTEwNywxNCAr
MTA2LDggQEANCiANCiBzdGF0aWMgc3RydWN0IHNwaV9kcml2ZXIgcGNmMjEyM19kcml2ZXI7DQog
DQotc3RydWN0IHBjZjIxMjNfc3lzZnNfcmVnIHsNCi0Jc3RydWN0IGRldmljZV9hdHRyaWJ1dGUg
YXR0cjsNCi0JY2hhciBuYW1lWzJdOw0KLX07DQotDQogc3RydWN0IHBjZjIxMjNfcGxhdF9kYXRh
IHsNCiAJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YzsNCi0Jc3RydWN0IHBjZjIxMjNfc3lzZnNfcmVn
IHJlZ3NbMTZdOw0KIH07DQogDQogLyoNCkBAIC0xNjAsNTIgKzE1Myw2IEBAIHN0YXRpYyBpbnQg
cGNmMjEyM193cml0ZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1OCByZWcsIHU4IHZhbCkNCiAJ
cmV0dXJuIHBjZjIxMjNfd3JpdGUoZGV2LCB0eGJ1Ziwgc2l6ZW9mKHR4YnVmKSk7DQogfQ0KIA0K
LXN0YXRpYyBzc2l6ZV90IHBjZjIxMjNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlICphdHRyLA0KLQkJCSAgICBjaGFyICpidWZmZXIpDQotew0KLQlzdHJ1
Y3QgcGNmMjEyM19zeXNmc19yZWcgKnI7DQotCXU4IHJ4YnVmWzFdOw0KLQl1bnNpZ25lZCBsb25n
IHJlZzsNCi0JaW50IHJldDsNCi0NCi0JciA9IGNvbnRhaW5lcl9vZihhdHRyLCBzdHJ1Y3QgcGNm
MjEyM19zeXNmc19yZWcsIGF0dHIpOw0KLQ0KLQlyZXQgPSBrc3RydG91bChyLT5uYW1lLCAxNiwg
JnJlZyk7DQotCWlmIChyZXQpDQotCQlyZXR1cm4gcmV0Ow0KLQ0KLQlyZXQgPSBwY2YyMTIzX3Jl
YWQoZGV2LCByZWcsIHJ4YnVmLCAxKTsNCi0JaWYgKHJldCA8IDApDQotCQlyZXR1cm4gLUVJTzsN
Ci0NCi0JcmV0dXJuIHNwcmludGYoYnVmZmVyLCAiMHgleFxuIiwgcnhidWZbMF0pOw0KLX0NCi0N
Ci1zdGF0aWMgc3NpemVfdCBwY2YyMTIzX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQotCQkJICAgICBjb25zdCBjaGFyICpidWZmZXIsIHNp
emVfdCBjb3VudCkNCi17DQotCXN0cnVjdCBwY2YyMTIzX3N5c2ZzX3JlZyAqcjsNCi0JdW5zaWdu
ZWQgbG9uZyByZWc7DQotCXVuc2lnbmVkIGxvbmcgdmFsOw0KLQ0KLQlpbnQgcmV0Ow0KLQ0KLQly
ID0gY29udGFpbmVyX29mKGF0dHIsIHN0cnVjdCBwY2YyMTIzX3N5c2ZzX3JlZywgYXR0cik7DQot
DQotCXJldCA9IGtzdHJ0b3VsKHItPm5hbWUsIDE2LCAmcmVnKTsNCi0JaWYgKHJldCkNCi0JCXJl
dHVybiByZXQ7DQotDQotCXJldCA9IGtzdHJ0b3VsKGJ1ZmZlciwgMTAsICZ2YWwpOw0KLQlpZiAo
cmV0KQ0KLQkJcmV0dXJuIHJldDsNCi0NCi0JcmV0ID0gcGNmMjEyM193cml0ZV9yZWcoZGV2LCBy
ZWcsIHZhbCk7DQotCWlmIChyZXQgPCAwKQ0KLQkJcmV0dXJuIC1FSU87DQotCXJldHVybiBjb3Vu
dDsNCi19DQotDQogc3RhdGljIGludCBwY2YyMTIzX3JlYWRfb2Zmc2V0KHN0cnVjdCBkZXZpY2Ug
KmRldiwgbG9uZyAqb2Zmc2V0KQ0KIHsNCiAJaW50IHJldDsNCkBAIC0zNzcsNyArMzI0LDcgQEAg
c3RhdGljIGludCBwY2YyMTIzX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQogCXN0cnVj
dCBydGNfZGV2aWNlICpydGM7DQogCXN0cnVjdCBydGNfdGltZSB0bTsNCiAJc3RydWN0IHBjZjIx
MjNfcGxhdF9kYXRhICpwZGF0YTsNCi0JaW50IHJldCwgaTsNCisJaW50IHJldDsNCiANCiAJcGRh
dGEgPSBkZXZtX2t6YWxsb2MoJnNwaS0+ZGV2LCBzaXplb2Yoc3RydWN0IHBjZjIxMjNfcGxhdF9k
YXRhKSwNCiAJCQkJR0ZQX0tFUk5FTCk7DQpAQCAtNDA5LDQ3ICszNTYsMTMgQEAgc3RhdGljIGlu
dCBwY2YyMTIzX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQogDQogCXBkYXRhLT5ydGMg
PSBydGM7DQogDQotCWZvciAoaSA9IDA7IGkgPCAxNjsgaSsrKSB7DQotCQlzeXNmc19hdHRyX2lu
aXQoJnBkYXRhLT5yZWdzW2ldLmF0dHIuYXR0cik7DQotCQlzcHJpbnRmKHBkYXRhLT5yZWdzW2ld
Lm5hbWUsICIlMXgiLCBpKTsNCi0JCXBkYXRhLT5yZWdzW2ldLmF0dHIuYXR0ci5tb2RlID0gU19J
UlVHTyB8IFNfSVdVU1I7DQotCQlwZGF0YS0+cmVnc1tpXS5hdHRyLmF0dHIubmFtZSA9IHBkYXRh
LT5yZWdzW2ldLm5hbWU7DQotCQlwZGF0YS0+cmVnc1tpXS5hdHRyLnNob3cgPSBwY2YyMTIzX3No
b3c7DQotCQlwZGF0YS0+cmVnc1tpXS5hdHRyLnN0b3JlID0gcGNmMjEyM19zdG9yZTsNCi0JCXJl
dCA9IGRldmljZV9jcmVhdGVfZmlsZSgmc3BpLT5kZXYsICZwZGF0YS0+cmVnc1tpXS5hdHRyKTsN
Ci0JCWlmIChyZXQpIHsNCi0JCQlkZXZfZXJyKCZzcGktPmRldiwgIlVuYWJsZSB0byBjcmVhdGUg
c3lzZnMgJXNcbiIsDQotCQkJCXBkYXRhLT5yZWdzW2ldLm5hbWUpOw0KLQkJCWdvdG8gc3lzZnNf
ZXhpdDsNCi0JCX0NCi0JfQ0KLQ0KIAlyZXR1cm4gMDsNCiANCi1zeXNmc19leGl0Og0KLQlmb3Ig
KGktLTsgaSA+PSAwOyBpLS0pDQotCQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnNwaS0+ZGV2LCAmcGRh
dGEtPnJlZ3NbaV0uYXR0cik7DQotDQoga2ZyZWVfZXhpdDoNCiAJc3BpLT5kZXYucGxhdGZvcm1f
ZGF0YSA9IE5VTEw7DQogCXJldHVybiByZXQ7DQogfQ0KIA0KLXN0YXRpYyBpbnQgcGNmMjEyM19y
ZW1vdmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCi17DQotCXN0cnVjdCBwY2YyMTIzX3BsYXRf
ZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZzcGktPmRldik7DQotCWludCBpOw0KLQ0K
LQlpZiAocGRhdGEpIHsNCi0JCWZvciAoaSA9IDA7IGkgPCAxNjsgaSsrKQ0KLQkJCWlmIChwZGF0
YS0+cmVnc1tpXS5uYW1lWzBdKQ0KLQkJCQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnNwaS0+ZGV2LA0K
LQkJCQkJCSAgICZwZGF0YS0+cmVnc1tpXS5hdHRyKTsNCi0JfQ0KLQ0KLQlyZXR1cm4gMDsNCi19
DQotDQogI2lmZGVmIENPTkZJR19PRg0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHBjZjIxMjNfZHRfaWRzW10gPSB7DQogCXsgLmNvbXBhdGlibGUgPSAibnhwLHJ0Yy1wY2YyMTIz
IiwgfSwNCkBAIC00NjUsNyArMzc4LDYgQEAgc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIHBjZjIx
MjNfZHJpdmVyID0gew0KIAkJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihwY2YyMTIz
X2R0X2lkcyksDQogCX0sDQogCS5wcm9iZQk9IHBjZjIxMjNfcHJvYmUsDQotCS5yZW1vdmUJPSBw
Y2YyMTIzX3JlbW92ZSwNCiB9Ow0KIA0KIG1vZHVsZV9zcGlfZHJpdmVyKHBjZjIxMjNfZHJpdmVy
KTsNCi0tIA0KMi4xNy4xDQoNCg==
