Return-Path: <linux-rtc+bounces-6429-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAb6Kzr97mk42wAAu9opvQ
	(envelope-from <linux-rtc+bounces-6429-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 08:07:54 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085346D6C7
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 08:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9E4C3001FE8
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Apr 2026 06:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE13D36BCED;
	Mon, 27 Apr 2026 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qMF8Jtje"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0433B97F;
	Mon, 27 Apr 2026 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270071; cv=fail; b=eUiWnKs7S9bJuubqA1cFABvc+kZ6xJ8yUJAzuF9qJ9ej5SDI0DkYMkUOgfYIPGmUJ0w6eMPCRRalRs/NT3Vsg7G07+ETyjwF17jXqgSe8o88ZmFplOgct8YU0f1YJk36H2fequFPMHXD9nJztSaW9FY5NUDjfegb820sF1LF8OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270071; c=relaxed/simple;
	bh=2HL1fNyqHu4GpWZMKa0ESuTrjUD4PIXJSZYIMWnDMF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=StUNfVc/i3FIUhBdHPxr0+ZgPP+7h+Sd5Ug57WQT24hIVq6lITrIGh7rmsUnLIO+lcRS2SUDECPNV1OU6ce7D6jipneRS0Fv6/RMhYwsKu2s+6SJvgI/ZwRKBVnS7HJ6P39LpZsxCqlStLjDlgCn+zgkanOL+sS+j/mwrhOqhJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qMF8Jtje; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqNWkh9d2WRD3Udr7unc7+WYvRDsanZeh0Cc5eKzSImGw797CieXZ5XKjbCiw9xdaD9aeZGy1gxG37ly0Ivpu/KoNLZ+SELHlWHGskatJtWUUCFcKAwWpkki2YkP8o5VqqNpu+j1EdXHps9l/2NTnY2wpTujohUoqSFF9ZVvKzxzD7EtZhvs71TH9AqLtYCNy2VK9BAkxuQOAMCJQ3xVhKkz2pkF/wragb08s1egG8VCLXG7uvnirXP4D5KS2srXfBkp+n6ZI1H/ThAxIeM9OOC/jzOZg2b3nVwLc+pWKGAafyeSdCIzL34Iph6lJa1i79Ed3dEqGJXrALvD7hFllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HL1fNyqHu4GpWZMKa0ESuTrjUD4PIXJSZYIMWnDMF8=;
 b=RhrFIjzSnPrC9Up0E4F+rap/ODjlmcqKqagfVMbFemXm3HoPoF6S3ToQo2xzKjoCsnB9MGvqWhu3RPA9eSFKntkEflO5bEYypBlCrfcN2DmcGbI758WMh1wXs+KxAifqoy5o7Xh1tbmtYRYgUbO0Z8REoB7y9CqzadOkTiC/I+Vp6jczInlDEPf5Kxkgj3n5UBxRMluQPVQtotKvP9KKC5PJphuaGmXPc6Eopyzyh1thrzKEvSEG+Dnanpx36XUyVDV9F1RDgIzK05gIFUPoVkg2MIYJKN6aiHpzGn4nE0C/lm/bDgx1/KLj3X3QBcJUdSt4J01x1ynXAvQ8zsWJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HL1fNyqHu4GpWZMKa0ESuTrjUD4PIXJSZYIMWnDMF8=;
 b=qMF8Jtje8TjCrjPvYOpwEEAOKXMIbRdCirbmlhgdurE9KJzfV6289RmTbJpS2EmV+iMqLWWZ0o+SPTeZz4lNrYpmRlYrgcBMleaGDsB3vKAhG1Gj3+RVALpH0rf+JokQDz0+mxOQDEKP8R6SxqwmDdOBYul/aZEYLWPrSty94dM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15454.jpnprd01.prod.outlook.com (2603:1096:405:270::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 27 Apr
 2026 06:07:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 06:07:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: John Madieu <john.madieu.xa@bp.renesas.com>, "ryan@bluewatersys.com"
	<ryan@bluewatersys.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "m.grzeschik@pengutronix.de"
	<m.grzeschik@pengutronix.de>, "Denis.Osterland@diehl.com"
	<Denis.Osterland@diehl.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "open list:PIN CONTROLLER - RENESAS"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Topic: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Index: AQHc1MttLmzg7LlcnkKheBUo3vItcLXv+ikwgAAhPYCAAlDzgA==
Date: Mon, 27 Apr 2026 06:07:46 +0000
Message-ID:
 <TY3PR01MB1134640F5189C4EE71F93D59086362@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134607A936EAE3F7F2185D3086282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <202604251836574d655eb1@mail.local>
In-Reply-To: <202604251836574d655eb1@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15454:EE_
x-ms-office365-filtering-correlation-id: 3453d209-72f5-4d44-8fc9-08dea4234d65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 gUly4EjvBTxke7X1qGJun2Ht8k250XEIg/mpmNlyP0NRyqfqXLKAK6+mx6l7joyZ/Wwr7WxoSpWbrAeXPz9mYlmnQGoHyfdFdl/IXUsOkrul3s5FDYUnD5yr+fFYjj/9be7wHgTbb1pYmQNr4SJatDfwoM12h5VaMFHDqPrG9QcPyioLAb0yxVV3recu/9qGghL6TCfIytZVCAcoznAapWOJFpuVgzTs73OputTFOK1pweNtF48urCC9bbTHDZ8y0PYo5lXAI9SChhqRQUI1PnK6R47FvEGZwqrBjJvtfgx5hGJNiw1yt+2NsGjUObGF0pcYOTjeFy7HvipYk2jfgZ60sZHlw7iPCAWp0BisuEDHILhv3qQ5wvnO7DgBfWTwjz2JvLkXqU3k5kU+GqtVN03jq9UzVBZxE5TlLLZ+8BxgQkUSCBzKsJOf93cVk5jRe0+VCPITdeNlxbTu7ZIfOn8yf9NcDabKt6X91wlBbYyzNo5fqygX55IF7o7Ios69dT8PrAV2qo52AMeNB3VS8EGlZTantfcVqPAaCKB7WlQtT8r1SDDXvPHM/S2pX16zw/PwOHUPzw+VUkBIyqYvi3XYtXVHZOt1rkS99YZvBldjmJXvgyZXH48AdTwQmTXRbgs+KequyAjPj3+zpCVHqzfTIIcUW9O/OC/q/YEB8mLg2HdHbjC59OXZ3zqRRhxj2OWpsMP+ZzJkQWgtC283bPH4GzZFkobOLTvp5khYmv7Vl5iSd4eCrSeNZhrAkDIg1wg/0+M6iKEXzwYe+tsKE/6X/dHBteJNwQZRToO53nk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jTwkfKVRoHXRlmDl4PRfzYsmo3aehtmL0bbXJaePIpVqvmg7vl1KVOqhNpzF?=
 =?us-ascii?Q?CabxFw+zvOI4IQy8pR7mgJuyOcNd+spv53KCcDMxtE1ZekG5QvUsFdOlESl1?=
 =?us-ascii?Q?kE6O1V+Pu6v3c8BFiRvN5M7HndeD9gBQyI8Yd535eINYwd+sJCpBJEtDc2YL?=
 =?us-ascii?Q?b3vd9YlT2pzKZjkHjXKdO0xTJ2frc2TBELolcTSl+B2wQVzjHCGo9j/3y0Qr?=
 =?us-ascii?Q?TnBN9fzJp6/jmotzbI63SefJNW8PR/MZkUjnU7fT2n3K1X1ny7mHCZ4hAGcS?=
 =?us-ascii?Q?nqiclfp+MlabF3z6mtQLqeavTepJx9ahBPuzquK4tC0ToO+xMmRBOk+nUp0D?=
 =?us-ascii?Q?PAvFi3yCSx/zkBzY2SCm7swNVlQCEgK/+9r1LoqDvRKsveP/EIlk2LrNxeIl?=
 =?us-ascii?Q?vI+IqUsaG6MMIvzF4Xu8H74V4j1H4/p8EEypZFUmdfTgse8WGXGbAraGEOC/?=
 =?us-ascii?Q?bG5TxiNwsJlmF4zNH4Zd2gFoDDLtOLQ7889SbygS99+PCdljSyug7LKYpLlt?=
 =?us-ascii?Q?hTBdwZydIXs6pBXCW/HUgMzyY8tBiAsgQvl93HuJWrXZmGxkYufzgRT/YlOl?=
 =?us-ascii?Q?bT8xKi1iWflIuFrTmKkurCMtT1Y5bJr/QBtZFld1BaExBAsgZJYP53Cqs5A0?=
 =?us-ascii?Q?8zd9n7/i2aznbTCwmq72gf84POZq5HgWEVpd2QSytGv5o66kr+tEDrDj4NiW?=
 =?us-ascii?Q?cNJ/vqIvNyZrbgSXUSwumAzi8X+TkTXDk6jVvoHSqryKOLBlYFoYpWgixzvH?=
 =?us-ascii?Q?gqhNd44fFWgDusbyOU3sbXnet0owtyBc5fK2i+NYbxR4q817zonRFgGDLc1o?=
 =?us-ascii?Q?/mPSra7NQP58pkvYchTtMYZyUMTicUVVJ5YimPkffPxdkeaPaIJ2XUU9FW8B?=
 =?us-ascii?Q?XbjiWOzLsnp1AXKpzUK++WoAG7yxo9Fx2Fr/yWgSk9VFQkhz204S2zsoQr64?=
 =?us-ascii?Q?fz2XoCIMcO8C7nWJ71V7g4DumLsNo0lMqdd8bQwkYZI5PNMlQF+jyDGbKD2D?=
 =?us-ascii?Q?/7bCq6XsFpv7mad7xpchgHK83XHZ1ACyuwY8w+mkliFyzjpEgQuv98lVwmxa?=
 =?us-ascii?Q?99oz4pTVEj+uldJC5krkzk/IiwPE4a1RiMU6PgtfyVQaKFMRuxo0+ya9CjCN?=
 =?us-ascii?Q?iaY9rtipEnqO+k6t2ZW3vLXu6WqmRuBS3NeR4FwnKdHsAm+5UNSbZ8qiv0zF?=
 =?us-ascii?Q?wOdQ2/8QmtAak+wdjpk635XUmOqiZ/YdXSRV4akR2JyESIX6hPMdx7r7+tCJ?=
 =?us-ascii?Q?DP/4dpEEfppfSHlZw3lSPL7uLTOpCTORJ1Bdeq5XJ3eDEBmLZD0NDJt+HxLF?=
 =?us-ascii?Q?b74V3FzbUUwSbXWooAy2BM8ovSz5mg6vwBj7lWYCjSH2xKTswCeTAc0ar+vf?=
 =?us-ascii?Q?ti9inauZIFq+dd1FTO7BMUBagRpieau/khZZXy7lhXs073VyM9OgLnCnlKBa?=
 =?us-ascii?Q?cyi6p7asiAyH38gAMQZf75sQva3di0Z2P+saqcrUG2TnjhTiqYPH8hoCUWB/?=
 =?us-ascii?Q?eWHGUyf8uee9ZABoXcOlORCs0aWajam8SP+NWSe9zBHSw/TVV/wMJ6gQm+Oc?=
 =?us-ascii?Q?u2afHn3owAZft7Ri6VeHpUf7XT5Dh+0sbpjOMCHYwsOpxyAIhHWpgS9LbwX7?=
 =?us-ascii?Q?ZlIZ75Zsmn/Bpyzks8aRrvqPBvoRpy0gg19KKklaMAYekGCKkUUrkpiV8wg5?=
 =?us-ascii?Q?EgAkPcYtjRp7N8iPPtG5vENexayN7NgXXghRxQ9kk7gXDhCoT28EOL31twFg?=
 =?us-ascii?Q?v4yMR7vPxQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3453d209-72f5-4d44-8fc9-08dea4234d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 06:07:46.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKxVyuHZyDv0YVvt7vRRb7tBzqJvj7caXrr6WwVGW7Hs5zJYi045zgHuF/c6Zuyc1XBqwJ/84iteNZ5xXMqmp8RuktX0o3mFFlIE9fE6/KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15454
X-Rspamd-Queue-Id: 8085346D6C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6429-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ozlabs.org:url]

Hi Alexandre Belloni,

Thanks for the feedback.

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: 25 April 2026 19:37
> Subject: Re: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with dis=
able_irq_wake() on cleanup
>=20
> On 25/04/2026 16:39:16+0000, Biju Das wrote:
> > Hi John,
> >
> > > -----Original Message-----
> > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Sent: 25 April 2026 16:50
> > > Subject: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
> > > disable_irq_wake() on cleanup
> > >
> > > isl1208_setup_irq() calls enable_irq_wake() after a successful IRQ
> > > request, but the driver has no remove path that balances it.
> > > The driver is devm-only, so on unbind devm releases the IRQ - but
> > > enable_irq_wake() is not undone by IRQ release, so the wake count for=
 that IRQ stays incremented.
> > >
> > > Each rebind therefore leaks one wake reference; the leak doubles for
> > > the chip variant that has a separate evdet IRQ, since
> > > isl1208_setup_irq() is then called twice during probe.
> >
> > Is removal of RTC device possible [1]?
> >
> > [1]
> > https://patchwork.ozlabs.org/project/rtc-linux/patch/20230922081208.26
> > 334-1-biju.das.jz@bp.renesas.com/#3195765
> >
>=20
> I'd say yes if this is not the RTC that is backing alarmtimer or alarmtim=
er is not compiled in the
> kernel.

obj-y +=3D timeconv.o timecounter.o alarmtimer.o

Alarm timer is always compiled.

Now, On RZ/G3E SMARC EVK, only single RTC that have backing
alarmtimer support. On this platform, it cannot wake up the device
from deepsleep on RTC ALARM. But it can do timekeeping.

Cheers,
Biju


