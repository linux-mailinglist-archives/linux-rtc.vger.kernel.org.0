Return-Path: <linux-rtc+bounces-387-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98325800EC0
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C60E281A68
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 15:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CF54AF89;
	Fri,  1 Dec 2023 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mPtbN4jx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CD9194;
	Fri,  1 Dec 2023 07:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMEJQVLanwPYhMG8yIPyoyog1hYhZ8DVAoFBzJBhElOQlQxrRPHjm0JDBrw6qAKLT57wVDl5nrPYn6l2Evaa3Y+ez1VBpi/tnxTrhEIXFfqeoOEGh6xLBml+JAcaj1O/8vZcYLTIsRfgHT93njU22k/NDxSAEK+qUr++7Lh4g4o1aopIaXNOjJ7uJGidp7+TdGT1GontDfd2dPOKzgukSDCWtu6jaCo9Uv/cd6fw5l1FbywsbNgmVJOo0PHQr5XVsxPiN/sO4GfjC0bTykS9tH268dG3rBtgHH1AG07IViMrP+DZum6bFgtbxBgXfYp+3zNYhM/2CY/HgkZpsI1QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdvYTQO71hnJAMRJ1Z1YO3MB347N4z+QQIevq98IAJ8=;
 b=CWCk3tmgFpBZH5Rhcn5USWIrlLN2GpwyynGKV4eeEPyyNYIOwnO9J6n93zo69g/gWZo2gIkHlXf1SvZt0IJlLuvLrQn/QpvFbFCMSV57+P4k/U3t1oxP3Ea5pC49cfFWuYZeVhMJE+BFAywBAQ9+VBOEnMletz9q9FHNINEyiJTERFRUPPauZODvYpEGYQ2DHdSp1QYT5rPnFSHM0J925Vk0qr8YORxqLAh5Gl9x26TI6MrmfhVVfPxSqLv0D+DuFlCNnIadIQy+bK4qz+W4Wb5rI3te/nR0nmti4JAup5ow0BVjJUxWe2+wCkdo6x8ELVn1JRGDelFlQ+nrkS+GTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdvYTQO71hnJAMRJ1Z1YO3MB347N4z+QQIevq98IAJ8=;
 b=mPtbN4jxk1rrFmii/aoXdA90e80MdcSrD9zUoKylgXKDW1/MtC+OE1Y6cw2wLGa5wscPz1KSIi4Y+FTsyAb4jkRwefdR7Cit/6SHB9TpZ86JehMQmX100qHT1FOPEwl5j5Ojq0yBVU55VD5kUbI9t7wSRwDm3dSpvula7xop1B8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8228.jpnprd01.prod.outlook.com
 (2603:1096:604:176::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 15:43:28 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 15:43:28 +0000
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
Thread-Index: AQHaJEbIMKcu/jSjKEOPN5GP9OdxM7CUZzQAgAADWnCAACCjAIAABShQ
Date: Fri, 1 Dec 2023 15:43:27 +0000
Message-ID:
 <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <202312011520103c5f28dc@mail.local>
In-Reply-To: <202312011520103c5f28dc@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8228:EE_
x-ms-office365-filtering-correlation-id: c98d0a74-d14c-4cfa-64ce-08dbf2844336
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZqGMPXc+5ktoC90KANE76rLvhQzXlpoih+WH4Z0dhQSEc9RkXeH2c3pB8D6Uihg9gJsjHqvjC81kkraU6OBWCMAdHQujyKgVQuChurIe0yHOachqG3g/q1qCz6oqjQDhNQscL6kaksX1fZKbahPTeLwuvPKNC+vDQisW76lStbIjEs1XePbRKY/6m39dY3d9eM+td6visNHkSxt/gBajZB3VZIRCJBwe/oPTvZ9uOOzEAixX5peHoz7UMk8U3mpqJSogDqxeAJbRkxiiEZJwV89nUWEYTfbpTigbCRfJOBnVYPBY0LcDisU4NXg4HL5j+H6q8vKc5yOyDKCZstBYXFHwX9sR4SYMtaSP1XST2QYf5k80Pa3EIXO4aXcpC8iyixD/tP8ZUQtrnwAtOeTvBYlWY4K0lMXsU3MDNDLp8cYC1HGNCTJEPZhuU0pJjX24u2bKZ43LBrYY5BpwWJeDnOXu6Lsu5FRIT/P3LrZLp0WXZ/HFViyj5JHShr46fLoU4bL/l4WEDCWaGcLf6lOnGxitPlSg76kQ4I+KRjCf+G5c5Kr3iD2Q26CtjeOevWZRd0mUqu/NJoVly4H0emV9LwVhYQhTh0ibbcLsplDLG3Wo0xMNMYIQgWx5A9MC8mxX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(122000001)(316002)(76116006)(9686003)(86362001)(41300700001)(52536014)(2906002)(38070700009)(5660300002)(38100700002)(6916009)(55016003)(33656002)(83380400001)(26005)(966005)(478600001)(53546011)(6506007)(45080400002)(7696005)(8936002)(8676002)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVlYZXJvL0Z6VFB1S3JmWEdpeGlmR1Q5aTJUVXZVM0V5aE9iNHVibVIxRWdx?=
 =?utf-8?B?d2ZTaTNKRDBDK0VEV0hJQWxCNjY0OTk2NkhiMXMranFyNzFibTYrM0o1SklK?=
 =?utf-8?B?Z0xQeHJuTlozcjZhM3JoT25KQll2OTNiREN1TTRpa1J6cHo3MGY0akowSTA0?=
 =?utf-8?B?MjdLeGxXa1VwK3NHUjFiRnYxeFBUb3FpTXkxWUpKQ0hPVnQvS0RBMG1oTnF2?=
 =?utf-8?B?c2ZBcUd1MEFtVkxmeXB6ZHBUVG5xcjI2NzJWQTZRb1MvNE5PZDM3dGRUamlH?=
 =?utf-8?B?V2tFMTBVclE2MGxMSU1OOTJXdGFMbDlTU1U2dGFRYVd3SSs2ZDRQWFRVTmh6?=
 =?utf-8?B?NjJ6cHJCdGxGNGQ1NTRMRGU2dHZhT2Job3U5bE5vNWVLMGdWRUl5eE1KYlJl?=
 =?utf-8?B?Ym5BUzZBNzV6akNJdUVPbTlpakNSb1RuN2VqWXd1ZXJxSzY5M0tyclQvcWJV?=
 =?utf-8?B?Ym1GcFJjQUN5M1RYeG5UNHNTM1granZqMzN5WXVNL2YvN2wzQWRyb0prY2RZ?=
 =?utf-8?B?dm9KejJiOEdkd1V2TzAyai9PcC93S3hxL0RzUlBQV1VDRkR4d3JmY0FzdU9T?=
 =?utf-8?B?T1pjVGlmbDRadjJrcWNBR2g4akhSaEUrUFRwbG1QTTkxeGp1OWdzOEI5Tkps?=
 =?utf-8?B?YXVyaDJScXUwUlowa0lPdUxmSmpzS09odkhjMlBVUHlwcWcrSW1wVUdFclRL?=
 =?utf-8?B?WVYwZENqeDJ6QTFzYUtoQWdteXdkR3g4YURRWExMNnNXVzF4YXpYQ2Y4U09y?=
 =?utf-8?B?eHNOMnZ3a2dYT1VTS1RoZ3UxOEFReG96MFZKZlZpSk9tekxCL3AzMExLMnp1?=
 =?utf-8?B?L3ZuS05KMG1qTlBEdUErYk1XSHg2ZFU1UzlXa0pYNVVQQVV6eDlmU21lQmdY?=
 =?utf-8?B?RW5XVkplenp0V0NFNWpWY2Yyd2wyUDRPYUJqZTFXY2tTVnExdk8zdjFSd1E5?=
 =?utf-8?B?ZzJWb2JwQ0FFVkVhdXRqcWNxZDZIRFBVakNnWnA1bTVvaHhkQVd6R1EzbzFL?=
 =?utf-8?B?cy9WRlM4Y2lWVGxleWxFdjF4ZjJUZTZBY3ZkYzBOeURDZWVldm9ZMGFvdDlJ?=
 =?utf-8?B?d0VWWExhcXpUQXAxYTlic2xTZTdGYnR4ajlTRHIzbVB4ZHRHZ1FldWVmZy9u?=
 =?utf-8?B?OHNXUjU2QmhXdUFMeDM1RUxjM25pd0p0UlFIeHQ5VGxXK1JSYy81MFlOQWtW?=
 =?utf-8?B?Y0FBeHJhMklFdTdUVHhPME1SZTByMmtHaWhTbktkZ2hDZy9HR2h2TDhRUlI0?=
 =?utf-8?B?OEVVOHMvOVZDM09NL3Q2TVNQbEQzYzUrdjBoOEFCaVJRd09Mak9BOEgvK09K?=
 =?utf-8?B?NkZYb2NXVjY3UnNvejZJc0ZOYUF5UlVvZ3NMSjYxSUZsK3J4QlhKV3JtNHBs?=
 =?utf-8?B?MVM0bHhpL0VPOGVmNUo0QU5Nb0N1V3FocnVuTE5MK0hhNXIvZHlob2NPNGNC?=
 =?utf-8?B?Q0s1dWU0dmRzMWc3dWc0UXUxL2dUYTJKZ2pyeWgxOGNCRWZEeEZMZGdKS0lN?=
 =?utf-8?B?WStBVGZERTJyMmRqcHlib0szamdYTzkvMmpqeU1TTnNOSVBDNUU3QmV2Nk1F?=
 =?utf-8?B?S0xCd0lXaVo2WXFwZ1ZzeFMrZFBhK09KSFg3bXl3Mllrb1A4RTF2NVhYS2Fz?=
 =?utf-8?B?M0M5YkVQYkRkNlNoUS9nYno4c3Z4d3c5bDUyOGdlRXBkTHBFWW5pQ2hhRnds?=
 =?utf-8?B?cCtlS0JHV1oxNmhZK3Y3SEdwRm0zVDUvcDVZU1MvS25VRnZoOW9WUFpkUHp5?=
 =?utf-8?B?aWdSd1N2VkNkekd4c2pqbThlaktmYzg2V3g2R0hHUWRvWVBsWi9jVzJUZzJy?=
 =?utf-8?B?Uk8ybG9aR0MyZlJvNWFXTkVKaTByVWZFa1lKc2UwWm1SYXZmbE9HMFRrVDRP?=
 =?utf-8?B?Y0VVa3c5NjdJVHBwN2hTbmxjTTVra3laU3d2V200QnYrdXQvTXdqQVJSaE1K?=
 =?utf-8?B?NkhxRmcra1FydVBCUUE3S3BmejhhaS9Ba2Y5cDVaazFoekh0bzRDcjFzaGh5?=
 =?utf-8?B?b24rSnBRNjNvY2xGTTV0UThvUE04SnZDQ1ZrZFk3VFd0OXpqamdCY3hsRk9h?=
 =?utf-8?B?M1gxSnZ4UFpPV2tFSm00bXd5MVU5dFBWNDhiRWVhRUZCOW1PR1drRTdidDll?=
 =?utf-8?B?ZWdQRjVteHNXSSszUjRjOE1mem9wVyttbHlJZE5CL0hmNVA1STZOYjNOdHg3?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c98d0a74-d14c-4cfa-64ce-08dbf2844336
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 15:43:28.0025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ckds2XpmLuoWSrf7U+OIPinqKqqPEwvtYzyy0zoymRwPZRZpj1IVKEYVY7SVkxaO/PiQkgE6jUGoNEDAGeq2q4aHj+Mhl38w4Z4bQ0mCIMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8228

SGkgQWxleGFuZHJlIEJlbGxvbmksDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy82XSBydGM6
IGRhOTA2MzogVXNlIGRldl9lcnJfcHJvYmUoKQ0KPiANCj4gT24gMDEvMTIvMjAyMyAxMzozMDow
NSswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBHZWVydCwNCj4gPg0KPiA+IFRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrLg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy82XSBydGM6IGRhOTA2MzogVXNlIGRldl9lcnJfcHJv
YmUoKQ0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gT24gRnJpLCBEZWMgMSwg
MjAyMyBhdCAxMjowOOKAr1BNIEJpanUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gUmVwbGFjZSBkZXZfZXJyKCktPmRldl9lcnJf
cHJvYmUoKSB0byBzaW1waWxmeSBwcm9iZSgpLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ydGMv
cnRjLWRhOTA2My5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1kYTkwNjMuYw0KPiA+
ID4gPiBAQCAtNDg4LDggKzQ4MCw5IEBAIHN0YXRpYyBpbnQgZGE5MDYzX3J0Y19wcm9iZShzdHJ1
Y3QNCj4gPiA+ID4gcGxhdGZvcm1fZGV2aWNlDQo+ID4gPiAqcGRldikNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9UUklHR0VSX0xP
VyB8DQo+ID4gPiBJUlFGX09ORVNIT1QsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJBTEFSTSIsIHJ0Yyk7DQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBpZiAocmV0KQ0KPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJy
KCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBBTEFSTQ0KPiA+ID4gSVJRICVkOiAlZFxu
IiwNCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfYWxhcm0sIHJl
dCk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIHJldCwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIkZhaWxlZCB0byByZXF1ZXN0DQo+ID4gPiA+ICsgQUxBUk0NCj4gPiA+
IElSUSAlZFxuIiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaXJxX2FsYXJtKTsNCj4gPiA+DQo+ID4gPiBUaGlzIGNoYW5nZXMgYmVoYXZpb3I6
IGJlZm9yZSwgdGhpcyB3YXMgbm90IGNvbnNpZGVyZWQgZmF0YWwuDQo+ID4NCj4gPiBBZ3JlZWQu
IE1heWJlIGEgc2VwYXJhdGUgcGF0Y2g/DQo+ID4NCj4gPiBpZiB0aGVyZSBpcyBubyBpcnFoYW5k
bGVyIG9uIHBsYXRmb3JtIHdpdGggSVJRIHBvcHVsYXRlZCBub3RoaW5nIHdpbGwNCj4gPiB3b3Jr
LCBSVEMgd29uJ3Qgd29yayBhcyAicnRjX3VwZGF0ZV9pcnEgIiB1cGRhdGVkIGluIGlycSBoYW5k
bGVyLg0KPiA+IEkgdGhpbmsgaXQgaXMgYSBmYXRhbCBjb25kaXRpb24uDQo+IA0KPiBUaGlzIGlz
IG5vdCB0cnVlLCBhbiBSVEMgY2FuIHdha2UgdXAgYSBzeXN0ZW0gd2l0aG91dCBhbiBJUlEuDQoN
CkFncmVlZCwgSSB3aWxsIHJlc3RvcmUgdGhlIGJlaGF2aW91ciBmb3IgdGhpcyBjYXNlLg0KSXQg
bWF5IG5vdCBiZSBmYXRhbC4gQnV0IGJhc2ljICJod2Nsb2NrIC1yIiBmcm9tIHVzZXJzcGFjZSB3
b24ndA0Kd29yayBhcyAiIFJUQ19GRUFUVVJFX1VQREFURV9JTlRFUlJVUFQiIHNldCBhbmQgdGhl
cmUgaXMgbm8gaXJxaGFuZGxlci4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUNCj4gPg0KPiA+ID4NCj4gPiA+ID4N
Cj4gPiA+ID4gICAgICAgICAgICAgICAgIHJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEoJnBkZXYt
PmRldiwgaXJxX2FsYXJtKTsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4g
Pg0KPiA+ID4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0aGUgYWJvdmUgZml4ZWQvY2xhcmlmaWVk
Og0KPiA+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+DQo+ID4gPg0KPiA+ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+ID4gPg0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLQ0K
PiA+ID4gZ2VlcnRAbGludXgtIG02OGsub3JnDQo+ID4gPg0KPiA+ID4gSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYQ0KPiBoYWNr
ZXIuDQo+ID4gPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvcg0KPiA+ID4gc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCj4gDQo+IC0tDQo+
IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluIEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwNCj4gZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9qcG4wMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYm9vdGxpbi4NCj4gY29t
JTJGJmRhdGE9MDUlN0MwMSU3Q2JpanUuZGFzLmp6JTQwYnAucmVuZXNhcy5jb20lN0NiNjk5ZjQ4
NjU2ZDM0YTkyM2E2NDANCj4gOGRiZjI4MTA0YWYlN0M1M2Q4MjU3MWRhMTk0N2U0OWNiNDYyNWEx
NjZhNGEyYSU3QzAlN0MwJTdDNjM4MzcwNDA4MTc2MDQ0MzENCj4gNSU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWgN
Cj4gYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1FOXREaTA4c0JSb2g0
dEJjY1FCJTJCOGF6JTJCcVE0JTINCj4gRnRRT3BGamRQZ1U4elFYYyUzRCZyZXNlcnZlZD0wDQo=

