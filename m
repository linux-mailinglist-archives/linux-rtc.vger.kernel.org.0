Return-Path: <linux-rtc+bounces-6426-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aORILi1Y7mnesQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6426-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 20:23:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16A46AC00
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 20:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 446123001D72
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 18:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AD8287254;
	Sun, 26 Apr 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AJyl5G+6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682B2517AC;
	Sun, 26 Apr 2026 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777227817; cv=fail; b=WAbG2dg0t3gVnswHSaISPzTiNb9HzxntlBox43HdL7M36wltu/S2UCrD53O/As8LC/omd8jmbuWDoxOw7lWj6CcHJWu1dgC5P5mExynoPXefPA6oqMRXc5FL39UExvtSbHYEvEYDheYgppUJwgumRqT7t+XlMDt7g41CIgWp7y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777227817; c=relaxed/simple;
	bh=8rzH2yznYg5MvK3GqcfSftVyKG3LJxnQ88py83PFtu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ed4Ian8yFXxlhIQx47vdrDjGPpyIoas+BB22EsIOhk3PZ89rBdiFpBrMav3Svt1UP1z3CxYEzDdWzfDx4MRJSbKzxtRShoj/kwVV41+d7WLigBKaJOLVI0cn+pitnkbVYMUbQ6j5XTkQkofdRzpp/pOdWXH9T6J3KXvfHIpih/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AJyl5G+6; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPiVtXkm2bL95Bhp6JNeWe5c0zcP6ijS4LmXrZ8zYQRpzn940h27g9IOVhPi1Pnlgc1vK2EwoTiuNx3ulEItipElC94OhnZrEdyiNif0kxaCxiK5rdXtt33BhEw+Y7l+ZdrRh2/82pFkaYDA1txuZNeDh7gKf2qg42NXSbklObPpuaKx/p4JFZTX8IyZFNjRe4z7X79E7cee3bx53kTDHaYrDNtFb7thB3YM8p8WR1wxpFhBi0nIT/bEeJdlLBX49wUDXTxNoIFdc2I6swaU20MtTvCDOb6+4U1QgtRPn+JkiZnqTfGtPfBkipw6clkmxwy4Q40/mpC+UhQVT+hTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rzH2yznYg5MvK3GqcfSftVyKG3LJxnQ88py83PFtu0=;
 b=FPj2jdF35QWuWc/xBroeyRL7iPoA/i4K3LgxT6r1Ktr5/aIbaEA51laRZ2bSZrEO6ml0/eot/bnNBMzvSYwe2HdHilPuNaSjwNYtdqmldN7rphLzIHjl5ajf2CFnmx2oWaWPkEmoRjD7s6QNags9/2Rqu9QUhd2bOrPWfBIL55u4+7xAZVN8PtgN3m4cAPvIa4OI4ohBVEw8biSoZBVs0iu50gVO5MDq6VOnXp7BYFT/LoKYP5dK5WH/IRuDoH1IY4inGczO4CIYY92dQe7Z+oa3h66EisiTuYGsr2+64rZkrIqLQ6Kg2mg/tdY5pL3ixYRZs78k70Icy6QxVNEzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rzH2yznYg5MvK3GqcfSftVyKG3LJxnQ88py83PFtu0=;
 b=AJyl5G+6yrH5YxsO7SRE+p5R6xME7zXE4PVf8uDlgsvf6usZWPOGPHUNQtwUO7okp0D1HdmawAAvV8gNFFrWlaoexqghcy75pZEy0u/UGZ9YlZAU7clqtb6JsAynmg5qhee34oB7RWfz6OjCcPJT9Blu1xwjQxlJiXorfehX1z8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB17555.jpnprd01.prod.outlook.com (2603:1096:405:34d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 26 Apr
 2026 18:23:32 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.025; Sun, 26 Apr 2026
 18:23:32 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Biju Das
	<biju.das.jz@bp.renesas.com>
CC: "ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Denis.Osterland@diehl.com" <Denis.Osterland@diehl.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Topic: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Index: AQHc1Mtq1BhckrrHH0Odq0Po+Tst1bXv+oUAgAAg4YCAAYUyUA==
Date: Sun, 26 Apr 2026 18:23:32 +0000
Message-ID:
 <TY6PR01MB173776B62474FD1456F7BCEB1FF292@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134607A936EAE3F7F2185D3086282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <202604251836574d655eb1@mail.local>
In-Reply-To: <202604251836574d655eb1@mail.local>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB17555:EE_
x-ms-office365-filtering-correlation-id: 3ee64873-b7ba-4667-b683-08dea3c0ec1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AvpH/fH8SrewMhpDR81QI7dT7Dp8SvWAnyrd1/a0nZlG/grjC/PIdH+WQw+zQfnJPxaLva0u/pfaPD/4MU1888NKElWgnZ5hwpk4m7NCBEk46WUkY20RtNq3AsGqmLLTap2GQ4F7arE+DLPQHM18eWixysP6Ky33VOATMt6U/8lXumLpvHN5zwZ7U1YKExtZ0tqXzLidPMegLy8ntI5xzi5oGKaPk5gzK3imxkiffiAPFo/kmWgUvZGrBccZP8wkaDj+vuiNPOJfdDuwWC18cQysaWWEkDgb1PHxOeI6NiRDNUpARejReR85doWQQAl15adjb2Qj78sTOme0VaAflJvUMRZZi9nOocNFvjTVAnRCfJpilm3kiEdx5vCPph3Z/BgpeNvCBTeads/IxUFIUitcIjzeS/5vlh95RIirA1AS34Iv/ED1G8jq/F4P7ktzDastqm/ZSH3xvVgpAhZtkjvdc6eiCcRX+tIFNuq4++XETw+P4YVicWjW7JspzyeTcMRFsUppSfx/Vj4+WTbdVEVPEHevAVYFDr78joqkKv3kt3guMXikPyQvM8aWX9Ko03u2CgP5MEq4P3gMH7JsnFPbVP8V/iYWuiDEEkTGvpSjSR0wI0r7OyVLXhtgzAXJJKfN3thVAgC4+SiOoUclbZGDI5cGJO0xsHFrwUvewWYWH/BqiHWILnrMZInD8ga0Y4T8/8EeluRhUaztSxXN1Cw7y5Htzw4z2qYRYnD3cPLykFrUbf1CSRUJTF1Jy1LskVXQbbpnhcteVeTDvbg7281wTv4qJhm4W5W85EjxMK8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VYrbqIMEyob+MXvw0Sg+eIt/tZ7K5IloXKSr1jX537lZScSCZEm9hnmDIEPs?=
 =?us-ascii?Q?p+AlPpwml80JIIWlWFNJun2qu+SOAf66MYIDzz7fEukiJHHHSVn3nH1jBt0o?=
 =?us-ascii?Q?I31Bodhwnu2SJD7DUO9AggG5zzeCD6GPVF2AXptpLM8Ym740XwecM6Lj16f1?=
 =?us-ascii?Q?vVOOnwSkA0RWTcHDv29qsEHu+hqBHAuX2ocW2Q0qEtYUp440WA/wMwrmGhnk?=
 =?us-ascii?Q?LhOOgYrDEqfmWzAJe1hps4QTu0LtSLElWT2y2OCrZSlJIF2jJwBsIYGjW9X9?=
 =?us-ascii?Q?h8DCrIGkr6zGrzbb3S70F/i4AHaBQdr1dez7KLW932FBbjwQ7wPfvxomcOVH?=
 =?us-ascii?Q?9JJ7+roP6KJD22iw4ggnMO6MHoPn40g3rGbi5ZanTEQMKdfDVb6t5K7G1iyu?=
 =?us-ascii?Q?15w6jZN+amm+NzJnnIamxtlLPdO8D7U2lmghpMTz7U4GPk5PQLCK7xA7rwpK?=
 =?us-ascii?Q?SiuWEVAYef7grljRIBr8EXnpEQ4BYzXjlOwY3hPu6zqYWQKOiq1bDi9NKldO?=
 =?us-ascii?Q?JWLHu4p2jAEohLH0D7Kj7soyEAJvjHjANSJKF0CN7mYRNorYu/JEAoHk9oyw?=
 =?us-ascii?Q?K6CZBY+6PmvZL0GNzwHeA7zPTQXi0l/q2IP+pItEk7T1HxU5rlumBYeYiu0g?=
 =?us-ascii?Q?2ruK3j6F05ul/Jh4VnKPOzwofrRAmE6l//owIAmB7ptkLZ6JaZ7pDbEQphbW?=
 =?us-ascii?Q?qkhO3/WMihMbhklDFDCUe9qtcT9CE86dwu8CKNFQFiXOdlUlGJTo2WQqc/lJ?=
 =?us-ascii?Q?ukAYXgDHZey6YzVQwWavpyi+oXf1CoPqysoZHnYPsSOTMxuElxojZtJ7YtWu?=
 =?us-ascii?Q?YRHpsjDDHKcdwuHXw3lSTEH7WfcetnZ/w8V1sXeLU1c6dtmpu5yqb6IgDsSF?=
 =?us-ascii?Q?NMQVSZS+NQ7qWzy0jpMhah6hyIBotffqmDhP8VcThRk+hVMVQA9OjoCfY8DI?=
 =?us-ascii?Q?LIqJucWYEV7r/sNLCWa/Q9uPfcQGyIYpy3YTtUS+ZMomfH6LX5y9u+RF86MC?=
 =?us-ascii?Q?tyX1EVhmliO+uO0mkxqJI0QhFUfHRYhB1ocV9H0TkWNRE/httKCyJ8RjoCmN?=
 =?us-ascii?Q?5J3PLYIEnpsKkjFvtW5GUgSJ85fe+Fl2UuvQQF8orcYe6DlDO8oxYNgTil+b?=
 =?us-ascii?Q?XY4lsEeOSUCnYkNunf6SrS3u0Yx5bWLQ49ZmiLt8QMNsCtpB0qjnitm+oljT?=
 =?us-ascii?Q?ZIfbQu1bLgTKfztwwM/2uxI8zQR5bfRKZKeQp6Sm/j9Jnh1aOyDhaCi8zZAu?=
 =?us-ascii?Q?jbBFTN5Zouz0RCf+Ea9fv1Jq/2G4Uvnaf+MsbRmeUldaGLDi1s2/QEqharJ/?=
 =?us-ascii?Q?NHZ35VyyNUQmi944Vb4izgIvwCk6ouIYkj6o/nKB0WdaYvsDNjBorYbh89++?=
 =?us-ascii?Q?DwyAn7hcedXCXZEbjmMhmksA7jB99ERHJonw9iR0Js3vyGiEjU3IFaW6V6BM?=
 =?us-ascii?Q?HIcYEoFCCAwUjK0hLILVsVgjNrybWM9kfBAV0hoS0l0PbUdoLCwSsYS3Pjyq?=
 =?us-ascii?Q?l4bOOMlQHKuVg2NL0JhamDgWAbdaHBgGVGv0Ycy7hqQuyogf+i7fqrNtcixh?=
 =?us-ascii?Q?INV2Mz4dBREXsH1JhKt8GNXPtZ6gAUPdPT3C45Ap4EQVNMJ7LixdfasDtHpb?=
 =?us-ascii?Q?gcTSWVZ7sGO2rTYzmvAS6vY0ZEEbel5xT0udIYXac+sIbNVRegooFzc5YI/k?=
 =?us-ascii?Q?acQ6yDB+5NmR/+rhWhAROfuzHVAfUiVBVzT8GzTjMpaHay2Xp9HeDGInGnO/?=
 =?us-ascii?Q?npRBhA2xZbcTM8ljj5N4ILRp7QWEk3g=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee64873-b7ba-4667-b683-08dea3c0ec1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2026 18:23:32.3477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zw5X7v0gBhCGvUhN0ToBxK7rTys6sRFPzBiUmSk5QxSo23otylO/AgbRrtx+Q/UU5CoMNu6hEqvQDjZ/mLheQXvnVb06QUJqdr/UTjCLBZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17555
X-Rspamd-Queue-Id: 5A16A46AC00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6426-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,ozlabs.org:url]

Hi Biju, Alexandre,

Thanks for the feedback.

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Samstag, 25. April 2026 20:37
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
> disable_irq_wake() on cleanup
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
> > > enable_irq_wake() is not undone by IRQ release, so the wake count for
> that IRQ stays incremented.
> > >
> > > Each rebind therefore leaks one wake reference; the leak doubles for
> > > the chip variant that has a separate evdet IRQ, since
> > > isl1208_setup_irq() is then called twice during probe.
> >
> > Is removal of RTC device possible [1]?
> >

This patch addresses the per-IRQ wake refcount leak, which I
think is independent of whether alarmtimer is holding the RTC.
Found this by code inspection while working on patch [1/2]'s
issue.

> > [1]
> > https://patchwork.ozlabs.org/project/rtc-linux/patch/20230922081208.26
> > 334-1-biju.das.jz@bp.renesas.com/#3195765
> >
>=20
> I'd say yes if this is not the RTC that is backing alarmtimer or
> alarmtimer is not compiled in the kernel.
>=20

Thanks for the clarification. That said, looking around I noticed
most RTC drivers don't bother balancing enable_irq_wake() either.

Alexandre, do you want this patch as-is, or would you rather I
drop it? I'm fine either way.

Regards,
John

