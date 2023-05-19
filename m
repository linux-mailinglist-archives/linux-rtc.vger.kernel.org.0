Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29706709C07
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 18:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjESQIo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 May 2023 12:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjESQIn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 12:08:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DAAC2;
        Fri, 19 May 2023 09:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwS8Ht4CWZ39n78itaSxgmsiOVRNywt/w8BWqngjuu9N2MbD/y09kLlMplnqnPUB5z33nR5r9+oFBP0iXR2HiLvlGpG0xwW4MlUiPAYFGuiTvv73nspfpHiG2N+kUkQrsT12Y+e8UWNYMiXxZe+j9x1YC377HYTubLA9jySQiPWjX3LAV/fANmqAwh/PZECwdPV+E9r1qbcldwZqZOwaxqoQE+vIwuzjS2OeuNf/OSEoPOefMRuD18DTs6ja9IsAioV7oL+XuILB2KLv/x3qMR/IrXpIf0hiBbsHIQ4AzSDT2rAa2vNVVBlxO/itRAHL2U/i5blKN6nIE9MjsoPICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPsiXQm9dq7xRZLqoilV/f9/LjJNbwP7tToCp1UpGoc=;
 b=jYlxcCEuUPg+cvD6YbBnQd3VyaI++WN+vsv0POgeBrEK7YD872sdByKXmN1+TkvoFiMqhCKDISorJgWVOObkFYlOrfHLoAt8T/fLFbnwktE9oOKhfLp7tnUs90ZLPWcvDToc8xrr7Nhnk54ObeHmJYs+F/DXrTBcXEnteQHiW+pJ+cVJKfTXla32tS/sYrWlgbZPDRKwhnquzrR3EuQcbpKlaSRupi2qj22f/Pf9JvA1/r+RJZMlQOnffSf3BlnIQ2rS/N9acOTYL78Od1bb8mcofDk2P2NDJJ9AyNTvXWy+HEzNh/DKT2Z5RVrnU+k6OeTUfNuvb/p5fsgbmNeVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPsiXQm9dq7xRZLqoilV/f9/LjJNbwP7tToCp1UpGoc=;
 b=SJKW9nSXxJrVy0cy0WvwypTiwEitFqnIA25Z07knLBLqfaFywE5aUCVoondUjHubcPDkASfkVUEhd5Xf/OkgWGE5xU9w7KKrJltVw798mbaI4pPuf0s+4ooiK16crH40PeOtM1fBbs3GN4aKZcZofO6Yo7s5Ld2awM8GpeQuVsA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 16:08:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:08:38 +0000
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
Thread-Index: AQHZiX0Y/g2rupGPLkWYfWCeLVhlIq9hiqwAgAA45eA=
Date:   Fri, 19 May 2023 16:08:38 +0000
Message-ID: <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXaJtZVxp5faw=vovsdukdwiXH8RbaJfiKAoOKTLWrZzA@mail.gmail.com>
In-Reply-To: <CAMuHMdXaJtZVxp5faw=vovsdukdwiXH8RbaJfiKAoOKTLWrZzA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11431:EE_
x-ms-office365-filtering-correlation-id: 8601eefe-15da-4b2c-9817-08db58834eb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CA21vsMMuA58DIzto2oVBYwZ+Ao49j0XTD19oXJGwjIXkzSBFlGwUfiNSyq738WpAtg3I3IjjD+P1X5Uyb3tia6OfitJfSgyK1tQjnbOqu3x348CtFUmAaMtQWKrvEBuf8gVxdEPK/+Y0IqNsGDio95aB6NKBCXuDzILhkrfKK0lu2o3SrLN4Ctss/LmJ+OS2d5G3xHqay2bKyqFt/8cu4TYcd2UD0CTyTzahevTrBWQRzjxnqlh/JEZDuZdSmpHdEByxIUhysDzV08NQfV5mHJKUVar7egjIN7j/LdeKli814/RrAG9I95+XlgyTlXsAknWG8WXYlpUy8SPCV4KY/ZMNkajvqXDHMov7bgPVKOw+edk35H6CE3qfriNoT05govgFHCuJu+Y3i0VrdezqBS0N7tza5+hM2rxOBjGzjx3j1lrRyiAi541Rm2y9paX6npPRZHIRatuPfna7J/z8S2slIFX4mGsVDdnDK35+ga5YWY3eyAQQJimbSnvI8ffWVJEYwUFoYOPUZHpdL7E0HoM0fRPnyb4iUE8WTnNMXL4feT+tkvp+AsAsCrfRo8qdAG+rKU4Oy1sPLA0eb3bkrF3VCiYMUu2IGicKPtdAw5opQQu/KPaaS+fN55xOyx7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(33656002)(55016003)(53546011)(8936002)(26005)(8676002)(9686003)(5660300002)(6506007)(186003)(52536014)(316002)(54906003)(66446008)(66556008)(76116006)(66946007)(6916009)(41300700001)(66476007)(64756008)(478600001)(7696005)(4326008)(71200400001)(38100700002)(122000001)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZThNWjBRcGowU204SXExQis3YWFjM0E3RnY1M3pNU1VXUEdmQ0FEWVB4ZEhB?=
 =?utf-8?B?T2RkK2lGdGdlcUJDWnh2V0UzS0t3Y3MvbkZlNG5qaHJNY0l2eEYzcmc3dFh6?=
 =?utf-8?B?MDQ4b0hWU0Q3bWRXaE9BVkIzeEVBeGV1enR1OTJ5SHZnYmx6Z1BkMGltZVlF?=
 =?utf-8?B?N08zS3hPczBRa1ZUSTRoMStzeU5vRHhLNmlMMk5CWHVDdkx1OExnZnVDVmh6?=
 =?utf-8?B?OTdITGJLRm03QmpDU3JTQlZBMmIxUCtpYm1sWHNOSFhXc1RRZWlhVTZYdW5C?=
 =?utf-8?B?KzlIL1BKdUw1czZPV0JTNnB6YnNJMjQwZnJrNS9TSUpkUmlzd3NKM3Y3dTNO?=
 =?utf-8?B?ZkxNNWd2VGpiVHp5d0R3ZVRWSW1DTWsvaE4zMEtVYXAxdUc3WmcxT29DSTUw?=
 =?utf-8?B?b1UvbThuZVR5VmFadG56NDl0K3ZqNmdFM25IWU84enJOcmVEMVVmWUtTWmpW?=
 =?utf-8?B?K0dDRDJMQUZGTVFERXdyOFM3Z3FEZTcraGZ4WDRPekxTY3VwRkt5dzVZaVlh?=
 =?utf-8?B?NXpXZ2VVckx3RFNYanduVnRWZTZUSE9OaDc2d09kQ3ZzMEhWTjVMWklQdDFF?=
 =?utf-8?B?TlluQU1xRnZoLzRJN0ozZmo2Rm5XZGNKUnZ1RDBBcVRWWnNhOVUweU9qRXJR?=
 =?utf-8?B?L1JJc0NaeUUzeldxdmJ1WFEvcitxdUdTdHhUUklyUVBmWDc3Y0h0THdCK0s4?=
 =?utf-8?B?WUU3UlFCbGQyZlUwSE12d3ByTUdDL2lMR0dQWVZGOGNKeks4OTdpM3BJMWl5?=
 =?utf-8?B?TmF6ZE84NTg0cTlDMjh6ODVIQjdiZlpsd3hsNnR0dG9GZDRmWldTOENleDZ5?=
 =?utf-8?B?a0djUEtvMk5jaFhVa1RoelA1ck9LZUFOLzRiT2hnenVxckRSeGdGS2RwZFFp?=
 =?utf-8?B?OWdTWVkyRXNYay9TQUtFdVR6RWlQWWV4d1JGZWNZVlZsRGVHdm0ydmpiNnky?=
 =?utf-8?B?VmRvV1prVStmbmF4ZVJyaS9xNUpSbDNZQkRwM2kzeGZvTkM1WDlmcnRqYnhB?=
 =?utf-8?B?NXBhZUZUVTJaaFRjcmxRMGt3UXlhY1hFcmM2dzdMdEd0VlA1aVFCZFJUMjhH?=
 =?utf-8?B?YVBLckNmWEFITVhxa3V4MHU3MUh4VnhaMm9SVG1DTGJHUDN4c2JkR0o4VjAy?=
 =?utf-8?B?cElPV0JMMnNNK2I5KzBvU3hPVUtiTlhSTkdVcFJqQ3ZRZ3N0UEtxN3YrdU0w?=
 =?utf-8?B?Ky9nQVFjTWFqTFZIK2tvMUV0M3ovY2NkN1V6SzFlV05KeENLODVBVUtKTSty?=
 =?utf-8?B?bVRJQTgyR0ZjN0FGOGNpaUdQMzdYcVFuWisySGVkOFFCeEdPZ2hjQXg3dGVE?=
 =?utf-8?B?VWxPSXdORzJ2TUp4MlVNNlR1NUs4dlZxUDZ0TWp2dVhPYmJ6WWhkeWJrMzJt?=
 =?utf-8?B?VHU2aHJzS2FWZzE2RW92OWxEN2dNbHRmNCs1dmtXbHJlcDB4MjR2T3ltNjhI?=
 =?utf-8?B?dlhlR1I5MWphUXhEcDFmSHVQNU50M1VnWnlKdS9FOERBVVUxRmM3K0N6QWFw?=
 =?utf-8?B?Y21haUhiZ2U3cEdhUHFjTTNGZXBJWG9qQTVyV3I4ZytjSitIbm0rN1NSRXpS?=
 =?utf-8?B?eUxHbVRnRHIxL3ZyUkdFbWVBTnBtdmZ2VFZ0dmxUV2MrNUF1TmlyNnYrV2ZU?=
 =?utf-8?B?ajFGcDU2Mis4Smk3VzNoZGVRT1ZNYnNyUnE0aTBOYW9Db1l1VDhZNDljR1NQ?=
 =?utf-8?B?QVJwa3c5bVBSOEZsc3BmUWF5N1p2WVhCeEtDbHZoZVo4S2QrR3AvS204NzE5?=
 =?utf-8?B?bFFub1N5Q2pnaGtjVHpJZVZhenV4b1ZJcHgzdW1ZWXlCWkh0Y2FlL1BkNzNH?=
 =?utf-8?B?Z1ZWaXA4eU1BQjlHaUlyRm1RU09DdlNhdDZhVjhvR1Nqamp5dmd6RGg4UWcz?=
 =?utf-8?B?NFd3YTB0OFFUTVBMZUdlYjBDekk2TW1IOWQ1dC92RW83aFVVMTNyakU0Qlgw?=
 =?utf-8?B?aVhiNlFyVEw5aHZqamVYMjhOdlEzZGMzWGUxVWx4WkNWblhCUU5LV2JLTitY?=
 =?utf-8?B?L3pHVmI2czI4QnRzZWtWa3pwMTBrbTFZbGJKQm5sUS93UTY2NHRlVkdBS1JH?=
 =?utf-8?B?dFRxY0U5ODFJZUEwSExsTFNLQS9ZV2FsMkVOb0NHcnNHU2RqNm9pM3ZxTWlh?=
 =?utf-8?Q?CZWuhAICsPdQs/qjajibK8AQp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8601eefe-15da-4b2c-9817-08db58834eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:08:38.7250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiYBvN1MHflK0078NgDdy5fWohVihKJGZVpcdDhFQw/Ny1gc//uJiKo/l49zYb2fyLgBi3HxOb+jz2RIaP8GUbqEOqkNqNOuwogPPi8Qn8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDE5LCAyMDIzIDE6MzkgUE0NCj4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8g
PGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8N
Cj4gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2Fz
LQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDUvMTFd
IHJ0YzogaXNsMTIwODogTWFrZSBzaW1pbGFyIEkyQyBhbmQgRFQtDQo+IGJhc2VkIG1hdGNoaW5n
IHRhYmxlDQo+IA0KPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAxOjM34oCvUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgaXNsMTIwOF9p
ZFtdLmRyaXZlcl9kYXRhIGNvdWxkIHN0b3JlIGEgcG9pbnRlciB0byB0aGUgY29uZmlnLCBsaWtl
DQo+ID4gZm9yIERULWJhc2VkIG1hdGNoaW5nLCBtYWtpbmcgSTJDIGFuZCBEVC1iYXNlZCBtYXRj
aGluZyBtb3JlIHNpbWlsYXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjQ6DQo+ID4gICogTmV3IHBh
dGNoLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IA0KPiA+IEBAIC04MjIsOSArODIyLDkgQEAgaXNsMTIwOF9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAgICAgICAgfSBlbHNlIHsNCj4gPiAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkID0NCj4gPiBpMmNfbWF0
Y2hfaWQoaXNsMTIwOF9pZCwgY2xpZW50KTsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICBpZiAo
aWQtPmRyaXZlcl9kYXRhID49IElTTF9MQVNUX0lEKQ0KPiA+ICsgICAgICAgICAgICAgICBpZiAo
IWlkKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+IC0g
ICAgICAgICAgICAgICBpc2wxMjA4LT5jb25maWcgPSAmaXNsMTIwOF9jb25maWdzW2lkLT5kcml2
ZXJfZGF0YV07DQo+ID4gKyAgICAgICAgICAgICAgIGlzbDEyMDgtPmNvbmZpZyA9IChzdHJ1Y3Qg
aXNsMTIwOF9jb25maWcNCj4gPiArICopaWQtPmRyaXZlcl9kYXRhOw0KPiANCj4gSXQncyBhIHBp
dHkgdGhlcmUncyBubyBpMmNfZ2V0X21hdGNoX2RhdGEoKSB5ZXQuLi4NCg0KWW91IG1lYW4sIGlu
dHJvZHVjZSBbMV0gYW5kIG9wdGltaXplID8/DQoNCglpZiAoY2xpZW50LT5kZXYub2Zfbm9kZSkN
CgkJaXNsMTIwOC0+Y29uZmlnID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZjbGllbnQtPmRl
dik7DQoJZWxzZQ0KCQlpc2wxMjA4LT5jb25maWcgPSBpMmNfZ2V0X21hdGNoX2RhdGEoaXNsMTIw
OF9pZCwgY2xpZW50KTsNCg0KCWlmICghaXNsMTIwOC0+Y29uZmlnKQ0KCQlyZXR1cm4gLUVOT0RF
VjsNCg0KWzFdDQpjb25zdCB2b2lkICogaTJjX2dldF9tYXRjaF9kYXRhKGNvbnN0IHN0cnVjdCBp
MmNfZGV2aWNlX2lkICppZCwgY29uc3Qgc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCnsNCglp
ZiAoIShpZCAmJiBjbGllbnQpKQ0KCQlyZXR1cm4gTlVMTDsNCg0KCXdoaWxlIChpZC0+bmFtZVsw
XSkgew0KCQlpZiAoc3RyY21wKGNsaWVudC0+bmFtZSwgaWQtPm5hbWUpID09IDApDQoJCQlyZXR1
cm4gaWQtPmRyaXZlcl9kYXRhOw0KCQlpZCsrOw0KCX0NCglyZXR1cm4gTlVMTDsNCn0NCkVYUE9S
VF9TWU1CT0woaTJjX2dldF9tYXRjaF9kYXRhKTsNCg0KQ2hlZXJzLA0KQmlqdQ0K
