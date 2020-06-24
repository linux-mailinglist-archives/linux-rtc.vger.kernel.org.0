Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7F62072EA
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2020 14:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403812AbgFXMJU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Jun 2020 08:09:20 -0400
Received: from mail-eopbgr1300070.outbound.protection.outlook.com ([40.107.130.70]:33803
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388522AbgFXMJQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 24 Jun 2020 08:09:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRmEiqaN4luPheS8nWkX4ze4tvzoqzj1Wxda273s/HxeOa1Cx/Y8Yf3b0RuWutp5oqaaIoBZ3m2ie0E07s5SXsrkUXguttBtWuT65ksciid/JsuNPHTjZ7YYqpbcxkVPSuRwVq9QqylX7DKYjMiOBT3wFf7DJjylsUH6Q3UgGPv0Y6UjlRvUAdeYlyw/26frSYOdBb+H4b+YlIRE0cQBoGP+ZJyqqyGzbWPBOejwSR/e9SWPjOtJOXf5X7oJGj1Xaeq4+GC9YsCWMxNoxx4ULE5pVZRWCIizW5R4+eXe1bDn3WnRr06RqXLsSsrT9kbw1T9MRMIAtTxT24KcEUxi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/AGggQl1i1D3yTyEr8XXNRXAPGdoDuZsgNC+o0nKtI=;
 b=iWzC1oHGNvclDbBOareKbZpE+kID16mdb3k/gVXXv7+RqOazWH1VFLadiFiKsBRaqBKAAQkZyOYvbFIQjqgxZJVIvpmrtb8vJstmz5ZQZXbPwiOFQ3wwpv04q97xMI6oo4M7C6AxZaO01CFCW07u+2pxHvFu+YQPuDbTHsjVclCJKjCz1yvUBgxj3LbFiD53yFBYQWLrnZjWzPt/dKiz7HLH8hlZBo/bf1ROCIGaWZZAZtN07s67rIhq/Bei4eZTgXhNJc2ETy0viF1XKz6apgXeEY3UCjqu+gHaCf6RA+uROzgSyHtnFGHX+UkHZxGmvKlw6SKLn4IipBBDUvklWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/AGggQl1i1D3yTyEr8XXNRXAPGdoDuZsgNC+o0nKtI=;
 b=GhHHcgl4UuXowJ2w1OKEaeh6KKjI/ZMRCZ2czgLAscB9gUdrmZ+fO3xKD57F7Xe4OrwrEPHrV63W1kfMPi6oULepGrBohpN4PasdycbK9OEc6TPzjdnSW3g9+ChbCH2OUsB/z4hJeDmWtCpfWslvFa9A4FwV4LCDjju2BrHF+PQ=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3363.apcprd01.prod.exchangelabs.com
 (2603:1096:202:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 12:09:06 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3%6]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 12:09:05 +0000
From:   =?big5?B?Sm9obnNvbiBDSCBDaGVuICizr6xMvrEp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH 3/3] watchdog: ds1374_wdt: Introduce Dallas/Maxim DS1374
 Watchdog driver
Thread-Topic: [PATCH 3/3] watchdog: ds1374_wdt: Introduce Dallas/Maxim DS1374
 Watchdog driver
Thread-Index: AQHWSKEsc3rPjJeNCkiN8FbFVgZdGajlvIMAgAB0XACAAXytUA==
Date:   Wed, 24 Jun 2020 12:09:05 +0000
Message-ID: <HK2PR01MB32813909499422C293E929D2FA950@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB3281885DA5822E1D10ACD07CFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <9af288a5-b2a2-c36b-1b28-6a0b925b4a68@roeck-us.net>
 <HK2PR01MB328183C5595B0BD046146B41FA940@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <de352d8e-7c91-6f8e-5d0d-93497a830940@roeck-us.net>
