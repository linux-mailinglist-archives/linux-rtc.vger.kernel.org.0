Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870D413440
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 21:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfECT7W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 15:59:22 -0400
Received: from esa3.tennantco.iphmx.com ([68.232.154.86]:3394 "EHLO
        esa3.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbfECT7W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 15:59:22 -0400
IronPort-PHdr: =?us-ascii?q?9a23=3AwoGE/BPYhIea3amnVsAl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0K/z9pMbcNUDSrc9gkEXOFd2Cra4d0qyJ6uu5BTFIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+0oAnMucUanIRvJ6YswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKMSMy/mPKhcxqlK9VoAyvqQFjw4DaY4+VOvhxcKTcfdwGSm?=
 =?us-ascii?q?ROUd1cVzBaDY6mc4cCFfYNMOReooLgp1UOtxy+BQy0Ce3hyj5IgmX53asn2O?=
 =?us-ascii?q?ojFgHH0hIvHtITu3nTotv0NKMSXvqzzKXSzzvDaP1X1in96YXTbhAuv/eMXb?=
 =?us-ascii?q?RqfsrX1UkgCwTFgk+MpoziOjOYz+IAuHWY4ep4Te+jlnIrpg5rrjWgxMogkI?=
 =?us-ascii?q?fEi4EPxl3E6Cl12Js5KNm7RUJhf9KoDJRduzuUOoZ4WM8uXX1ktDoixr0Ip5?=
 =?us-ascii?q?G2fzQGxZEiyhPedvOIb4yF7xf+W+mPPzh1indod6yiiBmu7UStz/fzW8uv31?=
 =?us-ascii?q?lUqCdOj8PCuWoX1xPJ78iKUv59/kC81jmRzw3T8eREIVwslarcNp4h3qY8lp?=
 =?us-ascii?q?oNvkTHGS/7gF34gbOReEk45OSk8vnqbLP4qpOFMI97kR/xPr4pmsyiHeQ3KQ?=
 =?us-ascii?q?8OX3Wd+euhzrHj5Vf5QLJWjvIojqbZrJHaJcMdpqKjBA9Vz5oj6xK4Dzeh09?=
 =?us-ascii?q?QUh2UILFVAeB6fjojpPU/BIOzgAPuin1ihny1nyv/EM7H7DJjALWLPnbf8cb?=
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
X-IPAS-Result: =?us-ascii?q?A2F1CgDjmsxc/zMmL2hlg1VQW4EGBAsoCoQGg0cDhTGJT?=
 =?us-ascii?q?5xNAxg8DwEtAoQ+AheCEzgTAQMBAQEEAQEBAQIBAQJpHAELgjoiaTkyAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQI4OQIBAxIRBA0MA?=
 =?us-ascii?q?QERJgEPAgEiAiYCAgIwFRACBA4FIoMAgWsDHQGhHz0CYgILgQEpiF9xfDOCe?=
 =?us-ascii?q?QEBBYR+GFKBPAmBCyeGeIYtP4RhhEM7glCCWIsbgjqZYQcCggtWkWMnlUiMG?=
 =?us-ascii?q?5RpAgQCBAUCDgEBBYFmIoFWMxojgzyBGIRmilNAATGBKY51AYEgAQE?=
X-IronPort-AV: E=Sophos;i="5.60,426,1549951200"; 
   d="scan'208";a="13731134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-bl2nam02lp2051.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.51])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 May 2019 14:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/CT1WCcXx5ZYsldQSVjzEwMHeb/eeV0W66vv4pp0yE=;
 b=EntLlfCa7feY38qpX9Tz5diTonZiZuFi5YWcTL8XK+3flZn9L7Sp6wRONw15bf1ZP49aea347L7agYqdanxMTp2xYrw9HZ4eP2Jm2xFmtI5CeAt+KEw2iylZ2vvaGvHJT1o9qEDmoSRuoKaOvonD+sttyhzIRfLBTQ1dYEEDPvE=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1624.namprd20.prod.outlook.com (10.171.167.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 19:52:13 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 19:52:13 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Dylan Howey <Dylan.Howey@tennantco.com>
Subject: [PATCH v2 4/4] rtc: pcf2123: use %ptR
Thread-Topic: [PATCH v2 4/4] rtc: pcf2123: use %ptR
Thread-Index: AQHVAemzlzvgTfa2QkWK6KkkgoESLg==
Date:   Fri, 3 May 2019 19:52:12 +0000
Message-ID: <20190503195149.31297-4-Dylan.Howey@tennantco.com>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
In-Reply-To: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:208:2d::23) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a221061-f9a3-4533-8944-08d6d000d5cc
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1624;
x-ms-traffictypediagnostic: CY4PR20MB1624:
x-microsoft-antispam-prvs: <CY4PR20MB1624567A1369651AEFCB9A7FEF350@CY4PR20MB1624.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:172;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(186003)(386003)(26005)(486006)(71200400001)(7736002)(11346002)(86362001)(6506007)(14454004)(6436002)(305945005)(71190400001)(1076003)(4326008)(72206003)(102836004)(50226002)(2501003)(52116002)(76176011)(256004)(6916009)(5660300002)(6512007)(81166006)(99286004)(478600001)(446003)(2351001)(68736007)(6486002)(53936002)(6116002)(107886003)(5640700003)(8676002)(2906002)(316002)(3846002)(36756003)(66066001)(81156014)(64756008)(73956011)(66446008)(66946007)(8936002)(66476007)(66556008)(2616005)(25786009)(54906003)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1624;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AFPhHF4yutQ4CJsaY2KXNYiYZTT5vywpYtld2NaO1Y6dgnRmWG/zNfNB9Qwv+6wNGxDTrVlMEWUijZE4OJmNPhPUeBLHf9+b1QU7qWPI+nFUClR7U0FxNrphE5h1df1XDbQT8BpnwHJfLdN6YuNXAsZipS19YBGETdMWk5z2JFuNVJmEkThLm62b0brnA+x+iOxVXcWMcIMjyg4sZ/FyFCicuqVa5fdBYo6L0HpMrZ6KTVoCyqdj4hgQ4cFzSrNhhz0FTmRjb6AKt6+V7n/nLdEkEGOIpt0L75NyOEeuFOipJL7C8hJEMSp/vJeasBipo1ZXRwChX5vRIwUvuL6qjmTjANGq8XeNtnxFsKFApYRYHc/XuGF/5VeaU9qamTW6+X63J6ryGmd0O4DiKomSCyt9xnd70t8IZ8nwFLo0+Ho=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a221061-f9a3-4533-8944-08d6d000d5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 19:52:12.8185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1624
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VXNlICVwdFIgdG8gcHJpbnQgZGF0ZSBpbiBodW1hbiByZWFkYWJsZSBmb3JtYXQuDQoNClNpZ25l
ZC1vZmYtYnk6IER5bGFuIEhvd2V5IDxEeWxhbi5Ib3dleUB0ZW5uYW50Y28uY29tPg0KLS0tDQog
ZHJpdmVycy9ydGMvcnRjLXBjZjIxMjMuYyB8IDEyICsrLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ydGMvcnRjLXBjZjIxMjMuYyBiL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTIzLmMNCmluZGV4
IDg2MTBiZjY5MGRlNi4uM2IzMTRjZTk5MWU1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ydGMvcnRj
LXBjZjIxMjMuYw0KKysrIGIvZHJpdmVycy9ydGMvcnRjLXBjZjIxMjMuYw0KQEAgLTIwMiwxMSAr
MjAyLDcgQEAgc3RhdGljIGludCBwY2YyMTIzX3J0Y19yZWFkX3RpbWUoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRtKQ0KIAlpZiAodG0tPnRtX3llYXIgPCA3MCkNCiAJCXRt
LT50bV95ZWFyICs9IDEwMDsJLyogYXNzdW1lIHdlIGFyZSBpbiAxOTcwLi4uMjA2OSAqLw0KIA0K
LQlkZXZfZGJnKGRldiwgIiVzOiB0bSBpcyBzZWNzPSVkLCBtaW5zPSVkLCBob3Vycz0lZCwgIg0K
LQkJCSJtZGF5PSVkLCBtb249JWQsIHllYXI9JWQsIHdkYXk9JWRcbiIsDQotCQkJX19mdW5jX18s
DQotCQkJdG0tPnRtX3NlYywgdG0tPnRtX21pbiwgdG0tPnRtX2hvdXIsDQotCQkJdG0tPnRtX21k
YXksIHRtLT50bV9tb24sIHRtLT50bV95ZWFyLCB0bS0+dG1fd2RheSk7DQorCWRldl9kYmcoZGV2
LCAiJXM6IHRtIGlzICVwdFJcbiIsIF9fZnVuY19fLCB0bSk7DQogDQogCXJldHVybiAwOw0KIH0N
CkBAIC0yMTcsMTEgKzIxMyw3IEBAIHN0YXRpYyBpbnQgcGNmMjEyM19ydGNfc2V0X3RpbWUoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRtKQ0KIAl1OCB0eGJ1Zls3XTsNCiAJ
aW50IHJldDsNCiANCi0JZGV2X2RiZyhkZXYsICIlczogdG0gaXMgc2Vjcz0lZCwgbWlucz0lZCwg
aG91cnM9JWQsICINCi0JCQkibWRheT0lZCwgbW9uPSVkLCB5ZWFyPSVkLCB3ZGF5PSVkXG4iLA0K
LQkJCV9fZnVuY19fLA0KLQkJCXRtLT50bV9zZWMsIHRtLT50bV9taW4sIHRtLT50bV9ob3VyLA0K
LQkJCXRtLT50bV9tZGF5LCB0bS0+dG1fbW9uLCB0bS0+dG1feWVhciwgdG0tPnRtX3dkYXkpOw0K
KwlkZXZfZGJnKGRldiwgIiVzOiB0bSBpcyAlcHRSXG4iLCBfX2Z1bmNfXywgdG0pOw0KIA0KIAkv
KiBTdG9wIHRoZSBjb3VudGVyIGZpcnN0ICovDQogCXJldCA9IHJlZ21hcF93cml0ZShwZGF0YS0+
bWFwLCBQQ0YyMTIzX1JFR19DVFJMMSwgQ1RSTDFfU1RPUCk7DQotLSANCjIuMTcuMQ0KDQo=
