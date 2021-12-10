Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA4F46FAAE
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Dec 2021 07:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237015AbhLJGie (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Dec 2021 01:38:34 -0500
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:44003
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236965AbhLJGie (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 10 Dec 2021 01:38:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTGaI4AgY27SIv67oMdvr6fS30whcsVXcxteBbW8d2mVrLAG6ZtFl+/XaU4AbDbFDQBhk1ipL4kh8I0eYiLdc4uwdYImJKzFiAbEv5IEdGqnvfCy10ChMW7zDQNP6Jm0mLkbYl6r73udzYXFug8KBVRl0YFqRKRHhViOFuME0diqJ5TfsgMa++sOCXH/FfPfEFWmNT2L0fUuLsHioa1/Qthb4fwkJXHtzDJw3zGeSytD1vnWzvMLJfrE2n7zp5Rhmq95N1jBhbQ/WkV/8Eab71DMnopJ0R/j74LH54gzYhvenQ8s/Y+P2bJTrJxaLfE+DcmEnkTHI4bbv2qdu59S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkMsA8sueY+l6nmER4Kb7svhR6raihDJl1I/7TWX7Gk=;
 b=nSJfv7bnPcA2vZsGEuRYG698PBj+Jm8+tCRJZCRjzbR2AgKOv+Ps+XLBHH3cU0W/JPghVnLeMGbPuy+uDXD1PCuLTiL1c7kWDcbgJq+81tFJt/T+rseylFBDpnGdD1ZGfZaAdju8VibiUQgXn0S3frpNuFBa9J87iOH3DHJfYVUUYy2DN1XEiIP2AWLTjKGH5l8eQH4EYSWlB3wCeK1xUKa1bUo2RdsG+O3utaK+m/VhpprO3JF1wYiNPJRN5JlSQdQK7lcoyI03qbsn5Y2v+Ikk+wWg0oPHMKF58rTk+VTXudrZNop6ZzPMYw923ddQJvrrNSErSu8dF8d6ibn8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkMsA8sueY+l6nmER4Kb7svhR6raihDJl1I/7TWX7Gk=;
 b=PxQ6C/BneYhI+imB2SoEf9j5Qt4PiqPht28RfGZOEIRK5OBzXxglDu0XXSbiGwtNkQUgzEOPULyo4E+TNB+CazwqY4y4eILG2qIusjPrLfn6vPbPqjRYN7h66sqRNrlV1p4HYb+z7zfbmQoY4FrAZii0fCUYTOUiL7rfiQ3wJKA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2409.eurprd03.prod.outlook.com (2603:10a6:3:69::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Fri, 10 Dec 2021 06:34:51 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 06:34:51 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Hugo Villeneuve <hugo@hugovil.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        "r.cerrato@til-technologies.fr" <r.cerrato@til-technologies.fr>
Subject: Re: Inquiry about new RTC driver PCF2131
Thread-Topic: Inquiry about new RTC driver PCF2131
Thread-Index: AQHX7ZAIpJE2gKmaukqa9Yj2UTh3Bw==
Date:   Fri, 10 Dec 2021 06:34:51 +0000
Message-ID: <96188b2a-882f-a030-b1f1-d79092f4e319@fi.rohmeurope.com>
References: <20211209145207.30ee844655c553a5c20d9249@hugovil.com>
In-Reply-To: <20211209145207.30ee844655c553a5c20d9249@hugovil.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce33840-f010-483d-bd7f-08d9bba72b88
x-ms-traffictypediagnostic: HE1PR0301MB2409:EE_
x-microsoft-antispam-prvs: <HE1PR0301MB240916C7F696433A916FB78FAD719@HE1PR0301MB2409.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/uIca/dLjp1/6r8dUUf4UY869NUTe8GvSO7ZOcMcJ0or0mgwGhDiFL18x2NLZIWhU4qbe//2yoOYvw3k5KaJhlgynLV94A8I0plVIkCy1JMdbYqx1X5HxDqhU5oiFSUw56IKhB3zNeRP5r1vHW+51b7WfUQ21NaBhqmxD8PhWjD2po03L82Hg84sXEpbDIwJi1ivFlQK3kBqP2ET52DlvIupvjwfTaXc58sonZNGwgNJCgIq1DtJC9v6AlTqIDokTtqsQvv7ITh6R4IBvpljx8cvt1q3a7ZcvSF1tbz2mXP5LNcgpY9XXRUpwf2HysJcWnJjFNEIIQ65tdScfaI0maDhp0llH2J4tvbGbEXSFOF2GOXTv06on+ToBlDL/GrVaQJlnrVGnCv3vOxjve4By8IjteyijIPRwuyLobKZpbZVzqVxCZpte2e1vyEEgCJGkZyk7zwuQbddnAHUDrJGxwAiynZVvEjFcKlVFz/ABkm/ECMtyYV113Gb4vqx5YbQY7y1c3VRFmh60D1y+p22MlxCtFW/bp9oCx6ylgJ8P2NRcAJUvQClc5tFNeqPiAuc7aUO+VGOEQF+qHQTyd1UyWjTfwQEsqRroxWVidCwxOn+SRxHGzGUxWXjcrvi5PBsmWoVSLEJ8cw6zA17ls/Y+feG8ZHLLXYYmBNSIKFwieYPNBP5E9rwBbez8AKIhFrLXUrT8HawPvv8EtVkdN9bG0Zz5HuwZd5eB3wTeZm/8MdX8+IpbBZ5Ab2s+qr2WHgYWAQvbWvgF35NJfDd9baTL9SFByDViEzwi2a4AFzZ0OWx4MHPMlti1ZK/dNeTHmZZ2xmtDhwmzcwe2Ho99YplQgOc1NFbwIg0E4lVa6SuRM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(71200400001)(2906002)(53546011)(83380400001)(6506007)(2616005)(110136005)(54906003)(316002)(186003)(38100700002)(5660300002)(122000001)(966005)(4326008)(86362001)(38070700005)(66556008)(64756008)(76116006)(66946007)(6486002)(8676002)(508600001)(66446008)(66476007)(8936002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUxsa1YwTENhVkF0NFJOYzRwalBMS1lubjlqWG1Nd1d4OG5lUzhNczBCTjZG?=
 =?utf-8?B?YjFPck8wRXZnbkNVNnhiaXRZRXJyTHJtSk1qMVhkZVAxSkkxQXdiWFNheUtj?=
 =?utf-8?B?TCtBK0hUN0pMNnpEU0RjZ2F5eFF5SGtyWTI2NmRGNEJIWUJrZDgxQ1laSUJ2?=
 =?utf-8?B?TUxyKzJ1bXlFbTJ0VC8yc2lHNXUzZVVpUDNRaEdEamY3ZHpUNmdCU2lERG92?=
 =?utf-8?B?UmhGTVNsbXVqTXBDTWNtMDd6RGUzKzdUOW1SOURuY3NFVGJSd2gvay9OSFgz?=
 =?utf-8?B?aTk0b1lPQXcvVG11NGtXVUtMNldKWjZPNzVTa0U2ZnJnLzFLSFl3blNRTXQx?=
 =?utf-8?B?Wit5THVNMWEwUHJaT0xKVkpabEs0SFNNNHV1L1dLRTVVem1ESm1RTHpUVjR4?=
 =?utf-8?B?WENFTlZOZDZQWU9TejI3cWJUR3JqdTk3TitiN095NkM5MDFYazJQV2NGZTZv?=
 =?utf-8?B?a1k0MW13RThLRWhPR0xNZlRUU1RrUjJWQWtPSEZBQ29zUWRibnBZdUlLb3pS?=
 =?utf-8?B?dE81K3JMbW1XZDJ1eWVKV3hoRkZ2aUI2b05jUlJQN3lhaGNqbVZ3cm1JQ1RQ?=
 =?utf-8?B?THFCRjdIVlF3bFovNXRESWdFY2J4SCtpZjNMWFBhS2FtZmhaVS9CMHVZcTh0?=
 =?utf-8?B?bGdoNk5USEF2dXRMS2h3dWhML3dKVkZQZllKdXpXVGFaYzQ3MGtnMHkzQ2Rr?=
 =?utf-8?B?V295bEQ4MHNweXg4MzJuc3REUmxXVDF5dTgvYk82RlN2TzE2UlZrQ08wVWh2?=
 =?utf-8?B?OGMxVzB2SExjZUU3L2UyWW0yNFpXamQxRzhiWDYyZGJQQ1dYU2dpQk1MdUJI?=
 =?utf-8?B?dE1BQkZjNWc1akFUSDVFR2N6d1EvaVZGWHJjeU1KbDJyZGtSU0FvK21wWW1s?=
 =?utf-8?B?ZGl4aUpoQ2ZaODdGcjZZOFlVZzdKRFpkc05ET1YyUklPa3I1N1E5TlhkTHI4?=
 =?utf-8?B?QkZhTDlmM09VRkF0bDlodVA3QTRQaEd5SUtTeFJXRVZIM3RxcWJINUZIdHc2?=
 =?utf-8?B?aEJaQzcvNUdtRk5GNU5BUE5wYnkyZEZrN09ucTFHMjlKVjlhTHBFK3k4b2w5?=
 =?utf-8?B?UHBVYy9hQmNPMjhPZ0JzRVZQbnJRVElOb01qSXpIbDdGcCtHVHcybTRuc3hh?=
 =?utf-8?B?UUhJYlpiTjJRbnJUTDJ0SURzdStNUXF3YjdCaWl3VVFTVVExR1BFWHdFU3ZJ?=
 =?utf-8?B?WW9COEk1Y2Z3TTNuU1FOQk1vQ3lndTU4RUNlYStqdmluenJ6Nkk1ZVFmNVF6?=
 =?utf-8?B?QjZTbnN4SmVSTmp5VE1YeHVYUUZQTkoyYWVLeFl5VG0yUWk5Z3dyL0FPR1ky?=
 =?utf-8?B?Y1pBeXhsdU9CVzBQeHpMckkyZEZNdVlDZVZ1eks3VFJ0V0lqNnBGTnhvVVFa?=
 =?utf-8?B?ZDVkL1NMZDlsL2JETW0rUTlhSnVnZ2lrYU9CUnQvV2JvVy9oc1h1Sjd2WmJS?=
 =?utf-8?B?WGdrTnFLUElOcjNOcThGNGxFYTJwNFRRdy9IUTdicHdMK05rbkQzMWh1VUsy?=
 =?utf-8?B?c2lCT2NrcWdvd0l1c3hsWnJvMTJSbWJCQk9RVjN4RkhseFdabG9wWUtCTUZH?=
 =?utf-8?B?Z3dJdUVhNVhwbDUzV0V3UnJRN3Z0Vkh6S2Z0UXdMZEVNSmNLb1JkVHZ2eDNS?=
 =?utf-8?B?bGRhVWEwUHhmZXhGZ3hrcnFCSjFaM1dBU2k1cU42VUZIWVhOMFNhd0V4Wlh1?=
 =?utf-8?B?ZjB3OFgxRXdXRDdBWGd5bkZKUXZVZW52TWNBcE1nSnFBeFZSOWFlb2w4SjJQ?=
 =?utf-8?B?K05qN0J5ZlVsbStZN2pwUU1QTWVHTzdrdnR2YU9QQnZqZFlEaUgzVkpnbE9Q?=
 =?utf-8?B?dHM0cmluenl2MCtZNEVXbmc4c1hiQU9kWTdtQU1RNENtNmh4ZE1KVGpOSFFj?=
 =?utf-8?B?UDVtVlpRK012Q0NOeUJQaTgwR3M2aytyNmttcTNwOHp2V3BwU2txb0xJVFRY?=
 =?utf-8?B?NHhkY2drdHpabzNQSGt3MHZYTWVBOTIwVEVJSWlNd3ZTbmlDekhoQW1YS3lr?=
 =?utf-8?B?a0F0a0J2V0V6cHFLam9FVFgvTGJWUU04U09EUjlXdE85YytpVW14WWdTWkR4?=
 =?utf-8?B?ODd3L2FNcCtaZ2FaSjB0VEJUTC9OZDBXTXNZWHdVcTFFSHhBVk1OWVl4U2RP?=
 =?utf-8?B?djhhYkdzQVNVSG9tbFJzbWYxbEl1Q1pleTNuTzNGb3l2SWtBelcwei8wNlJv?=
 =?utf-8?B?WnVVU2pDcm9TczY2c2R1Tkk3STFUdDFId01UOHBTWFhpNSsvN0JMa3hqWjhV?=
 =?utf-8?B?NTVhZjZBZjhIMTZkaDJZdjN0Ukd3WXN5cW1NeXRxTzZtM3E2ZEZqcExNRzZC?=
 =?utf-8?B?SlkyV20rMGY4WENTQTJzQjEzN0t2L2dTdDZEYXRFUEd1b0JxZEtFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93A81AC3D6172F4C951637431781ABD4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce33840-f010-483d-bd7f-08d9bba72b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 06:34:51.3510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POZoTX06CvF1p6Eqfxv+737FSKugZjFJrVXub4SiVOg5cYJ/VXyi6UzsBYv464XfMC5sGuyNgYXGJROHOzefynA7BfDrO3OaKNwDipQboWPhKfQBF77+C3xXYD1kjQFa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2409
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgZGVlZSBIbyBIdWdvLA0KDQpPbiAxMi85LzIxIDIxOjUyLCBIdWdvIFZpbGxlbmV1dmUgd3Jv
dGU6DQo+IEhpLA0KPiBJIGFtIGN1cnJlbnRseSBkZXZlbG9wcGluZyBhIG5ldyBSVEMgZHJpdmVy
IGZvciB0aGUgTlhQIFBDRjIxMzEgY2hpcC4NCj4gDQo+IFRoaXMgUlRDIGlzIHZlcnkgc2ltaWxh
ciBpbiBmdW5jdGlvbmFsaXR5IHRvIHRoZSBQQ0YyMTI3LzI5Lg0KPiANCj4gQmFzaWNhbGx5IGl0
Og0KPiAgICAtc3VwcG9ydHMgdHdvIG5ldyBjb250cm9sIHJlZ2lzdGVycyBhdCBvZmZzZXRzIDQg
YW5kIDUNCj4gICAgLXN1cHBvcnRzIGEgbmV3IHJlc2V0IHJlZ2lzdGVyDQo+ICAgIC1zdXBwb3J0
cyA0IHRhbXBlciBkZXRlY3Rpb24gZnVuY3Rpb25zIGluc3RlYWQgb2YgMQ0KPiAgICAtaGFzIG5v
IG52bWVtIChsaWtlIHRoZSBQQ0YyMTI5KQ0KPiAgICAtaGFzIHR3byBvdXRwdXQgaW50ZXJydXB0
IHBpbnMNCj4gDQo+IEJlY2F1c2Ugb2YgdGhhdCwgbW9zdCBvZiB0aGUgcmVnaXN0ZXIgYWRkcmVz
c2VzIGFyZSB2ZXJ5IGRpZmZlcmVudCwgYWx0aG91Z2ggdGhleSBzdGlsbCBmb2xsb3cgdGhlIHNh
bWUgbGF5b3V0LiBGb3IgZXhhbXBsZSwgdGhlIHRhbXBlciByZWdpc3RlcnMgaGF2ZSBhIGRpZmZl
cmVudCBiYXNlIGFkZHJlc3MsIGJ1dCB0aGUgb2Zmc2V0cyBhcmUgYWxsIHRoZSBzYW1lLg0KPiAN
Cj4gSSB3b3VsZCBsaWtlIHRvIG1vZGlmeSB0aGUgZXhpc3RpbmcgUENGMjEyNyBkcml2ZXIgdG8g
YWRkIHN1cHBvcnQgZm9yIHRoaXMgbmV3IFJUQywgaW5zdGVhZCBvZiBzaW1wbHkgY29weWluZyAo
Zm9ya2luZykgdGhlIFBDRjIxMjcgZHJpdmVyLiBJIHRoaW5rIHRoYXQgaXQgd291bGQgZWFzZSB0
aGUgbWFpbnRlbmFuY2UgaW4gdGhlIGxvbmcgdGVybS4NCj4gDQo+IEkgYW0gY3VyaW91cyB0byBo
ZWFyIHRoZSBSVEMgbWFpbnRhaW5lcnMgdmlldyBvbiB0aGF0IHByb3Bvc2l0aW9uLg0KDQpJIGFt
IG5vIG1haW50YWluZXIgYW5kIHlvdSBkaWRuJ3QgYXNrIGZvciBhbiBvcGluaW9uIG9mIGEgcmFu
ZG9tIGd1eSANCmZyb20gdGhlIHN0cmVldCAtIHlldCwgSSB3aWxsIGdpdmUgeW91IG9uZS4gUmVn
YXJkIHRoZSBvcGluaW9uIGFzIGJlc3QgDQphcyB5b3Ugd2lzaC4NCg0KQXMgYW5kIGV4YW1wbGUs
IHRoZSBSVEMgZHJpdmVyIGZvciBSVEMgSVAgaW4gdGhlIFJPSE0gYmQ3MDUyOCBQTUlDIHdhcyAN
CmV4dGVuZGVkIHRvIHN1cHBvcnQgYWxzbyB0aGUgQkQ3MTgyOCBhbmQgQkQ3MTgxNS4gVGhleSBh
bGwgaGF2ZSBmYWlybHkgDQppZGVudGljYWwgY29udHJvbCBsb2dpYyAtIGFsdGhvdWdoIHRoZXJl
IGFyZSBhbHNvIGRpZmZlcmVuY2VzLiBJTUhPLCB0aGUgDQpjb2RlIGR1cGxpY2F0aW9uIG11c3Qg
YmUgYXZvaWRlZCBhcyBsb25nIGFzIHRoZSBlbmQgcmVzdWx0IHN0YXlzIA0KcmVhc29uYWJsZSBj
bGVhci4gSXQgdGVuZHMgdG8gYmUgYSB0cmFkZS1vZmYgYXMgc3VwcG9ydGluZyBtdWx0aXBsZSBJ
Q3MgDQp1c3VhbGx5IGFkZCBleHRyYSBjb21wbGV4aXR5IC0gYnV0IGlmIHlvdSBnZXQgYXdheSB3
aXRoIGl0IGJ5IGp1c3QgDQphZGRpbmcgZmV3IG9mZnNldHMgdG8gcmVnaXN0ZXJzIHRvIGNvdmVy
IHRoIGVkaWZmZXJlbnQgYmFzZS1hZGRyZXNzZXMgLSANCnRoZW4gSSdkIHNheSB0aGUgdGhpbmcg
ZG9lcyBub3Qgd2FycmFudCBvd24gZHJpdmVyIGJ1dCBzaG91bGQgYmUgbWVyZ2VkIA0KaW4gc2Ft
ZSBkcml2ZXIuIChQbGVhc2UsIG5vdGUgbXkgbm90ZSBhcyBJIG5vdGVkIEkgYW0gbm8gbWFpbnRh
aW5lciAtIA0KYnV0IGp1c3QgYW4gaXJyZXNwb25zaWJsZSBndXkgd2hvIG1zeSBiZSBzaG91dGlu
ZyB0aGluZ3MgdGhhdCBwb3AgaW50byANCmhpcyBoZWFkKS4NCg0KPiANCj4gSGVyZSBpcyBhIGxp
bmsgdG8gdGhlIGRhdGFzaGVldHMgb2YgdGhlIHR3byBjaGlwczoNCj4gDQo+ICAgICAgaHR0cHM6
Ly93d3cubnhwLmNvbS9kb2NzL2VuL2RhdGEtc2hlZXQvUENGMjEzMURTLnBkZg0KPiAgICAgIGh0
dHBzOi8vd3d3Lm54cC5jb20vZG9jcy9lbi9kYXRhLXNoZWV0L1BDRjIxMjcucGRmDQo+IA0KDQpJ
IGRpZG4ndCByZWFsbHkgdGFrZSBhIGxvb2sgYXQgdGhlIGRhdGEtc2hlZXRzIGJ1dCBqdXN0IHJl
c3BvbmRlZCBiYXNlZCANCm9uIHlvdXIgZXhwbGFuYXRpb24gdGhhdCB0aGUgcmVnaXN0ZXIgbGF5
b3V0cyBhcmUgbGFyZ2VseSBpZGVudGljYWwgd2l0aCANCmp1c3QgZGlmZmVyZW50IGJhc2UtYWRk
cmVzc2VzLg0KDQpCZXN0IFJlZ2FyZHMNCgktLU1hdHRpIFZhaXR0aW5lbg0KDQotLSANClRoZSBM
aW51eCBLZXJuZWwgZ3V5IGF0IFJPSE0gU2VtaWNvbmR1Y3RvcnMNCg0KTWF0dGkgVmFpdHRpbmVu
LCBMaW51eCBkZXZpY2UgZHJpdmVycw0KUk9ITSBTZW1pY29uZHVjdG9ycywgRmlubGFuZCBTV0RD
DQpLaXZpaGFyanVubGVua2tpIDFFDQo5MDIyMCBPVUxVDQpGSU5MQU5EDQoNCn5+IHRoaXMgeWVh
ciBpcyB0aGUgeWVhciBvZiBhIHNpZ25hdHVyZSB3cml0ZXJzIGJsb2NrIH5+DQo=
