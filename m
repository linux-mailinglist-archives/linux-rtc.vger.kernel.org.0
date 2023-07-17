Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C6C755D76
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jul 2023 09:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjGQHvN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Jul 2023 03:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjGQHvN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jul 2023 03:51:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56500DE;
        Mon, 17 Jul 2023 00:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R20WzGs6HNYPC97TVB1Plo/GWU1F2Ngzdl3MTFUGQ0qyzSekR5eRcGQ/cSfc7ziCUc8ATWTKos4WLyMVIkvK4yeulz8P/0lvhAFFQ4hkPjxKdZz5iKuFIiFP5SjFLEW9jXGMSFn3xZUQyB9XViYfVknoK6hkD8Yg7dpxJQDVqBWmWAyfQWzVk0R+lM9nKQhGiSBqMTVcR9a0CMbxDkEDbiQlewOYPuuqh3sjiMUvH9HNDES5c54jIwUAPhtgRo/A5SXy1t+z7lHHUNm8W54mZPs+sV2+Ow3Fu1yhksOOjA8tSU9+ZxsrNd6/3phSg/c4xUtp3Ku5vQUxgEnKdbe47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9GrK7RPFyzprR/HYfszrpSt3SJG02lwv3FSLYtCtuM=;
 b=bpKXlkDpTo2VUFBsPvyBZHWYVDWVi6YgUKmv9NgXrQNKbNuv1s20RSvBHEWatHrIVpUzRisQPlTQ3YDnUaAKs70/MdMzRmjYXOO2SSfiAjL51NcfzGnpbjaYhgJLnOMP7LFdpa8F0kZLEvldDsoFnovCcOGgtsaZL1A8I+DVh9R0dTTYIJY9beByKcQoYuxjVJUCKUjEURptqEapUGwreVGoR/JUw4CYmVkdKlE9x0ufH/p6QTSjYx9WdH9gPCmUs6BvHEdvfpY1u/BHtRlxNUglssYhdo890SkicuQ3ilHovJmU502H2Zx2RVFHV0kFSFj/CQAZuxfwosxuTYiGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9GrK7RPFyzprR/HYfszrpSt3SJG02lwv3FSLYtCtuM=;
 b=gzPfzMewJKXl3c/IzN7tWFxxkzscY01boQ2UIeNxvATjEAPNga8Lwk/wQuelrPwl6pGwU3oohxO+3O2TDq4XNDob3QkOTzxnE9kPYn7m63gWUPyvv6ShPhzg6btSMGjGmDqQ0gCyM8qdQj/51cdVNOfrh8KjnD17dkfHmY1s1KE=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB10681.jpnprd01.prod.outlook.com (2603:1096:400:295::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Mon, 17 Jul
 2023 07:51:08 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:51:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] rtc: pcf85063: Simplify probe()
