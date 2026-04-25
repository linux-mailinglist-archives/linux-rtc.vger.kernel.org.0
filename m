Return-Path: <linux-rtc+bounces-6421-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL37M0Xu7Gn7dgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6421-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 18:39:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EB466F08
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 18:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4D34300B57A
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 16:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6585535A3B8;
	Sat, 25 Apr 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GXEoGTIt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9B358D27;
	Sat, 25 Apr 2026 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777135170; cv=fail; b=DKUJruka5Q4Gu3Re2Wxl7xXLPiex8x5TwEr/46ByljqINUg6HktccCg4upv/xXzj7b0B1t9ckGcLLhrw07V09QmaD1+fBALgpFnWDwwOr7Vtjvjb1QyOnmK9eLInsY0rasO0ffbzJk1KYZATh1yACo7y8agehRrbCel5TygjQs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777135170; c=relaxed/simple;
	bh=E5tQf5HpbpagpE78End6D/zNNWNOKpUGqwnODTkyZAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gTYsxVh553Sp/tkJHStnuZ1Fd+YlqrM94Xs0vP69mhAeBhhA7YwmpAZIwH2GkvM8OmPe8rjPsBYwb0QcyZtKrEreJbS5WQZ2kLVgnYaXZ1cdL9qB4Brc54zL5Sy6uPldk5HWmo2/lGGtf5tEyDZtb90PZb57Nd9iarUFrZDbHWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GXEoGTIt; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1RFBHKGgnrHXuCGvq+4I8+nb8rwgVlJ/SIkvvxVgSGjbrvhRqMD4c8MJamIkcJ+VZqku30XARdpe+KS677TKALshWSXc9K7DG7fTDoPTSQIQv0uxu1URnzO36WNhIsqWeW0BxlJIFFJUyCQyNkjG1x1ceO2t4TZN1xhVN1hBAIi0WEN4eqyVWBhEvlBaxt58LwfUwYiNjEmCnruZODsFXX/O1u+PMhrKe0zhRfbBxobS1HFXumuyixsJ97AJ7tG/KQBgYG3DvoJXJrBFIswpaBgvq2DeNzLIDjmCoaBfhRyUeBMgasbbqVYa+udpR8yhVVbB1AcmaFzSIMvnYhnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5tQf5HpbpagpE78End6D/zNNWNOKpUGqwnODTkyZAM=;
 b=NpOJNj0yoYeBkI4YHJWsp1Kx/WMMnkH7RO8ii1zSDcdkkiwP4BA7ACr7Ox5FNp30uHF9XnEUC3iN291b6CVkvoGdkVVmQ/28mjkPAwl05kj4lattTvIZOZY8NSzvGSoxVTlblurLCtSNEv0JfB0omabAehx6Xyvgn5K361G2YwLcT+gIYY4MOUgCd8Y2wTQZYDDrftmCP0CZpVw2sSV8sEk+51I5486ymuQs66cCa+n8HtEoiQX0L4qeKFi9ygSsCVD8LxRZhYWoQyGoLDKvdgThbgwk3TED04ptW99mXTzK4H3XG3x+PvJBqklZ+VUR3g3DbdVnP/Pgb1DeCkzVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5tQf5HpbpagpE78End6D/zNNWNOKpUGqwnODTkyZAM=;
 b=GXEoGTItQVqBwCbsY1XyBFt7+X2GV2OuAGeeYLByj61B00stU/eZ529/IjUntU5qJgAdO9Tmq1n4kCIW2IOs1xSXRAkOQE5yFyyNkPxVwDnfi6e56wkopHbdBtZH9LRBSV1xqqYyHMdgCMd59xCDcRtuDQha1baz7Wq3gsPf9zE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10167.jpnprd01.prod.outlook.com (2603:1096:400:1ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 16:39:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 16:39:16 +0000
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
Subject: RE: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Topic: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Thread-Index: AQHc1MttLmzg7LlcnkKheBUo3vItcLXv+ikw
Date: Sat, 25 Apr 2026 16:39:16 +0000
Message-ID:
 <TY3PR01MB1134607A936EAE3F7F2185D3086282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10167:EE_
x-ms-office365-filtering-correlation-id: 61d03de9-080a-4740-17e0-08dea2e9312d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 JtH9ywF7xxYrEWwsp3YdWNoNadwRudk2HnDkzrYjwKF826BQqaarkIj2OSD23q32Tcdb6pkEVZTSutDKppneWCQQuQVC5vanYRDMagrffQEWbD+S9zHeKMRBM5ujiifU6At7CrX6GEAzcaLA4VCenvo8a4fi2/55tGma7/SJ6kzAWrDyoIfPWE32Km0zBQgceInEr5Jc08UpbjIXUjFABmntWNsH1wVXThhZqXLCHiPkL/g+0SRa3d06FddtLOnhM4WxZmOM5WzO/8NqAvqP9+ebKmrDvfvsFJQtLSE+apwYpTFbV62t36pxx5+ZO5P5k5dLY0uuR8mTLxo3f0Mbqar4tXySr1gKOn3t5z8QnkSLqtc4dU8khVeKwg1YXjFZ39El0zqSv+BZcicgPB7HwDyjVLslbu+BvE6swkOsIfUYrUBGonlnwp6ILJxPykTqteiCUVOnLel4xCdPpMrrKoSNIUukEAj3d5crwfUvIDM9b59WatS0Q5W88jVhN8p6O3kt+Y+puidOg6uWUawR0jtk5d3JI3RLYRE7i/7tqnIM1GUoNnYnpKUj3u/epZ/rYfKAWzyitWxeeSmewoQtdJUHT/uuRGztaDdWzDJXP6YhkiZ5DZb0/mXrmfF3n+KY7ifN9Y55Vpbj/SIvNiYzBekJWHZWi/KzyBeOljOma9RfhzmkO1Zlo5G38lWKEQXDDneQBnP9WXA2bAbRjZsY7o3koTgoDARdnfPQIQjx4WsDlVSdawphaNQ64GizPnChNReuYtPQp6mNzYU/yqfrMbcKaKyy/oS+dZ5JCXv/vhY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8dFs3kRUSy6g8a/SYBEzxu56Z0PlJ/0Hls5zDpbt0gQ7Cr5Seewf7OuSA7vF?=
 =?us-ascii?Q?pOg5cYZ3TY6dbhuNWSQkK22ls1aciaAAQHaMmOiy6BNoT0v/vbxXbs6xYV2Z?=
 =?us-ascii?Q?rNgjZ1/J8wNCCBPng2Jx7hNrCWi9cINRDQEa0rbAojkMH7+0HCJ9/KKhlL+B?=
 =?us-ascii?Q?F+pqh5tyzqvDq8fnrG4NDo5QQUbVVXFeHpkUObLXAvstoTtzk6cVMQRoFCz9?=
 =?us-ascii?Q?fjpTS+lgQdDQyEUJBDpt98MdgUpSNBRV+u32FGIKgSwPeOH0+hlZ2QxjagRS?=
 =?us-ascii?Q?dx7BiMmawDIQ9rs97LbXluv/7XluBC8D7Uj4j+6QeGTYh6tKgV8ZFqZCjDY8?=
 =?us-ascii?Q?ug8ULlcaqQlZCTZGQ36Yy0z91C6v1bwUL4hO0Q4C5FX/EIIKhcGdCdujAgVj?=
 =?us-ascii?Q?fp6bFOSaMGEMd6spqg8WCEXns4jBzGg+CXc+w2cmyOtpQtNpp7gj9LUTh6cE?=
 =?us-ascii?Q?0naa6TnMBSJa5wqlNxnW9DTXtanls4osBY4z+WA2dJvSa7lw4gsbHCVii+PP?=
 =?us-ascii?Q?kKpFjABgPeEOggVQ70lsYcS7cS0TSqPZnuo2Z8R62Y/ObCYFqgXjY2eAcgQf?=
 =?us-ascii?Q?Wf8jHH6163EuD+4LKhSFyVJS4JkmxOTH01tWyexYvWWo6abEjsc9wCWKinQ+?=
 =?us-ascii?Q?94ZQTFttBLp2Gx90wn1K0dqtlEOReRsBaylIH9FnxgPtjQKQzMmTX1JJpAmd?=
 =?us-ascii?Q?18B/hMgceL3SmxHNolnd1KiRgO1fXU20Cj+LJJvfPcacCK1QFTYZOWULBwxT?=
 =?us-ascii?Q?ONVd7YjjVFBaZVzU9AZyc93CxMo60jj/kXWKiWgNkexmcyOD/VzeCgVIjjrC?=
 =?us-ascii?Q?3GGGB6H+14cOMWmi6/MxBkQbWlWwe6AimjblnQMNdv3ANYoCi/hEEasPhrXX?=
 =?us-ascii?Q?EDALPklpK/H8f8tsp691FNetflpYNhPxXYAbh+5TAYays5Rp+FTGTp18iVqo?=
 =?us-ascii?Q?SR0cwwVtuThjDhCS6yiNyJKSXbGTkwEmFkgNCGOaGmf8OvGpQQyxxfHpIpUT?=
 =?us-ascii?Q?fPZ5liCNwp1mfbSUv0hBiLiYgATWeE4h+o0Ue9p8i0UhXAzaWHCKWvQdzG7W?=
 =?us-ascii?Q?J6yGbjDY7IagNxkSeBmwakURGhNrVd1n7dQIwUfkg5xq3qypX8vDdmyPedsl?=
 =?us-ascii?Q?j+tSph+VsYdPO2s56sgzR95AjiCWHRRJ1fN9Qthsla7L8RzZ6cp2J+8DSOMX?=
 =?us-ascii?Q?lhgyiiMrmMdVt7F0JmrVHTIMedh+HJJba/nCNhgV6FuU51pdgbpRw7fXYW4B?=
 =?us-ascii?Q?3F/ZY5a4zEqL/XSsUNF3uubed0AiE3SFTvx5VfCy8nfAHyFD2hyeAMELFWGX?=
 =?us-ascii?Q?zwi9rp0LQeyfXwSOPr/mNqlDISGuMZIl1qHRlw/KckePkpiYb/79W6iN+tZK?=
 =?us-ascii?Q?eOMiifioidrBCPLIsXiC9s51XUNr8+84adsDuNNX4XaFmyfk0drq7V8UChEJ?=
 =?us-ascii?Q?nv5fUVIkcOIioBV+kWBMdHPgFtxPcS9ble4MeH0XPKCkVu5I+C10qabY5Xug?=
 =?us-ascii?Q?o9IwrpDiAie7W9EkgxC6/2qdRJks+FAjeD0jtR16ViL9dbA0gX50wvdOMKc/?=
 =?us-ascii?Q?kFfzlQDqUVyRHjbzIOrkf19G4jjuIfTJoEr7tPhvR/U7ARakQ+XqAHUzVTeC?=
 =?us-ascii?Q?aUMNyAORSHlroCNi6XzruukIU/h+bP+suqoyE45vy1PsANEJvOf4J4RqrUNs?=
 =?us-ascii?Q?3l98GpSdlGSOwQxTGiDeJgeYldwAIU1MszJSWtn0qpljW0k0+C0WVvRznudB?=
 =?us-ascii?Q?szfn9xZcGw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d03de9-080a-4740-17e0-08dea2e9312d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 16:39:16.8965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHJucYCWjjWuiBQ913+zG8QYzfLTCiUaxzbvU95weHFi7+ic7yEy4i8cUyDs4RwzPJmRDh4lkQBldVSRsimVIZ6ISqdx/q96qmB0Lq4EXOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10167
X-Rspamd-Queue-Id: 452EB466F08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6421-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ozlabs.org:url,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 25 April 2026 16:50
> Subject: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with disable=
_irq_wake() on cleanup
>=20
> isl1208_setup_irq() calls enable_irq_wake() after a successful IRQ reques=
t, but the driver has no
> remove path that balances it.
> The driver is devm-only, so on unbind devm releases the IRQ - but enable_=
irq_wake() is not undone by
> IRQ release, so the wake count for that IRQ stays incremented.
>=20
> Each rebind therefore leaks one wake reference; the leak doubles for the =
chip variant that has a
> separate evdet IRQ, since
> isl1208_setup_irq() is then called twice during probe.

Is removal of RTC device possible [1]?

[1]
https://patchwork.ozlabs.org/project/rtc-linux/patch/20230922081208.26334-1=
-biju.das.jz@bp.renesas.com/#3195765

Cheers,
Biju

