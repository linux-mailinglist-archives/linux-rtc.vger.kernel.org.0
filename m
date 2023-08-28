Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3996378AE89
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjH1LOA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjH1LNj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:13:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068B0E3;
        Mon, 28 Aug 2023 04:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rm70qd9BPrGNyqU6JTjRfHtARZPuLEKZ2BheahxxmApD9fxBdKyLoFemT9XH77NZFW2GxqQE2pb493graD8ubDLncB0NcmDepsQ6rpTUKIeKxJI/WhUT+p2zl8/6N+h+5UaVCqCUidTAcqhDD/jeS4bsfI4UuHvzwMxXv4Malll2TFZwdP+glmNmdO4jUg3XaiQvvQHQqTJpgwwIzFeOmWeStKGwpmm93ZrjMjdTCEdhJxB/01TZvE4a5WrnvV7hWVKGn0PYxfPGgwTlnrixDpMYv/7k8zCMbkdecMeUgtwFBIw2hJvLm1vxhJMYLVmzR/EHO9Y5AR6ygNLQWUMoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwcV0ku5OXmwZgTxSm4u4WREuDtczeLqt8plf2CXuJI=;
 b=M3iNIoRgHqLGls69ZMD527l/hB6v9gQDnYrJjwK6x3SUWdmVnVqqWQ6XiX+8zi7HzDmpPphaIjoiPuBu/j8IzXbfkQA9p4OLIq33LlVOze0SHURzOUrk7cKegML2pq6d30//iNEtGvR0On5JzL864Hua+RRGoVlrAuM7+mlBEAWpnJaMCt9/FO1uXM9CPyWpFueitIXXejVMclny7+3cu31qgPywjfUnRdPHAjyrLp98v5J7WlBXrDltuAQBpFrIxdAlgHooQSjIlqrLRWv73WDSpRYNHUL9zZXRZbAJm+C9GUSIFBSoYmUBeK6aMMyMgim057qu5tuc4IjQQRaLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwcV0ku5OXmwZgTxSm4u4WREuDtczeLqt8plf2CXuJI=;
 b=FgNsYB8UbzgjkLsnvavOjCCCZhv5NHpxxhW3D48xUsbsxNDPjw/tGjr72CbgZuHEwQGeQu7ZQcIhYSIle+HxvRE5DWQuDCGrmMn8bpOUCF/0pZU0AbJuMGYnGugXmjlLUfmu1u1Bv2xkTSo93m29l6gO+w6xOEMHJbMCfIQdD8A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10307.jpnprd01.prod.outlook.com (2603:1096:400:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:13:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:13:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] rtc: m41t80: Simplify probe()
Thread-Topic: [PATCH] rtc: m41t80: Simplify probe()
Thread-Index: AQHZ2ZHmE9T7P3cQc0GDELPti9Wgha//jVaAgAAAR9A=
Date:   Mon, 28 Aug 2023 11:13:29 +0000
Message-ID: <OS0PR01MB592250E1368B54DEC421837A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828092737.30816-1-biju.das.jz@bp.renesas.com>
 <ZOyAn9xnqlai42bF@smile.fi.intel.com>
