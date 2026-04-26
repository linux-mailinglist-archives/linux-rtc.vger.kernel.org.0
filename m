Return-Path: <linux-rtc+bounces-6425-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id grmpHuRP7mkasQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6425-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 19:48:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E011046AB3A
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 19:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64E613000732
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3781226CE39;
	Sun, 26 Apr 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c5d5ubX4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C42EB10;
	Sun, 26 Apr 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777225696; cv=fail; b=tSUEI8COGRXXCqZwhwda2mOYv5lrCS6I6SFs4kcyPAg47BBtkdAyg4SD/B2Yx/HPtx9/fbWdMJk64Ew+iAFS0jt+hMcwCQgJx3BnmmYYnstVGGmplnPr6h8p9YhwGD4toece8yHbCjNEcpbjwlGtXDKMZJlL+KyYf9jQpilMTjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777225696; c=relaxed/simple;
	bh=JyCFK9Ia9b40JmeGzmege4IPqMEQYQfgTKflBrzLIo4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IDWAV/PpyHo32r/uTxDmPmY1hzrNrBa26umLV5+/j9JBwmtJPd4390055lkiNjdH6uwKezJCuDYXUbMGeoJ3llN94VG46JseYeuVXaFIS68DcPMlHlEEdGd8Xq6kR8N9xUxXDWsjfPWJ6fwkLf2kaPJKfmncGBrk8YQBONOo5es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c5d5ubX4; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/+KfqU+W6BJkqk0Se6EEIJJmmYgxCSmPk6SiuByjqiY/ZWhbbMcuOsCi/MkVkT9wWiRX+filbukVo5d6dQ2ZWrQdNuKvP7l6vGryJ6B8KGcZsQ4/jVwjUyNFF4NfnzDRJ8WDlUseUoHq95lZiLpivUk1Y2LJ+MY5Z0DE7KYQvrWXErcKEdrvEfDqpH+WG7bLpPu72sb4eHTE63vDXQScmisqTojlg9Fp+Trg9eEB/wpEv+o/KeJL19GozGyX69eBrGPzrzFlQoq46U+yODdBvEBD+2i7JWeSyUhMvr0NY+4rIkfIK27xEfKzpR8OJi98/LMEHHABtm3fUTkJwBekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnTs2iqYmVPncbq0k8H7H+mszASVa4nXU84cLFbY1Hg=;
 b=dalEFCrnV7WRmUXnFdPOXufjKZZDEcsqs46JwdYkK/osmU+2oEEGMbHm1881+QKd7LynSVUrZAHAfIGQlM8k5RwQE9l31m6OtddG4FtcZiGlmUP6RHY7U3OqiMs1s2MvqQ/CyfVj3/rGYXpB8BTP87YfuYUXSOxJP/kqZljtTquA0feC6A1MH4KvyEV9s0FYuLjbkZwrIcCFBcEZFd7xOA+Zni92OulEr9V85IkK/qvvyabkqLp0A2tGkRngw015OClcOB/pD8RS0cTCv8SmtomW5PF034EUH+Aef8nwD2mMSB3/v4IaogddYHXyOSEDKrOlj1KqBg9+9Aj+OcQVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnTs2iqYmVPncbq0k8H7H+mszASVa4nXU84cLFbY1Hg=;
 b=c5d5ubX4OHmeWZx+VOkkIenA51PfXlojozquio1L9SIaW5Rc1iOk5fi4zauuxNalyCUMcFILTJzdYJIBsyyrjlG0bFWA4ETzXyfxlTFJKhUCXC8yHz1Am3f8Ar6c3UsAKx6/eK4anIUiURL+DtVDXvRTGzfpQQJCYdtaZpNfIXE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB11095.jpnprd01.prod.outlook.com (2603:1096:400:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 26 Apr
 2026 17:48:10 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.025; Sun, 26 Apr 2026
 17:48:06 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
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
Thread-Index: AQHc1MtoAScwmeohuUK2OTpHOTfMXLXwBMsAgAGZ1SA=
Date: Sun, 26 Apr 2026 17:48:06 +0000
Message-ID:
 <TY6PR01MB173776D008E8D0D5DAD622A0BFF292@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-2-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134639F6A3A38551180B626386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134639F6A3A38551180B626386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB11095:EE_
x-ms-office365-filtering-correlation-id: f36f04fb-f493-4694-b59c-08dea3bbf8ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 c/1+upQTttnnwiquf9Xf7Dr9Rf//Gy66VRTJlisFkX8lpVBhraIc+uxRKBaW+KqoiRtjJAG8owCIqUrIm0iv4/fIUbpVrz8bOk4JyH1dWLc83a2ARdr3CDbBZ0Ca9wLxllB5ySzXEMCon4QLJk0mn8mQ/hKnn3BBP6/F7aRC+becXSfMy0pFmIZCIFmajEOoAwlyg7l1X966SqVQMVBYsl5WdS6v9cPxIOvV9YibhfMISQXnK6dn/ne1NuZ+4VLEEAR4FmkzvUtgMxjmI324CKBLbJFLl1TpTv+wltHvTOCikUwDgcrsmxHTjNJadFhHp8tyL6/Q5OYAm9eWXaMoJfCvND6OX+mwLzFGMv680cTBHMNH9jkd5grWcrcJlgh3Oz0egL9l+UeAnjoK9OEc2tYiThyCvh6qyiYhxUgFioALjTKu4FTfRfhdvvxgAtq5nfEPk67ZfoNTYyEB5P1KBLa823/0BJRaYHTYhWgbGAQpiP/aKnFHO5PlVxeUHd2aDwqN33mhI3U6zjxtCKG/lqQcX0GPsEMjEwIqqLFMuaE8TMI/Ubgw6ph3eE2gm9ilQrHDGRE5QR326Xn8WgWgmLrLWlBfioKEcaiwIwUpvwtlfspEo6d/HJ/MC7VdqliAl5gqb0TVXaC6Dq3g85RCuk5HyQ+YAF7v3YCsyTHzclIyzJmgEk7oNnogZOyL47oy747zlREi5fvq4xuxLDvBluVsaXlDZaia4R7UBLRgHHm2Kkm7Qbi2Uu+Jj6Vjih2KpUCXJH2/86c7fDUAQ72jodWkhKc6kKdvUOP8M3x3OjU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cWW8x/7Bsd2/pI3cRrnAB8xx8dKJvikuGKEoacfrGza3Q2f9lX+ubBrORBUC?=
 =?us-ascii?Q?K7pJhFbnhV3vSWMyZMBdCoz1pVNB5Pt3w1egO8S9ngr7Z0OdIk5uNq+LEHlX?=
 =?us-ascii?Q?X/pgQqHnHRO9+M+mTRoQds9WcIGYmLCA3owQqe8mcMqSxJKsVToOB7uWez+s?=
 =?us-ascii?Q?RBWAydFLGRNya0Ce3rpWpr3RF71ZaqBUr3yWhPQkdENEo1wQWgkjwbe6rQw9?=
 =?us-ascii?Q?oSuKBMU/EL+0pbhvsMupsSxT7fh0hQ689tDJJbtpVxEd0vk3lNPiUkofXmSv?=
 =?us-ascii?Q?SqA/70Zg5c2qC7o5N1CpvTzABiFjRomfi6XAlFuWESHeG0fLRyBv82u2kIcB?=
 =?us-ascii?Q?sJfBHTnm5FVIEXm7loL2GSDwWWb+ZYfiTCM1lNcztudgPXfcvK3BGFRAG/sf?=
 =?us-ascii?Q?9E/VU7/7GfNUPNiDLoqKPdzDWxaiuJECu/NNU8xMocSzkRcpqEypvKIOtAX2?=
 =?us-ascii?Q?wPKMfux8aqc1N+6DvjMtmn7++QdGJAADp71aaQ4HeYIZy9rZRRgAyeSvbxzo?=
 =?us-ascii?Q?H6w0k6wc3piG3QhewV6Fv0f0Gv920YKtdPx0q86Gtd05re0uVnclqPDwGDwU?=
 =?us-ascii?Q?hqd9V5ahr00zyyU6d5edD9aLpGMyAoQ/Grm2PmRE5AsqDSabqavQ4qJRyeXd?=
 =?us-ascii?Q?REMlWZV5ZweFBbcaJ0sKuY1KRYe1rkF0QfeCi5e1Xeuz0yafZsnQ5PjXqEui?=
 =?us-ascii?Q?Jt/q/TityysB6YwAqna6OQ2eIvs1no/lKWJ+Qf696zG+h3MPij3HYAngLtkA?=
 =?us-ascii?Q?hljiDlxOwlVkHGBrKZ1EUBXbBBuc1YmTfw0mVj3BQWU6u/JIl+6cLw0nTwMv?=
 =?us-ascii?Q?L1mGuiyLYawnUR0YLaKv9aT+SFvviSB/3P9q0uxs/SKinic3NO4Qvk9UiwFD?=
 =?us-ascii?Q?OZ4hB+3lk5D/o69wy5CHygMzOLkhieT9EgtAVXQtTL0VOECYOO1K6Aizo3RO?=
 =?us-ascii?Q?6ACJ6pBzfE8fB0tHpznjV57OHdTMetnf4LfJaoGfpIooL2iTMIuCKBOCD44a?=
 =?us-ascii?Q?cEn350kWBuSK4OADYpTYJzjJ8+g/VVndxNHWKHjlhJtbzP2Q3vqtHWtZPOOX?=
 =?us-ascii?Q?/I3K7pyhS0sq/MtTTjW+2qA8GMXqh93wmZj+/4uo59M0xunRNkOVfvOPmqWM?=
 =?us-ascii?Q?GVRmQjFxHPtAn3zKhmfCrShIG2UFk1I2yKipTXUZb5jweyjnL4CPEWkKStsA?=
 =?us-ascii?Q?rj9SNG6RvGuq5gkduDLdxuGT5fA5XqWHllYCE33tPsH++POO5uKDqjkOdPtk?=
 =?us-ascii?Q?Lnq9M36FVaLuJfEt1UTSSNo/mAhtEiPmFYwepR9RR7iAr0F/95j+1IZK7o3d?=
 =?us-ascii?Q?IMSRUeVydQaLyQi4iK3xMoU+NcG8lAlHbqI/xHQkaDQ2jm+d5KBhnuU0GTpB?=
 =?us-ascii?Q?MliwBvv+6nO9sZXZHcme8QqdbaZZ7NVt5l+Hzxb9hy5uK03zNsmfbV4BTW6z?=
 =?us-ascii?Q?A47MGqHGVOpreC2PhJiTBvY/zbBa7sPmnrIy0m8OuQNPTdWWmLvfGUX2YksN?=
 =?us-ascii?Q?92cKukw89HRGR4k2RAdQpuoisaPpAuNuklU2/IgaFE/48voaOIVZ+NwTI6HH?=
 =?us-ascii?Q?R0wM+dgYxZmT1GjMTxhxcdGbsqtW6hIbzPr5U7YiFLPh+TC9vLJnRxNQmCGw?=
 =?us-ascii?Q?7l3im9Aj6tWNhq+Ux1zawkAy4TYodNzBT3lTGbifUWengWnxYnh4CR4rzLkx?=
 =?us-ascii?Q?QvwYRSM/YsBQ5aphiRUg5X7Nn3egJLj+qLxdENfK1pfPsUVnnSzUsd0iyFse?=
 =?us-ascii?Q?WfyZMXtm9vlu+pwH0aVx5ucFghu9Ji4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f36f04fb-f493-4694-b59c-08dea3bbf8ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2026 17:48:06.4432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azgZy2TMJRvC8dvkfSO0THZ7FFfhRo9EC21gnLVrJuL62eWgaH2KaPc1TgEE2GC4l7GsuN+xdSokT0VIe5OdmVT7MmGTvFfJenKxnrJpl44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11095
X-Rspamd-Queue-Id: E011046AB3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6425-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email]

