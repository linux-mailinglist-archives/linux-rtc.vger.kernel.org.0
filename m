Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03552635135
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 08:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiKWHoE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 02:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiKWHoC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 02:44:02 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423E0F72FD;
        Tue, 22 Nov 2022 23:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI2q+oKgFy/om6+2QIwT60+zksd+DTPPQft1Lngqmmp0Nv2HWt/F8J1yJDLzUwiJaLg+WwPx4mI2E/tSKibmSkyIJUP3NuWfikNkgpp2FW4UPWR43Jx6oesS1nyWrF4SCM6kZ3ndcPsd7ZqcETRP65m9rezR533cqEoN72Z+6DgCY6oiNqr8Cs2F0Eaiq+lLisXK1gRBWvnHeOmt/4kbj9XfQX0B0+tS/pTD9TvA+ucGgCdyAGf6hNorQe7nj+xFlwDnTyrGm1LtBadOrAu6BT9HVFYbm8bxl81IxTzDfrAiY14ZUOU4fGKjHS9LLWCROOE0Y0aQC5qlww2h92+8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b/jg00FRmANmHVME803dBnucDs+zQliSlYbg+PoRKk=;
 b=nRAUILspPRidd7QhTDt6yLQg5wjHI50MXmWzxVfRrury/jHs105n89/AVPd69dhugv+NW4Rpd1GdTe5xUFrlCW9ab3s25AUfZPRYwtx5agjY42RX7hHpIyn5d6F1pvxluOZ0gFbBv8h60tztzYgdHu+ezFMuFCtFUK+C/6iGbGIL6o88uLyt8D5B/Zk6MoENnNXZTsxfGxPGAAo91z9v7jB6fubNi7aiMFB8w1BZLG3rRO8iUNME0MPNbH46lHMcOpDZH1jajb6C8Jni3xDLlKJ+UhQjwa7Fw2vKrFyC5AYL9WZzO/FgGbMi2ZGz6f6tjXQ/v9+BWheXE2ttbQdd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b/jg00FRmANmHVME803dBnucDs+zQliSlYbg+PoRKk=;
 b=KaYQFt0EP+Cv49D2XGidYNRI079Z+1IEdzDBYxmCkR8xd+r3j4VmDSp1cLyyL0bpQ5t8xd3vFnxr1/JpdrojbNtDUN/ccPFA4zKnPIu1nkUdRFSVDQtotCqDLZ4djCDGvppSbvEhHihWp7qhkhR/+S6r96yaXfE/UGQOFt5wQY0=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 07:43:58 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 07:43:57 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Topic: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Thread-Index: AQHY/XWNECi6akMI70mG4aJ99Q3psa5JFw0AgAAMooCAAXISgIABghRQ