In-Reply-To: <de352d8e-7c91-6f8e-5d0d-93497a830940@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3039a1c7-753a-47cf-c3d3-08d81837646a
x-ms-traffictypediagnostic: HK2PR01MB3363:
x-microsoft-antispam-prvs: <HK2PR01MB3363F16CC8AD2F82B9BBD802FA950@HK2PR01MB3363.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T83j9GeiJNwEKjUS70yZZGNk6UVWNLDsCUrrzX2Z9GW9bmrSXUEFjdaiolMBwvU4KJBvzLD83ScOgDvv1zvh2hWg8RDjuWe0lAM/FaQwtYQG9B4po93JEQvFdsMLOrJuZrcQBjtEvj8hKtelEoYkkKUuaiPhGYuBqQr8wq7+Py9AU+qq/VMMn+ByOmzK6r1e+4vc6/onJLXBJ6hDur6wjQB+WuNiaetjAvzKFhiwqZSoVgi6909qbL9wK6beppvZw8AbAygEMZHVajj1dfiBbsMbg3kO0N4Plwt8nTBpt7eKTyWnySGrgSle/KkNFYFhzi8fu7N0FwWNUmZQgE/24g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(71200400001)(86362001)(8936002)(110136005)(54906003)(478600001)(8676002)(316002)(83380400001)(186003)(55016002)(6506007)(7696005)(5660300002)(85182001)(66446008)(9686003)(30864003)(53546011)(26005)(33656002)(64756008)(66946007)(76116006)(52536014)(2906002)(4326008)(66476007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: iT6lfpC4mGM+p/r9B8SoKT5owv2nyo3wO7U/sgIAPSeiWbHyHkv7nScOtWqkq39QH91bK59BvGMh9TzHxTWuNqBjFd6v4bO+717upnfVM9CR6JKENsxSDYGWU0Tx1CSB70gXr5IAQUMvV5dkPZeO7jtFjjXKdUVeB3RvSPNwo/+PbI5e7038I3KJoJQ6J9QCai1BK8ns7ZBrhhACO824YLyKv2DSpDmL7NASGPrwIXT71CCZa//DiI7A+CPMOoiV6BULksgRcyRy4rSWB/og953jKK1NzFxXlB739M5a/HK1HkSPqPbPjQBWQAkFAQbm56xPPaACTy+0M+YiNAz6UB2cxida/rD+QZ9cGcHbDLRMn8QV8dY3YDLdxdlj3U1GRSl2s+FY+pssPlpmLGWbuLN5ARIVTMUBwH3j21CMtwL/JW3cfqgw/I3mo0/xdkTKOIjOIUW5nIdM+vCzRRTP82J24kOT5i1IvMff33nY9jY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3039a1c7-753a-47cf-c3d3-08d81837646a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 12:09:05.8182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: On1l4pkcW6JZH3x/GMlPoPACkrLXef86Z51rUvdCPXR7MPJuJ2yBH2hkW5PmkyvXCn5aqf5pXyc3zFl8fqscjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3363
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksDQoNCj4gT24gNi8yMi8yMCAxMToyOCBQTSwgSm9obnNvbiBDSCBDaGVuICizr6xMvrEpIHdy
b3RlOg0KPiA+IEhpLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIGdvb2QgZGV0YWlsZWQgc3Vn
Z2VzdGlvbnMhDQo+ID4NCj4gDQo+IE90aGVyIGZlZWRiYWNrIHN1Z2dlc3RzIHRvIGNvbnZlcnQg
dGhlIGRyaXZlciB0byB1c2UgdGhlIHdhdGNoZG9nIGNvcmUgaW4gdGhlDQo+IHJ0YyBjb2RlLiBJ
IHdvdWxkIHN1Z2dlc3QgdG8gZm9sbG93IHRoYXQgc3VnZ2VzdGlvbi4NCj4gDQpVbmRlcnN0YW5k
IHRoZSBmb2xsb3dpbmcgc3VnZ2VzdGlvbnMgZm9yIHdhdGNoZG9nIHRpbWVyIHNldHRpbmcgYW5k
IEkgd2lsbCBpbXByb3ZlIHRoZW0gd2l0aCB3YXRjaGRvZyBjb3JlIGluIHJ0YyBjb2RlIGxhdGVy
Lg0KDQoNCkJlc3QgcmVnYXJkcywNCkpvaG5zb24NCg0KPiA+Pj4gKyAqIEl0IHdvdWxkIGJlIG1v
cmUgZWZmaWNpZW50IHRvIHVzZSBpMmMgbXNncy9pMmNfdHJhbnNmZXIgZGlyZWN0bHkNCj4gPj4+
ICtidXQsIGFzDQo+ID4+PiArICogcmVjb21tZW5lZCBpbiAuLi4vRG9jdW1lbnRhdGlvbi9pMmMv
d3JpdGluZy1jbGllbnRzIHNlY3Rpb24NCj4gPj4+ICsgKiAiU2VuZGluZyBhbmQgcmVjZWl2aW5n
IiwgdXNpbmcgU01CdXMgbGV2ZWwgY29tbXVuaWNhdGlvbiBpcw0KPiBwcmVmZXJyZWQuDQo+ID4+
PiArICovDQo+ID4+PiArDQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+Pj4g
KyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2lvY3RsLmg+DQo+ID4+PiArI2luY2x1ZGUgPGxp
bnV4L3JlYm9vdC5oPg0KPiA+Pj4gKyNpbmNsdWRlIDxsaW51eC93YXRjaGRvZy5oPg0KPiA+Pj4g
KyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gPj4+ICsjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+DQo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiA+Pj4gKyNp
bmNsdWRlIDxsaW51eC91YWNjZXNzLmg+DQo+ID4+DQo+ID4+IEFscGhhYmV0aWMgb3JkZXIgcGxl
YXNlLg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyNkZWZpbmUgREVWTkFNRSAgICAgICAgICAgICAg
ICAgImRzMTM3NF93ZHQiDQo+ID4+PiArDQo+ID4+PiArI2RlZmluZSBEUzEzNzRfUkVHX1dEQUxN
MAkweDA0IC8qIFdhdGNoZG9nL0FsYXJtICovDQo+ID4+PiArI2RlZmluZSBEUzEzNzRfUkVHX1dE
QUxNMQkweDA1DQo+ID4+PiArI2RlZmluZSBEUzEzNzRfUkVHX1dEQUxNMgkweDA2DQo+ID4+PiAr
I2RlZmluZSBEUzEzNzRfUkVHX0NSCQkweDA3IC8qIENvbnRyb2wgKi8NCj4gPj4+ICsjZGVmaW5l
IERTMTM3NF9SRUdfQ1JfQUlFCTB4MDEgLyogQWxhcm0gSW50LiBFbmFibGUgKi8NCj4gPj4+ICsj
ZGVmaW5lIERTMTM3NF9SRUdfQ1JfV0RTVFIgICAgIDB4MDggLyogMT1JTlQsIDA9UlNUICovDQo+
ID4+PiArI2RlZmluZSBEUzEzNzRfUkVHX0NSX1dEQUxNCTB4MjAgLyogMT1XYXRjaGRvZywgMD1B
bGFybSAqLw0KPiA+Pj4gKyNkZWZpbmUgRFMxMzc0X1JFR19DUl9XQUNFCTB4NDAgLyogV0QvQWxh
cm0gY291bnRlciBlbmFibGUgKi8NCj4gPj4+ICsNCj4gPj4+ICsvKiBEZWZhdWx0IG1hcmdpbiAq
Lw0KPiA+Pj4gKyNkZWZpbmUgV0RfVElNTyAgICAgICAgICAgICAgICAgMTMxNzYyDQo+ID4+PiAr
I2RlZmluZSBUSU1FUl9NQVJHSU5fTUlOCTQwOTYgLyogMXMgKi8NCj4gPj4+ICsjZGVmaW5lIFRJ
TUVSX01BUkdJTl9NQVgJKDYwKjYwKjI0KjQwOTYpIC8qIG9uZSBkYXkgKi8NCj4gPj4+ICsNCj4g
Pj4+ICtzdGF0aWMgaW50IHdkdF9tYXJnaW4gPSBXRF9USU1POw0KPiA+Pg0KPiA+PiBTam91bGQg
bm90IGJlIHByZS1pbml0aWFsaXplZC4gQWxzbywgMTMxNzYyIGlzbid0IDMyIHNlY29uZHMsIGl0
IGlzDQo+ID4+IDEzMSw3NjIgc2Vjb25kcy4NCj4gPj4NCj4gPg0KPiA+IDEzMTc2MiBpcyAzMiBz
ZWNvbmRzIGFjdHVhbGx5IGJlY2F1c2Ugd2F0Y2hkb2cgY291bnRlciBpbmNyZWFzZXMgcGVyDQo+
ID4gMS80MDk2IHNlY29uZHMgZm9yIERTMTM3NC4gSWYgRFMxMzc0X1JFR19DUl9XREFMTSBpcyBz
ZXQgdG8gMCAoYWxhcm0pLA0KPiA+IGFsYXJtIGNvdW50ZXIgd2lsbCBpbmNyZWFzZSBwZXIgMSBz
ZWNvbmQuDQo+ID4NCj4gDQo+IFRoZSB3YXRjaGRvZyBjb3JlIGtlZXBzIHRpbWVvdXRzIGluIHNl
Y29uZHMuIEZvciB0aGUgd2F0Y2hkb2cgY29yZSwNCj4gMTMxNzYyIGlzIDEzMSw3NjIgc2Vjb25k
cy4gWW91ciBjb2RlIGFzc3VtZXMgdGhhdCB0aGUgd2F0Y2hkb2cgY29yZQ0KPiBkb2VzIG5vdCBj
YXJlIGFib3V0IC8gbmVlZCB0byBzY2FsZSwgd2hpY2ggaXMgd3JvbmcuIEJlc2lkZXMsDQo+IE1P
RFVMRV9QQVJNX0RFU0MgYmVsb3cgY2xlYXJseSBzdGF0ZXMgIldhdGNoZG9nIHRpbWVvdXQgX2lu
IHNlY29uZHNfIg0KPiAoZW1waGFzaXMgYWRkZWQpLg0KPiANCj4gPj4+ICttb2R1bGVfcGFyYW0o
d2R0X21hcmdpbiwgaW50LCAwKTsNCj4gPj4+ICtNT0RVTEVfUEFSTV9ERVNDKHdkdF9tYXJnaW4s
ICJXYXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMNCj4gKGRlZmF1bHQNCj4gPj4+ICszMnMpIik7
DQo+ID4+PiArDQo+ID4+DQo+ID4+IEFzIGEgbmV3IGRyaXZlciwgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGp1c3QgdXNlIHRoZSBjdXN0b21hcnkgInRpbWVvdXQiLg0KPiA+Pg0KPiA+Pj4gK3N0YXRp
YyBib29sIG5vd2F5b3V0ID0gV0FUQ0hET0dfTk9XQVlPVVQ7DQo+IG1vZHVsZV9wYXJhbShub3dh
eW91dCwNCj4gPj4+ICtib29sLCAwKTsgTU9EVUxFX1BBUk1fREVTQyhub3dheW91dCwgIldhdGNo
ZG9nIGNhbm5vdCBiZSBzdG9wcGVkDQo+ID4+IG9uY2UNCj4gPj4+ICtzdGFydGVkIGRlZmF1bHQg
PSINCj4gPj4+ICsJCV9fTU9EVUxFX1NUUklORyhXQVRDSERPR19OT1dBWU9VVCkgIikiKTsNCj4g
Pj4+ICsNCj4gPj4+ICtzdHJ1Y3QgZHMxMzc0X3dkdCB7DQo+ID4+PiArCXN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQ7DQo+ID4+PiArCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdDsNCj4gPj4+
ICsJc3RydWN0IHdvcmtfc3RydWN0IHdvcms7DQo+ID4+DQo+ID4+IE5vdCB1c2VkLg0KPiA+Pg0K
PiA+Pj4gKw0KPiA+Pj4gKwkvKiBUaGUgbXV0ZXggcHJvdGVjdHMgYWxhcm0gb3BlcmF0aW9ucywg
YW5kIHByZXZlbnRzIGEgcmFjZQ0KPiA+Pj4gKwkgKiBiZXR3ZWVuIHRoZSBlbmFibGVfaXJxKCkg
aW4gdGhlIHdvcmtxdWV1ZSBhbmQgdGhlIGZyZWVfaXJxKCkNCj4gPj4+ICsJICogaW4gdGhlIHJl
bW92ZSBmdW5jdGlvbi4NCj4gPj4+ICsJICovDQo+ID4+DQo+ID4+IFRoZXJlIGlzIG5vIHdvcmtx
dWV1ZSBoZXJlLCBhbmQgdGhlIHJlbW92ZSBmdW5jdGlvbiBpcyBub3QgbmVlZGVkLg0KPiA+Pg0K
PiA+Pj4gKwlzdHJ1Y3QgbXV0ZXggbXV0ZXg7DQo+ID4+PiArfTsNCj4gPj4+ICsNCj4gPj4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHdhdGNoZG9nX2luZm8gZHMxMzc0X3dkdF9pbmZvID0gew0KPiA+
Pj4gKwkuaWRlbnRpdHkgICAgICAgPSBERVZOQU1FLA0KPiA+Pj4gKwkub3B0aW9ucyAgICAgICAg
PSBXRElPRl9TRVRUSU1FT1VUIHwgV0RJT0ZfS0VFUEFMSVZFUElORyB8DQo+ID4+PiArCQkJCQkJ
V0RJT0ZfTUFHSUNDTE9TRSwNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBzdHJ1
Y3Qgd2F0Y2hkb2dfZGV2aWNlIGRzMTM3NF93ZGQ7DQo+ID4+PiArDQo+ID4+IE1vdmUgZGVjbGFy
YXRpb24gcGxlYXNlLg0KPiA+Pg0KPiA+Pj4gK3N0YXRpYyBpbnQgZHMxMzc0X3dkdF9zZXR0aW1l
b3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdCwNCj4gPj4+ICsJCQkJCXVuc2lnbmVkIGlu
dCB0aW1lb3V0KQ0KPiA+Pj4gK3sNCj4gPj4NCj4gPj4gSG93IGlzIHRoaXMgc3luY2hyb25pemVk
IGFnYWluc3QgYWNjZXNzZXMgYnkgdGhlIFJUQyBkcml2ZXIgPw0KPiA+Pg0KPiA+IEJ5IG9yaWdp
bmFsIGRlc2lnbiBpbiBydGMtZHMxMzc0LmMsIGl0IHNlZW1zIG5vIHN5bmNocm9uaXplZCBwcm9i
bGVtDQo+IGJldHdlZW4NCj4gPiBydGMgYW5kIHdhdGNoZG9nLCBidXQgSSB0aGluayB3ZSBjYW4g
YWRkIG11dGV4IGxvY2sgdG8gZGVhbCB3aXRoIGl0Lg0KPiA+DQo+IFRoZSBtdXRleCBpcyB1c2Vk
IHRoZXJlIHdoZXJlIG5lZWRlZC4NCj4gDQo+ID4+PiArCWludCByZXQgPSAtRU5PSU9DVExDTUQ7
DQo+ID4+DQo+ID4+IE5vdCBhbiBhcHByb3ByaWF0ZSBlcnJvciBjb2RlIGhlcmUuDQo+ID4+DQo+
ID4+PiArCXU4IGJ1Zls0XTsNCj4gPj4+ICsJaW50IGNyLCBpOw0KPiA+Pj4gKwlzdHJ1Y3QgZHMx
Mzc0X3dkdCAqZHJ2X2RhdGEgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZHQpOw0KPiA+Pj4gKw0K
PiA+Pj4gKwlyZXQgPSBjciA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShkcnZfZGF0YS0+Y2xp
ZW50LA0KPiBEUzEzNzRfUkVHX0NSKTsNCj4gPj4+ICsJaWYgKHJldCA8IDApDQo+ID4+PiArCQln
b3RvIG91dDsNCj4gPj4NCj4gPj4gImdvdG8gb3V0OyIgaXMgdW5uZWNlc3NhcnkuIEp1c3QgcmV0
dXJuIHRoZSBlcnJvci4gU2FtZSBldmVyeXdoZXJlIGVsc2UNCj4gYmVsb3cuDQo+ID4+DQo+ID4+
PiArDQo+ID4+PiArCS8qIERpc2FibGUgYW55IGV4aXN0aW5nIHdhdGNoZG9nL2FsYXJtIGJlZm9y
ZSBzZXR0aW5nIHRoZSBuZXcgb25lDQo+ICovDQo+ID4+PiArCWNyICY9IH5EUzEzNzRfUkVHX0NS
X1dBQ0U7DQo+ID4+PiArDQo+ID4+PiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEo
ZHJ2X2RhdGEtPmNsaWVudCwgRFMxMzc0X1JFR19DUiwNCj4gY3IpOw0KPiA+Pj4gKwlpZiAocmV0
IDwgMCkNCj4gPj4+ICsJCWdvdG8gb3V0Ow0KPiA+Pj4gKw0KPiA+Pj4gKwkvKiBTZXQgbmV3IHdh
dGNoZG9nIHRpbWUgKi8NCj4gPj4+ICsJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgew0KPiA+Pj4g
KwkJYnVmW2ldID0gdGltZW91dCAmIDB4ZmY7DQo+ID4+PiArCQl0aW1lb3V0ID4+PSA4Ow0KPiA+
Pj4gKwl9DQo+ID4+DQo+ID4+IFRoZSB2YWx1ZSBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiBmcm9t
IHRoZSB3YXRjaGRvZyBjb3JlIGlzIHRoZSB0aW1lb3V0IGluDQo+ID4+IHNlY29uZHMuIEkgZG9u
J3Qgc2VlIGEgY29udmVyc2lvbiB0byBpbnRlcm5hbCB2YWx1ZXMgaGVyZS4NCj4gPj4NCj4gPg0K
PiA+IEZvciBvcmlnaW5hbCBkZXNpZ24gaW4gcnRjLWRzMTM3NC5jLCBkczEzNzRfd2R0X3NldHRp
bWVvdXQgKCkgd2lsbCBjYWxsDQo+ID4gZHMxMzc0X3dyaXRlX3J0YygpIHRvIHdyaXRlIGhhcmR3
YXJlIHJlZ2lzdGVyLiBUbyBzZXBhcmF0ZSB3YXRjaGRvZyBhbmQgcnRjDQo+ID4gZnVuY3Rpb25z
LCBleHBhbmQgY29kZSBmcm9tIGRzMTM3NF93cml0ZV9ydGMoKSBoZXJlLCBhbmQgZmluYWwgYnVm
W10gdmFsdWVzDQo+ID4gd2lsbCBiZSB3cml0dGVuIGludG8gaGFyZHdhcmUgcmVnaXN0ZXIgZm9y
IERTMTM3NC4NCj4gPg0KPiANCj4gZHMxMzc0X3dkdF9zZXR0aW1lb3V0KCkgaXMgYW4gQVBJIGZ1
bmN0aW9uLCBJdCBnZXRzIHRpbWVvdXRzIGZyb20gdGhlDQo+IHdhdGNoZG9nDQo+IGNvcmUgaW4g
c2Vjb25kcy4gVGhvc2UgdGltZW91dHMgaGF2ZSB0byBiZSBjb252ZXJ0ZWQgdG8gY2hpcCBpbnRl
cm5hbCB2YWx1ZXMNCj4gaW4gdGhpcyBmdW5jdGlvbi4NCj4gDQo+ID4+PiArDQo+ID4+PiArCXJl
dCA9IGkyY19zbWJ1c193cml0ZV9pMmNfYmxvY2tfZGF0YShkcnZfZGF0YS0+Y2xpZW50LA0KPiA+
Pj4gKwkJCQkJCURTMTM3NF9SRUdfV0RBTE0wLCAzLCBidWYpOw0KPiA+Pj4gKwlpZiAocmV0KSB7
DQo+ID4+PiArCQlwcl9pbmZvKCJjb3VsZG4ndCBzZXQgbmV3IHdhdGNoZG9nIHRpbWVcbiIpOw0K
PiA+Pj4gKwkJZ290byBvdXQ7DQo+ID4+PiArCX0NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsJLyog
RW5hYmxlIHdhdGNoZG9nIHRpbWVyICovDQo+ID4+PiArCWNyIHw9IERTMTM3NF9SRUdfQ1JfV0FD
RSB8IERTMTM3NF9SRUdfQ1JfV0RBTE07DQo+ID4+PiArCWNyICY9IH5EUzEzNzRfUkVHX0NSX1dE
U1RSOy8qIGZvciBSU1QgUElOICovDQo+ID4+PiArCWNyICY9IH5EUzEzNzRfUkVHX0NSX0FJRTsN
Cj4gPj4+ICsNCj4gPj4+ICsJcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShkcnZfZGF0
YS0+Y2xpZW50LCBEUzEzNzRfUkVHX0NSLA0KPiBjcik7DQo+ID4+PiArCWlmIChyZXQgPCAwKQ0K
PiA+Pj4gKwkJZ290byBvdXQ7DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiAwOw0KPiA+Pg0KPiA+
PiBQb2ludGxlc3MuIEp1c3QgcmV0dXJuIHJldC4NCj4gPj4NCj4gPj4gQWxzbywgdGhpcyBmdW5j
dGlvbiBuZWVkcyB0byBzdG9yZSB0aGUgbmV3IHRpbWVvdXQgaW4gc3RydWN0DQo+IHdhdGNoZG9n
X2RldmljZS4NCj4gPj4NCj4gPj4+ICtvdXQ6DQo+ID4+PiArCXJldHVybiByZXQ7DQo+ID4+PiAr
fQ0KPiA+Pj4gKw0KPiA+Pj4gKw0KPiA+Pj4gKy8qDQo+ID4+PiArICogUmVhZCBXRC9BbGFybSBj
b3VudGVyIHRvIHJlbG9hZCB0aGUgd2F0Y2hkb2cgdGltZXIuIChpZSwgcGF0IHRoZQ0KPiA+Pj4g
K3dhdGNoZG9nKSAgKi8gc3RhdGljIGludCBkczEzNzRfd2R0X3Bpbmcoc3RydWN0IHdhdGNoZG9n
X2RldmljZSAqd2R0KQ0KPiA+Pj4gK3sNCj4gPj4+ICsJc3RydWN0IGRzMTM3NF93ZHQgKmRydl9k
YXRhID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2R0KTsNCj4gPj4+ICsJaW50IHJldDsNCj4gPj4+
ICsJdTggYnVmWzRdOw0KPiA+Pj4gKw0KPiA+Pj4gKwlyZXQgPSBpMmNfc21idXNfcmVhZF9pMmNf
YmxvY2tfZGF0YShkcnZfZGF0YS0+Y2xpZW50LA0KPiA+Pj4gKwkJCQkJCURTMTM3NF9SRUdfV0RB
TE0wLCAzLCBidWYpOw0KPiA+Pj4gKw0KPiA+Pj4gKwlpZiAocmV0IDwgMCB8fCByZXQgPCAzKQ0K
PiA+Pj4gKwkJcHJfaW5mbygiV0QgVElDSyBGQUlMISEhISEhISEhISAlaVxuIiwgcmV0KTsNCj4g
Pj4+ICsNCj4gPj4NCj4gPj4gVGhpcyBpcyBub3QgYW4gaW5mbyBtZXNzYWdlLCB0aGlzIGlzIGFu
IGVycm9yLiBCZXNpZGVzLCBpdCBpcyBqdXN0IG5vaXNlLg0KPiA+PiBKdXN0IHJldHVybiB0aGUg
ZXJyb3IgYW5kIGRyb3AgdGhlIG1lc3NhZ2UuDQo+ID4+DQo+ID4+PiArCXJldHVybiByZXQ7DQo+
ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBpbnQgZHMxMzc0X3dkdF9zdGFydChzdHJ1
Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHQpIHsNCj4gPj4+ICsJaW50IHJldDsNCj4gPj4+ICsNCj4g
Pj4+ICsJcmV0ID0gZHMxMzc0X3dkdF9zZXR0aW1lb3V0KHdkdCwgd2R0X21hcmdpbik7DQo+ID4+
DQo+ID4+IFRoaXMgaXMgd3JvbmcuIFRoZSB0aW1lb3V0IG1heSBoYXZlIGJlZW4gdXBkYXRlZCBi
eSB1c2Vyc3BhY2UuDQo+ID4+IEl0IGlzIGluYXBwcm9wcmlhdGUgdG8gY2hhbmdlIGl0IGJhY2sg
dG8gdGhlIGRlZmF1bHQgaGVyZS4NCj4gPj4NCj4gPiBUaGFua3MsIEkgd2lsbCBrZWVwIGluIG1p
bmQuDQo+ID4NCj4gPj4+ICsJaWYgKHJldCkNCj4gPj4+ICsJCXJldHVybiByZXQ7DQo+ID4+PiAr
DQo+ID4+PiArCWRzMTM3NF93ZHRfcGluZyh3ZHQpOw0KPiA+Pg0KPiA+PiBQbGVhc2UgZG8gbm90
IGlnbm9yZSBlcnJvcnMuDQo+ID4+DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiAwOw0KPiA+Pj4g
K30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50IGRzMTM3NF93ZHRfc3RvcChzdHJ1Y3Qgd2F0
Y2hkb2dfZGV2aWNlICp3ZHQpIHsNCj4gPj4+ICsJc3RydWN0IGRzMTM3NF93ZHQgKmRydl9kYXRh
ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2R0KTsNCj4gPj4+ICsJaW50IGNyOw0KPiA+Pj4gKw0K
PiA+Pj4gKwlpZiAobm93YXlvdXQpDQo+ID4+PiArCQlyZXR1cm4gMDsNCj4gPj4NCj4gPj4gTm90
IG5lZWRlZC4NCj4gPj4NCj4gPiBUaGFua3MhLCBpdCBoYXMgYmVlbiBpbXBsZW1lbnRlZCBpbiB3
YXRjaGRvZ19zdG9wKCkuDQo+ID4NCj4gPj4+ICsNCj4gPj4+ICsJY3IgPSBpMmNfc21idXNfcmVh
ZF9ieXRlX2RhdGEoZHJ2X2RhdGEtPmNsaWVudCwgRFMxMzc0X1JFR19DUik7DQo+ID4+PiArCS8q
IERpc2FibGUgd2F0Y2hkb2cgdGltZXIgKi8NCj4gPj4+ICsJY3IgJj0gfkRTMTM3NF9SRUdfQ1Jf
V0FDRTsNCj4gPj4+ICsNCj4gPj4+ICsJcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEo
ZHJ2X2RhdGEtPmNsaWVudCwNCj4gRFMxMzc0X1JFR19DUiwNCj4gPj4+ICtjcik7IH0NCj4gPj4+
ICsNCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIEhhbmRsZSBjb21tYW5kcyBmcm9tIHVzZXItc3BhY2Uu
DQo+ID4+PiArICovDQo+ID4+PiArc3RhdGljIGxvbmcgZHMxMzc0X3dkdF9pb2N0bChzdHJ1Y3Qg
d2F0Y2hkb2dfZGV2aWNlICp3ZHQsIHVuc2lnbmVkIGludA0KPiA+PiBjbWQsDQo+ID4+PiArCQkJ
CXVuc2lnbmVkIGxvbmcgYXJnKQ0KPiA+Pg0KPiA+PiBUaGUgd2hvbGUgcG9pbnQgb2YgdXNpbmcg
dGhlIHdhdGNoZG9nIHN1YnN5c3RlbSBpcyB0byBub3QgbmVlZCBhIGxvY2FsIGlvY3RsDQo+ID4+
IGZ1bmN0aW9uIC0gYW5kIG1vc3QgZGVmaW5pdGVseSBub3Qgb25lIHRoYXQgZHVwbGljYXRlcyB3
YXRjaGRvZyBjb3JlDQo+ID4+IGZ1bmN0aW9uYWxpdHkuDQo+ID4+DQo+ID4+PiArew0KPiA+Pj4g
KwlpbnQgbmV3X21hcmdpbiwgb3B0aW9uczsNCj4gPj4+ICsNCj4gPj4+ICsJc3dpdGNoIChjbWQp
IHsNCj4gPj4+ICsJY2FzZSBXRElPQ19HRVRTVVBQT1JUOg0KPiA+Pj4gKwkJcmV0dXJuIGNvcHlf
dG9fdXNlcigoc3RydWN0IHdhdGNoZG9nX2luZm8gX191c2VyICopYXJnLA0KPiA+Pj4gKwkJJmRz
MTM3NF93ZHRfaW5mbywgc2l6ZW9mKGRzMTM3NF93ZHRfaW5mbykpID8gLUVGQVVMVCA6IDA7DQo+
ID4+PiArDQo+ID4+PiArCWNhc2UgV0RJT0NfR0VUU1RBVFVTOg0KPiA+Pj4gKwljYXNlIFdESU9D
X0dFVEJPT1RTVEFUVVM6DQo+ID4+PiArCQlyZXR1cm4gcHV0X3VzZXIoMCwgKGludCBfX3VzZXIg
KilhcmcpOw0KPiA+Pj4gKwljYXNlIFdESU9DX0tFRVBBTElWRToNCj4gPj4+ICsJCWRzMTM3NF93
ZHRfcGluZyh3ZHQpOw0KPiA+Pj4gKwkJcmV0dXJuIDA7DQo+ID4+PiArCWNhc2UgV0RJT0NfU0VU
VElNRU9VVDoNCj4gPj4+ICsJCWlmIChnZXRfdXNlcihuZXdfbWFyZ2luLCAoaW50IF9fdXNlciAq
KWFyZykpDQo+ID4+PiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4+PiArDQo+ID4+PiArCQkvKiB0
aGUgaGFyZHdhcmUncyB0aWNrIHJhdGUgaXMgNDA5NiBIeiwgc28NCj4gPj4+ICsJCSAqIHRoZSBj
b3VudGVyIHZhbHVlIG5lZWRzIHRvIGJlIHNjYWxlZCBhY2NvcmRpbmdseQ0KPiA+Pj4gKwkJICov
DQo+ID4+PiArCQluZXdfbWFyZ2luIDw8PSAxMjsNCj4gPj4+ICsJCWlmIChuZXdfbWFyZ2luIDwg
MSB8fCBuZXdfbWFyZ2luID4gMTY3NzcyMTYpDQo+ID4+PiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+
ID4+PiArDQo+ID4+PiArCQl3ZHRfbWFyZ2luID0gbmV3X21hcmdpbjsNCj4gPj4+ICsJCWRzMTM3
NF93ZHRfc2V0dGltZW91dCh3ZHQsIG5ld19tYXJnaW4pOw0KPiA+Pg0KPiA+PiBJcyB0aGUgaWRl
YSBoZXJlIHRvIGJ5cGFzcyB0aGUgd2F0Y2hkb2cgc3Vic3lzdGVtJ3Mgbm90aW9uIG9mIGtlZXBp
bmcgdGhlDQo+ID4+IHRpbWVvdXQgaW4gc2Vjb25kcyA/IElmIHNvLCB0aGF0IHdvdWxkIGJlIHdy
b25nIGFuZCB1bmFjY2VwdGFibGUuDQo+ID4+DQo+ID4gSXQgc2VlbXMgdGFrZSBjYXJlIGFib3V0
IDQwOTZIeiBmb3Igb3JpZ2luYWwgZGVzaWduIGluIHJ0Yy1kczEzNzQuYy4gSSB0aGluaw0KPiB3
ZQ0KPiA+IGNhbiBqdXN0IHVzZSBpb2N0bCgpIHdoaWNoIHdhdGNoZG9nIGNvcmUgcHJvdmlkZXMg
YW5kIGlucHV0IG1hcmdpbiB0aW1lDQo+ID4gYXBwcm9wcmlhdGVseS4NCj4gPg0KPiA+DQo+ID4+
PiArCQlkczEzNzRfd2R0X3Bpbmcod2R0KTsNCj4gPj4+ICsJCWZhbGx0aHJvdWdoOw0KPiA+Pj4g
KwljYXNlIFdESU9DX0dFVFRJTUVPVVQ6DQo+ID4+PiArCQkvKiB3aGVuIHJldHVybmluZyAuLi4g
aW52ZXJzZSBpcyB0cnVlICovDQo+ID4+PiArCQlyZXR1cm4gcHV0X3VzZXIoKHdkdF9tYXJnaW4g
Pj4gMTIpLCAoaW50IF9fdXNlciAqKWFyZyk7DQo+ID4+PiArCWNhc2UgV0RJT0NfU0VUT1BUSU9O
UzoNCj4gPj4+ICsJCWlmIChjb3B5X2Zyb21fdXNlcigmb3B0aW9ucywgKGludCBfX3VzZXIgKilh
cmcsIHNpemVvZihpbnQpKSkNCj4gPj4+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gPj4+ICsNCj4g
Pj4+ICsJCWlmIChvcHRpb25zICYgV0RJT1NfRElTQUJMRUNBUkQpIHsNCj4gPj4+ICsJCQlwcl9p
bmZvKCJkaXNhYmxlIHdhdGNoZG9nXG4iKTsNCj4gPj4+ICsJCQlkczEzNzRfd2R0X3N0b3Aod2R0
KTsNCj4gPj4+ICsJCQlyZXR1cm4gMDsNCj4gPj4+ICsJCX0NCj4gPj4+ICsNCj4gPj4+ICsJCWlm
IChvcHRpb25zICYgV0RJT1NfRU5BQkxFQ0FSRCkgew0KPiA+Pj4gKwkJCXByX2luZm8oImVuYWJs
ZSB3YXRjaGRvZ1xuIik7DQo+ID4+PiArCQkJZHMxMzc0X3dkdF9zZXR0aW1lb3V0KHdkdCwgd2R0
X21hcmdpbik7DQo+ID4+PiArCQkJZHMxMzc0X3dkdF9waW5nKHdkdCk7DQo+ID4+PiArCQkJcmV0
dXJuIDA7DQo+ID4+PiArCQl9DQo+ID4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsJfQ0K
PiA+Pj4gKwlyZXR1cm4gLUVOT1RUWTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGlj
IGludCBkczEzNzRfd2R0X25vdGlmeV9zeXMoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICp0aGlzLA0K
PiA+Pj4gKwkJCXVuc2lnbmVkIGxvbmcgY29kZSwgdm9pZCAqdW51c2VkKQ0KPiA+Pj4gK3sNCj4g
Pj4+ICsJaWYgKGNvZGUgPT0gU1lTX0RPV04gfHwgY29kZSA9PSBTWVNfSEFMVCkNCj4gPj4+ICsJ
CS8qIERpc2FibGUgV2F0Y2hkb2cgKi8NCj4gPj4+ICsJCWRzMTM3NF93ZHRfc3RvcCgmZHMxMzc0
X3dkZCk7DQo+ID4+PiArCXJldHVybiBOT1RJRllfRE9ORTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+
ID4+IE5vdCBuZWVkZWQgLSBzZWUgYmVsb3cuDQo+ID4+DQo+ID4+PiArc3RhdGljIHN0cnVjdCBu
b3RpZmllcl9ibG9jayBkczEzNzRfd2R0X25vdGlmaWVyID0gew0KPiA+Pj4gKwkubm90aWZpZXJf
Y2FsbCA9IGRzMTM3NF93ZHRfbm90aWZ5X3N5cywgfTsNCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMg
aW50IGRzMTM3NF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+
Pj4gKwlzdHJ1Y3QgZHMxMzc0X3dkdCAqZHJ2X2RhdGE7DQo+ID4+PiArCXN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KHBkZXYtPmRldi5wYXJlbnQpOw0KPiA+Pj4gKwlp
bnQgcmV0Ow0KPiA+Pj4gKw0KPiA+Pj4gKwlkcnZfZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2Yoc3RydWN0IGRzMTM3NF93ZHQpLA0KPiA+Pj4gKwkJCQlHRlBfS0VSTkVMKTsN
Cj4gPj4+ICsJaWYgKCFkcnZfZGF0YSkNCj4gPj4+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+Pj4g
Kw0KPiA+Pj4gKwlkcnZfZGF0YS0+d2R0ID0gJmRzMTM3NF93ZGQ7DQo+ID4+PiArCWRydl9kYXRh
LT5jbGllbnQgPSBjbGllbnQ7DQo+ID4+PiArCW11dGV4X2luaXQoJmRydl9kYXRhLT5tdXRleCk7
DQo+ID4+PiArDQo+ID4+PiArCXdhdGNoZG9nX2luaXRfdGltZW91dChkcnZfZGF0YS0+d2R0LCB3
ZHRfbWFyZ2luLCAmcGRldi0+ZGV2KTsNCj4gPj4+ICsJd2F0Y2hkb2dfc2V0X25vd2F5b3V0KGRy
dl9kYXRhLT53ZHQsIG5vd2F5b3V0KTsNCj4gPj4+ICsNCj4gPj4+ICsJd2F0Y2hkb2dfc2V0X2Ry
dmRhdGEoZHJ2X2RhdGEtPndkdCwgZHJ2X2RhdGEpOw0KPiA+Pj4gKwlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBkcnZfZGF0YSk7DQo+ID4+PiArDQo+ID4+PiArCXJldCA9IHdhdGNoZG9nX3Jl
Z2lzdGVyX2RldmljZShkcnZfZGF0YS0+d2R0KTsNCj4gPj4NCj4gPj4gVXNlIGRldm1fd2F0Y2hk
b2dfcmVnaXN0ZXJfZGV2aWNlKCkNCj4gPj4NCj4gPj4+ICsJaWYgKHJldCkgew0KPiA+Pj4gKwkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIFdhdGNoZG9nIGRldmljZVxu
Iik7DQo+ID4+PiArCQlyZXR1cm4gcmV0Ow0KPiA+Pj4gKwl9DQo+ID4+PiArDQo+ID4+PiArCXJl
dCA9IHJlZ2lzdGVyX3JlYm9vdF9ub3RpZmllcigmZHMxMzc0X3dkdF9ub3RpZmllcik7DQo+ID4+
DQo+ID4+IENhbGwgd2F0Y2hkb2dfc3RvcF9vbl9yZWJvb3QoKSBiZWZvcmUgY2FsbGluZyB3YXRj
aGRvZ19yZWdpc3Rlcl9kZXZpY2UoKQ0KPiA+PiBpbnN0ZWFkLg0KPiA+Pg0KPiA+Pj4gKwlpZiAo
cmV0KSB7DQo+ID4+PiArCQl3YXRjaGRvZ191bnJlZ2lzdGVyX2RldmljZShkcnZfZGF0YS0+d2R0
KTsNCj4gPj4+ICsJCXJldHVybiByZXQ7DQo+ID4+PiArCX0NCj4gPj4+ICsNCj4gPj4+ICsJZHMx
Mzc0X3dkdF9zZXR0aW1lb3V0KGRydl9kYXRhLT53ZHQsIHdkdF9tYXJnaW4pOw0KPiA+Pg0KPiA+
PiBVbm5lY2Vzc2FyeSBoZXJlOyBjYWxsZWQgZnJvbSBzdGFydCBmdW5jdGlvbi4NCj4gPj4NCj4g
Pj4+ICsJZGV2X2luZm8oJnBkZXYtPmRldiwgIkRhbGxhcy9NYXhpbSBEUzEzNzQgd2F0Y2hkb2cg
ZGV2aWNlDQo+ID4+PiArZW5hYmxlZFxuIik7DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiAwOw0K
PiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50IGRzMTM3NF93ZHRfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPj4+ICsJc3RydWN0IGRzMTM3NF93ZHQg
KmRydl9kYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4+PiArDQo+ID4+PiAr
CWRldl93YXJuKCZwZGV2LT5kZXYsICJVbnJlZ2lzdGVyIERTMTM3NCB3YXRjaGRvZyBkZXZpY2Vc
biIpOw0KPiA+Pj4gKwl3YXRjaGRvZ191bnJlZ2lzdGVyX2RldmljZShkcnZfZGF0YS0+d2R0KTsN
Cj4gPj4+ICsJdW5yZWdpc3Rlcl9yZWJvb3Rfbm90aWZpZXIoJmRzMTM3NF93ZHRfbm90aWZpZXIp
Ow0KPiA+Pj4gKw0KPiA+Pg0KPiA+PiBDYWxsIHdhdGNoZG9nX3N0b3Bfb25fdW5yZWdpc3Rlcigp
IGJlZm9yZSBjYWxsaW5nDQo+ID4+IHdhdGNoZG9nX3JlZ2lzdGVyX2RldmljZSgpLg0KPiA+Pg0K
PiA+Pj4gKwlyZXR1cm4gMDsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIHZvaWQg
ZHMxMzc0X3dkdF9zaHV0ZG93bihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4+
PiArCXN0cnVjdCBkczEzNzRfd2R0ICpkcnZfZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBk
ZXYpOw0KPiA+Pj4gKw0KPiA+Pj4gKwltdXRleF9sb2NrKCZkcnZfZGF0YS0+bXV0ZXgpOw0KPiA+
Pj4gKwlkczEzNzRfd2R0X3N0b3AoZHJ2X2RhdGEtPndkdCk7DQo+ID4+PiArCW11dGV4X3VubG9j
aygmZHJ2X2RhdGEtPm11dGV4KTsNCj4gPj4NCj4gPj4gVW5uZWNlc3NhcnkgYW5kIHBvaW50bGVz
cy4NCj4gPj4NCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCB3
YXRjaGRvZ19vcHMgZHMxMzc0X3dkdF9mb3BzID0gew0KPiA+Pj4gKwkub3duZXIgICAgICAgICAg
PSBUSElTX01PRFVMRSwNCj4gPj4+ICsJLnN0YXJ0ICAgICAgICAgID0gZHMxMzc0X3dkdF9zdGFy
dCwNCj4gPj4+ICsJLnN0b3AgICAgICAgICAgID0gZHMxMzc0X3dkdF9zdG9wLA0KPiA+Pj4gKwku
cGluZyAgICAgICAgICAgPSBkczEzNzRfd2R0X3BpbmcsDQo+ID4+PiArCS5zZXRfdGltZW91dCAg
ICA9IGRzMTM3NF93ZHRfc2V0dGltZW91dCwNCj4gPj4+ICsJLmlvY3RsICAgICAgICAgID0gZHMx
Mzc0X3dkdF9pb2N0bCwNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBzdHJ1Y3Qg
d2F0Y2hkb2dfZGV2aWNlIGRzMTM3NF93ZGQgPSB7DQo+ID4+PiArCS5pbmZvICAgICAgICAgICA9
ICZkczEzNzRfd2R0X2luZm8sDQo+ID4+PiArCS5vcHMgICAgICAgICAgICA9ICZkczEzNzRfd2R0
X2ZvcHMsDQo+ID4+PiArCS5taW5fdGltZW91dCAgICA9IFRJTUVSX01BUkdJTl9NSU4sDQo+ID4+
PiArCS5tYXhfdGltZW91dCAgICA9IFRJTUVSX01BUkdJTl9NQVgsDQo+ID4+DQo+ID4+IC50aW1l
b3V0IHNob3VsZCBiZSBzZXQgaGVyZS4NCj4gPj4NCj4gPj4gQWxzbywgdGhlcmUgY2FuIChhdCBs
ZWFzdCBpbiB0aGVvcnkpIGJlIG1vcmUgdGhhbiBvbmUgZHMxMzc0IGluIHRoZSBzeXN0ZW0uDQo+
IFRoZQ0KPiA+PiBjb2RlIGRvZXMgbm90IHN1cHBvcnQgdGhpcyBjYXNlLiBkczEzNzRfd2RkIHNo
b3VsZCBiZSBtb3ZlZCBpbnRvIHN0cnVjdA0KPiA+PiBkczEzNzRfd2R0Lg0KPiA+Pg0KPiA+IFRo
YW5rcyBmb3IgZ29vZCBzdWdnZXN0aW9uLg0KPiA+Pj4gK307DQo+ID4+PiArDQo+ID4+PiArc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHMxMzc0X3dkdCA9IHsNCj4gPj4+ICsJLmRyaXZl
ciAgICAgICAgID0gew0KPiA+Pj4gKwkJLm93bmVyICA9IFRISVNfTU9EVUxFLA0KPiA+Pj4gKwkJ
Lm5hbWUgICA9IERFVk5BTUUsDQo+ID4+PiArCX0sDQo+ID4+PiArCS5wcm9iZSAgICAgICAgICA9
IGRzMTM3NF93ZHRfcHJvYmUsDQo+ID4+PiArCS5yZW1vdmUgICAgICAgICA9IGRzMTM3NF93ZHRf
cmVtb3ZlLA0KPiA+Pj4gKwkuc2h1dGRvd24gICAgICAgPSBkczEzNzRfd2R0X3NodXRkb3duLA0K
PiA+Pj4gK307DQo+ID4+PiArDQo+ID4+PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkczEzNzRf
d2R0KTsNCj4gPj4+ICsNCj4gPj4+ICtNT0RVTEVfQVVUSE9SKCJKb2huc29uIENoZW4gPGpvaG5z
b25jaC5jaGVuQG1veGEuY29tPiIpOw0KPiA+Pj4gK01PRFVMRV9ERVNDUklQVElPTigiRGFsbGFz
L01heGltIERTMTM3NCBXYXRjaGRvZyBEcml2ZXIiKTsNCj4gPj4+ICtNT0RVTEVfTElDRU5TRSgi
R1BMIik7IE1PRFVMRV9BTElBUygiUGxhdGZvcm06ZHMxMzc0X3dkdCIpOw0KPiA+Pj4NCj4gPg0K
PiA+IEJlc3QgcmVnYXJkcywNCj4gPiBKb2huc29uDQo+ID4NCg0K