Hi Biju,

Thanks fort he review.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Samstag, 25. April 2026 19:16
> To: John Madieu <john.madieu.xa@bp.renesas.com>;
> alexandre.belloni@bootlin.com
> Subject: RE: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t
> in IRQ handler
>=20
> Hi John,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 25 April 2026 16:50
> > Subject: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t
> > in IRQ handler
> >
> > isl1208_rtc_interrupt() is of irqreturn_t type but two paths return a
> > negative i2c errno instead of an
> > IRQ_* value:
> >
> >   - The SR-poll loop on timeout: `return sr;`
> >   - The post-alarm cleanup path: `return err;`
> >
> > genirq's note_interrupt() casts the return to unsigned int and flags
> > any value above IRQ_HANDLED|IRQ_WAKE_THREAD as a bogus return, logging
> > "irq event N: bogus return value X" each time it happens.
> >
> > Return IRQ_NONE when the SR read failed (no progress, can't claim the
> > interrupt) and IRQ_HANDLED when toggle_alarm failed.
> >
> > Fixes: cf044f0ed526 ("drivers/rtc/rtc-isl1208.c: add alarm support")
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  drivers/rtc/rtc-isl1208.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> > index f71a6bb77b2a..c93998c53e7a
> > 100644
> > --- a/drivers/rtc/rtc-isl1208.c
> > +++ b/drivers/rtc/rtc-isl1208.c
> > @@ -654,7 +654,7 @@ isl1208_rtc_interrupt(int irq, void *data)
> >  		if (time_after(jiffies, timeout)) {
> >  			dev_err(&client->dev, "%s: reading SR failed\n",
> >  				__func__);
> > -			return sr;
> > +			return IRQ_NONE;
>=20
> Maybe you can use a goto statement?? that will take care of handled IRQ's
>=20
> 		goto err_irq:
>=20
> err_irq:
> 	return handled ? IRQ_HANDLED : IRQ_NONE;

Agreed. I'll do it your way in v2.

>=20
> >  		}
> >  	}
> >
> > @@ -666,7 +666,7 @@ isl1208_rtc_interrupt(int irq, void *data)
> >  		/* Disable the alarm */
> >  		err =3D isl1208_rtc_toggle_alarm(client, 0);
> >  		if (err)
> > -			return err;
> > +			return IRQ_HANDLED;
>=20
> Same as above.
>=20

I'll set handled =3D 1 so that goto can return IRQ_HANDLED.

Regards,
John

> Cheers,
> Biju
>=20
> >
> >  		fsleep(275);
> >
> > --
> > 2.25.1


