Return-Path: <linux-rtc+bounces-6422-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X+ysF9v27GkJeAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6422-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 19:16:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F81466FBD
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 19:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 454F03008211
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C23135AC2F;
	Sat, 25 Apr 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t0CFjqcx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246D234F489;
	Sat, 25 Apr 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777137367; cv=fail; b=tmTnxYq22Z6aVf61wJfOZcCg4D+JCnRq5s9WQ1HwanBa16gqoYIfeX1sbm25eHan75rYDAZZT2N0yrRqUb69KRm+GFMB8IaGBdNDBW7dR6KIgI3qU+H4rFCzz0P280ZkyzJkT3JfqfuQ9WH0o3uDCFSzyuks9z12rawqR/03drw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777137367; c=relaxed/simple;
	bh=TiH9ndzZ/tqLs3VwKBI2PiWDj3URHFORlicajGgIGGk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ccRfVw4MReozPlVj7sF9is2H1u3wBdbmReYTwymUPh3NLgCl+Chkgy1PhLL0JZx6xTBHqmRKUkvuaeoKPTGmkbq5/YZqNWQLzLbOp6fC3axJPBuw3IZ8a2ngLcmlESDsMligreDKT85tWNFH7rc1V997Bss0lCzQF81MfM+lSGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t0CFjqcx; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmrOIVxaxWajnR3Vef2DBHkKxvl3ODw0AY2vGQ30DQmY3bd+YFXIuNbwNRRkwWC/ft8sOJoEQYJmAEeondN2BxPhuP5hpdQ/bQsNzeRIneCl2z0k74Q2DzDCpbXvQRqGssTeONOTLgi20eAWlT/WgqygrdooJ2b8GhvdiyMNwn+OjLlI7iEOST6PN8otoxwmW3J/+OkrP8FAAonUftWoChwpdDEjRnGAe16AI3IsMHhDUuT4o7CS5TBpmqto88GbeEknsNXHZpZKF18mt6j6lcF9aLwyEjWpz0Zj1yY224qlfFuUPiH7E5HxbE4321OavsYAeZ7YMuwryY6Uaw124Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDivjbGAMdy3k6rG53QEG37bzIOkTdh5vDRf2Df3pfo=;
 b=MKqWyk5bcVgSMr8r5BXL+kFuIlTKr3uQLR8dmQj4JE0xXxyKV3BdqvMW4z+aFnFk6iNe/Xd8mHwncEoNy7ePvBebDOFISdkx48jPXr1qyH1Q8JFs+FMzgcjwDva2aavUMBTZSnQhgaVKIHfik6ERisTSNUOfOHVbmOT8hMJ3fgITuT7tW6gMphCehXnY1hmeioaYvSm7Ccum396zVUIZGGlry1UO/lIYmPaRTJPUV12acCCPMdlV+6CeSly0A/CqpVaHVUeeZVbAwpUtHBEye0V3H8P8l9Rhy6hMXkWLyOuAu06vUnr1iv/MTy4fDuS1udnjvYPEMjC5YP4ocL0srA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDivjbGAMdy3k6rG53QEG37bzIOkTdh5vDRf2Df3pfo=;
 b=t0CFjqcxONVfvZps9pZrvjZv5jw5wHHnT89Rovcf9gwyhaJzCnh08NPzpsXOmsTS5ZZ2L03l7UHd3zZdIUgxIlvSvJNHIUwGBQAWqeoigInF8TVRzZMYjcmbkzPQGLWLIcIXCg0uIOOP2sv8iqhbhaNejbeFI4OW0v7Cvcuwkws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10341.jpnprd01.prod.outlook.com (2603:1096:604:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 17:16:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 17:16:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Denis.Osterland@diehl.com" <Denis.Osterland@diehl.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in
 IRQ handler
Thread-Topic: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in
 IRQ handler
Thread-Index: AQHc1MtpASnRMIE8KkmYq1oUowxYhrXwA9Iw
Date: Sat, 25 Apr 2026 17:16:02 +0000
Message-ID:
 <TY3PR01MB1134639F6A3A38551180B626386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260425154959.2796261-2-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10341:EE_
x-ms-office365-filtering-correlation-id: 236ee80a-f115-447a-21fe-08dea2ee53ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 2S/7yljFeccpLEzCyRpAS2MfzCt6gV2wpo53ZRHNQSBa96QRz6V3w5qWQ73VHb2bubwOSnCjJq6bYbUPmR+GhDdSDXez3nwDqp561Ruv/E9W5+B3QDknvf7IR2pkE6gJo16BjKi6igNjacJt96ry76J5b5GhzyDtj5cyReYrg7J+ButpAht28XTVHgYW7zaU4LQ9LXHXcGLyVE/3U/MZwAd9aB3mdlXPLH9iEkahedjkscSZUaCVW5Z4u0KyAbYpvvJaB3yBVqHTzAGbO9RCdzcObs8gTJq9kPbborbjtVi2wzJkj9EjA3grfda/zbKkxWHqM1JeKr1VZ3z1qPcw49NpZwv+dp1HydFcUbnz/gpsAoIgyxp1XF6B5p3BUsKC0kMBHQhoxfOUC2eLexCPzdyiOWKoCICIJpvYAttwEVAHKR6ChIlpVuoU2Ezd9/U7sVBHuCtyKaM4hQQfQ0EA0wk0K7hR5tnshm+C2ga8mC+B9MsHzE2yJ4BRBTi1ccH/YoNZmkdrD4v6ftMuTqvrAigzy3mIvxK6yXoLbqllBHTC+pOPB+KL+28ZCDosP0hOPukfizGi6g0vk97ZjW0Vq/r/WWUH2OTccCSmWmBQvukKP09olCK0IEHiig4Fx8WtHyimqWSEi6LCldF0j2wFRetoJaSe6k0ZzMQIq0g80DZl7QwWy5Yna0JNUDmFMwdg5n5b1Bnz7GuhIumcQCpkU5zw7RaFdVNNLlnnKoXmPUdRWW4tS/aRLIQKy4Zmpr7uwF5JBxnmJ9pjCHk3oN/dra8IHmlLbDRJ4z7+Ean4O+k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+jxvJKQ0ogwrem/wA0v9e2FyN+ibfGPIgxAGowxdPYHQvd+qS0wuuZo2SASH?=
 =?us-ascii?Q?RuUDlLkdhA6qLFs+jNnDOVSSFUtU+47fYZ3xrtJm+WSD1SXPZZPGy7uf18xL?=
 =?us-ascii?Q?24tLoUcCWJe5OINkh7JoB04NRHYN0GMtWiCddX7uL1MSc3EO1WFa5ekPbYaV?=
 =?us-ascii?Q?nKmyUdHvyJIaRA0f73d+t5qTY3zwaZExWaVgrWc4H5dsD87sXTd4m7ac16N1?=
 =?us-ascii?Q?ibkMMrmG53kzMrB/I7SeazFGZky/McwjDdxhU/M4Tw1MIB50PUogvCPtBn36?=
 =?us-ascii?Q?QEieTuQCDMsOsm07g9BTr4oYoY/u4qPHIxM0tf/Pmnvnq111yru5GW5il14I?=
 =?us-ascii?Q?eVO6r00D7c2L7O6meVCQq64i9hEkqISD5cjNYC+/pc6ys0oU7pA7WnGy0OAT?=
 =?us-ascii?Q?qz5fhJMfbu0/4YCFwfHAWLCuWF7iG5PE7XTYyzYhNglD5YW597QtdUNOWOV2?=
 =?us-ascii?Q?sbQJShK48OK3IORn8VNik4+iynwTUOWIQ3JXNA4S3eDy2JzanOD1AnYLjx3b?=
 =?us-ascii?Q?W/Z6rUF5spP98KceT4b9SJJG74Z46bBAL2LNQuvnC0/AL9GxJyErrUC7+TkI?=
 =?us-ascii?Q?0JPZJf9H99+LfJBh3IebJ4JAEyyb9utXAdcuzAa9bhTjnFqhHYxpX+CfDAdt?=
 =?us-ascii?Q?ex+mNqrl8Fhn+Fa9wqX0wB+Pjr4K4vLODenlA3SAEDnba+cpVzfnIkYH6Mtg?=
 =?us-ascii?Q?15pMNiaMtiYm9hd5l8Y+F2f0HlGSnmduj9bMTXmAy+faDnsQizg+VcnqO2X/?=
 =?us-ascii?Q?v9SMVFfXN8qG46tIXmRxLGWGF8lB7Wwk3eIuOKJEPcyLIWEFqk1y0pzkDRJT?=
 =?us-ascii?Q?4N7RkAGjSR+Lr5DNDmupqcZ1PyIWvU26qWbDFElyhFoJtTAVLRuOUcwaVyEM?=
 =?us-ascii?Q?UVq94P0PieyG/d/qu030oud414wFow5e4sY6jMRxGpQNn99nMlCHXKGXpabP?=
 =?us-ascii?Q?kmph1fB79gYUJ+X2rMMq7t64IfcumKjyLBQ63/Ky8P3ztAhTXEOoWgwqWmtW?=
 =?us-ascii?Q?v85hSYixzAAisasU8x8E3RtGpZFSBx2MXqMK/eaIFF4P1Od7khM2criMdUCI?=
 =?us-ascii?Q?TjitQ24q1Dd9eMK+OlLHFV13gfrIGsgk53zhW8wMKgbNbfUs0AKxWmcLsh3c?=
 =?us-ascii?Q?YlL6bIzb3RhzLb+6ASI3nAP9F36EGKD4Mmv6pnh2Txg5OmbBeShTVGSvKeG2?=
 =?us-ascii?Q?VFXoLXOopLPmf3wHbJS+tqOo/kpQjKlr94VECrre7rk5vQiBU9prHbJmjh21?=
 =?us-ascii?Q?bnDytuSYkU3SZ4bnX/F/ArC0e4euLIRRDDzHuMCm2GV12ziFVA2QQIOp9C7v?=
 =?us-ascii?Q?Me0OHcFzu1z0xLt3JTjH0V0+cuWNQGYeRzR+u8EuSag5NrsINGvBCgpa4pTB?=
 =?us-ascii?Q?ueQnDKwbqzgSYD+dOEeIdZwkIV4tL16NqfHwmJEPTIo9N0VW4u/bc+LK7KjG?=
 =?us-ascii?Q?S6LfaCB2hcR1SB3D7E6p8TlrrEk0p3TgdZvd2VFt0+r1yNoPNUTR2kpopLHC?=
 =?us-ascii?Q?yKWwmpNEa1MVNAPVLxa1F0G++uXjWa4w94SKpg0V9D0iaIxlTfMLCfUXtrbR?=
 =?us-ascii?Q?6jfWxVZD4A94klYJzIEn2yevJuhNq6sV1fRM4y13C0LS33ioKsS3QSQew52X?=
 =?us-ascii?Q?JSNRj4LJIJWwq6XzMWsD29IWL9JNOPwzsjS1tQ7hpYUvG85dJwquqUNYPjK/?=
 =?us-ascii?Q?7aPFDUAMXnw/dfrFwHM3S+pDeYp/hcgrXE7MeTSMoc9Pji9jFZIx52aUx69c?=
 =?us-ascii?Q?gXKWifgIvw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236ee80a-f115-447a-21fe-08dea2ee53ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 17:16:02.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMvH4jXJV/V6xD+Rjnb52FikhRo96/D+fjD69zNbuODLOGLpEcJ67hJgPmY9Lmwn/uRrXF6rYVRWz8ajmv2gkbsDcdRXjL9Rx9FhROA8t2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10341
X-Rspamd-Queue-Id: A0F81466FBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6422-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 25 April 2026 16:50
> Subject: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in =
IRQ handler
>=20
> isl1208_rtc_interrupt() is of irqreturn_t type but two paths return a neg=
ative i2c errno instead of an
> IRQ_* value:
>=20
>   - The SR-poll loop on timeout: `return sr;`
>   - The post-alarm cleanup path: `return err;`
>=20
> genirq's note_interrupt() casts the return to unsigned int and flags any =
value above
> IRQ_HANDLED|IRQ_WAKE_THREAD as a bogus return, logging "irq event N: bogu=
s return value X" each time it
> happens.
>=20
> Return IRQ_NONE when the SR read failed (no progress, can't claim the int=
errupt) and IRQ_HANDLED when
> toggle_alarm failed.
>=20
> Fixes: cf044f0ed526 ("drivers/rtc/rtc-isl1208.c: add alarm support")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  drivers/rtc/rtc-isl1208.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c index =
f71a6bb77b2a..c93998c53e7a
> 100644
> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -654,7 +654,7 @@ isl1208_rtc_interrupt(int irq, void *data)
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(&client->dev, "%s: reading SR failed\n",
>  				__func__);
> -			return sr;
> +			return IRQ_NONE;

Maybe you can use a goto statement?? that will take care of handled IRQ's

		goto err_irq:

err_irq:
	return handled ? IRQ_HANDLED : IRQ_NONE;

>  		}
>  	}
>=20
> @@ -666,7 +666,7 @@ isl1208_rtc_interrupt(int irq, void *data)
>  		/* Disable the alarm */
>  		err =3D isl1208_rtc_toggle_alarm(client, 0);
>  		if (err)
> -			return err;
> +			return IRQ_HANDLED;

Same as above.

Cheers,
Biju

>=20
>  		fsleep(275);
>=20
> --
> 2.25.1


