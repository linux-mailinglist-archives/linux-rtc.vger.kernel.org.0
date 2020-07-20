Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A873C225646
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 05:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgGTDqV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 19 Jul 2020 23:46:21 -0400
Received: from mail-eopbgr1310085.outbound.protection.outlook.com ([40.107.131.85]:47584
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726123AbgGTDqU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 19 Jul 2020 23:46:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSVUVnlYw+POUATSaOKMepxwJQCbNqSmpBcVVm3ll0zMKbz/hHM0/NO+hEAOmyuhGKw86+RTem/pL1BHqlUbaKXs/WwD5quQCZBFPLsrviUCTfEVWwF/H8ccaBtd1bjsDhtH0u8KV7QVBP3HVID6cSn3KPA5v9J9iT8L5Gczqaj8DpfyUZMXF+kHWKrsMvscpS76cE8kA1Lx0EBZvJNNrmygoc3BbIfjiobMmyIlPnFuFBaUVSpzVeEaQHPOGbwU0s58RHkb5MfIhAamVTWIObFMOv0TQbiLVO1Ctdn2+EfgR1dq0tcgsZhgocS/Ru4mxxHfh9gda/mS9/iZsWj6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgKcaSx9e6Wgyj3SgEVBicEOJnG/0XvaqOASV2Wld98=;
 b=mMLK5DMJuAeCWg+jydQTPYLY7LNnJK3Gj5ctFkH2us8/wg+i6wixupPOrQYCo/28JJ0Y5XTtqa6Y1PLbi6EUZb+Fd9/LY1UdXZmwcoAWzzV+YhkP9o7856VSgY3yiX5Knk3wiNKc9jd6KBmOXL/tKUXKOuErAPwOSBVtH/4OPjGJHQ0yB/0DG/Qo1n+3kLzyEFdghBaEOC1ImFcDBtSTVlzB21F+1vijo2fUYwwn0MuaTl3hBY2NhHdAvU0JV0V/kbHV7x0V54mko+APghumpYHWsn8lILLk5O0aiHM7ol9vqCuxu5Pcu/5qCaAY6ndgO/3rudLPxjaYhTlI5Lyl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgKcaSx9e6Wgyj3SgEVBicEOJnG/0XvaqOASV2Wld98=;
 b=L6IBJn/SeHUACUIsfrI35esmvFTOlKT9zSiegPPxWZ7QhcvCMz6c7r6YDVQ16OhDyHiljpEhvqMgHz9Do7kNpjMN5BdVXKWKtLV6mCFu1Fqx0YRBLqHKJ8C/HqLacETkOTh/FcHBwp2XFbM1lnLmFjgf7a1JAMitT9rRwxO1C84=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3394.apcprd01.prod.exchangelabs.com
 (2603:1096:202:25::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 03:46:16 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 03:46:16 +0000
From:   =?iso-2022-jp?B?Sm9obnNvbiBDSCBDaGVuICgbJEJERD48Ui4bKEIp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Scott Wood <scottwood@freescale.com>
Subject: RE: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
Thread-Topic: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
Thread-Index: AQHWXKQ1iSSgQh4Y6UGMkRd+5h1jW6kP00MA
Date:   Mon, 20 Jul 2020 03:46:15 +0000
Message-ID: <HK2PR01MB32812019FB4521DC22313B10FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <20200717214036.67fa5379@canb.auug.org.au>
        <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
 <20200718113853.6bd63897@canb.auug.org.au>
In-Reply-To: <20200718113853.6bd63897@canb.auug.org.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff539962-4a2c-4f01-6803-08d82c5f7473
x-ms-traffictypediagnostic: HK2PR01MB3394:
x-microsoft-antispam-prvs: <HK2PR01MB33948810D5DBFCB22785FB51FA7B0@HK2PR01MB3394.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMc/gfyo30y82V1p1jN2w513PGlubAJyeIY0y4M3ZOG6ekqiN70Erdi4DvlimY2QAmJttZuIbqAKVC//mWNuva2P2/t+VjH9wnoPA9Ym8WhRjsN2A1KISqTERUTHDGeizv/ptIwWxtFxfh6swMKcF4DrJntjmNfvFSi0HEFb49qbw2TSRYeWEzsiNfOAf1gfnn/GobUVi1Zak56AJH3xxlWS5v9YLTTxImhzSHmyZuVb60RgxCggjlIbAAWQT0OtnSEjLYA7t0VMePFnD9IMXs8TBZfcg1QO9fRaikjxfte0+CiCxRRGDPR+XxFkHnQVp7IBxUBdCUXA9jaQVP37lA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(26005)(85182001)(478600001)(71200400001)(186003)(86362001)(110136005)(5660300002)(2906002)(4326008)(8676002)(66946007)(316002)(76116006)(66446008)(66476007)(64756008)(66556008)(33656002)(52536014)(6506007)(54906003)(8936002)(53546011)(9686003)(55016002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HnQGPVZLQPkt0Ymn5cFka/6Bm/9AY7gWByultUV5xeqxojmmQ7wANc6eroH+sfRgISq4boEIatCuCFEmQ5NN2Vi58V8qzlVbPjH4TlXD3Hpc4M1vA1i/cRXVVP87VVw8fArhD/EE/0z31oFKrXkJSOEDh3orpnAFZ3tE9zm54QRr0CaTYwICfVoRoGcjyRuBhs7PbRb918ZlPLUR7m7WLcB/ZsAKwliG7P/YZ1vmXn7ew/CtlYzwpahnMNokFC7N7iTheIJ7cOrvyWOTg/Lpv628mutpmVEmHUSWEr0jflms4iptOKduNTngmF0oY0pQ456/MhnmVFObVtayceL9uwgMy4fDHVlPeUn6dmKYHvrPrtcscWLrA5X2XPKChnrheP+4lZgDoyN6pHeiJXAbHBRzqatVShiG4UXrCDwtyG6YZthYMyCcS9WPdbuCd1bWtY7Qpdaln63HiyUxDcj+2PngNa+KgbjiQVjgAs/2fNM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff539962-4a2c-4f01-6803-08d82c5f7473
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 03:46:15.8631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxh0tT6oACoybb4ezZnanlkAdBnaT5YsmXag5BG4IdI+ceyxLQ5ARq39EYnXZr8AZFEJOdPUpikTHN/iDW5j/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3394
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Stephen,=20

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Saturday, July 18, 2020 9:39 AM
> To: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Ma=
iling
> List <linux-kernel@vger.kernel.org>; linux-rtc@vger.kernel.org; Alessandr=
o
> Zummo <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Scott Wood <scottwood@freescale.com>;
> Johnson CH Chen (=1B$BDD><R.=1B(B) <JohnsonCH.Chen@moxa.com>
> Subject: Re: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
>=20
> Hi Randy,
>=20
> [Please trim your emails a bit more, thanks]
>=20
> On Fri, 17 Jul 2020 09:49:05 -0700 Randy Dunlap <rdunlap@infradead.org>
> wrote:
> > on x86_64:
> > # CONFIG_WATCHDOG is not set
> >

Thanks for your information.

It seems RTC_DRV_DS1374_WDT should be depended on RTC_DRV_DS1374 && WATCHDO=
G_CORE. Otherwise error will happen if RTC_DRV_DS1374_WDT is enabled but WA=
TCHDOG_CORE not. I'll put this into v5 if there are no other suggestions.

Should I add " Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>" into v=
5? So many thanks!

> > ld: drivers/rtc/rtc-ds1374.o: in function `ds1374_probe':
> > rtc-ds1374.c:(.text+0x736): undefined reference to
> `watchdog_init_timeout'
> > ld: rtc-ds1374.c:(.text+0x77e): undefined reference to
> `devm_watchdog_register_device'
>=20
> Caused by commit
>=20
>   d3de4beb14a8 ("rtc: ds1374: wdt: Use watchdog core for watchdog
> part")
>=20
> from the rtc tree.
> --
> Cheers,
> Stephen Rothwell

Best regards,
Johnson
