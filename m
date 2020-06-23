Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685EA204ABE
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2020 09:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbgFWHMs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jun 2020 03:12:48 -0400
Received: from mail-eopbgr1320058.outbound.protection.outlook.com ([40.107.132.58]:38042
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730977AbgFWHMs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 23 Jun 2020 03:12:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/3dXRMyqNWs/h5uum39tyJNLkXLIjkn7oDmVb44TLeXGqxxA+X9ssOmuT8UKnRmxiJUC3NrWXqca5em9jUbZOiEnrFCC2JD3+jNPP7maPm4vCTZvqMdovDMtdDozUFxF817S9Ovm/1y9pswjgAwkwvI/waSQV097A4m44vunRWc5GYgoSWi+ehG6XOkfbQpqgBIRIv14D7rtWXSG/c+QYHxN/b5Ic+jlVtZ+roAZsQuaBNHSEGnFEAz4IyC1uVHV614DDPkpoN0aOA+p6jNupAaDEU/UC84VrrPps/K/SP/3lynSJ+CIZyk1vadMQnnwvWK+ch7sV2L0gqDAq7QOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpV3/WmrnvrJHFotmIPAMfu4pGKMX8/DIi9e4kqjaF0=;
 b=L0KO5dfegIUL038q5RgfPuvTtHcL80cuUqpQn1pftAY+PaD57qZdzxLEcdtUuRXJG2sfGG6ZBvWnV/+ZZc3/myWGwUDZTG29JLVjP9xd0YGcw9GXJg1mSbqty7rtsLGbVkuVsdFOopOCuSfVyq93ALCaeK1i2iAlUY4Y+WKXD3dY1wK5rj/rt9v7snZWz4qDiA42mij8YgvKkqkqSInEaVRM+jFxqZK5URp/azw97cXTtVztBJN4vhehMpT7xx+G7inbmXwzBNCxkq+M4LZbXaQ3d4ISfF22lkzmfvKMcG5/DDDTjoWd8TyUVAn/JqAKfSqn+0qZg9kQbWOs/6njtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpV3/WmrnvrJHFotmIPAMfu4pGKMX8/DIi9e4kqjaF0=;
 b=GwgZrDLo4fNTK87+ZqFpLRIjqcJATz9KGnBIZZQNtG+l/hnorbBCux5mtW/B644K+29E09KsGWA1yEQQE+3OtHk9l81XlKLImj1gB8/kr5S/yNwDXXfjmwh1XOJ1PtyHUCeHB5eIEu5+2cpH8r+JtJQ0/4mDaytAT9OqoNoIrms=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3364.apcprd01.prod.exchangelabs.com
 (2603:1096:202:1a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 07:12:42 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 07:12:42 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: RE: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
 driver
Thread-Topic: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
 driver
Thread-Index: AQHWSIZGE1OKIScqKk+eBYxI6L8uSqjksVAAgAAJowCAAQbiIA==
Date:   Tue, 23 Jun 2020 07:12:42 +0000
Message-ID: <HK2PR01MB3281B2BC29C32315759B7ED2FA940@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB328111AB2520315A7D4A1172FA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200622111413.GV954398@dell> <20200622142656.GA102380@roeck-us.net>
 <20200622150126.GJ131826@piout.net>
In-Reply-To: <20200622150126.GJ131826@piout.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da28ad35-f916-45e9-126a-08d81744d209
x-ms-traffictypediagnostic: HK2PR01MB3364:
x-microsoft-antispam-prvs: <HK2PR01MB33646607A40E83F007B33E70FA940@HK2PR01MB3364.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWIWBJlacEKRwaloRl36IOla5Iy4F4AK0aucFFFRKry4/L1nG4NqOzPKLUEum9lhuTMq5YtSenrNL1sdpf7SvOIiuNuGZONQx5/lqIIOTUIZKlZZMetqzsTk0JEXXXigYaaTm1C9/aGgVLwGzM3e5YabfxXoh9U/Bhdj2QL5payao7KMl8DMLQgsxReFLHWaAnU3uxpWzP/yVZFndv8IDG364oqsmD8Z7WW1oZx/7lvVYk9pGgmMmlM5yD3JTS+HZ9v8KRpitNJ92ipDabu4cvqOI79VMRGupKc05QSRmOhrLoH/umLGPY6eqHNxTIGbsw66uPp6HHuvbFRkoUZEYmYqGgPz65tZbt2HuOLAIufzDViBVMCj745p00cPvDNhySJyViAMXwXBEUk7GfEiBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(346002)(39850400004)(376002)(85182001)(110136005)(54906003)(966005)(55016002)(7696005)(9686003)(478600001)(186003)(6506007)(33656002)(316002)(26005)(2906002)(86362001)(66446008)(66476007)(66946007)(83380400001)(5660300002)(52536014)(4326008)(8936002)(8676002)(76116006)(71200400001)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0dO5B1nc2JIrWk1Wf6kJTyEExTd+XhjvvM41pq93Vpcdbjj/7gKWCam9CMK0UW2g7G2HiDWFlFH5zLLpjsJrGGXsV2ucv/XJVtTtNfoo5H6/zbY0f9WP7cMAdik0THhHkT1efDCnHtGvD7enbfcK+fPHN1QL4/04pahJi+sTb62OEkrMxQNkotKBsrKt6GicSWHgX6ZGdFkUuTdZp1zyp9oUbcwke7nVonxhw7I+xig82pnzNvWorcD/elndAzwcQF9adEuFJ4E7sDdy54GlOPtMsDYimR9kjDu5xn+g+lKta3GHXTsWgE1fIhPbSCVP3GeYPv3WXk9dPdu3GZ66i9ocgJ4RYcf5kxD9+ZLULvWYaeKz/gB6zTH4WjwXdq9qsef0hh2BeQuVH7Tc90GnuzVven0l1s7vuDEqbFjET8frK4Qgu+UHmKTIIzcCWXI0fjixB0sDeIatBrdw5LWo2cJ507zlkjvCVqewlz7PSIE7L1cM85nuToAwD4WPlY1q
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da28ad35-f916-45e9-126a-08d81744d209
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 07:12:42.0360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIN9JKXj6E8aBST9XvsrxqsVPboz8FNXCh8Z2Qyirek66Z65juozUmFkO2P2y0XQvkms4AJiZiJgvuqUJFwbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3364
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksDQogDQo+IE9uIDIyLzA2LzIwMjAgMDc6MjY6NTYtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90
ZToNCj4gPiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAxMjoxNDoxM1BNICswMTAwLCBMZWUgSm9u
ZXMgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIyIEp1biAyMDIwLCBKb2huc29uIENIIENoZW4gKOmZ
s+aYreWLsykgd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBEYWxsYXMvTWF4aW0gRFMxMzc0IGlzIGEg
Y291bnRlciBkZXNpZ25lZCB0byBjb250aW51b3VzbHkgY291bnQNCj4gPiA+ID4gdGltZSBpbiBz
ZWNvbmRzLiBJdCBwcm92aWRlcyBhbiBJMkMgaW50ZXJmYWNlIHRvIHRoZSBob3N0IHRvDQo+ID4g
PiA+IGFjY2VzcyBSVEMgY2xvY2sgb3IgQWxhcm0vV2F0Y2hkb2cgdGltZXIuDQo+ID4gPiA+DQo+
ID4gPiA+IEFkZCBNRkQgQ29yZSBkcml2ZXIsIHN1cHBvcnRpbmcgdGhlIEkyQyBjb21tdW5pY2F0
aW9uIHRvIFJUQyBhbmQNCj4gPiA+ID4gV2F0Y2hkb2cgZGV2aWNlcy4NCj4gPiA+ID4NCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogSm9obnNvbiBDaGVuIDxqb2huc29uY2guY2hlbkBtb3hhLmNvbT4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICB8ICAxMSArKysrKw0K
PiA+ID4gPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgfCAgIDIgKw0KPiA+ID4gPiAgZHJpdmVycy9t
ZmQvZHMxMzc0LmMgfCAxMDENCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygr
KSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGRyaXZlcnMvbWZkL2RzMTM3NC5jDQo+ID4g
Pg0KPiA+ID4gTm90IHN1cmUgSSBzZWUgdGhlIHBvaW50IG9mIHRoaXMgZHJpdmVyLg0KPiA+ID4N
Cj4gPg0KPiA+IE5vdCBlbnRpcmVseSBzdXJlIGVpdGhlci4gU2VlbXMgdG8gbWUgdGhlIGlkZWEg
aXMgdG8gdXNlIHRoZSB3YXRjaGRvZw0KPiA+IHN1YnN5c3RlbSBmb3Igd2F0Y2hkb2cgZnVuY3Rp
b25hbGl0eSwgYnV0IHRoYXQgaXMganVzdCBhIGd1ZXNzIGFuZCBub3QNCj4gPiByZWFsbHkgbmVj
ZXNzYXJ5ICh0aGUgY29udmVyc2lvbiBjb3VsZCBiZSBkb25lIGluIHRoZSBydGMgZHJpdmVyKS4N
Cj4gPiBJIGRvbid0IHRoaW5rIHRoZSBjb2RlIGFzIHdyaXR0ZW4gd29ya3MgLSB0aGUgcnRjIGNv
ZGUgdXNlcyBhIG11dGV4DQo+ID4gd2hpY2ggdGhlIHdhdGNoZG9nIGRyaXZlciBvYnZpb3VzbHkg
aXNuJ3QgYXdhcmUgb2YuIFRoZSBtdXRleCB3b3VsZA0KPiA+IGhhdmUgdG8gYmUgbW92ZWQgaW50
byB0aGUgbWZkIGNvZGUsIHdpdGggcmVzcGVjdGl2ZSBhY2Nlc3MgZnVuY3Rpb25zLg0KPiA+DQo+
ID4gT3ZlcmFsbCB0aGlzIGFkZHMgYSBsb3Qgb2YgY29tcGxleGl0eSwgYW5kIGl0IHNlZW1zIHRo
ZQ0KPiA+IGludGVyZGVwZW5kZW5jaWVzIGJldHdlZW4gcnRjIGFuZCB3YXRjaGRvZyBmdW5jdGlv
bmFsaXR5IGFyZSBub3Qgd2VsbA0KPiA+IHVuZGVyc3Rvb2QuIFBsdXMsIG90aGVyIHdhdGNoZG9n
IGRyaXZlcnMgaGF2ZSByZWNlbnRseSBiZWVuIGFkZGVkIHRvDQo+ID4gb3RoZXIgcnRjIGNsb2Nr
IGNoaXBzLCBzbyB0aGlzIGFkZHMgc29tZSBpbmNvbnNpc3RlbmNpZXMgaW4gdGhlIHJ0Yw0KPiA+
IHN1YnN5c3RlbS4gQXJlIHdlIGdvaW5nIHRvIHNlZSB0aGlzIGNoYW5nZSBmb3IgYWxsIHRob3Nl
IGNvbWJpbmVkDQo+IHJ0Yy93YXRjaGRvZyBkcml2ZXJzID8NCj4gPiBJZiBzbywgaXQgbWlnaHQg
bWFrZSBzZW5zZSB0byBjb21tdW5pY2F0ZSB0aGF0IG5vdyB0byBlbnN1cmUgY29uc2lzdGVuY3ku
DQo+ID4NCj4gDQo+IEkgcmVhZCB0aGUgZGF0YXNoZWV0IGFnYWluIGFuZCBJIGFncmVlIHRoZSB3
YXRjaGRvZyBwYXJ0IGNhbiBsaXZlIGluIHRoZSBydGMNCj4gZHJpdmVyLiBBcyBvbmx5IHRoZSBS
VEMgYWxhcm0gYW5kIHRoZSB3YXRjaGRvZyBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLiBJIGRvbid0
DQo+IHRoaW5rIGFuIE1GRCBkcml2ZXIgaXMgbmVjZXNzYXJ5LiBDb252ZXJ0aW5nIHRoZSBjdXJy
ZW50IGRyaXZlciB0byB0aGUNCj4gd2F0Y2hkb2cgc3Vic3lzdGVtIHNlZW1zIHRvIGJlIHRoZSBj
b3JyZWN0IHdheSBmb3J3YXJkLg0KPiANClRoYW5rcyBmb3IgeW91ciBnb29kIHRoaW5raW5nLiBJ
ZiB3ZSB3YW50IHRvIGFkZCB3YXRjaGRvZyBmdW5jdGlvbiBzdWNoIGFzIA0KIm5vd2F5b3V0IiB0
byB0aGUgZHJpdmVyLCBpdCdzIGdvb2QgdG8gdHJ5IHRvIHVwc3RyZWFtIHRoaXMgaW4gcnRjLWRz
MTM3NC5jIGluIA0KcnRjIHN1YnN5c3RlbT8NCg0KSXQgc2VlbXMgbGlrZSBtb3JlIGNvbXBsZXhp
dHkgaWYgd2Ugd2FudCB0byBzZXBhcmF0ZSBydGMgYW5kIHdhdGNoZG9nIGZvciBvbmUgDQpjaGlw
IHN1cHBvcnRzLiBGb3Igb25lIGNoaXAgd2hpY2ggc3VwcG9ydHMgcnRjL2FsYXJtIGFuZCB3YXRj
aGRvZywgY2FuIHdlIA0KdXBzdHJlYW0gcnRjL2FsYXJtIGFuZCB3YXRjaGRvZyBmdW5jdGlvbnMg
dG8gdGhlc2UgZHJpdmVyIG5vIG1hdHRlciB3aGVyZSBpdCdzIA0KaW4gcnRjIG9yIHdhdGNoZG9n
IHN1YnN5c3RlbT8NCg0KDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluDQo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNv
bQ0KDQpCZXN0IHJlZ2FyZHMsDQpKb2huc29uDQo=
