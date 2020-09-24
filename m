Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8A52766D4
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 05:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgIXDUi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Sep 2020 23:20:38 -0400
Received: from mail-eopbgr10046.outbound.protection.outlook.com ([40.107.1.46]:6798
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726196AbgIXDUi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 23 Sep 2020 23:20:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUUt6kLJ57nO0go7Xjp+N4txOR0cV/Q0vb72blYsqIsvkJMiiQwBsfpduzFjT4mMtVKgFsGt2+eieNZ7KL4kI/Vv3VVrvh1xwBXUlz2xYyDn/u3P3dVHQNgYZFStvEeNDXcFxgXl6up24LPzt33XqQVwSwCTVjS35dpgNl7CrFNmBOIuDXrwx8BXgx3ZAJJgyXzwzrElZ2/5nBplRQmgdxqBi4gppY3HBogtVS4qGP0gw11f3seBidU4LgMV+Os+WrYJP23vXZXHXpk9NiFNp8WXA/8XJNmKSwW3DhI9g4F89HSe0pHmrSC2tsQ7+K3mOy/STAkinkuLeTZA81nPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54e4JOsol3MbdHnbpxgyiZPuK6xKJ20pc2oveBYA68w=;
 b=eUWgAWRbyjRjDVbQmavKmEmQIG9Jyw09NXVaEqJl2VnF5h9iz4zGyrk2SqrUhMF9AOQwb8yG+5Pk8c+3k8Ub80/m7eJW0N8sydn80PPobnaVnVZciulNwyBi25qSiZ6F51ktL/KaHP9rJEp6Esr9UbteTwbERYxTyFbRhbfVfSlu0DQAjjtzUDoVmvuIc/ZMUxa/u699hlE3LqNKP+auMQEy9lhpr8S4iVzqe4jE6hgcx/3LwuegcRD2h5UFFTlkhx3bjklrwmxdGsGwWa6srZxZ0xEw1M74Sf5A4CWBmAHPvx6phfiGXdhwC4uFoJjPt7lQyh6FVt7JGP1cP4Zayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54e4JOsol3MbdHnbpxgyiZPuK6xKJ20pc2oveBYA68w=;
 b=VV7wD0VzyagM3vkU7q1MvwUcBVWOaFPooX265h7t3vZOQZWshMtXPURht6YfrUE+P9OZ3JEo890dWz1Ad5YaZmx8yaptVpGBBjjjRtcoZEI8BEofwgtdjC7UHAyzdplN+QvX6CqhHgaBO4KOMtRRqb1KN38o3K1urMeC+hAodbQ=
Received: from DB8PR04MB6763.eurprd04.prod.outlook.com (2603:10a6:10:10b::28)
 by DB8PR04MB7147.eurprd04.prod.outlook.com (2603:10a6:10:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 03:20:33 +0000
Received: from DB8PR04MB6763.eurprd04.prod.outlook.com
 ([fe80::7926:bb74:b8fa:4447]) by DB8PR04MB6763.eurprd04.prod.outlook.com
 ([fe80::7926:bb74:b8fa:4447%4]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 03:20:33 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
Subject: RE: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Thread-Topic: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Thread-Index: AQHWj9v8ujWDbe4KQkWWGAO9y9OzgKl1/KOAgAEbugA=
Date:   Thu, 24 Sep 2020 03:20:33 +0000
Message-ID: <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
References: <20200921054821.26071-1-qiang.zhao@nxp.com>
 <20200923094449.GP9675@piout.net>
In-Reply-To: <20200923094449.GP9675@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc8b5ab3-e763-412d-0c7e-08d86038cc39
x-ms-traffictypediagnostic: DB8PR04MB7147:
x-microsoft-antispam-prvs: <DB8PR04MB7147EF25E0B1877E2FA1C27791390@DB8PR04MB7147.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +cOu9e7bCqXw0hdYVp1rMV5lo+0EEoC0PU6wzCo5dVYV+T4qGYpWQQSQ2a0te6UkRIRUh6mmAkLXWtLTyydE7jP8NCqJaGK/3Tib6nEv411BetCJsuk05fojoobflhL3WZ94TZrf3WgVBIJ9czaIaA/y0zJKb84fd0vsAcfFTiBs/dS5dwxD3Td4ZWoUcfSZ/saXCZ3KEfW0xewwsRVsNTMfLbSqOrkn8dkz4GyC0dNMVmTCQytFMZwb5y9yYf+26JugiMWyiwFMCT9j4Kg5RPjdNjzrlOaWAw+Dxwg/rwYfxLyBSScMM2W9/5nlrLvxC5thiMtU8xlEfgIGcZihaLep6lRVUzp+GDug365XTCMVXHmUvWnz2Cf9YmbcKsPHCPxwITOj6qU/A0kMYtxRYZBdC1AgNRrXxspedGfcM/A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6763.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(66556008)(64756008)(76116006)(186003)(4326008)(66446008)(66946007)(966005)(7416002)(2906002)(66476007)(5660300002)(8936002)(26005)(83380400001)(478600001)(7696005)(316002)(66574015)(9686003)(53546011)(8676002)(45080400002)(71200400001)(44832011)(6506007)(33656002)(6916009)(52536014)(55016002)(54906003)(86362001)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NRkpwlCmnBvdF9Xr5nKHh0RUoQOBn6UtIOePAkJ7UqP5K9Ne+nrwmeNSduATex/kKnYZ5Dyo7TAHjQKvmaRLvtZbuYay8yS4UgHd69fDIdM+44+46YxKIPnER773Yx7aMAd7RzPmNlJPldy0EzrZx5T39fOooTJZNQJppOwTAr6eT+pLjYGIzq3cUzv0LmMu3yS98Frs77IUOyV7CNDGFxmhg5NeJJTMfQc5j9x3rPEsUG9DxfrJMsK/PyROFDaMYBpRbfKyvX593Yzj25k29r8pHQ+Zysf2F+LKKQAB5nv5tkKIBz2LKseoAmFCj8R6aHhEek3WImgvphCcs/yXKNFdHkDgCoCUP93er5vbBwy/Gi2P/uOrAw1epqJI2PAnQpr9ZWTRVKqb2ZBM4O+I3qod9FSf5iOvdWLGVoJf13gwkqIyjWwdgKaJETIFlMXtPedlxC7Eekf+MYMXUbh3IOQcDjPWkX1jIN0bzBAohE4U8JRc+mNaqnalLoVDoEzaQSbJsM1TdFEEyfyF1B508t8QHZ7mTe1v3z+Fdnh/faUuDnFswYdRDIDLoDJ27DI8cGrpKmkRAecEtNPOP52zQmFBUa9E2U9B0sERb+B6Jckwcm12iujSl1n/N26GhyOqJOTDuIYnRtNW7nfB+SQJGQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6763.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8b5ab3-e763-412d-0c7e-08d86038cc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 03:20:33.2801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccmimeo8PcTs7exPSMEStSf6XPSZJDkiXsi9om3rd1KKqNmwBwnr4kC/y+kgb+6wVuWN56qt/1C5I27wWrONZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7147
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMjEvMDkvMjAyMCAxMzo0ODoxOSswODAwLCBRaWFuZyBaaGFvIHdyb3RlOg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4gU2VudDogMjAyMOW5tDnmnIgyM+aXpSAxNzo0NQ0K
PiBUbzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiBDYzogV2ltIFZhbiBTZWJy
b2VjayA8d2ltQGxpbnV4LXdhdGNoZG9nLm9yZz47IEd1ZW50ZXIgUm9lY2sNCj4gPGxpbnV4QHJv
ZWNrLXVzLm5ldD47IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsNCj4gYS56dW1tb0B0
b3dlcnRlY2guaXQ7IHJvYmgrZHRAa2VybmVsLm9yZzsgbGludXgtcnRjQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IFV3ZSBLbGVpbmUtS8O2bmlnDQo+IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+DQo+IFN1YmplY3Q6IFJlOiBbUGF0Y2ggdjIgMS8zXSBkdC1iaW5kaW5nczogcnRjOiBwY2Yy
MTI3OiBBZGQgYmluZGluZ3MgZm9yDQo+IG54cCxwY2YyMTI3DQo+IA0KPiBIaSwNCj4gDQo+IFlv
dSBmb3Jnb3QgdG8gY29weSB0aGUgd2F0Y2hkb2cgbWFpbnRhaW5lcnMsIEkgdGhpbmsgc3VjaCBh
IHByb3BlcnR5IHNob3VsZCBiZQ0KPiBkaXNjdXNzZWQgd2l0aCB0aGVtLg0KPiANCj4gTm90ZSB0
aGF0IEknbSBzdGlsbCBjb252aW5jZWQgdGhpcyBpcyBub3QgYSBjb21wbGV0ZSBzb2x1dGlvbiwg
c2VlOg0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm4NCj4gZWwub3JnJTJGbGludXgtcnRjJTJGMjAyMDA3
MTYxODE4MTYuR0YzNDI4JTQwcGlvdXQubmV0JTJGJmFtcDtkYXRhPQ0KPiAwMiU3QzAxJTdDcWlh
bmcuemhhbyU0MG54cC5jb20lN0NiNzFmNzlhMDQ0YjA0OTNkNmQ0ZjA4ZDg1ZmE1NTFjDQo+IGIl
N0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MxJTdDNjM3MzY0NTEwOTMx
MTc0DQo+IDM1NSZhbXA7c2RhdGE9JTJCT3hyekI4Ukl1eE05TGV0NXNsaGZDVm1NbTZQTU5vRVJE
ZUhDOSUyRmR4bmcNCj4gJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KDQpZZXMsIHlvdSBhcmUgcmln
aHQsIFRoZXJlIGlzIG5vdCBhIGZ1bmRhbWVudGFsIHNvbHV0aW9uLg0KSG93ZXZlciBpdCBzb21l
d2hhdCBhdm9pZCB0aGlzIHNpdHVhdGlvbiBhdCBsZWFzdC4NCg0KQW5kIGlmIHdpdGhvdXQgdGhp
cyBpc3N1ZSwgDQppcyBpdCBjb3JyZWN0IHRvIHJlZ2lzdGVyIGEgcnRjIGRldmljZSBhcyB3YXRj
aGRvZyBubyBtYXR0ZXIgaXQgaXMgdXNlZCBhcyB3YXRjaGRvZyBvbiB0aGUgYm9hcmQ/IA0KRXZl
cnkgdGltZSBMaW51eCBhcmUgYm9vdGVkIHVwLCB3YXRjaGRvZyBkZXZpY2Ugc2hvdWxkIGJlIGNv
bmZpZ3VyZWQgdG8gdGhlIHJpZ2h0IG9uZSBtYW51YWxseS4NClNvIHRoZSBwYXRjaCBhcmUgdXNl
ZnVsLCBldmVuIHRob3VnaCBpdCBpcyBub3QgZm9yIHRoZSBpc3N1ZS4NCg0KV2hhdCBzaG91bGQg
d2UgZG8gdG8gcmVhbGx5IHJlc29sdmUgdGhpcyBpc3N1ZT8NCg0KQmVzdCBSZWdhcmRzDQpRaWFu
ZyBaaGFvDQo=