In-Reply-To: <ZOyAn9xnqlai42bF@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10307:EE_
x-ms-office365-filtering-correlation-id: c4e93b27-b673-451e-acc2-08dba7b7cf29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKWlfpxwoQVTYie+DZhqf2T9WHhgCdlBs/TESx873HuQPoQkco2sBETL1L7xO3uv5wSM5PTUSleYJXl1wTGDLnl+ryR0LQbhz84JTjOVrc8ANEC2JPliuASdWqaPc4qWsJ/FPKXUIZnKcDQBpbyO7cMn7bnjDnVy52sFcH3wiKDpnEyQRgw6g/iaQ62UxX4olTPOE8MzjNufP6oQN6OJ9VzWHa0UNXQLheN8kYDpszepXrTP3E5duiE+8ummi2Ho7M+H8v5vScHsykVkStSuSirADLNDjnGBbtnO2URtxrmcikLDTEdtcndk0gjJzbbOr/Q/kUrbCdORtMHzuz+CcXgpFsic8aVyXroRmwzYf2LWkLJq6yKh5MvdujUdO0wb0lkjtO0L+YOBQipA2RlJ1xHUzcPO2NWTGYo8U+5umuAjgM3Ate/V2nqYm3Qnw7VqPoCquB5pmBuGSnQEC31Wyj8NagEYYTJIFnpZzm+5X0yi9jINmMc2cjeUiAbwd/uHcpZGobFQILTn7j1PNnbATy4wukySXvtv7kFP6Bh6BqI5iZ1q9sD1k0FecyQXW44TZeqGjLLXj9oSuWeUUwCE71iEPQbiYUyoJB/CXDlczVnWQode47qKgVVokIZwr+Dk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(71200400001)(55016003)(6506007)(7696005)(86362001)(33656002)(26005)(9686003)(38070700005)(316002)(6916009)(5660300002)(76116006)(66946007)(66556008)(38100700002)(54906003)(64756008)(66446008)(66476007)(52536014)(41300700001)(2906002)(122000001)(478600001)(8676002)(8936002)(4744005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?beoDSe+k1sfSdnR1DkPjKID08u5OJtmJpT16sayI6nVg1U0YcW4FO7N5UJES?=
 =?us-ascii?Q?aaSTUSUhnToXE4DHC0A0Su0JE7wLSUAPPTRkLsVdUp+2D9lCZEpaMo3DW0jL?=
 =?us-ascii?Q?gSOfzSAyWQonciRzD9CCTGYfhBY8UHSmgRxbqIPQL7pVJ0f/HBJxlIhOJgzV?=
 =?us-ascii?Q?X7grI4yQ46n32hrR72XlWpzFoh+cRdY9ESyLNUzX0+ublTDxw2EsoCMXo++N?=
 =?us-ascii?Q?mVLv3J04KLqgLtM1rXzBoW+jW+PI67IOwJYGTmeeoqAcZTcUOeNiw/3H4Gf7?=
 =?us-ascii?Q?TZlSrkARbogUnUDDDv4ObeFDV24R8bK71A4IgLEmuEDLgfo3x495aWEdzsYx?=
 =?us-ascii?Q?/kojMbN6IJUg/wKt7dqtXis8Gd+57U5OiOoWeCQxRNmMHOiz6mvTcq1e/UUn?=
 =?us-ascii?Q?qtV5WfHZe+EZlR8HV3O5PSkIEuSbM+k7cB8vo9n3zd5vAq2CdUxLaY0H/iXs?=
 =?us-ascii?Q?UNsDOXrWfEkWXIFNn5jMVJG400XkkhkijkmQ2vwwW86G9i6snEc138NQlemU?=
 =?us-ascii?Q?83ktuBcm/KR56CiMV7IN+Mgi3X02wsQdHrN9ayVbotZ6f/sMjpCp8MaH/g4p?=
 =?us-ascii?Q?pHSEqInA43dfAWqDsDSop13q5d8EyLPMyGiYzdwIBvzDi/3d/yL1DxGFyzID?=
 =?us-ascii?Q?r2Ji0UPKnIQ61RGtAHplW0lbR+8B/D3BKkWCBPJdDZgUPaOwcY8gj5SK6vsq?=
 =?us-ascii?Q?IKy1onHmuPdiirSfIV6p3wlDZBIxvz/l0fjQMU7D+/tg1jyweYM5Yb3mJ32y?=
 =?us-ascii?Q?SvpCk/tpMlTkPjnGt4+JfhL0Ir/QDQYiCinUwsF+36uKC3xElv2C0JATowrw?=
 =?us-ascii?Q?xYp134etWmAVaURyZySdzdwmoSF8YtnZUnxjHEl2gHM26X5AG8z2OMI/PFBB?=
 =?us-ascii?Q?4jfnphilDCwWFi4EzSiLo9ZlwYw3Fd+akPlYmn3mcRioHF2LmgRTXIJI/Xmq?=
 =?us-ascii?Q?6Hls6MGbyP5kg6cLjhWOs7LGJ05Aja3/zhfNyq9kO7nH3koVDcA1YF8brAmz?=
 =?us-ascii?Q?eIgqKgAu58pVT5QqKVqcf/luNz9guCgrrHg8lxPgXeAotUJW5ajc3DhnVDG0?=
 =?us-ascii?Q?mpLKXNSjPsypxJjQcFZYlzqWSOd1wkehRdEXeOT4wm750LrF0HQYwls1uGdR?=
 =?us-ascii?Q?PKJOinmFZZ/ir+KnV2JRo/Lb6armGd6U6yBwc+nDk1y7nEclEmcT3AKW7aRk?=
 =?us-ascii?Q?DqM//Aiv/iPI8vne334oi6g/ZUBkHDT/swIuMYXjcpb/ApUHQfczMB+1ZH0s?=
 =?us-ascii?Q?BpTLAtY/HxkZ+JK8W25+Ris8IMZQraCarjvvXhbid6tFM7HeNqnQqcf3gVUi?=
 =?us-ascii?Q?VMVerEv4GIlrcRCEiYWASJeE4lR1NgKEOApwjh8XxF1H/UL5JQKN5BrNGBzH?=
 =?us-ascii?Q?L/u0M3AaflxZ1ESpwL/rsPPl2UnBmZ+fSRlIy/2UyFKwVXxxyOpW4mAZjpCU?=
 =?us-ascii?Q?HIkzzmRZdU+gBu0vRXNBGUT9WOS/6h7F35CsDD0PaWKqdqhjANBe/vmEU8gC?=
 =?us-ascii?Q?Pg8kb/lbMY+VUcJkSX53Tdx19TNCBT2gvgb4vJCY/Y6iGpBvFL++DvXENsgr?=
 =?us-ascii?Q?nNdcjhnxkPvB0LZLo8MPrQPSQlqN9rh2ksP3kVFnVwvSP0eSVIoiW1o9aRXM?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e93b27-b673-451e-acc2-08dba7b7cf29
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:13:29.9434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omOaTcbPIyAoiAC6P0+xnaR5NaD5dCiMFgHNQB4PnxggpvB8Lzc0ixSItTAKZq1rBJMtqoadYhyLffEUSuXfQsi1FJQA3eufA6VpyqHP/2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10307
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH] rtc: m41t80: Simplify probe()
>=20
> On Mon, Aug 28, 2023 at 10:27:37AM +0100, Biju Das wrote:
> > Simplify probe() by replacing device_get_match_data() and ID lookup
> > for retrieving match data by i2c_get_match_data().
>=20
> ...
>=20
> > +	m41t80_data->features =3D (unsigned long)i2c_get_match_data(client);
>=20
> uintptr_t is more natural and de facto pattern for this. Why unsigned lon=
g
> is here?

I just used the casting used for of_device_get_match_data.
I will change it to uintptr_t, If there is no objection.

-		m41t80_data->features =3D (unsigned long)
-			of_device_get_match_data(&client->dev);

Cheers,
Biju
