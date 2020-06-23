Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA962047E1
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2020 05:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgFWDUE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 23:20:04 -0400
Received: from mail-eopbgr1300059.outbound.protection.outlook.com ([40.107.130.59]:45661
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728478AbgFWDUE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Jun 2020 23:20:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaL67JBllGBSXHdb4oK/U1Im2H2llJzT+jdI662WmHI0PzLzan0VugiZ+OZ0ctde/Ksjtfm6Hqp5LmQ4aGnxaGN+BKdugq1TJuel4hFH6w9r7sPXCzkSj8Gje0dwrXMFAGs9l/aRAk03EFn8OAilu/FldFDUMrxH+rehxniUZDNVgxjUAOXpWXXnZqycKH2LqC9Ga07v+6m8O7uOOyzZBcwE9VyCmsZSsFDG7LLcpMv5KKADHkWldde/swmM4K8QdUAFTkiLosKX0fcOGUMJ2euD5rHP+8vDN5SbohHMnkKfJtfbcFODtFb25M8Afd19y4wKWX1iD0mhvjH1r0U4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK0so9SbCYldWX9BTrRoqs0J3GurngkWw2Siddh9yCE=;
 b=FPKfC8davBWQnv5zLEHk3p5vju5Z32AATHSDZJ/gS+T+HWjZ810oxBxmXyxbdIyo3f+bwW7yqzc4uTumg9JmFdAzmkqQ+4VDVrjqUuDgSSn5GX/lPcLFEA5Mr3Sf9s6UHjihQyk3kLfFM6ZUGdXH1c4Zsc8MiAsPNVYCU21TuU6KhguS3XLuzfzhrIkt10ytpchQCqIEWuEojET7fuiAlAjfGKScl1XePIYKtnBljFBOePlB9ybdDZQvrPkQwVBgyd9ghLjUyTq9jR3ZsSRaIJNdfFooBLxPTo/6m3Mkqe7SaU2JmvdOFCkHROSLJggt6aBU6jr17oozeVU+bV7W6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK0so9SbCYldWX9BTrRoqs0J3GurngkWw2Siddh9yCE=;
 b=LJf6z7qELQ3APFfOdhdk3egv4PIrZr4e1z9XeEl5ad+z+r3iozB/9vHA1W+JwCseNagKqEbz321Rmx8ZJQOK+OAS67lQqxuxcxSAOqyh+fb0Ih2OujO48WBHmOYT/3FbngT/ff9ie/KL5WSQ5i9aiMAtfWfSEtJimSDQgZiaZS0=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3153.apcprd01.prod.exchangelabs.com
 (2603:1096:202:20::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 03:19:59 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:19:59 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH 0/3] Use MFD for Dallas/Maxim DS1374 driver series
Thread-Topic: [PATCH 0/3] Use MFD for Dallas/Maxim DS1374 driver series
Thread-Index: AQHWSHk8vS8zWbAau0uFznOwrrAykqjkfsGAgAEG5hA=
Date:   Tue, 23 Jun 2020 03:19:58 +0000
Message-ID: <HK2PR01MB328105F4DEACC77E8096EB7CFA940@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB3281DAE412911621A7F8963BFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200622112537.GE131826@piout.net>
In-Reply-To: <20200622112537.GE131826@piout.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33171f9e-99ad-4bb4-770a-08d817244f64
x-ms-traffictypediagnostic: HK2PR01MB3153:
x-microsoft-antispam-prvs: <HK2PR01MB3153E659F69FE198791927A5FA940@HK2PR01MB3153.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hGZGVx7Jtq+hqEJDHr14jeI83+BbA40O6KVwqk1KwPDejjaXascgX/1uRCEx/StG80fxErAVpxgkK/LEZ4b8AEyJsKwLmSE9QhUS8II0cRLW9oimZ9umKMhbNLgeVKZExMRAynTgf1XH7z9uar0ru89msR2bVxoFjcbu1dr3ASca8SF/M7K8hjFjs1uEuZOUfpKNEh/hfuJr0zi5sBhyCbJVo+51PGnsFN9KXcnVHGI1gCY7zkVBhuUSRiaJxVTvE7bMClNSuOgO1GjHoOFehJvovidmxqNYHXnk2V1s4qKul7yoVOttdFmhi2MAaDxwkiz//4IMNBwTz9ENOnzA10oi+oJTzkHkie5ePJ6whhL1vovjrr4h05vam4GlJkmzblv0SPb9kHLwD+13J9vaTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(8936002)(54906003)(52536014)(6916009)(26005)(6506007)(2906002)(7696005)(186003)(9686003)(86362001)(55016002)(5660300002)(71200400001)(33656002)(478600001)(966005)(66556008)(4326008)(64756008)(66446008)(66946007)(85182001)(316002)(76116006)(66476007)(8676002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: g8b+dGHJmhNnYxgbcPuJjvi7JjuYWrGYvT4Gv2XvI9qx6KQpXyC4dy/3xqinVdtb38gU1mKAKbAdrTXj48mfsnkip7PjP6khLxjN/FApBhil18TT/R462iygktnPVjZcM0uGYauxYmV9gUonhZTgvDVZS9gC65GsYNAhFQIMLDDATWuLWuMRQVABZez/iRlZTpOQjgmXIGGYdO9KjtcfUXcMhtUfUQ50MProiSzlZROf9L5GyyC7wfcPeehLjM5iJGc0XQ9d61Qa2KfR4YhCO5XC1Sh8QWw1qUSpvAhJwD7PbtlMuZzMZmOk20ez36iA/5nYycVGElpDqUZd0AgKpolPshhrStVoqDoJpOOhKePEM4qs9ZKkgHrUCA5ppJT36mv8agRp/jBcVdbfJJHLUNtyn1jU2SgdL4ibJYvrlesyEd3h4geQplWKffiTjYHPYe/aDIlS78ZTPGmQZ/E+DngZUOrdLz7Po+pa0eYkdrY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33171f9e-99ad-4bb4-770a-08d817244f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 03:19:58.9042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ec6guryj/4g0zY5KWdRoI6rkOdwl0sgIsAyloXx9O21RV8+jlzKkBOks+vFT0Q2u/6W6lGPyIi9oxhtSRcyUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3153
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIA0KPiANCj4gSGksDQo+IA0KPiBPbiAyMi8wNi8yMDIwIDEwOjAzOjI1KzAwMDAsIEpvaG5z
b24gQ0ggQ2hlbiAo6Zmz5pit5YuzKSB3cm90ZToNCj4gPiBIZWxsbyBhbGwsDQo+ID4NCj4gPiBU
aGlzIHBhdGNoIHNldCB1c2VzIE1GRCBzdHJ1Y3R1cmUgZm9yIERTMTM3NCBzbyB0aGF0IFJUQyBh
bmQgV2F0Y2hkb2cNCj4gPiBmdW5jdGlvbnMgY2FuIGJlIHNlcGFyYXRlbHkuIFRoZXJlZm9yZSwg
d2UgY2FuIGFkZCBtb3JlIFdhdGNoZG9nDQo+ID4gc3ViZnVuY3Rpb25zIGhlcmUuDQo+ID4NCj4g
PiBBIERTMTM3NCBNRkQgY29yZSBkcml2ZXIgc3VwcG9ydHMgdGhlIEkyQyBjb21tdW5pY2F0aW9u
IHRvIFJUQyBhbmQNCj4gPiBXYXRjaGRvZyBkZXZpY2VzLg0KPiA+DQo+ID4gMS4gQWRkIERTMTM3
NCBNRkQgY29yZSBkcml2ZXIgd2l0aCBJMkMgYnVzLg0KPiA+IDIuIExldCBEUzEzNzQgUlRDIGRy
aXZlciBoYXMgUlRDIGFuZCBBbGFybSBmdW5jdGlvbnMgb25seS4NCj4gPiAzLiBBZGQgRFMxMzc0
IFdhdGNoZG9nIGRyaXZlci4NCj4gPg0KPiANCj4gRm9yIHJlZmVyZW5jZSwgdGhpcyB3YXMgdGhl
IGxhc3QgYXR0ZW1wdDoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJ0Yy8y
MDE3MDcxODA5MjI0NS50YzVvb3NiYmI2bHp2cXB5QGRlbGwvDQo+IA0KPiBUaGUgbWFpbiBpc3N1
ZSBJIHNlZSB3aXRoIHlvdXIgc2VyaWVzIGlzIHRoYXQgdGhlcmUgaXMgbm8gd2F5IHRvIHNlbGVj
dCB3aGljaCBvZg0KPiB0aGUgcnRjIG9yIHRoZSB3YXRjaGRvZyBkcml2ZXIgaGFzIHRvIGJlIHVz
ZWQgYXMgSUlSQyBlYWNoIGZ1bmN0aW9uIGlzIG11dHVhbGx5DQo+IGV4Y2x1c2l2ZS4gSSB0aGlu
ayB5b3Ugc2hvdWxkIHdvcmsgb24gdGhlIERUIGJpbmRpbmdzLCBhZGRyZXNzaW5nIHRoZSBmZXcN
Cj4gcmVtYWluaW5nIGNvbW1lbnRzLg0KPiANClRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIGdv
b2Qgc3VnZ2VzdGlvbiEgDQpVc2FnZSBvZiBydGMgYW5kIHdhdGNoZG9nIHNob3VsZCBiZSBkZWZp
bmVkIGluIERUIGJpbmRpbmcgaWYgd2Ugd2FudCB0byBrZWVwIA0KdGhlbSBzZXBhcmF0ZS4NCg0K
SSdsbCB3b3JrIHRvd2FyZHMgdGhlc2UgbGF0ZXIuDQoNCj4gLS0NCj4gQWxleGFuZHJlIEJlbGxv
bmksIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBo
dHRwczovL2Jvb3RsaW4uY29tDQoNCkJlc3QgcmVnYXJkcywNCkpvaG5zb24NCg==