Thread-Topic: [PATCH] rtc: pcf85063: Simplify probe()
Thread-Index: AQHZt/pB4P+1rgtfeEi0E3LGXYWLvK+9kX6AgAAEyeA=
Date:   Mon, 17 Jul 2023 07:51:08 +0000
Message-ID: <TYCPR01MB59334E2BFDE01A766B6BF629863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230716152858.92696-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWDz9kEMbtcg_N8Z4DeKiHeAk_eLvRF3_QbdkMYB+-hvA@mail.gmail.com>
In-Reply-To: <CAMuHMdWDz9kEMbtcg_N8Z4DeKiHeAk_eLvRF3_QbdkMYB+-hvA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB10681:EE_
x-ms-office365-filtering-correlation-id: 9cb1b97c-854e-427b-f18f-08db869a9502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBei0hmjex3Os3NnH8kFOMP4rNCzRXyjQ1p/99dEfm5qSc4bSHuIFX5jk2Y1f97PXR/MI8CX4NXYRvREhiSM0zFMxj0fa4Qw/R3p8QiaId7oGuC230vfxbUv4uJ6KixRK+YI5DPepxGqyixAqrWN5XTdBYeiIQxgOk//AQ2zieBs9QE7YT6RfYwxH/ey38x39VVU+kKkVfDJDjbc7xkjHvXtjfOUG+mPh88HWGVEes9kS0CJU0DMR8kYroFMwDakEqVkI+G7yAG+zSnXHRP/n6oWmHl23qUp+y2B3PTHr+jRisU7gfC64jX675uhzBivn7UMSLbmsnWm/3RPh0DfNHFqBvH5lgBop1XZWAt1QZ8ixEaDrsBgGDvQM30AkljygC8DEcsuY3UqE5AhmyNfAfWkg1I2vgVX9qQ8GIQhQFyNRsHtm486IjfnOwCxFyL2yL71boe2shVt15QH45EoaKsLzyPMykWbHy56TLCq1tyBrhRJG/G/+0xPKpFx0ANZYWLxFqrAgtshmNKSz9uonrozcGtaRC663335/7DElNdJ50MHhnFGmg/9SyGgEM5SvWxL7xKGh7Mjfy0euzNkDH+sCV+aRwcdQnG9pzYYqo2+CyczHX1yNOKWpJ9MwKx8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(55016003)(41300700001)(52536014)(2906002)(8936002)(8676002)(316002)(5660300002)(6916009)(66476007)(66946007)(66446008)(64756008)(4326008)(76116006)(66556008)(26005)(6506007)(53546011)(86362001)(83380400001)(71200400001)(38070700005)(33656002)(7696005)(38100700002)(54906003)(9686003)(186003)(478600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUZIZDVpcTI2SmUxQXN4a3hCWGxDWE1pTVRsbjlTZi9udm40Qkx0MVkwQS8v?=
 =?utf-8?B?SUt3a3NxQ3NoVEVuU0hFMllqRFBkODgva1NhL3VBb2N0Vm5WeVZMc1hsc280?=
 =?utf-8?B?bms2c3BnOWswMGE1Rk1ERG92amNHYWVsNXBFbHRiNEZqTUtXUHIvRmVDWmhX?=
 =?utf-8?B?ekc3S3dCWDAwZEN2b29WTVJlejNKeE9NYnJjeXZuUFFtSlYxWW9zbWNPMHFx?=
 =?utf-8?B?RVZ3a051ZG85Wkc4RDJ0Qzg2a3NaOU5JSU9JODhiRGJqNFJjQnk0OXRUY3N6?=
 =?utf-8?B?eERDQVgyOVZpaEJrV3ZnSjIrN3NzdDVjWTEwcDJnT3dHcStncDRCSnRLMFdB?=
 =?utf-8?B?S0ZlWnh6RkdNeUlBaG9UdHhtdGtCRk4zT3Y2ajA2WUJWK0RtNVpFYk9mQTdF?=
 =?utf-8?B?VVVoczJ4N3BvYTdWaFQxLzl6QlI5dGo0VEJEZHVXRWhHRHFrUC84RnFIZTFh?=
 =?utf-8?B?M2lkWmlHZWxkdlVTMnh2YVRYRUhBLzVPOTk3aFlURDRUejY1ejhKR3BXTUdr?=
 =?utf-8?B?ZGc2UkF1ZldkcWFqTW9IZVZBUm1XN05pVVh1SWtaellzdElvT2xZWkhIeGlF?=
 =?utf-8?B?MlQzWVhvTEVEYWF4c0tWR2duYjROelNPRWtybzJEVWlrNTdnL1RILzE3Mmxm?=
 =?utf-8?B?K3QxU2tHVzljTWozR3I5UW1xTE9Uc1dtV3dhalBNYW84QjVoVWErY3dXeGNj?=
 =?utf-8?B?dU1xNlVCNUVRNld3Wnl4cmZRVzdHdUVQUmh5VWdxODJjSkJmSzFadTk2eWh5?=
 =?utf-8?B?amkwU1FkSUZCMy8vRDJxQUhiaEdOVzhPSlJXUTdHMFp1NjBLeXpzRlV6ZEth?=
 =?utf-8?B?cWxOdUpWdThYVG15bm9jNnN5cEYyUCtmcThzbGxKaVlESldXMDBkSDg0dlBP?=
 =?utf-8?B?UDg2b1NEWGl4MU84MWc0YmVFZ2pubElkSEs1OGl3MEFiSDRTRnlQUngzcXE5?=
 =?utf-8?B?NnlQbkFzelk2V2tFZGgyeElaMmIzWU52cFFyWFJoeXNicTU2aGVBNEJuQktv?=
 =?utf-8?B?QmNWT3BLamkxMTZnUUczSUFBcG5ia1RVTWF2Mk5zWkhtL3VLR3lQZmRyZmJ6?=
 =?utf-8?B?c28yNEN3TThpQnFKNGF0RU8xSHdCRkVBSERCd1dxa2FnRHIyV3YvZTk0dnhi?=
 =?utf-8?B?TmVpNWRoWlZrdnRjWEVSYmFrQnFvUzVFQ3lNZVErY1k2aGZFYkVHNzBHS3RT?=
 =?utf-8?B?eWNmUDhMNzZRdko2YU9TU3E1Qko3bkxFS3kxNmdwYjBwTklBOUp6ZWFOeGRn?=
 =?utf-8?B?QktRQnFDMWtuQnVaNW53dW5URU1BRUoyNlFoMTBTWFBYdjdUeWJiUmJPN1VO?=
 =?utf-8?B?RG1WYW5NVm9qYlJ3YjFjOGszY1czRXU2bVpESmtlMEU5Y3hsMStZUklmRDZk?=
 =?utf-8?B?eHFDeFFDWkhuUGN2QnVPQXlKSG5teFFad0J6VXhvdTl1enlYSWpaVTJNeStW?=
 =?utf-8?B?cUt3QUlwdXJOZmZodDNMd3EzUUt3a2pnS1FVei9BRkgvT01GSXZISCtaSmYv?=
 =?utf-8?B?Rk5QMzBWT1hBbERYYjU2dncrQTkvc2o0U2JITkllelBvaHc0MFRncG4vd05l?=
 =?utf-8?B?UmI2S0FHMS9ISGRDUjhOSVg1YW50bmZ5Z0NKWCtGUXI5ejFoU2lQQ3JEVmJa?=
 =?utf-8?B?eDdiaFl4dEQ4Zkd4RTRQdGpRTEp1K2FDWW01M2JXcVF3Y3ZHa3RpeWM2Nm1D?=
 =?utf-8?B?bk1Lclhmblp2SldxNyt6MVlzdGNETGRxQUlqVXh0RUpBdGVNZVBrVEtnVUlC?=
 =?utf-8?B?RmJBZGhoTnNvNWZZMGxDRHBJeGVTQmt4ZWlZU3FqQ2Rob2N6Q2VaTTNzWTNJ?=
 =?utf-8?B?eGpKd05VQ2Y2T2VPL0lxbEJkRTd4N1JMVXhZczJReWFLWWlMd2djc3F2SE4v?=
 =?utf-8?B?RUVNSFQ3REVOTjZLZVlVYTk5U1JQOVJ2UEQ4RXNkU043S3VIc3RaMHJ4ck9T?=
 =?utf-8?B?a1J3eWFhNEdXcy8xM1N4MXNxcnBKa09jRTNWaGNDaG03UVB4VzhpSlFVSE43?=
 =?utf-8?B?WmFFRW1zSlRoWitJUjg0ZldCNkRwbndLencvbW1sQXJreVpVYmlLTzlKZ05C?=
 =?utf-8?B?c2svYk5uS1VhYzltRHQ3WXB2YUNUSU04S3pwMWRWcEU4VEJNelRobEJyV2RB?=
 =?utf-8?Q?OtMej8Q8Od/tjBlHJxppJb5nk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb1b97c-854e-427b-f18f-08db869a9502
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 07:51:08.5785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLCLwoqY6uyOwhQlGIK7qfBqu7Xhn5RaPtGpa0hG1ZASXcQTHlSpkB1XIUyQg2/ZT0YmHQc4WqzWAbOKCg8Gsv3IJbm7SfdmC/Iz8Z4zVnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10681
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxNywgMjAyMyA4OjMyIEFNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBBbGVzc2FuZHJvIFp1bW1v
IDxhLnp1bW1vQHRvd2VydGVjaC5pdD47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4YW5kcmUu
YmVsbG9uaUBib290bGluLmNvbT47IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IEdlZXJ0DQo+
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBQcmFiaGFrYXIgTWFoYWRl
diBMYWQNCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4
LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
cnRjOiBwY2Y4NTA2MzogU2ltcGxpZnkgcHJvYmUoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IFN1biwgSnVsIDE2LCAyMDIzIGF0IDU6MjnigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBwY2Y4NTA2M19pZHNbXS5kcml2ZXJfZGF0
YSBjb3VsZCBzdG9yZSBhIHBvaW50ZXIgdG8gdGhlIGNvbmZpZywNCj4gPiBsaWtlIGZvciBEVC1i
YXNlZCBtYXRjaGluZywgbWFraW5nIEkyQyBhbmQgRFQtYmFzZWQgbWF0Y2hpbmcgbW9yZQ0KPiA+
IHNpbWlsYXIuDQo+ID4NCj4gPiBBZnRlciB0aGF0LCB3ZSBjYW4gc2ltcGxpZnkgdGhlIHByb2Jl
KCkgYnkgcmVwbGFjaW5nIG9mX2RldmljZV9nZXRfDQo+ID4gbWF0Y2hfZGF0YSgpIGFuZCBpMmNf
bWF0Y2hfaWQoKSBieSBpMmNfZ2V0X21hdGNoX2RhdGEoKSBhcyB3ZSBoYXZlDQo+ID4gc2ltaWxh
ciBJMkMgYW5kIERULWJhc2VkIG1hdGNoaW5nIHRhYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBPbmUgc3VnZ2VzdGlvbiBmb3IgaW1wcm92ZW1l
bnQgKHdoaWNoIGNhbiBiZSBhIHNlcGFyYXRlIHBhdGNoLCBhcyBpdA0KPiB3b3VsZCBhbHNvIHRv
dWNoIHBjZjg1MDYzX29mX21hdGNoW10pIGJlbG93Li4NCg0KDQpPSy4NCg0KPiANCj4gPiAtLS0g
YS9kcml2ZXJzL3J0Yy9ydGMtcGNmODUwNjMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1w
Y2Y4NTA2My5jDQo+ID4gQEAgLTU3OSwxNyArNTc3LDkgQEAgc3RhdGljIGludCBwY2Y4NTA2M19w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50KQ0KPiA+ICAgICAgICAgaWYgKCFwY2Y4
NTA2MykNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtICAg
ICAgIGlmIChjbGllbnQtPmRldi5vZl9ub2RlKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGNvbmZp
ZyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LT5kZXYpOw0KPiA+IC0gICAgICAg
ICAgICAgICBpZiAoIWNvbmZpZykNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0RFVjsNCj4gPiAtICAgICAgIH0gZWxzZSB7DQo+ID4gLSAgICAgICAgICAgICAgIGVudW0g
cGNmODUwNjNfdHlwZSB0eXBlID0NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpMmNfbWF0
Y2hfaWQocGNmODUwNjNfaWRzLCBjbGllbnQpLQ0KPiA+ZHJpdmVyX2RhdGE7DQo+ID4gLSAgICAg
ICAgICAgICAgIGlmICh0eXBlID49IFBDRjg1MDYzX0xBU1RfSUQpDQo+IA0KPiBOb3RlIHRoYXQg
dGhpcyB3YXMgdGhlIHNvbGUgdXNlciBvZiBQQ0Y4NTA2M19MQVNUX0lELi4uDQpPay4NCg0KPiAN
Cj4gPiBAQCAtNjU1LDExICs2NDUsMTEgQEAgc3RhdGljIGludCBwY2Y4NTA2M19wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpICB9DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkIHBjZjg1MDYzX2lkc1tdID0gew0KPiA+IC0gICAgICAgeyAicGNh
ODUwNzNhIiwgUENGODUwNjNBIH0sDQo+ID4gLSAgICAgICB7ICJwY2Y4NTA2MyIsIFBDRjg1MDYz
IH0sDQo+ID4gLSAgICAgICB7ICJwY2Y4NTA2M3RwIiwgUENGODUwNjNUUCB9LA0KPiA+IC0gICAg
ICAgeyAicGNmODUwNjNhIiwgUENGODUwNjNBIH0sDQo+ID4gLSAgICAgICB7ICJydjgyNjMiLCBS
VjgyNjMgfSwNCj4gPiArICAgICAgIHsgInBjYTg1MDczYSIsIC5kcml2ZXJfZGF0YSA9DQo+IChr
ZXJuZWxfdWxvbmdfdCkmcGNmODUwNjNfY2ZnW1BDRjg1MDYzQV0gfSwNCj4gPiArICAgICAgIHsg
InBjZjg1MDYzIiwgLmRyaXZlcl9kYXRhID0NCj4gKGtlcm5lbF91bG9uZ190KSZwY2Y4NTA2M19j
ZmdbUENGODUwNjNdIH0sDQo+ID4gKyAgICAgICB7ICJwY2Y4NTA2M3RwIiwgLmRyaXZlcl9kYXRh
ID0NCj4gKGtlcm5lbF91bG9uZ190KSZwY2Y4NTA2M19jZmdbUENGODUwNjNUUF0gfSwNCj4gPiAr
ICAgICAgIHsgInBjZjg1MDYzYSIsIC5kcml2ZXJfZGF0YSA9DQo+IChrZXJuZWxfdWxvbmdfdCkm
cGNmODUwNjNfY2ZnW1BDRjg1MDYzQV0gfSwNCj4gPiArICAgICAgIHsgInJ2ODI2MyIsIC5kcml2
ZXJfZGF0YSA9DQo+ID4gKyAoa2VybmVsX3Vsb25nX3QpJnBjZjg1MDYzX2NmZ1tSVjgyNjNdIH0s
DQo+IA0KPiBUaGVzZSBsaW5lcyBjYW4gYmUgc2hvcnRlbmVkIChhbmQgZW51bSBwY2Y4NTA2M190
eXBlIGNhbiBiZSByZW1vdmVkKSBieQ0KPiBzcGxpdHRpbmcgcGNmODUwNjNfY2ZnW10gaW4gaW5k
aXZpZHVhbCB2YXJpYWJsZXMuDQoNCk9LIHdpbGwgc2VuZCBzZXBhcmF0ZSBwYXRjaCBieSBzcGxp
dHRpbmcgcGNmODUwNjNfY2ZnW10gYXMgaW5kaXZpZHVhbCB2YXJpYWJsZXMgYW5kIHJlbW92ZSBl
bnVtIHBjZjg1MDYzX3R5cGUuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgICAgICAgIHt9
DQo+ID4gIH07DQo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBwY2Y4NTA2M19pZHMpOw0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
