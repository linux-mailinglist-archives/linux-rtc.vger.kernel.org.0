Return-Path: <linux-rtc+bounces-470-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D382490D
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jan 2024 20:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0CF2830D4
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jan 2024 19:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA3E2C1A8;
	Thu,  4 Jan 2024 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RiL27NIE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0D2C19E;
	Thu,  4 Jan 2024 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtH2wfJt/kpX1SNC6DtRAnnWQn7EMSe5qgYCkqePaqAHviZsgJ/P59Fwh0QX8GDcb2idyn03C+UELCcSJnUj9RYGZyKNSM9N3QwU7i73HTHm6jJKj98TMC2O9F5Iw6USmfuQ+miZixu7fOfcNkvXp3EExDOtfQUh/bHwpq/Y1JK/7oTtxhqDRUVpTtZ1TZkGI9vxXIiyeshShVJp9/SxevffisGBvB3l/V5IthImUqopyYk4Q+Gv8te7qRgdD+7VVGXh4X6+2JU9BIQbzcFkPx19XAfSuqetiDoW/9XQhSoO2YSy6Lp4pLfLGe0JikNihKzt09qWsJcubgwTZVMGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi/8m914KgebXwAPjTOEoKhtbcu6YV0m4AvAv/DIQzI=;
 b=nKvdPpq3OxIgJeEecaX6w9nFqiQ7EkllbQhC+ng9+u9vwJRUn1zO+Oz4e42CJxCMPFRZ/arzSgghyYSirWAMzDV0ay5tB8/qIaTKDx5NqVAQjg3DIeM8gZYtUJjOU54PDHlzDk1YBMhiyDbYi0IT/uDF9eLacJnRgbr4ARGT0imW2OCNbjwnSf/RvuWfGCoxA4XBofiqnkDB8A44K4e9sOgButI3k5R+5QuIyq1l1CUtoJgCIEhloBApZcpOUJQRaUUu7W/5sj9AEw7jFsWm6xNbF7Uq09Gda6I012Fqw0Qdet9bmb2MY4iEr2vpasKvsTUEhddJXgQJ8kY3hmfc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi/8m914KgebXwAPjTOEoKhtbcu6YV0m4AvAv/DIQzI=;
 b=RiL27NIEE5BDHrnwJuIAYyeV6zPYAOR6/mvyi0LOqnjVet26wPgOmnwFDBJ8jPaPYDFv4NALFjhZD+0rHp3Uo7TJbmRnOFN0STOo4bRVLXLsbuAJIbVNW7SbhFCtTlcjFLtQOfUDG106UMBR17VhJXQn6rOSbP5pmci1hsIrHho=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11019.jpnprd01.prod.outlook.com
 (2603:1096:400:390::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9; Thu, 4 Jan
 2024 19:31:32 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 19:31:32 +0000
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
 AQHaJEbIMKcu/jSjKEOPN5GP9OdxM7CUZzQAgAADWnCAACCjAIAABShQgAAEnoCAAAHkEIAczLoAgBjcSvA=
Date: Thu, 4 Jan 2024 19:31:32 +0000
Message-ID:
 <TYCPR01MB112695EE120985DAD1ADCE0F486672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <202312011520103c5f28dc@mail.local>
 <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <202312011555095065168a@mail.local>
 <TYCPR01MB11269531DC2A3ACF0A78FD8AE8681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20231219234956fd65a895@mail.local>
In-Reply-To: <20231219234956fd65a895@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11019:EE_
x-ms-office365-filtering-correlation-id: a4ede18b-3eb4-42c7-4fc2-08dc0d5bc1e2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 m/rSlujzLtAapGWjtaBG1eVCJgavxqpJOsH+79j9WAd096CJY8u2lvNQHyjRS6NLbpZyKfckZtZmm9BXX6lGRxl35qlDBYgN7xYBf9ohKD0Y+Pvo08P5wPXNh/zZb1R0hDKI2MtS1VAESlmEc3fp26oAGC95PQwDQpkNibK9ew2c4kX6uJeOzCQa9X77voI5mZma+94/Km/nABslgx5DyYjQCR1gwUdNVEE1jTkeY1GaxwcUM5Xa+SogHMoX057kIzaXy5rKBTE+Dc096VQHzpUwpWELkD5NoL27h2u/Vk3pOORb4L4YcAheZR0ES5Y+iGHi9kREWVHSpNG36bzOvNaJiknFEGmgkoAaYCn7+XlCTs8t4e7NIF4mKC7lC3BgV/R2wSaTIeFuZeis4JAK9lnz4+ex6gcA5/kKBUZkDSp6pnWDI89cLFuISKqBWF8ALp6di1JHZcm7OSuYSk6JH0C0Q2QWN4dC5hQmHLPPzamPPT6veGyloawwBUOWIlOjmwb8TuguRBjs/tVo5MSPFOoNYd36He3UyuMIRqs0bXUEd38cK8OeBmJRkAoUgfAb0BrjtArbTxfZ2Y2B7eUmWRR2JL0xAGz+6creH7LCMkyjTgavpkIToSwB8DvlWnXx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(478600001)(7696005)(71200400001)(33656002)(86362001)(53546011)(6506007)(9686003)(8936002)(8676002)(41300700001)(54906003)(76116006)(316002)(66946007)(66556008)(66476007)(64756008)(6916009)(66446008)(122000001)(38100700002)(83380400001)(4326008)(38070700009)(52536014)(55016003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oU2j+ZJSR9Hl4XJgOEyzBp5UaWoHnvIUfQcrF2qZ/F1GZMjLlejJ09+9ME/O?=
 =?us-ascii?Q?Nc/KPlJDNIxMp9MNr3LbcpDrjCTAdOE5aR5tReFp86Al8GzrhW0MJENeoFKV?=
 =?us-ascii?Q?v2F0hZGNw3RS2zL3DoHzHr6gMRAFp+gi5JpCnRFZwvz+FL4Ksuwd4lW905Xf?=
 =?us-ascii?Q?XyYMrpX3cJ9rgW3iRuP+qVQf8RA5M32QRHGqPzvaKw7uMjMuzPTa1ns2Y9c2?=
 =?us-ascii?Q?d45bgCrsZ5z956CzztsRISHpdpUto3tyo2J0GUEPeio78td/YsUQU4wuMZ6U?=
 =?us-ascii?Q?I5sm2TYS4EHboTp3r+kFQ52G/GcEQjCgUzqdJSPw5zZ8EDc3g5f2u2Rf/hcM?=
 =?us-ascii?Q?rolAdLKT+fxVxCPsnRwK4WZMFnj8bHQ+uXBQLAHcYUl4WZ0y76LF2PJ0BL9h?=
 =?us-ascii?Q?YVU0U23ldXrRqAIsSpsssZe7e8lYs3MR5/Mgn6wnieuHy8nKNH2DCS5IHDeR?=
 =?us-ascii?Q?hdzCtb6RWygYWyXQfcC/igfFbeC5U0t31BK8vFcrloyRQpG8e46y2hkslkoG?=
 =?us-ascii?Q?iH/cTgqeU+I3ojtRwE9T3MUvjz3K6da77DQV3ccNKc401GtY9b3hnraUUcTd?=
 =?us-ascii?Q?+f1R/vEoUP+EOm9P3uqbpZY6f4WvxSr0nwMxN78wsRIa+7GF1yhTXz8a6BRB?=
 =?us-ascii?Q?qNVOKxw4apXi1u65mh3vnRS+y29mltq+JipQ78SVIPPiZypZq3uLOcm2LEvU?=
 =?us-ascii?Q?Jgs+cYYsTm0GT6EsXC19FtxCEG5ikQNNoPXhfDKBlLxMKpXiSoKubRo9xZgd?=
 =?us-ascii?Q?TLJ3IVrP2F0xrvZOXIQerbatuqJwqqQ38X0wEbqsUBoKG7fwPT4627OL/myu?=
 =?us-ascii?Q?zENAz7Jp0dREG2YuJKiRZ1Ig5bLoalyWqcvTq32s9jaLqkLQABzZ4mlcVx77?=
 =?us-ascii?Q?0i9gAnibpshSzStzfRTYmswBODXYtCbgh4QhozU0AFlRjnKtN5eaDqxVyY0a?=
 =?us-ascii?Q?BP7g9/47QpY5wbIIQMUhAcH6NrNK6snlHuJt63aZzIUuz183TRaFHsj4uAjO?=
 =?us-ascii?Q?bx5X6IN+pLq0715eDpJ6dBAh2upKXV14ynEVxlMaI8U+Lk7tNdB4h1tQ/QWh?=
 =?us-ascii?Q?1lZVrrG7Fj5FlIA5k5dR7mw2ikZ9B8hRDMeZA/VxCSCJ7LNylllmm431pSj4?=
 =?us-ascii?Q?vCZ1qqQihxmMKJbeyN/bgxgiP5cvlDplqWwWCf24Oko0yQrlOHLeX5fB4p3o?=
 =?us-ascii?Q?wub/A197uNcJOVokkXXQRjVbKzmi3LnPVhaLD+yYSJ7egRUafQqa4T/U1aQL?=
 =?us-ascii?Q?402IraOER98wQi/j+U/N1QtxvV+Am18aLt6aT3rz9bZ5jbearrjbfa6CVUKy?=
 =?us-ascii?Q?/rssy5CgyxvjyLYpUFLUDu876o6/7CbL5kd0TgSf731NnUlJjU45TV81C6ph?=
 =?us-ascii?Q?MhkoGYLM0tU5+/d0cCAZ3XOLi6oSoElFfjcN+ezMCpbha5A3rbgosROYVGKF?=
 =?us-ascii?Q?t9W4YtKPtALY5S1Lr+HWr4R2Sa2bdyBQu/0NY/qjx1qdtHABHroCS7W5Qk5A?=
 =?us-ascii?Q?8vCA8vLIFrcEBvwXZVg7kNpTdcczqyhTP/t8TNDUYSZTLVbttiVuwgp37QF+?=
 =?us-ascii?Q?zxQsyxWKHCKyFgxtgv8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ede18b-3eb4-42c7-4fc2-08dc0d5bc1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 19:31:32.5277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSvg60PrzieLcbptuoBXgwqnYn55nWaGsqx6sa93X9dNwU0tIciuGQlvOW7vE1PuL8pwB/W6LOR7qq31O5zqW7AfARCYlYeq/WVOvAm9U74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11019

Hi Alexandre Belloni,

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Tuesday, December 19, 2023 11:50 PM
> Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
>=20
> On 01/12/2023 16:40:25+0000, Biju Das wrote:
> > > RTC_FEATURE_ALARM is what you should clear and you have to fallback
> > > to the irq is not present case.
> >
> >
> > Ok,Will update Patch#3 with clearing "RTC_FEATURE_ALARM" as the
> > fallback for the irqhandler error case
> >
> > On patch#1, I will clear both RTC_FEATURE_ALARM" and
> > "RTC_FEATURE_UPDATE_INTERRUPT",
> >
> > as with just clearing "RTC_FEATURE_ALARM", I get below error.
> >
> > root@smarc-rzg2ul:~# date -s "2023-08-06 19:30:00"
> > Sun Aug  6 19:30:00 UTC 2023
> > root@smarc-rzg2ul:~# hwclock -w
> > root@smarc-rzg2ul:~# hwclock -r
> > hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> > root@smarc-rzg2ul:~#
> >
> >
>=20
> I can't believe this is true because the rtc core code will take the same
> path when RTC_FEATURE_ALARM or RTC_FEATURE_UPDATE_INTERRUPT is
> cleared:
>=20
>=20
> RTC_FEATURE_UPDATE_INTERRUPT must be cleared only when RTC_FEATURE_ALARM
> is set.

I rechecked this with latest next and it is working with clearing RTC_FEATU=
RE_ALARM.

I will send v3 with this change.

root@smarc-rzg2ul:~# date -s "2023-08-06 19:30:00"
Sun Aug  6 19:30:00 UTC 2023
root@smarc-rzg2ul:~# hwclock -w
root@smarc-rzg2ul:~# hwclock -r
2023-08-06 19:30:11.664350+00:00
root@smarc-rzg2ul:~#

Cheers,
Biju

