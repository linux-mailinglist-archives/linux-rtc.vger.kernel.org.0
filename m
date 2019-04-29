Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73996E5EA
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Apr 2019 17:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbfD2PQ2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 11:16:28 -0400
Received: from esa3.tennantco.iphmx.com ([68.232.154.86]:25942 "EHLO
        esa3.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfD2PQ2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Apr 2019 11:16:28 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Apr 2019 11:16:27 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3AKLE9+xCFRKhcmkevHLejUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP37rsiwAkXT6L1XgUPTWs2DsrQY0rOQ7fqrCTBIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+3oAnPucUbgoRvIbstxx?=
 =?us-ascii?q?XUpXdFZ/5Yzn5yK1KJmBb86Maw/Jp9/ClVpvks6c1OX7jkcqohVbBXAygoPG?=
 =?us-ascii?q?4z5M3wqBnMVhCP6WcGUmUXiRVHHQ7I5wznU5jrsyv6su192DSGPcDzULs5Vy?=
 =?us-ascii?q?iu47ttRRT1kyoMKSI3/3/LhcxxlKJboQyupxpjw47PfYqZMONycr7Bcd8GQG?=
 =?us-ascii?q?ZMWNtaWS5cDYOmd4YBD/QPM/tEr4fzpFUOoxmxBQiwC+3gxTBFnWP20rYg3u?=
 =?us-ascii?q?g9DQ3KwA4tEtQTu3rUttX1M6ISXPi7wKfKyjXCYe1Z2Dfl5IPVfB4gofWMUq?=
 =?us-ascii?q?h2ccbf1EIiEA3Lj1WUqYP/OTOZzOYDs2+V7uV+VeOikHInpB93ojip3MgsjJ?=
 =?us-ascii?q?XJiZ4Sylze6Sp5x4M1KMS+RUVmYtCkCINduzyGO4Z5WM8vTGNltDw1x7AGo5?=
 =?us-ascii?q?K2fCYHxIw6yxPbaPGLaZaE7g7sWeqLLzp1imhpdKyjixqu6USgxPPzW8qo3F?=
 =?us-ascii?q?tPqydIk8TDuWwJ2hHW98eIVOVy80mk1DmRyg/c9v1ILEUumqfZMJEu3Lg9nY?=
 =?us-ascii?q?cJv0vZBC/5gkD2gbeTdkUj5+en9fzqYq7jpp+AL490jRz+Mrg2lsy/H+s4Ng?=
 =?us-ascii?q?8OUnCD9+mg07Pv4UL0TKxUg/Mvj6XVqZfaKt8FqaKjBA9Vz5oj5A24Dze71t?=
 =?us-ascii?q?QXgGMLLEpfeBKAk4jmJU3BIOz5Dfe4hVSgijBrx+3aPr3lBZXNKXvDnK39cr?=
 =?us-ascii?q?Z67k5Q0AszzdZB6JJIErwNPe7/V0DruNHXDBI1KQO5zub9BNh92I4SQWePDb?=
 =?us-ascii?q?WYMKPWv1+I/OUvI+yUaYEbuDf9L+Iq5/j0gXE7nl8cc7em3JsMZXCkAPtmJU?=
 =?us-ascii?q?OZbmDqgtcdDWgKuRAyQ/DtiF2HSTJTfWq9X7og5jEnD4KrFZ3MRoSzj72Oxi?=
 =?us-ascii?q?i7GIBZZnpYBVyWCnjnaYGEW/MLaCKUI89siScLVb+mS4890RGutQn6x6B7Ie?=
 =?us-ascii?q?rT/y0SrYjj28Rt5+3PiREy8iR5AN6H32CMUmF0m2YIRzgt0aBjpkx8xEmM0b?=
 =?us-ascii?q?Jkg/NGCdNT5+lFUgYmNZTE1ex1F8jyWh7dfteOUFumRtSmATcsTtM+2tMOeV?=
 =?us-ascii?q?p9FMm5gxDd0CqlHaUVm6aIBJMq6KLc2Wb+J8Jnx3bBzqkhgApufswaHGmrlq?=
 =?us-ascii?q?d5+xLeT6TEl0GekafiIa0Y0T7E8muZwCyEsUVcVwhxea/CWmwbZ02QptP8sB?=
 =?us-ascii?q?DsVbirXP4HNRRM2IrKBrpOY9ujxQFqVfPqPpL+ZH28ik+sCBCOz7WQZ42scG?=
 =?us-ascii?q?IYinaOQHMYmhweqC7VfTM1AT2s9ieHVGQ0TwDmfl/s/O9iqXiyUk4zyUSQYl?=
 =?us-ascii?q?Z806aupE5HnuSSHvUU2L9M+DwsrTl5Bh6c55rXEJLBwmgpZ6BAeZU46VZD23?=
 =?us-ascii?q?jesllRL5ipKeZCgUETYixrskXo3hNrAYIGms8v/zsn?=
X-IPAS-Result: =?us-ascii?q?A2HmCADmDsdc/zUtL2hmHgEGBwaBZYE+KSdagQMDBAsoC?=
 =?us-ascii?q?oQGg0cDhTGJXIJXmXQDGDwPAS0ChD4CF4Y/OBMBAwEBAQQBAQEBAgEBAmkcD?=
 =?us-ascii?q?II6KQFhOTIBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEFA?=
 =?us-ascii?q?jg5AQEBAxIREQwBAR0aAQ8CAQgYAgIFIQICAg0jFRACBA4nhGoDHAGhQj0CY?=
 =?us-ascii?q?gILgQEpiF9xgS+CeQEBBYR7GIIOCYELJ40iPoQjPoREF4JzMoImjTyZPwMEA?=
 =?us-ascii?q?gKCCZInJ5UnoFoCBAIEBQIOAQEFgWYigVZwgzyCD4EkAQiCQopTQAExgSmRc?=
 =?us-ascii?q?AGBIAEB?=
X-IronPort-AV: E=Sophos;i="5.60,409,1549951200"; 
   d="scan'208";a="13663059"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-co1nam04lp2053.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.53])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Apr 2019 10:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnL6sYgRUbt2m/OaUrkJU6DJ3sOqN0mxgtxVxOd62X4=;
 b=l7IiO7uqvKhrY3zdvJpQyyVof+FGFXaelcha/UKUwbnlywcFZSrOKslK4J3MivSdhawY3n4Oxd/ARIJ4MTCSLyyX2pVPKmBQP/basyJEcaJ2/icwwoNCUI27PIybd/bYowhgC59niIXptfQTTIuYJx5E15GuWv7qN+Q21u1jwpg=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1526.namprd20.prod.outlook.com (10.171.168.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 15:09:18 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 15:09:18 +0000
From:   "Howey, Dylan" <Dylan.Howey@tennantco.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Topic: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Index: AQHU/GdxJRWxL7Stt0KuQz+yj2UEMaZP+a8AgANIhQA=
Date:   Mon, 29 Apr 2019 15:09:18 +0000
Message-ID: <20190429150913.GA15052@tennantco.com>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net>
In-Reply-To: <20190427130054.GY14604@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:2d::36) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1f6be45-0190-4f45-16ac-08d6ccb4a683
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1526;
x-ms-traffictypediagnostic: CY4PR20MB1526:
x-microsoft-antispam-prvs: <CY4PR20MB1526D7AB6CF2C0B4F8DA4896EF390@CY4PR20MB1526.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39850400004)(396003)(376002)(346002)(366004)(51914003)(199004)(189003)(53936002)(25786009)(8676002)(66946007)(14444005)(81156014)(81166006)(256004)(4326008)(6486002)(2616005)(6512007)(6246003)(386003)(6916009)(478600001)(229853002)(476003)(6506007)(5660300002)(11346002)(26005)(66066001)(8936002)(6436002)(446003)(72206003)(14454004)(186003)(102836004)(486006)(1076003)(3846002)(6116002)(52116002)(305945005)(71200400001)(2906002)(7736002)(76176011)(99286004)(36756003)(316002)(71190400001)(68736007)(66476007)(73956011)(97736004)(64756008)(66446008)(66556008)(86362001)(54906003)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1526;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v+BwIerK5nR3NGOXijWb9NpOLPaUycm8047UMWdfrp6+UN2yBowKl92f4aWBlcK+Zy2wJRWfvzKwnoV/sy4mmOigiVVZOqxIdTiPqV3wFvpp9ka4C5n1l+edrOtiTaVFUP4kE0rCSO23DvJGjnsCV4ymZCR3sx4+EOjYWMuKPXtsldNNqd3wa4mNWB91zm1zshHxZfuEsV6WDZtWKTXz6ASJDAOjeiEwe9wrrxdBDt0xkrSQTrUbMVnIDy5UYpWxKoGPhkqkDFMeS2jyvQ8xJwPerf3/7QZwIDAjddDZWaD+kt737ihWQZmBoJyttMwrV/IMOVkr0fVgs4yS82PQxkhYVyKy2+xjlYF7Dqy/PIkNK1qdU7dwmNjs+FXpejVHAqV+rYGiGGJImcY6NIhaXe7AV0ACEPseocrGPkKIa1s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEFCB4A2984DD74DA54FC595392161C7@namprd20.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f6be45-0190-4f45-16ac-08d6ccb4a683
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 15:09:18.1804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1526
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UuIFRoaXMgaXMgYWN0dWFsbHkgdGhlIGZpcnN0
IHRpbWUgSSd2ZQ0Kc3VibWl0dGVkIGNoYW5nZXMgdG8gdGhpcyBwcm9qZWN0Lg0KDQpUaGUgMDQv
MjcvMjAxOSAxNTowMCwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+ID4gLXN0YXRpYyBpbnQg
cGNmMjEyM193cml0ZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1OCByZWcsIHU4IHZhbCkNCj4g
PiAtew0KPiA+IC0JdTggdHhidWZbMl07DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X3JhbmdlIHBjZjIxMjNfcmFuZ2VzW10gPSB7DQo+ID4gKwl7DQo+ID4gKwkJLnJhbmdlX21pbiA9
IFBDRjIxMjNfUkVHX0NUUkwxLA0KPiA+ICsJCS5yYW5nZV9tYXggPSBQQ0YyMTIzX1JFR19DVERX
Tl9UTVIsDQo+ID4gKwl9LA0KPiA+ICt9Ow0KPiA+ICANCj4gPiAtCXR4YnVmWzBdID0gcmVnOw0K
PiA+IC0JdHhidWZbMV0gPSB2YWw7DQo+ID4gLQlyZXR1cm4gcGNmMjEyM193cml0ZShkZXYsIHR4
YnVmLCBzaXplb2YodHhidWYpKTsNCj4gPiAtfQ0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJl
Z21hcF9hY2Nlc3NfdGFibGUgcGNmMjEyM19hY2Nlc3NfdGFibGUgPSB7DQo+ID4gKwkueWVzX3Jh
bmdlcyA9IHBjZjIxMjNfcmFuZ2VzLA0KPiA+ICsJLm5feWVzX3JhbmdlcyA9IEFSUkFZX1NJWkUo
cGNmMjEyM19yYW5nZXMpLA0KPiA+ICt9Ow0KPiANCj4gVGhpcyBjb3ZlcnMgYWxsIHRoZSByZWdp
c3RlcnMsIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBuZWNlc3NhcnkuDQo+IA0KVGhpcyB3b3VsZCBj
b3ZlciB0aGUgc2FtZSByZWdpc3RlcnMgdGhhdCBhcmUgZXhwb3NlZCBieSB0aGUgc3lzZnMNCmlu
dGVyZmFjZS4gSSBjYW4gdGFrZSBvdXQgdGhlIHRpbWVyIHJlZ2lzdGVycyBzaW5jZSB0aGlzIGRy
aXZlciBkb2VzIG5vdA0Kc3VwcG9ydCB0aGUgcGVyaW9kaWMgdGltZXIuDQoNCkkgYWdyZWUgd2l0
aCB0aGUgcmVzdCBvZiB5b3VyIGZlZWRiYWNrLiBXaGVuIEkgc2VuZCBhIFYyIHBhdGNoIHNob3Vs
ZCBJDQpyZXNwb25kIHRvIHRoaXMgdGhyZWFkPw0KDQoNCi0tIA0KRHlsYW4NCg==
