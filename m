Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE3E219DD8
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2020 12:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgGIKal (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Jul 2020 06:30:41 -0400
Received: from mail-eopbgr80129.outbound.protection.outlook.com ([40.107.8.129]:11150
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726298AbgGIKal (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 9 Jul 2020 06:30:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I70mPRcncgx6Rlj43ae4tGEFDbTf7+bbDhNzogjovYX3zEhTTAMtTnAfFL6vuHHI5BOzTRXR5gbDDNYsP/xuvPuUlq/JhqlFEh6addONXxCYEnYN4Gu6fL1uUioI7pQuns1H+Vx02w6eYY+F/SLTFfjujRJf8uVS1lm6OZOU8dS3khNktmfBStYCMsp7gM1IDOA7UPl3CTMeG0jX7TkNzQZTCfGjHrIGxb3Sn5E6DEibHnaFA97NH9ihgZ0RPmuV/k+L4ieMLQ3lUyfzlZyyniA+ZwJm552QNuxsWLBMQLJozqRZbpmGumwsmhGwN0ZcX5M/R2gJpFJ8nQjFPQ+S8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv8KBjF2TTBKG6gOQRUIAPt9RSXPJ/9hmazBPV/R4kI=;
 b=aDtIZut/p6pDv7Uk/vOyMsWhv3vZaVtItdFJkXd4n0lPjxtnIeDSkozQ0DZOj/c5sTMCfTPdcabRLgFiuG8JGjLW3jQrcm2G/HNTfhhelEzHmb9JTp2ZB5tfEr2YczmsSJ/v6rvXJNvXdljGq6GTkSeigqURlU9dJ2t6M7Vm0Otc7sms4DxlGTQ3wsoRKKg10DJK2ZVlly26PnLfd3tLO+BlZcdNcf+k4/l/R5RuAiWKcK4e/9Xv7RpUzZPaySurSTe31V8P6brG/pCQQlwlJC1fINZ9joHsh/bYty06quvoCXGLpZSKW6+Bh4ivK7Os7zzxok310JHdUjMaZiapIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv8KBjF2TTBKG6gOQRUIAPt9RSXPJ/9hmazBPV/R4kI=;
 b=LzHi/1LVMbSc/8MwFbFjSTf0pHq/6Zrky4E/3x7Wy67iWSSFFmtdFAXAmrI5tpdB83u5cj1c0IISjewFvRU4Nld0AQm6Wd64YqOySADcans8jYHEYt2Uym27p7VtJl4A3q+bBwdnwIn9F8Tpj7eSJulDvHQ38sr9SolL750rnuY=
Received: from VI1PR0301MB6655.eurprd03.prod.outlook.com
 (2603:10a6:800:19c::8) by VE1PR03MB5728.eurprd03.prod.outlook.com
 (2603:10a6:803:124::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 10:30:36 +0000
Received: from VI1PR0301MB6655.eurprd03.prod.outlook.com
 ([fe80::499e:ff42:c812:83e3]) by VI1PR0301MB6655.eurprd03.prod.outlook.com
 ([fe80::499e:ff42:c812:83e3%5]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:30:36 +0000
From:   Miodrag Dinic <Miodrag.Dinic@syrmia.com>
To:     Huacai Chen <chenhuacai@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Markovic <Aleksandar.Markovic@syrmia.com>,
        Petar Jovanovic <petar.jovanovic@syrmia.com>
Subject: RE: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when
 necessary
Thread-Topic: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when
 necessary
Thread-Index: AQHWVdTl+C+Ab2AD5USBB3RbAbOSa6j/CH6w
Date:   Thu, 9 Jul 2020 10:30:36 +0000
Message-ID: <VI1PR0301MB6655A9BB3411D384F045A5FE94640@VI1PR0301MB6655.eurprd03.prod.outlook.com>
References: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H4iaAdxQD8GYYAZAusS+-dD6APy=jUMXm0QpdOXNS_N_Q@mail.gmail.com>
 <CAAhV-H77Qm91qhvLiTTMYkEZd7NLFZa5KD0mDrHsiSrtxT7wpQ@mail.gmail.com>
In-Reply-To: <CAAhV-H77Qm91qhvLiTTMYkEZd7NLFZa5KD0mDrHsiSrtxT7wpQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [178.148.222.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c50c74-8ce8-4db2-4686-08d823f31e33
x-ms-traffictypediagnostic: VE1PR03MB5728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR03MB572892CAC9684E13856233BF94640@VE1PR03MB5728.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvFirCWdXjNNkNiME6UhvpBQomwee3LRutPg2kSD0pFKXEqq8L9/2PIaOITyZw49spnplB+A+eo+E4QtKAJsDDWTDUrXKbPWNE3fn4QZCnZAFs/j5icRhKMwh/zLJenorCdjpQIp9b2HdC7SMd6DqM7KYx3MghJKXbH6IUqnctGDmtOzErUjzr+uklL5qqJyY+7rAANpeM8gjR1HGzzETcN6VWuI3FewBI7TVWNZeoB7FhJMR2NTOkIET6I7q7gTnFGQX2ih9YTnpbv398RsHaAJtF9SbXxJO1wB+P3SORjJhGHh6lsMIgSS5GjkxBrTgULWU9O8cdgcx7ThY8PqFB8qod2jAtXe8/E5JmZicFvuRBYfDZUmrBB7h92vGzBkc5A/lre/jSfbHxFLslYyLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0301MB6655.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39830400003)(396003)(376002)(346002)(136003)(33656002)(107886003)(52536014)(9686003)(8676002)(110136005)(55016002)(8936002)(6506007)(71200400001)(53546011)(54906003)(2906002)(508600001)(26005)(66556008)(86362001)(5660300002)(66946007)(66476007)(4326008)(64756008)(83380400001)(186003)(76116006)(7696005)(966005)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 2+NC/50jM0nJZ6BfMIAm+MkLIRL82YiXlp2ctvTrPqTdCehCduC6baEB/jFoh4Fh82f5Pare5Jzg4hbd9e0QlYlJUHEavFwdRIl0JQitOa1at0o2qyUm8WtniKeFwK4VL/8qF50w4m9jTNEpz/1vcLyeApg2PT8kfohVpJBVJpacKiDQChdLm4tB2qhuNUnfZ1KyzwjXqAQmXUr8ZGUL+mEEOSZF+DePWUvDPO5EYOm4Nxh73nxDoT04jZIpeDrW2aRxGaI4Wt9j+zXR3yi4UdjsAGqYjIdw65k1z69+2EU+nUBCgzr8ZyMBtrF2mI2rkzUbF+Bbyngi0ZyQzAIbXOTaz1UPATPn4iOwNXRx/FKjVOuSOrK0XAP9YJqtNI93X1sA+0qaj8Vw4pwKqm7ACgeajPkhSBCPr3pqSUEWaxaYx2g5AHzN5e+XLFWHka80xZz7juPWokKwnZZXVXrmdY0dspDiDc/XBpS6C0ywAkc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0301MB6655.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c50c74-8ce8-4db2-4686-08d823f31e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 10:30:36.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUilMLcQ1D8ygiHY7fuk0nUxPsYcAABtkALB9hcY+9+tGPJW9SQgxn5PMmWGRlo36EWukurmBf2x1oScPniv3Ed0ygtcPY9ei4OfM7Vr1mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5728
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgSHVhY2FpLA0KDQpZZXMsIHRoaXMgaXMgbXkgbmV3IGFkZHJlc3MuIEhvd2V2ZXIgSSBoYXZl
bid0IGJlZW4gaW52b2x2ZWQgaW4ga2VybmVsL1FFTVUgY29tbXVuaXR5IGZvciBhIHdoaWxlIG5v
dy4NClRoZSBwYXRjaCBpdHNlbGYgbG9va3MgT0sgdG8gbWUsIGlmIHlvdSBtYWRlIHN1cmUgdGhl
IFJUQyBkZXZpY2UgZW11bGF0aW9uIG9uIHRoZSBRRU1VIHNpZGUgaXMgbm93IGFsc28gaW5zcGVj
dGluZyB0aGUgVElNRVJfSVJRX0VOQUJMRUQgc2V0dGluZy4NCg0KT0sgSSBzZWUgbm93IHRoYXQg
eW91IGhhdmUgY29tbWl0dGVkIHVwc3RyZWFtIHRvIFFFTVUgdGhlIEdvbGRmaXNoIFJUQyBkZXZp
Y2UsIGdvb2Qgam9iIHdpdGggdGhhdC4NCmh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvYmxh
bWUvOTcxYjJhMWU1YjFhOGNjOGY1OTdhYzVkNzAxNjkwOGY5ZmE4ODBkZS9ody9ydGMvZ29sZGZp
c2hfcnRjLmMNCg0KWW91IGNhbiBhZGQgbXkgInJldmlld2VkLWJ5Ii4NCg0KR2xhZCB0byBzZWUg
dGhhdCB0aGUgImdvbGRmaXNoIiBwcm9qZWN0IGlzIHN0aWxsIGFsaXZlIG91dCB0aGVyZS4NCg0K
S2luZCByZWdhcmRzLA0KTWlvZHJhZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBK
dWx5IDksIDIwMjAgMTE6NDAgQU0NClRvOiBBbGVzc2FuZHJvIFp1bW1vIDxhLnp1bW1vQHRvd2Vy
dGVjaC5pdD47IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNv
bT47IE1pb2RyYWcgRGluaWMgPE1pb2RyYWcuRGluaWNAc3lybWlhLmNvbT4NCkNjOiBsaW51eC1y
dGNAdmdlci5rZXJuZWwub3JnOyBGdXhpbiBaaGFuZyA8emhhbmdmeEBsZW1vdGUuY29tPjsgSmlh
eHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0g
cnRjOiBnb2xkZmlzaDogRW5hYmxlIGludGVycnVwdCBpbiBzZXRfYWxhcm0oKSB3aGVuIG5lY2Vz
c2FyeQ0KDQpIaSwgTWlkb3JhZywNCg0KTWF5YmUgbWlvZHJhZy5kaW5pY0BzeXJtaWEuY29tIGlz
IHlvdXIgbmV3IGVtYWlsIGFkZHJlc3M/IFBsZWFzZSByZXZpZXcgdGhpcyBwYXRjaC4NCkFuZCBB
bGVzc2FuZHJvLCBBbGV4YW5kcmUsIGNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byByZXZpZXcgdGhp
cyBwYXRjaD8NCg0KSHVhY2FpDQoNCk9uIEZyaSwgSnVsIDMsIDIwMjAgYXQgMTE6MDAgQU0gSHVh
Y2FpIENoZW4gPGNoZW5odWFjYWlAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gUGluZz8NCj4NCj4g
T24gU2F0LCBKdW4gMjAsIDIwMjAgYXQgODowMyBQTSBIdWFjYWkgQ2hlbiA8Y2hlbmhjQGxlbW90
ZS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gV2hlbiB1c2UgZ29sZGZpc2ggcnRjLCB0aGUgImh3Y2xv
Y2siIGNvbW1hbmQgZmFpbHMgd2l0aCAic2VsZWN0KCkgdG8gDQo+ID4gL2Rldi9ydGMgdG8gd2Fp
dCBmb3IgY2xvY2sgdGljayB0aW1lZCBvdXQiLiBUaGlzIGlzIGJlY2F1c2UgImh3Y2xvY2siDQo+
ID4gbmVlZCB0aGUgc2V0X2FsYXJtKCkgaG9vayB0byBlbmFibGUgaW50ZXJydXB0IHdoZW4gYWxy
bS0+ZW5hYmxlZCBpcyANCj4gPiB0cnVlLiBUaGlzIG9wZXJhdGlvbiBpcyBtaXNzaW5nIGluIGdv
bGRmaXNoIHJ0YyAoYnV0IG90aGVyIHJ0YyANCj4gPiBkcml2ZXJzLCBzdWNoIGFzIGNtb3MgcnRj
LCBlbmFibGUgaW50ZXJydXB0IGhlcmUpLCBzbyBhZGQgaXQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmhjQGxlbW90ZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3J0Yy9ydGMtZ29sZGZpc2guYyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtZ29sZGZpc2gu
YyBiL2RyaXZlcnMvcnRjL3J0Yy1nb2xkZmlzaC5jIA0KPiA+IGluZGV4IDFhMzQyMGUuLmQ1MDgz
YjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLWdvbGRmaXNoLmMNCj4gPiArKysg
Yi9kcml2ZXJzL3J0Yy9ydGMtZ29sZGZpc2guYw0KPiA+IEBAIC03Myw2ICs3Myw3IEBAIHN0YXRp
YyBpbnQgZ29sZGZpc2hfcnRjX3NldF9hbGFybShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gICAg
ICAgICAgICAgICAgIHJ0Y19hbGFybTY0ID0gcnRjX3RtX3RvX3RpbWU2NCgmYWxybS0+dGltZSkg
KiBOU0VDX1BFUl9TRUM7DQo+ID4gICAgICAgICAgICAgICAgIHdyaXRlbCgocnRjX2FsYXJtNjQg
Pj4gMzIpLCBiYXNlICsgVElNRVJfQUxBUk1fSElHSCk7DQo+ID4gICAgICAgICAgICAgICAgIHdy
aXRlbChydGNfYWxhcm02NCwgYmFzZSArIFRJTUVSX0FMQVJNX0xPVyk7DQo+ID4gKyAgICAgICAg
ICAgICAgIHdyaXRlbCgxLCBiYXNlICsgVElNRVJfSVJRX0VOQUJMRUQpOw0KPiA+ICAgICAgICAg
fSBlbHNlIHsNCj4gPiAgICAgICAgICAgICAgICAgLyoNCj4gPiAgICAgICAgICAgICAgICAgICog
aWYgdGhpcyBmdW5jdGlvbiB3YXMgY2FsbGVkIHdpdGggZW5hYmxlZD0wDQo+ID4gLS0NCj4gPiAy
LjcuMA0KPiA+DQo=
