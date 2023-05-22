Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47FC70B579
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 08:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjEVGxg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 02:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbjEVGwx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 02:52:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5886626AB;
        Sun, 21 May 2023 23:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezquRbE0udKdpC/HxF5ZzGNVSfykygcGBB3SfZ+cLSrpK2WAip9OE67ltc/mibH8m+1nDrcw6kdo8z9rMjN3DR8eaQjWVl5KnLguUhoISUEtrxY0jE7qxhwIFJKNL6KarRgqCXbBaopC8UWswgUbLcaNI8apEjxXvGl2PxMQMZx5owKU9y8K8fCynHYzgxNDAih57S3fuOAD3wcZIQYvol679Pwn5kHZ0cGQtybTQAC6N89PoIDOimfYa7fJlXZaX+pQjLJjoTbnZvJODj7WarX16iuy+tKsF/XumfdbV3fXDYn23X+ZNqmZl48rGAD3EMwmeIdaSMLdA1IwcOdHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fP9LV2vbryoMRl33nlMQcy8WE8+a95+705/oD+gdzk=;
 b=RvYng1P2ZAPNs6sbKXMQ570cNT9m8Lmh/5WWOQalRNGkho1rNEEVDjrMYiUc1fYqOyMw2k7zJJ5ZlyR1M/WRcWw453TDKLk3p+7l7GpMaflIrTDtHEzTSwlb/2mCexwdSJ6a0xOmYeY/nsT5kUpVjJ5krFwjC0eIfcU8z3jzTwqudLH83UIsHNT9suPmTdCQQpRvWm9nBeGGIb4orCDzpiTnuntuHSRagN1D6R+Qttx2+X4VOFHOjrwrLL0l8K/7tTXJi6TCb7+WaKpf96asW9FxE8USc3/WvPuisKIZGUHRM2AadbyGgPj0/zbaA5mFk1maDtVzZGRhgmwaCV38JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fP9LV2vbryoMRl33nlMQcy8WE8+a95+705/oD+gdzk=;
 b=loqFhxitSL1TwzarBSxnaZN+QnULdVyzf6HAJMsypVenBXPnM5fjFboTn9V80bLJqBq2XEo6Xv1rx9cCyUqVUf9cHYKQguh6h+3ezbWnCBeep8yHs9DlSWeKQ1yGt62nEWfrZCkZ9sJMFEmEfhflPecz5xojAoXfXPwcpw0rkbM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10521.jpnprd01.prod.outlook.com (2603:1096:400:29e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 06:49:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 06:48:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-based
 matching table
Thread-Topic: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-based
 matching table
Thread-Index: AQHZiX0Y/g2rupGPLkWYfWCeLVhlIq9hiqwAgAA45eCAAD23gIAD3bhA
Date:   Mon, 22 May 2023 06:48:59 +0000
Message-ID: <OS0PR01MB5922C11C9FC61272513FDF2986439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXaJtZVxp5faw=vovsdukdwiXH8RbaJfiKAoOKTLWrZzA@mail.gmail.com>
 <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWnvceN5+9D+7HK5h4Guxtu12HwkUUy8rns_RW-pGhvYw@mail.gmail.com>
In-Reply-To: <CAMuHMdWnvceN5+9D+7HK5h4Guxtu12HwkUUy8rns_RW-pGhvYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10521:EE_
x-ms-office365-filtering-correlation-id: 7eca1cc9-7d2f-421a-af55-08db5a909f5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s91RQOeclXBN7TIj/taUPwMeWaQ9NGbWmuTf1O4Yint9IPvRA8evI14DB0xHfQM1BYkO5wER08saKaqNWw/1OQry0uQZicMeHjCFCXSlvf93b/iugJdyytubAr3kuY3pG749CR06SCcIt1num2Y3kjJ3A8SEGbxEUGtxzrdOkTQoaxC4GT0E2kAfvWZ4GWWoCbT7U3FTZKbq5a3/QKOHzH/ZQiE77JO2HyCqA0IoAOLCRtAUWagbZt5qOUyRywdXq2rXYLBqkP7OBzUkjiiOea/K3E/1yRzNLKZsHDsg9t+QvcD/oceVjFb+RwGD8WkS5Tp+zKJ7EC9d/WShEnDLXCwCQtG9yuakhdpkT7St71LkGdCYK1iR+0y1I4aEMKYW6rtf4Z8sUd8QGn4ro6iFhZwUoHc4eJOphyLvnXzQWlyO0AIOjpJIw/QQWPwdPPefNwZ6IiwlhYCi2jOsVMo/pK/o7qAbeaBMgbVhnIlWgHdjLTWdcBtzdtd+3ChF8NUUvj9ivo8O5E+SMFBQxfWm+V84Y7sytPYzWlEOOXVtJRcIU0STSpvZ1ZS8qBW+Nn3RWAZzmNnXnxE16aom6A2FfpqgSYk55bGcvL4a8b903qC7OwUe67ypvsz0uQi2MHrr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(8676002)(8936002)(52536014)(5660300002)(83380400001)(9686003)(53546011)(186003)(6506007)(26005)(86362001)(122000001)(38100700002)(38070700005)(41300700001)(55016003)(71200400001)(7696005)(478600001)(33656002)(4326008)(6916009)(64756008)(66446008)(76116006)(66946007)(66556008)(66476007)(316002)(54906003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alpsa2dDZUp0Z0FhUjAwTGJzalAwUHk0d3N4d0wvdm11NzM5R0kyb0l2bTdz?=
 =?utf-8?B?VG1PY2F1MWZlRlVjMXpCRFlXMkVWbytzQzBhckI5YlJ1ZjhDZ0ZpMWV0RTBu?=
 =?utf-8?B?YjE1YVgyWUgrMnBGQTIzNzFnM2t0aHVmWHZCakk4Mzh2cGd3aWFpR3Z2MFdh?=
 =?utf-8?B?T2xWVUN3ZytIdFZQQkU1UjdSeGFMTFU5Z1J1UzhUSmFPRUltVVRxL0gyOG40?=
 =?utf-8?B?TEE4dWx4LzlZcmpmbmFFMXRNMTFJSXFvQ3RtdDBhaU1GRWt4MCtqNEFua1RB?=
 =?utf-8?B?QlR0SFpWOTltaDYzUUw1dG1XRm1rT28xMFV2SVRybmNsTTZRa2hVWUlDMk9p?=
 =?utf-8?B?YVFYSWhZM2xTZ0VXSGtUVlRicEM1YmFiNEJBQnFIanpuRm5jKzZCSUlMcmZO?=
 =?utf-8?B?Y1kxdkI4MStMMWowY0ZjU2loaHdOVWg4TTFkNTBTYjlpYVNJVjFNWUtzeWdK?=
 =?utf-8?B?WXhJNFZpblpmTUh3TWtWQ1BCL0hZN21xc3pMTmY0TUdLYUwvam1wSjdZRGFK?=
 =?utf-8?B?M2NveGlSRTF5NkRaQ28zUzBrOUFVMUFkRVJWdjJ2MHBxVnprVWpPSm1OYXkx?=
 =?utf-8?B?cEJYMHhReWdYYnl2a2pBbFdKSWN2cDAwelNzb2ZzS3FXUUxNVWlOZXU1Q3R1?=
 =?utf-8?B?MThFdEhUU054bzl6b1JXZGFQa2pFQjBHSDBsNXl2S05WWXdHeWNKTVY0TUhw?=
 =?utf-8?B?SlNySWhRTEY3SzlDQ20wZitsKzdGSElRR0JZVkVhcXpLVVFPbjVVa05ENEFx?=
 =?utf-8?B?TGx3SjhRU3FYM3ppZEdaS0lRTHVjWkxBYjNsY2tRUTZ5VVhaTDI4U2hjRzdU?=
 =?utf-8?B?UWd1UkRZSExIbXh2ZFlPaGp6aG1VLzA0RHE5V3hYYURDR0FwRTR6eE1hSCtl?=
 =?utf-8?B?azZhdzNmQVA4MnBoUFB3bjdaVXlEcnZDbThOKzdEUVhicDlaVUJwb3ZkUSti?=
 =?utf-8?B?SHBYazdkazJZUEdFVjB3MlZ2YTBGZitmTVFyQ3piM3FEbEdUVVdRZVdlUUlR?=
 =?utf-8?B?TkNwamVOeXRtOXRwVk9xcWpwV0ViNStPWmNncTF0RHJ4SkNGbFZ0UVcwdFlJ?=
 =?utf-8?B?UVZTL0drQ3hrci95QVdaNEhmSVhBd2xpdnlmTkhqTUFCa00vZzBIalpwMERT?=
 =?utf-8?B?Q1A4N0hHdHhrVUhJN0FuUXV4M1Jxdlg4R0YvMGo2OVRvOW5ES0FnK0FUS0Vh?=
 =?utf-8?B?bmpFZ080bTloNFRZa3ZFTWZjV2pUWG14MzAycHNwcGJhNGRReGZlc084NGpC?=
 =?utf-8?B?QWd0Y2lrbUd2QnF5MmlOZGNMNXhQd0lPdFpVU0FuZmdKU2wvR0g4SnBtdEQ3?=
 =?utf-8?B?Y3B1VnB3TFU4ditMU3A4aWl5NTd0Q0pPOTFZRVZtR3llSTdHQ0N4Rkw5QmRL?=
 =?utf-8?B?dXBCUWUzcU9LengxNENvUnR0NHBvQWFtL0Qvams0TjdPV2k4RDdsTkdjWTFU?=
 =?utf-8?B?MG16b1IwNDFuQldQSFBVb1VIRWJqTFhnNEZFdTEvdmtjQytEU3ZhZFZmcnNs?=
 =?utf-8?B?U05VRCtwQ2RtbXVSWE9CUU45bEhRdkk0NWRqY2RBZjBDV2xyQlJ6TGwyZTVY?=
 =?utf-8?B?cEpUWlJJczdLNXhtVE9NVU9SM0w3RU54bFBrM3MvOGhFdFdaUytvZ2grWTJZ?=
 =?utf-8?B?cVRIOUxuUnpiR1lyVXR0bnk2bkxKWDd3Mm54blpNT21Sd0hPdEhwNlAvOEdJ?=
 =?utf-8?B?dU15aWZLZlBxZFA0TmhYSzNHY3YzQ3huSHVGNTFiL0dIMWxQTkUxTUp3Vklu?=
 =?utf-8?B?ckJuK0tkenVOa1ZQZ1NybjliSXBIamd2TDBqcEpHZUkvZkhwVm9VQnhtcHlV?=
 =?utf-8?B?ckJRTXNFU3kzN0RQRlZGU2V1Q1RFa2tIYVhwVkR0Tmgyb0JGK1hNdHNBam1n?=
 =?utf-8?B?cWl3NTExSG9sMlpmeXZZcXpmNDdHbEVpNklreDhpT01NT1R1eFc3MkF6Rk80?=
 =?utf-8?B?TGwybEtzZk9XdDRhdnVIZnliYi91ZjN6a2dNWld4RTQ0c0JnTDM3SHo0SThM?=
 =?utf-8?B?NDhndERDTUlIeFpmSmo0Qm4xazRZNjE4NFZwUVNRcnBzNXVJS1dVVm9ZUFli?=
 =?utf-8?B?TVlVQnlJMkhvY3J3WTVRUGx6am9CalV3YnU0cjVidUlsTDNiMXJ5Mm14UEdn?=
 =?utf-8?Q?cvBKzpq0iHBscczsqs/zhmzzs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eca1cc9-7d2f-421a-af55-08db5a909f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 06:48:59.8184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyB3aIxj3SRKQAO3I7NlSBRO9Mouow5owM/LvDocWJoB4mMZXOsk7a8BpN9XsyPrd8ZQKn1Csn8YLXXjPvLlRpT8VKHR2XBIkFEIAx0EWkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10521
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDE5LCAyMDIzIDg6NDMgUE0NCj4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8g
PGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8N
Cj4gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2Fz
LQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDUvMTFd
IHJ0YzogaXNsMTIwODogTWFrZSBzaW1pbGFyIEkyQyBhbmQgRFQtDQo+IGJhc2VkIG1hdGNoaW5n
IHRhYmxlDQo+IA0KPiBIaSBCaWp1Lg0KPiANCj4gT24gRnJpLCBNYXkgMTksIDIwMjMgYXQgNjow
OOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+IFNlbnQ6IEZyaWRheSwgTWF5IDE5
LCAyMDIzIDE6MzkgUE0NCj4gPiA+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiBDYzogQWxlc3NhbmRybyBadW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+
OyBBbGV4YW5kcmUgQmVsbG9uaQ0KPiA+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
PjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8NCj4gPiA+IENhc3RybyA8ZmFi
cml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgbGludXgtcmVuZXNhcy0NCj4gPiA+IHNvY0B2
Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDUvMTFdIHJ0Yzog
aXNsMTIwODogTWFrZSBzaW1pbGFyIEkyQyBhbmQgRFQtDQo+ID4gPiBiYXNlZCBtYXRjaGluZyB0
YWJsZQ0KPiA+ID4NCj4gPiA+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDE6MzfigK9QTSBCaWp1
IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+
ID4gPiA+IFRoZSBpc2wxMjA4X2lkW10uZHJpdmVyX2RhdGEgY291bGQgc3RvcmUgYSBwb2ludGVy
IHRvIHRoZSBjb25maWcsDQo+ID4gPiA+IGxpa2UgZm9yIERULWJhc2VkIG1hdGNoaW5nLCBtYWtp
bmcgSTJDIGFuZCBEVC1iYXNlZCBtYXRjaGluZyBtb3JlDQo+IHNpbWlsYXIuDQo+ID4gPiA+DQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IHY0Og0KPiA+ID4gPiAgKiBOZXcgcGF0Y2guDQo+ID4g
Pg0KPiA+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+DQo+ID4gPg0KPiA+ID4gPiBAQCAtODIyLDkgKzgyMiw5IEBAIGlzbDEyMDhfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiA+ID4gICAgICAgICB9IGVsc2Ugew0K
PiA+ID4gPiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkID0N
Cj4gPiA+ID4gaTJjX21hdGNoX2lkKGlzbDEyMDhfaWQsIGNsaWVudCk7DQo+ID4gPiA+DQo+ID4g
PiA+IC0gICAgICAgICAgICAgICBpZiAoaWQtPmRyaXZlcl9kYXRhID49IElTTF9MQVNUX0lEKQ0K
PiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKCFpZCkNCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gPiA+IC0gICAgICAgICAgICAgICBpc2wxMjA4
LT5jb25maWcgPSAmaXNsMTIwOF9jb25maWdzW2lkLQ0KPiA+ZHJpdmVyX2RhdGFdOw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgaXNsMTIwOC0+Y29uZmlnID0gKHN0cnVjdCBpc2wxMjA4X2NvbmZp
Zw0KPiA+ID4gPiArICopaWQtPmRyaXZlcl9kYXRhOw0KPiA+ID4NCj4gPiA+IEl0J3MgYSBwaXR5
IHRoZXJlJ3Mgbm8gaTJjX2dldF9tYXRjaF9kYXRhKCkgeWV0Li4uDQo+ID4NCj4gPiBZb3UgbWVh
biwgaW50cm9kdWNlIFsxXSBhbmQgb3B0aW1pemUgPz8NCj4gPg0KPiA+ICAgICAgICAgaWYgKGNs
aWVudC0+ZGV2Lm9mX25vZGUpDQo+ID4gICAgICAgICAgICAgICAgIGlzbDEyMDgtPmNvbmZpZyA9
IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LQ0KPiA+ZGV2KTsNCj4gPiAgICAgICAg
IGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgaXNsMTIwOC0+Y29uZmlnID0gaTJjX2dldF9tYXRj
aF9kYXRhKGlzbDEyMDhfaWQsDQo+ID4gY2xpZW50KTsNCj4gPg0KPiA+ICAgICAgICAgaWYgKCFp
c2wxMjA4LT5jb25maWcpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiAN
Cj4gRXhhY3RseS4gIE1pZ2h0IGJlIGJldHRlciB0byBkbyB0aGF0IGxhdGVyLCB0byBhdm9pZCBz
dGFsbGluZyB0aGlzDQo+IHNlcmllcy4NCg0KT0ssIHdpbGwgZG8gaXQgbGF0ZXIuDQoNCj4gDQo+
ID4NCj4gPiBbMV0NCj4gPiBjb25zdCB2b2lkICogaTJjX2dldF9tYXRjaF9kYXRhKGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICppZCwgY29uc3QNCj4gPiBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50KSB7DQo+ID4gICAgICAgICBpZiAoIShpZCAmJiBjbGllbnQpKQ0KPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsNCj4gPg0KPiA+ICAgICAgICAgd2hpbGUgKGlkLT5uYW1lWzBdKSB7
DQo+ID4gICAgICAgICAgICAgICAgIGlmIChzdHJjbXAoY2xpZW50LT5uYW1lLCBpZC0+bmFtZSkg
PT0gMCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gaWQtPmRyaXZlcl9kYXRh
Ow0KPiA+ICAgICAgICAgICAgICAgICBpZCsrOw0KPiA+ICAgICAgICAgfQ0KPiA+ICAgICAgICAg
cmV0dXJuIE5VTEw7DQo+IA0KPiBQbGVhc2UgcmV1c2UgdGhlIGV4aXN0aW5nIGkyY19tYXRjaF9p
ZCgpLCBqdXN0IGxpa2UNCj4gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgcmV1c2VzIG9mX21h
dGNoX2RldmljZSgpLg0KDQpPSywgV2lsbCBzZW5kIHRoaXMgYXMgc3RhbmRhbG9uZSBwYXRjaCwg
YXMgaXQgaXMgZW5oYW5jZW1lbnQuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiB9DQo+ID4g
RVhQT1JUX1NZTUJPTChpMmNfZ2V0X21hdGNoX2RhdGEpOw0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+
IEJpanUNCj4gDQo+IA0KPiANCj4gLS0NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4g
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=