Date:   Wed, 23 Nov 2022 07:43:57 +0000
Message-ID: <AS8PR04MB86420CA249C3E1D800BB4404870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <6bb1ee6d-ab8c-824c-4a7d-29769189e4b4@linaro.org>
In-Reply-To: <6bb1ee6d-ab8c-824c-4a7d-29769189e4b4@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8253:EE_
x-ms-office365-filtering-correlation-id: 96832723-05ea-40ca-8fd6-08dacd267abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8gfKxXthEr+4ejT9sK4s13nNjKb/f8SWMjzHfmBM33l3YwhUMmmK/PAuxAdvXreprLbdXMWlJG+mqzmxx8nGyQ3xIhlEioDdGpLCvd839ZTrchwyb2dMn7QArHDQRCUsPjMyIVQeLxXrZfAwOLwYu6GfyJfQvXee28pY9nHXB5vKKwTYbx/paThoFvyRFs92LYPC/BHJKZYy8TmKG7Xfu/5kNm5+dfOVgh02lqyXHuJFs/9KLG/Dg0OammT8JsoYO0zlz9faBEyAlbtvvqyhOWkesylUnx0NRlB7sbnGRaIYMn8gTmbrTrUAwpUqzm/Am7SETkcBwkJ7JgwSdhaNh0NHPNfe0wHl67NsMODwJYU7lowuoKME6YP8VwaQSY7cSE10OR5OJwiB+YlVwV08NuHx9JXTYNrbbOdy8CtJn46rSPYuyszjYtBNNDMvP3HTU1W1/Q7XDP102PU/1StMomTplZKV3GWbzz6qEJs7BWG3MgYDEiBGd8I3QSkUAdMSUhfIRlfWJasKU7UHxVBaUfZC7NYMPvBIrNnCrITw+vCTqWV99zli6hrbHYFxp4Z81YauM6Q0mSG52ah7o/HtrMDVC5O4TBnd3CP39mlYhQarmZSkUOf2KiDGiipsOhi8iTcZMijGzUt2xfhwEBXYJwT2CS4nI8+iQtnrUnc9GvoUuZSCQLz63tWC4uUGEm1NmxW57p4pt/I7k27sMAA0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199015)(8676002)(76116006)(66556008)(66946007)(66446008)(64756008)(66476007)(4326008)(38070700005)(110136005)(122000001)(316002)(2906002)(54906003)(7696005)(53546011)(6506007)(38100700002)(86362001)(55016003)(478600001)(26005)(186003)(9686003)(71200400001)(33656002)(41300700001)(52536014)(8936002)(83380400001)(5660300002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0N2dGpIVUs3dlV2VGlxVkMwdDZUWkxsNWFiZmpTSU44cHJ2N0lUTWRWQ21Y?=
 =?utf-8?B?R2I4Q204ZTVWZnUvbEpDZlJ2WFBnK05sVFhEQVU3RHNNZUs5R1dVclh4b1lQ?=
 =?utf-8?B?K0ZpUzUvNW9LZ3pEelF5ZFdHaWxtUENFYjJnNEp1NlZwbHhvNkpwMnZHTHNY?=
 =?utf-8?B?bU9welVDdlgzanlLVkNjV2hNZGxsUjJWNVh1Ym5kbmxjd3dYNEdUYWg3UWRZ?=
 =?utf-8?B?dGQrWEs4clRUWmI4L2ZQdmpGTW5pU2kydHRSZ0tQREdrNTIyQ0pXbUdNeStl?=
 =?utf-8?B?MWhxY2xpakxwS1dzWXdyVzZXSnNjOEV1WTlhTkdjeEZJZVhUVFhYNC9KR0ZG?=
 =?utf-8?B?YkoxelZVL2l5SUhLanZLKzJnaWdIa3I3V05TNU5HU0pvZ1hUMThxNlJCZDgw?=
 =?utf-8?B?Y2ZxeHl6WWhVNE5ud0hiU3p1cThWL2hiQU8vaDRXbC9nUXNCVWErSzdiUEpD?=
 =?utf-8?B?cEpoamk4MFgxdlNjcjVCejVHU3c5VjZydjVVSnovR1JzT1ZsL1ZyREdWQ3lR?=
 =?utf-8?B?WmFZbEJCTS9KTm5hRUNUYjVjc09nbnNFWVpaYzl6b1lpbnM5UmhCTGkzUEMr?=
 =?utf-8?B?V09kK1FrQjV5QitqQ29TSERDQVFYUHlIZzRjOHNKUjFkSitkMk94WDJFYm92?=
 =?utf-8?B?OTI2WktoTVUxbmJjd2Z6QmtiUXF4ckE1bUJtNEMxWDJLeU9rcTdPcDFENFp5?=
 =?utf-8?B?ZHQ1VXBJSjQvdVJuQzVCMDhueG1pZW9pL21QNzQ0ZHZLbnNHdDNOcy81YUNn?=
 =?utf-8?B?RzUzYk15amlISkhyc0dmbVBBZGxuMkc3QXVDMDRiREZOL01LNHZlQnFUcUF2?=
 =?utf-8?B?Zi9lYnNxaVdyZEpFMWRpUC95Qk9hUDNMZlFEeHEvZS9SOFdERTY2VDBZWFRo?=
 =?utf-8?B?MG1MR2ZVbHZ0cDdReVdLN2RaczJSMUtKcFR3R1B2S2pkU3VIZTFnNDRKY1l0?=
 =?utf-8?B?US80ZXpaVG9wd1JXa3RGbnhOVk52clREQUdMdWNnakhMajY1TXVLVDUvakhw?=
 =?utf-8?B?QVQ5WXpNNzZ5Qnl6ZDJ0ZFhrYmJaK3NUQkNLdXBVM3NDVTM4R2FJdXRTMCtV?=
 =?utf-8?B?VTFsb0xZOTNJUm0yQ0VOLzR6ZDdTallOSDR2ZXlOWG44bHBtSGVvak12OHlF?=
 =?utf-8?B?c2xPTWtMTlVvbUV1bkU5S0tNbHhpejMvRmszdXFtM1djRnAwdVBxZnhPZ1Ev?=
 =?utf-8?B?NEQvNDVVQ29rSFM5OUZFYzZqWjRhYkJiQ0FrSWwycndtaWEvMTd6WUhicHZX?=
 =?utf-8?B?ZVBZZk9hajhlelh4dzd5RHVBMkxNeCtwZnRKNjN2bVlVK1B6VWJ2Q2MvQy9K?=
 =?utf-8?B?cUkydEVKL0ljZ0pnaHR4ZXBjVVNzM2VMbjhiR1VackgrZ2w3eTRseEY3TFNQ?=
 =?utf-8?B?TUw4RVNnTWl2bGQ2cXdkQm5tb0hRNXFBWTNLK0RaS1RjS3RERlIrajV3YmtG?=
 =?utf-8?B?eVRkb1huaWlTNDRBek9FTWt3UVUrOVNoK00zUmNlM3d3Y005bVJYaGNNaTJJ?=
 =?utf-8?B?WENYM0VKaW9RUExjNlJUbGYrcHE2R04xS3AwYkFuRGlHK2MwNEdjZkpNN0F5?=
 =?utf-8?B?MVV2Mi9nL1RkN2ltNTBDNmtBZm1ReUZveGp0cVNlaDFmTHZ3bEQ2akdzalY5?=
 =?utf-8?B?UVRyaUlXVG1vaG1VSkVaVXNCNXpCK3VjK3E5SERUMVNNSGlyTzM5ZXRkWWFO?=
 =?utf-8?B?Z0RNZmFzcFVWTGlUbHgwdEthRG96ZzBxUHZITmtrWnYxb3RUNHc4dm9ZSGJ4?=
 =?utf-8?B?RjBaeU5Vc1VTeEFaNWxZdzFzZUVTRzJYVFh3Mjhrb3BZaVR4WUxWeGgyaUJL?=
 =?utf-8?B?YnlZQ29nd2VQc0RwdWRxcXBYVTJSY0hZSkJkN0JrVmRUVnlRNUh2UTdnUklP?=
 =?utf-8?B?TWNoTTI4dHBvK1N6R3NlOFlaYmg3d3I4cXRwZEljZE1UZlFPaDFSM1VOSlh0?=
 =?utf-8?B?WWhvNm5WL1Vobjh3TU8rZDlLcVpGVDlJRForWG5HN1VWWUtoS2JYa1UyYVpa?=
 =?utf-8?B?SStjRU56ZFMrV3BENEZHOGlFNUNhbGNNM3prWXM5Y2hUK3FyeHNiRjl5TmhX?=
 =?utf-8?B?WFd2bjI1dFM2UXlBMnRlUDVKcG9USG1rM1hqckh6VWd5YlZNRjl5MDhSazBG?=
 =?utf-8?Q?9wOY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96832723-05ea-40ca-8fd6-08dacd267abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 07:43:57.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNcaPyAe5L2E8b2vtsX+asYICzzQCG8/wFeb/QK9HYdh4tjDBAGK6TANlwt0wLk6XODkXZVWXBaDcw013betGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8253
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNF0gZHQtYmluZGluZ3M6IG1mZDogbnhwLGJibnNtOiBB
ZGQgYmluZGluZyBmb3IgbnhwDQo+IGJibnNtDQo+IA0KPiBPbiAyMS8xMS8yMDIyIDExOjI2LCBK
YWNreSBCYWkgd3JvdGU6DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkdC1iaW5kaW5n
czogbWZkOiBueHAsYmJuc206IEFkZCBiaW5kaW5nIGZvcg0KPiA+PiBueHAgYmJuc20NCj4gPj4N
Cj4gPj4gT24gMjEvMTEvMjAyMiAwNzo1MSwgSmFja3kgQmFpIHdyb3RlOg0KPiA+Pj4gQWRkIGJp
bmRpbmcgZm9yIE5YUCBCQk5TTShCYXR0ZXJ5LUJhY2tlZCBOb24tU2VjdXJlIE1vZHVsZSkuDQo+
ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0K
PiA+Pj4gLS0tDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBwcm9wZXJ0
aWVzOg0KPiA+Pj4gKyAgICAgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgICAgICBjb25zdDogbnhw
LGJibnNtLXJ0Yw0KPiA+Pg0KPiA+Pg0KPiA+PiBNaXNzaW5nIHJlZiB0byBydGMueWFtbC4NCj4g
Pg0KPiA+IE9rIHdpbGwgaW5jbHVkZSBpbiB2Mi4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgICAg
ICByZWdtYXA6DQo+ID4+DQo+ID4+IFVzZSB2ZW5kb3IgcHJlZml4LCBkZXNjcmlwdGl2ZSBuYW1l
IGFuZCBkZXNjcmlwdGlvbi4gV2hlcmUgaXMgdGhlDQo+ID4+IHR5cGUgb2YgJ3JlZ21hcCcgZGVm
aW5lZD8NCj4gPg0KPiA+IFR5cGUgaXMgbWlzc2VkLiBXaWxsIGFkZCBhIGRlc2NyaXB0aW9uIGFu
ZCB0eXBlIGRlZmluZSBpZiBuZWNlc3NhcnkuDQo+ID4NCj4gPj4NCj4gPj4+ICsgICAgICAgIG1h
eEl0ZW1zOiAxDQo+ID4+DQo+ID4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0LiBSb2Ig
ZXhwbGFpbmVkIHRoZSBzaW1wbGUtbWZkIG1lYW5zDQo+ID4+IGNoaWxkcmVuDQo+ID4gZG8NCj4g
Pj4gbm90IGRlcGVuZCBvbiBhbnl0aGluZyBmcm9tIHRoZSBwYXJlbnQsIGJ1dCB0YWtpbmcgYSBy
ZWdtYXAgZnJvbSBpdHMNCj4gPiBwYXJlbnQNCj4gPj4gY29udHJhZGljdHMgaXQuDQo+ID4NCj4g
PiBGb3IgdGhpcyBCQk5TTSBtb2R1bGUsIGJhc2ljYWxseSwgaXQgcHJvdmlkZXMgdHdvIHNwZXJh
dGUgJiBkaWZmZXJlbnQNCj4gPiBmdW5jdGlvbjogUlRDIGFuZCBPTi9PRkYgYnV0dG9uIGNvbnRy
b2wuIEJ1dCBubyBzZXBhcmF0ZSByZWdpc3Rlcg0KPiA+IG9mZnNldCByYW5nZSBmb3IgZWFjaCBv
ZiB0aGVzZSBmdW5jdGlvbnMuIEZvciBleGFtcGxlLCB0aGUgaW50ZXJydXB0DQo+ID4gZW5hYmxl
IGNvbnRyb2wsIEludGVycnVwdCBzdGF0dXMgYW5kIGJhc2ljIGZ1bmN0aW9uIGNvbnRyb2wgYXJl
IG1peGVkDQo+ID4gaW4gdGhlIHNhbWUgcmVnaXN0ZXJzJw0KPiA+IGRpZmZlcmVudCBiaXQuDQo+
ID4NCj4gPiBBbnkgZ29vZCBzdWdnZXN0aW9uIG9uIGhvdyB0byBoYW5kbGUgc3VjaCBjYXNlPyBe
X14NCj4gDQo+IFRoZSBzb2x1dGlvbiBmb3IgbW9yZSBjb21wbGV4IGNvbW1vbiBwYXJ0cywgZGVk
aWNhdGVkIGRldmljZSBkcml2ZXIgKE1GRA0KPiBkcml2ZXIpIHdpdGggaXRzIG93biBiaW5kaW5n
LiBIb3dldmVyIEkgdW5kZXJzdGFuZCB3aHkgaXQgd291bGQgYmUgb3ZlcnNob290DQo+IGhlcmUu
DQo+DQoNCklzIGl0IG9rIHRvIGtlZXAgY3VycmVudCBpbXBsZW1lbnRhdGlvbiByYXRoZXIgdGhh
biByZWltcGxlbWVudCBhIG5ldyBkZWRpY2F0ZSBNRkQgd3JhcHBlciBkcml2ZXI/DQoNCkJSDQo+
ID4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgICAgICBpbnRlcnJ1cHRzOg0KPiA+Pj4gKyAgICAg
ICAgbWF4SXRlbXM6IDENCj4gPj4NCj4gPj4gWW91IGhhdmUgc2FtZSBpbnRlcnJ1cHQgYW5kIHNh
bWUgYWRkcmVzcyBzcGFjZSB1c2VkIGJ5IHR3byBkZXZpY2VzLg0KPiA+Pg0KPiA+PiBCb3RoIGFy
Z3VtZW50cyAoZGVwZW5kaW5nIG9uIHBhcmVudCByZWdtYXAsIHNoYXJpbmcgaW50ZXJydXB0KQ0K
PiA+PiBzdWdnZXN0cyB0aGF0IHRoaXMgaXMgb25lIGRldmljZSBibG9jaywgc28gZGVzY3JpYmlu
ZyBpdCB3aXRoDQo+ID4+IHNpbXBsZS1tZmQgaXMgcXVpdGUgdW5mbGV4aWJsZS4NCj4gPj4NCj4g
Pg0KPiA+IEl0IGlzIGRlcGVuZHMgb24gaG93IFNvQyBpbnRlZ3JhdGVzIHRoaXMgQkJOU00gbW9k
dWxlLiBGcm9tIHRoZSBCQk5TTQ0KPiA+IHNpZGUsIGl0IGhhcyBzZXBhcmF0ZSBJUlEgbGluZXMg
Zm9yIFJUQyBmdW5jdGlvbiBhbmQgT04vT0ZGIGZ1bmN0aW9uLg0KPiA+IERpZmZlcmVudCBJUlEg
bGluZXMgY2FuIGJlIHVzZWQgZm9yIFJUQyBhbmQgT04vT0ZGIGJ1dHRvbi4gQnV0IGluDQo+ID4g
Y3VycmVudCBpLk1YOTMgU29DLCB0aG9zZSBpbnRlcnJ1cHRzIGFyZSBPUmVkIHRvZ2V0aGVyIGF0
IFNvQyBsZXZlbC4NCj4gPiBUaGF0J3Mgd2h5IHNhbWUgaW50ZXJydXB0IGluIHRoZSBleGFtcGxl
Lg0KPiANCj4gSXQncyBmaW5lIHRoZW4uDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQo=
