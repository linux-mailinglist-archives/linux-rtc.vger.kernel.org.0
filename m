Return-Path: <linux-rtc+bounces-391-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2980106D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 17:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7A92281C70
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271CA4CE10;
	Fri,  1 Dec 2023 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="L+CbaIlM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F966DD;
	Fri,  1 Dec 2023 08:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxmELSDCGsUPjwTHj9frQ3C5ZssNJ/Bi9masEJW/e3A2crbvDyECGnTvvt5nAeKmqfffonUgWIzkPy6I33za2EX7EAw+t/jgPMB3AG0G5k5dvljS2FrabfoGl2j++9N971lBOa0C/B7Hx16MzDLu0u4cvrmG2YSudEW8NrJeEX+2QPxHBmxr52Z6OP3i1YHSeMm7GhMziu2BoNIuUVdHuWu5oB/chNvDBBOYUAbKnX6KGI+KtH6qhCPs/WjVL3Eei3nOkb988iLq6XLSsVYBl/wdUrvf/6QNjts4GLdHWsO8sBk/nekbNTefuGNhr6Q6CY8R0P+h7HmsBZYr9/ljBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEXtmdSk9MkyQstuLhUifQnXZnmXrykrXGt2qDwHZyQ=;
 b=Awa0RJLmM0gtAORSQZdYCUeWWBipds8f1HhIXpF0SESYJujvc6d2BkMII1tj859NaYD50R8eZhTiSzd2kqMSAWvtjGr5Z6LjDRC0oFD4RZypJJ7tyHO9N4m65KyUolNxXUpYYScTD4Ha7xDgnTARZOM+JpE67FeQX5N9bgCFI+fi3R/bSHNOjvtFiRKPb9Y5y7BUYrhvDsjewuugRxztZuY5dGlFN8wqoI/8OOPhpDM1unkkNcGZJQyXZuhITl+Ulibt1Mas4y/FZIESOCNhfpFCNFtKRegL2y5032vRcYKmkJ9dUf2prbWxCMeYi4Kk9QJ+x7JoLqP8Pq/nAA1LhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEXtmdSk9MkyQstuLhUifQnXZnmXrykrXGt2qDwHZyQ=;
 b=L+CbaIlM7VyFdiQwtTobt10rZtGmuFhfTlZsy2xe1P5TWX32fAHg5htqyM47Npz0RNZaE4QxYL1Petwk9oLs2YmQ2Fe4MPwaLR3A2sxbcp82DUU1hVwqDuQLqsaP/oQtTwiC3a4dtCmoiUytWujDYixPdDs7HH/E2vorbLs/OZ0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB10176.jpnprd01.prod.outlook.com
 (2603:1096:400:1e4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Fri, 1 Dec
 2023 16:40:25 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 16:40:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Alessandro Zummo
	<a.zummo@towertech.it>, Support Opensource <support.opensource@diasemi.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
Thread-Topic: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
Thread-Index:
 AQHaJEbIMKcu/jSjKEOPN5GP9OdxM7CUZzQAgAADWnCAACCjAIAABShQgAAEnoCAAAHkEA==
Date: Fri, 1 Dec 2023 16:40:25 +0000
Message-ID:
 <TYCPR01MB11269531DC2A3ACF0A78FD8AE8681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <202312011520103c5f28dc@mail.local>
 <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <202312011555095065168a@mail.local>
In-Reply-To: <202312011555095065168a@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB10176:EE_
x-ms-office365-filtering-correlation-id: fe1b0146-9557-4b7b-2884-08dbf28c3819
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KrvC6xjeNQn+Hjw8COT7AbgP9RODddIvJLpmE2wXQHblvNq8ces554OIVcOl5XE0wnc46hqETYt9qQrsxPCfTnLKxkmt8kBq//sRkDlLHrPiVXlXUH95eYEe+vmVGmxz/47jgaLwgre0roCM0NRxoaiZonFrxYTy9w9X+DzCvBi1IC0aL8ctCc74ZZB6mbZdpnZ4XB+y4CU4rFM0poGZKfIcaR3rlhI/uRx0fnYu4qF5gkPMJCAZHAm3eUmPuWuxXleO38YoiUbyAQKkFIDzA28CqyjhO53T0R4rqkjoMwfGxKj7CfT9MSD1ZVSM96rAnBhw/CHsGo0gL5dgh2zgX5eVFINYtU9EAobQ5qZsY7H7JqwY6jWPCOodoUq8rChjd9L2YY2WbzzU2YeGPM8T7bziiUqUyB86g5b/Pk3wgqtdK1ShznO2YBeyGiCW2nviOyYn6O4+3QwS4HgCk8/1UFudeqQD9KL/5StKS3HX/rm3y30S0yHlN/VMyMHyCgAtuVfcwsHGfjjCuRDXcFD22M2OhL986NaGr5a1uFUYfEpyreWATAmpbcnPbzoNvccU2AyBNJuMJbFv/aUV8QBAaRgWBw+bVMvECkDq+cuhY7s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(9686003)(26005)(53546011)(45080400002)(7696005)(6506007)(86362001)(5660300002)(2906002)(66476007)(83380400001)(4326008)(76116006)(54906003)(64756008)(66556008)(966005)(8676002)(66446008)(66946007)(6916009)(316002)(52536014)(8936002)(122000001)(71200400001)(38100700002)(38070700009)(33656002)(41300700001)(55016003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUJmTE9EbC9IWHM2TzBLcUNrZWZkTHppSklLclhxb2QxQXIwNERTd0g1V2Fy?=
 =?utf-8?B?REkzdHl5VnZvemtCTGxiVlhOdVJOUnNlbWtKQmpWWEczNFR0cnJjbGkrdDZ3?=
 =?utf-8?B?Mk8yV2d5Q1hXMjJZZmRXb01XODUxQzROT0U5WC8zUHhMYm94ZHpYSmkveDJ4?=
 =?utf-8?B?aGo0WCs5VkN4VWR5OWliSVFEVExaMVJldkdVTjhWRHljMlBsU0kvMUMyNG51?=
 =?utf-8?B?QnIrMnlXU3I3S3FYd09JK3dGdkI3SnQwQXNyc2p4cjR6Tlk4V21WWVFQbnVl?=
 =?utf-8?B?VVVhVzc5YmtCbTB2YVZMNEZOS2RpSGltWnFiTW1zaXF6K29Zb0hwcjM0TWNE?=
 =?utf-8?B?MU5PSjd5b2l5c1JUL21HQjd2bUl2RFhFY256QkU5VndHNTk3L0F0S2FIc1dr?=
 =?utf-8?B?QUYva0srdVVqNy9TSmlHeGhkTFVQUUNja0dyZUZjbWdYZTNmOENON1l4ZG5l?=
 =?utf-8?B?OGlTbFBZTmQ5VkUrMzlCT0lJMEdXc215THdTc2NZajdTendFMXdlamJYU2Jo?=
 =?utf-8?B?YW5qdzBCRFdPd2JMK3pKSU4yUHRJL0tLejZ3ZlM3RHBwQ0t5elAyM1FtVkZH?=
 =?utf-8?B?L0hOWkRacTQ1V0prY2dhRHZCN1I0RUFjZXFYV0I3ZTBBZ2R0WDF0ZDJTRWZt?=
 =?utf-8?B?a3FaU09XZ0xkaC9qYW8yRUdDUXpVUU8vSmVZV2RHV0FFMGQyOEZRZFBmcHVj?=
 =?utf-8?B?R1o5SkV2WDBsNjVTQ1pGNEM4M3ZWNHpvWlh0Q2Q4TEVneG5PU3A1c2hBcEpP?=
 =?utf-8?B?RitNaGQxbU81aTd3RFpNSGg0RUNtN3RZNlBNMkNJRmxWMTlkWStEYldWOFF2?=
 =?utf-8?B?bnNMS2VtTHhPTkVnR1hLYWpRT1QxVm9ZTll1SmJwakMzTzFYR011UU9Qa3J5?=
 =?utf-8?B?aTFQd1c0M01iQzFyZUkxOXhqTldOYjA5aDRIbnFTVDQ2V3V0c3NHWGlTeFFp?=
 =?utf-8?B?YXh5NENoL3lwcVNFZGdFdUZSZ0gwdmpqMWRud1MyWHlQNDFuSkJ0L3Nkbjhj?=
 =?utf-8?B?UUppMUUzMkszb0pjTUxZbE9NeVgxeWgwNEc0M2xnR1hEcHJJazBHWTRZVEYx?=
 =?utf-8?B?RWNjSHVRNTdIcEV0eG9uUGtXWnVYZlRVSUIzeWRGU3hWWTBVZGVLYjh1TEdq?=
 =?utf-8?B?aVdHbFIxQWtXQklrOFNObUxobmdzQ3BjbzZJTFV2ZFg0WC9IREwyandncmh1?=
 =?utf-8?B?aERLVCt1VnVpZldET0hQcVE4MHRVMTlqUnNEV1c1V0VZUHRUOEVQelZrdkdF?=
 =?utf-8?B?UlFicmRpajF1STlOZjVlcWl6djVFenZtNmVFZ3FpUHc2aEs0eTJjMS8yOWpJ?=
 =?utf-8?B?Z2VxaFUvVjRpbHFkLy9uemtXdTVqOXdTMmxpK2lSTjRWc1FYRWQyaUY1OWpw?=
 =?utf-8?B?cVVEODArVlk3NlV6UXVDSzF0R0dydnQ5dkNvd09SK3NNYXpaYkY0M1pnZ0Rv?=
 =?utf-8?B?RWRnamxWdzZlYkZkVkZkcDhta2c4RXh2LysxRDBwZk5qNE5zRS9LRVlpTHdo?=
 =?utf-8?B?SWRlZHhMV1ZLWWhVbGNJMDlIRTlaS0NzdTAxaG5tNEkremsxcVF6dElrZFRS?=
 =?utf-8?B?cldRZDloMzhJZDB5TlREMHl1MVd1bHJYbTFhZEk5WmVwcGRvU21aQmxSaHB2?=
 =?utf-8?B?YkthSkpHaXQwV3pYY204UnBuSms4bVhmME9FT0RRMmNSbTA3eTYzWURKZ2FK?=
 =?utf-8?B?R1Q1MXBjYklJd1I0UUpjVnEvZ0ZzNFh1SGpxQXVSMkJIY2ZqY2k5ZUR3dDJF?=
 =?utf-8?B?dllYbXYwTnd1SEEvS2lXOTJ2SU95bzFNZm5WVHZ1dWNvbVdhOHFxcjc5dHpO?=
 =?utf-8?B?ZHZMZ291bWMwR3owdUEyZnpnWE0wQllRNXZpN1IwTmxURnNWazdDOTFTV0F1?=
 =?utf-8?B?VlQ4OTF4ZzMrUEZrM3BFUk5FRHRQMUM1ek4rbitBSVZSOTEwM3BCU3BEai8v?=
 =?utf-8?B?WGs4YWkxQXd3dHV1aEhQUkpPdzNrL2FwZTR4aFIyTUZrU0xPVnFyRSs3KzlG?=
 =?utf-8?B?d0JEYVZ5dS92ajFadXgvbnFIZklpbitvTzhGQkNuRlBrR1Q5UnIxVkUyc1FX?=
 =?utf-8?B?Y05Kek9DZTRZa3BDODFTZFZIZUsvelpROERrKzNyNE52QWJrdzdXSVlVVnYv?=
 =?utf-8?B?dzFOOTBiaWs1KzZkam10QjNkd1B1VXZqd2NGa3MydlBKQ2ZaSy92RHJvUWR5?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1b0146-9557-4b7b-2884-08dbf28c3819
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 16:40:25.3459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJRbGyGewS4w648+sHgga/YVS4gg15gCVjqCoB7wjXy6xt+z+Krny5nIKboMFCpQlpcAH4DOBF94muT/7bSLhtTqfCz8PPEaVT7yNdQersY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10176

SGkgQWxleGFuZHJlIEJlbGxvbmksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNl0gcnRjOiBkYTkwNjM6IFVzZSBkZXZfZXJyX3Byb2Jl
KCkNCj4gDQo+IE9uIDAxLzEyLzIwMjMgMTU6NDM6MjcrMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gSGkgQWxleGFuZHJlIEJlbGxvbmksDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFj
ay4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMy82XSBydGM6IGRhOTA2MzogVXNlIGRldl9lcnJfcHJvYmUoKQ0KPiA+ID4N
Cj4gPiA+IE9uIDAxLzEyLzIwMjMgMTM6MzA6MDUrMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
PiA+IEhpIEdlZXJ0LA0KPiA+ID4gPg0KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4N
Cj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+
IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzZdIHJ0YzogZGE5MDYzOiBVc2UgZGV2X2Vycl9wcm9i
ZSgpDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
T24gRnJpLCBEZWMgMSwgMjAyMyBhdCAxMjowOOKAr1BNIEJpanUgRGFzDQo+ID4gPiA+ID4gPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4g
UmVwbGFjZSBkZXZfZXJyKCktPmRldl9lcnJfcHJvYmUoKSB0byBzaW1waWxmeSBwcm9iZSgpLg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLWRh
OTA2My5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtZGE5MDYzLmMNCj4gPiA+
ID4gPiA+IEBAIC00ODgsOCArNDgwLDkgQEAgc3RhdGljIGludCBkYTkwNjNfcnRjX3Byb2JlKHN0
cnVjdA0KPiA+ID4gPiA+ID4gcGxhdGZvcm1fZGV2aWNlDQo+ID4gPiA+ID4gKnBkZXYpDQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gSVJRRl9UUklHR0VSX0xPVyB8DQo+ID4gPiA+ID4gSVJRRl9P
TkVTSE9ULA0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIkFMQVJNIiwgcnRjKTsNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBp
ZiAocmV0KQ0KPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRl
di0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QNCj4gQUxBUk0NCj4gPiA+ID4gPiBJUlEgJWQ6ICVk
XG4iLA0KPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfYWxh
cm0sIHJldCk7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvDQo+ID4gPiA+ID4gPiArIHJl
cXVlc3QgQUxBUk0NCj4gPiA+ID4gPiBJUlEgJWRcbiIsDQo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfYWxhcm0pOw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gVGhpcyBjaGFuZ2VzIGJlaGF2aW9yOiBiZWZvcmUsIHRoaXMgd2FzIG5vdCBj
b25zaWRlcmVkIGZhdGFsLg0KPiA+ID4gPg0KPiA+ID4gPiBBZ3JlZWQuIE1heWJlIGEgc2VwYXJh
dGUgcGF0Y2g/DQo+ID4gPiA+DQo+ID4gPiA+IGlmIHRoZXJlIGlzIG5vIGlycWhhbmRsZXIgb24g
cGxhdGZvcm0gd2l0aCBJUlEgcG9wdWxhdGVkIG5vdGhpbmcNCj4gPiA+ID4gd2lsbCB3b3JrLCBS
VEMgd29uJ3Qgd29yayBhcyAicnRjX3VwZGF0ZV9pcnEgIiB1cGRhdGVkIGluIGlycQ0KPiBoYW5k
bGVyLg0KPiA+ID4gPiBJIHRoaW5rIGl0IGlzIGEgZmF0YWwgY29uZGl0aW9uLg0KPiA+ID4NCj4g
PiA+IFRoaXMgaXMgbm90IHRydWUsIGFuIFJUQyBjYW4gd2FrZSB1cCBhIHN5c3RlbSB3aXRob3V0
IGFuIElSUS4NCj4gPg0KPiA+IEFncmVlZCwgSSB3aWxsIHJlc3RvcmUgdGhlIGJlaGF2aW91ciBm
b3IgdGhpcyBjYXNlLg0KPiA+IEl0IG1heSBub3QgYmUgZmF0YWwuIEJ1dCBiYXNpYyAiaHdjbG9j
ayAtciIgZnJvbSB1c2Vyc3BhY2Ugd29uJ3Qgd29yaw0KPiA+IGFzICIgUlRDX0ZFQVRVUkVfVVBE
QVRFX0lOVEVSUlVQVCIgc2V0IGFuZCB0aGVyZSBpcyBubyBpcnFoYW5kbGVyLg0KPiA+DQo+IA0K
PiBSVENfRkVBVFVSRV9BTEFSTSBpcyB3aGF0IHlvdSBzaG91bGQgY2xlYXIgYW5kIHlvdSBoYXZl
IHRvIGZhbGxiYWNrIHRvIHRoZQ0KPiBpcnEgaXMgbm90IHByZXNlbnQgY2FzZS4NCg0KDQpPayxX
aWxsIHVwZGF0ZSBQYXRjaCMzIHdpdGggY2xlYXJpbmcgIlJUQ19GRUFUVVJFX0FMQVJNIiBhcyB0
aGUgZmFsbGJhY2sgZm9yIHRoZSBpcnFoYW5kbGVyIGVycm9yIGNhc2UNCg0KT24gcGF0Y2gjMSwg
SSB3aWxsIGNsZWFyIGJvdGggUlRDX0ZFQVRVUkVfQUxBUk0iIGFuZCAiUlRDX0ZFQVRVUkVfVVBE
QVRFX0lOVEVSUlVQVCIsDQoNCmFzIHdpdGgganVzdCBjbGVhcmluZyAiUlRDX0ZFQVRVUkVfQUxB
Uk0iLCBJIGdldCBiZWxvdyBlcnJvci4NCg0Kcm9vdEBzbWFyYy1yemcydWw6fiMgZGF0ZSAtcyAi
MjAyMy0wOC0wNiAxOTozMDowMCINClN1biBBdWcgIDYgMTk6MzA6MDAgVVRDIDIwMjMNCnJvb3RA
c21hcmMtcnpnMnVsOn4jIGh3Y2xvY2sgLXcNCnJvb3RAc21hcmMtcnpnMnVsOn4jIGh3Y2xvY2sg
LXINCmh3Y2xvY2s6IHNlbGVjdCgpIHRvIC9kZXYvcnRjMCB0byB3YWl0IGZvciBjbG9jayB0aWNr
IHRpbWVkIG91dA0Kcm9vdEBzbWFyYy1yemcydWw6fiMNCg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXQgPSBk
ZXZfcG1fc2V0X3dha2VfaXJxKCZwZGV2LT5kZXYsDQo+IGlycV9hbGFybSk7DQo+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoZSByZXN0
IExHVE0sIHNvIHdpdGggdGhlIGFib3ZlIGZpeGVkL2NsYXJpZmllZDoNCj4gPiA+ID4gPiBSZXZp
ZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC0t
DQo+ID4gPiA+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLQ0KPiA+ID4gPiA+IGdlZXJ0QGxpbnV4LSBtNjhrLm9yZw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYQ0KPiA+ID4gaGFja2VyLg0KPiA+ID4gPiA+IEJ1dCB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yDQo+ID4g
PiA+ID4gc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IEFs
ZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluIEVtYmVkZGVkIExpbnV4
IGFuZA0KPiA+ID4gS2VybmVsIGVuZ2luZWVyaW5nDQo+ID4gPg0KPiBodHRwczovL2pwbjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZib290bGlu
JQ0KPiAyRiZkYXRhPTA1JTdDMDElN0NiaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29tJTdDNzJl
OTNmMmQzYjI1NDQ3Nzg5YzYwOGRiZg0KPiAyODVlODIzJTdDNTNkODI1NzFkYTE5NDdlNDljYjQ2
MjVhMTY2YTRhMmElN0MwJTdDMCU3QzYzODM3MDQyOTE2OTM2NDI2OSU3Qw0KPiBVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aQ0KPiBMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9ekd0OVpzazZB
WVozendPVFU2bDB6bU4zS0YxckdxT1RBZTNYUg0KPiBoeFBXYUElM0QmcmVzZXJ2ZWQ9MC4NCj4g
PiA+IGNvbSUyRiZkYXRhPTA1JTdDMDElN0NiaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29tJTdD
YjY5OWY0ODY1NmQzNGE5DQo+ID4gPiAyM2E2NDANCj4gPiA+IDhkYmYyODEwNGFmJTdDNTNkODI1
NzFkYTE5NDdlNDljYjQ2MjVhMTY2YTRhMmElN0MwJTdDMCU3QzYzODM3MDQwODE3DQo+ID4gPiA2
MDQ0MzENCj4gPiA+IDUlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpDQo+ID4gPiBJNklrMWgNCj4gPiA+IGFXd2lMQ0pYVkNJ
Nk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9RTl0RGkwOHNCUm9oNHRCY2NRQiUyQjhheiUy
DQo+ID4gPiBCcVE0JTINCj4gPiA+IEZ0UU9wRmpkUGdVOHpRWGMlM0QmcmVzZXJ2ZWQ9MA0KPiAN
Cj4gLS0NCj4gQWxleGFuZHJlIEJlbGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbA0KPiBlbmdpbmVlcmluZw0KPiBodHRwczovL2pwbjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZib290bGlu
Lg0KPiBjb20lMkYmZGF0YT0wNSU3QzAxJTdDYmlqdS5kYXMuanolNDBicC5yZW5lc2FzLmNvbSU3
QzcyZTkzZjJkM2IyNTQ0Nzc4OWM2MA0KPiA4ZGJmMjg1ZTgyMyU3QzUzZDgyNTcxZGExOTQ3ZTQ5
Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAlN0M2MzgzNzA0MjkxNjk1MjA1Mw0KPiAxJTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJU
aUk2SWsxaA0KPiBhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPVdVTFNr
dGVQbG9qR3FWUGJRSiUyQkRlbEpuUUVPVUloJQ0KPiAyQmFTSm0yUmE0T3NSSSUzRCZyZXNlcnZl
ZD0wDQo=

