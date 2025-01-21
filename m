Return-Path: <linux-rtc+bounces-2999-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A420DA17FDA
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 15:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6BE3169905
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079C71F37B2;
	Tue, 21 Jan 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NE0ncwFw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3441F1508;
	Tue, 21 Jan 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737469920; cv=fail; b=WunIRWrTiJYeYaEZhe9l0lr992llCv8+CgenRI+TlD9gZF63630yAiDE8XGFDS0WvcrkcdbqMNbp//DHFjkpyn7Nk/920tdz9ay4czgHWPPQy8DBWPEOMjS+IbWM9ndaLWltA2hd0gOtPJbPKGYXVNlk6XWnzYbm6J8jJOQGetQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737469920; c=relaxed/simple;
	bh=L8ciXzfwCfO8v/yyi9Q2svIL7nwkR3X3qzgSGlbDYZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b0YRAM1v5ri2TWUT7yJ8SjErgh1JwkTS1gdbr+UoJ/eNbfKQtnmHWRaHlChSjuTygl9UWWKsZccfJ0g9lRKyl7iexIX/9wVhW3P1uf8/LSn1g9hyCCBcPJ4R6uZ0epqUCUWQLo+ZVwXTQI0clJwnCZPXE5iLKkzaSl7+FnfNBhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NE0ncwFw; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un5ohnZtbpKHhTLCJSSW961xrfBPFd1lwXVX/IUtaDSvmJB2e1sIrwNDXfU8T1TdFkq1+LwYrEQVzhMaqxDOLzbz8zle9jMTkiVExE+UqutPwbsivPK9yaREtM2aJHSk7tIzLcir71l8yQ35bHijZkIM4V915C8Eiic8KOcOBNi8sOee4XGvz7bRxWIcv28ZozsfWvrhx7vKRx7ISYGNc5UA8HMPvK/vNGp7Yzuxd0dSCLShr7YkVaqLGNPaUe/IisTzhmOa4oFqo+GTECFdLgFjdQfVF0J+w9NWKZA+9/yHHaoMOdLLyfMyjbFzEBdnE8oFH5m6YOzuzYTALSuWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPpN1nMz8ypNY7Uvp2UVwET0jVW8zavGqE0/d00IijA=;
 b=b2xiVd//OVC2pBNvdKzYdxAiTHSdZBHGzHP8I31iNeagb/sXvfPYi7NlkAU6o7LCGQ9Ec1Rr5TLB9ZXhwVH/dakTtNT7KgJaEzEg3WBAuho/FjlDMH0OxJCyU1CQ6Khi4VOJz9adEdKl2XwTpeIQAzc9V6hSlVUAHkDTd43WrO/juSZeDGiGHyvCKueN8VUXGw7sld67r9AaEn4+c8dpxr3cc8d3mq2FuFzFgOsJOG+wzntmoU8fRA6Bj3LcSgcQASSN0eLVxNELKtQR6h19SVesgjgLVQIxfuv89tW4vBLYazUiI+dFQgA1Mmf6b9TBKTB3u1bdJHLe0Twlmadf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPpN1nMz8ypNY7Uvp2UVwET0jVW8zavGqE0/d00IijA=;
 b=NE0ncwFwwq3egvbUphkr0gUR+SLKn+aPREkagMpOQb5EqTquI43ws2pxcDYCEL3EN7jWg4IBO0YB6nAdbA00pZzKBYDyqnLtPBYcRWqe/ZjPKox6tu8ZBuMLS0N9shKNYmWq3vV6mMFSJq6VJDIHQLH/RefFlgKPnU9rTlWfLDk8thPIlWUwY80UGcA+AHECZKh2CVeeMjt4QK1MBJGfDHxPaYTCq2QjVZjg4AIGqmcoSXocyrskvhyXmspLEbaOj21IA4xcpCpLpl4juxkClPzFfOkXGAy85sPqqhXTTwoeTUxdd8+wUWlf/cf/eHGU7w5Zehwq+xTgSlpKP3LmWw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8748.eurprd04.prod.outlook.com (2603:10a6:20b:409::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 14:31:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 14:31:55 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>
Subject: RE: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Thread-Topic: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Thread-Index: AQHbauK0WlkpRT4hXUuysPkoc9lMC7MfdE+AgAHSTTA=
Date: Tue, 21 Jan 2025 14:31:55 +0000
Message-ID:
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
In-Reply-To: <20250120102117538ef59b@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8748:EE_
x-ms-office365-filtering-correlation-id: 449442e3-0efe-4a48-e8f2-08dd3a285ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UZRCam2LvSvSQl1TfxsvoyZ/QOP0VVJSpZ0wQ4m5Ru4oOVkGy49QVDdvc+Ff?=
 =?us-ascii?Q?zC2K6V5Ez865N30XZDolu3spAt0Pg+pkm02JMUJtkY7FkHoWSCjddFUsBFvr?=
 =?us-ascii?Q?wl4nrKfFJLz+apszZwSCPc00P5oFaLXUvQyNuLeDXXXeEE4I9IbYNS+/glN/?=
 =?us-ascii?Q?q4/ssM6nvCgxfDwe6JQcxorjp92n0GnjVMFMzF4OpZoyKepmqc4ZKBjna9iK?=
 =?us-ascii?Q?Ra0PEeqX56FxGanuma8SPEOXUQolJSKSBy4V+VYJ9GYsgiVWYa3LI7tMS6qe?=
 =?us-ascii?Q?JhUYWQqD07HdetmL91BzefTH5wbY5IKWIZvm0rK4HdQUQrvJkZermcUKIAWH?=
 =?us-ascii?Q?5jJBR1qNuAeSptd19KiHXa3KfMPA+BvDVI0GdyghMSwaClS3Jc0jRco7JguO?=
 =?us-ascii?Q?KtvXc8QzfCEkzItxDMNLNP4uS5mVud3bHjStLI3IotDxX7x9+H27qNyXW7bO?=
 =?us-ascii?Q?8bqdXN2R/PSxe/u3kjoEtRBB63hrxLiSePn3WnkP6rA/rcZpccCDJG13RTfZ?=
 =?us-ascii?Q?uIHpewtKFGyqNfLBLuMX2+1SmsDkG715ws4Ycl5jWZGHY+1ogrfMYGqwa6Tj?=
 =?us-ascii?Q?Dyc7qsZO/RHz1DgYnMAWlbHOnl/ZPVu/9bUeRtZZtAcmA8izVFeHVB0k6sQe?=
 =?us-ascii?Q?rIiT4glgsua5STm8bvU/KkTSmOzZvEozOUWHKfN7i/mv4TMzVgSBSfIxqQT+?=
 =?us-ascii?Q?zfERaw30PsXWxgFrF6WQNWKWpPbNPEFrVgM5xTjeYmnTEva/oQ9uKjCQdVfd?=
 =?us-ascii?Q?KA/BC883u06ppmaxmFxbtTJbJy7XAwjgh2JAeFJBOdC1WlkSovGVYC9oBLxK?=
 =?us-ascii?Q?Nu1GJ11L4RUmyBDvMDHylF6etK78iu2xUdtZTXPECWpw2DJE1g1fmKvtDihG?=
 =?us-ascii?Q?ZhXt2YFDvwX363qaQvFf4YjuQ3aQssQk8f45pn81ftise1D+uwtfb2dvHJ8e?=
 =?us-ascii?Q?B2ZzW9kBp0GUNKONt4abFPDELl3yT9keFBOG/H1GhgWlXk0oKY9F+Z45vH8f?=
 =?us-ascii?Q?iDitlwUAb+ruwC9pbFFVDHVsumDdeqYysYDzrzOg8IyjdCP6nrt4E8eoioQC?=
 =?us-ascii?Q?HLlFAWBLyVCSfbnc916+rLNHFOqM65rCDvQqohFExgDjGKXEPnWqP1oEGXsh?=
 =?us-ascii?Q?zHLzcZxjSUukM5/WwElPYAxzLu3Lxc4UCwQaggkJYg/yR5tZxkCQymDmSmU/?=
 =?us-ascii?Q?C66QYqrYBFiZQ8o9nE1OGLQ4BIbU2yiz5N2KLUdljZ33I6Ek1OnnYLPpgYBY?=
 =?us-ascii?Q?b/aP5hIFWN+KPImTwqRuq2Dlou2VOg0FTn9U3p2nwm3opXR3H136YHtaPggk?=
 =?us-ascii?Q?PSCbbBoC85U6UoCuoMfyJmauL+GtBgR/JWzNgCosi6tl57hh7nTkp/QBcvNi?=
 =?us-ascii?Q?0D9VYXhxQ4fTRbeMwmj7G0C3Hh3B?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KBc3+bgtxxK+2KZbQgcFsFNvfsr4/HqdN/jh9fH46bkMn5LlCavVALScSrPt?=
 =?us-ascii?Q?ACF4UGTBTTecaKdG2M9/6wHTWsZVcbeZ5Ib14eKlSdkuH5EJv3MBLX4eNlwd?=
 =?us-ascii?Q?JclJtUcY4EN5HbJJ32o/BKsOgBxOHzCNN+DI3iE62UTOE9L+mW3y0acApamU?=
 =?us-ascii?Q?/mEMnlVrv7AYSJmUfKfXC8tQytgOD2G2dQaTUmJ/WfY3C9GQML9v9aqef5TX?=
 =?us-ascii?Q?FtVDv8+9NykbWtQL1BWhvj2VHWQ1TzS6tl9x6rL7SGMtlEBisXmWpst+43Fs?=
 =?us-ascii?Q?zjQ7hsCtov9E8w2NwjZEqHPQatrVpp7e0El1DmXvzqO94l/Q314YN1Meb9jf?=
 =?us-ascii?Q?u2hXiTLqnk+ulnRA2HcdExcEEsn2KfYekgC3z3wYia4CiDE7WMKVLRFTUmSW?=
 =?us-ascii?Q?/0zOojuUN+e9jEExD0DvyCve6fEJQA9wPYIsHjK2g8yORYLsIRfpYan3TdEj?=
 =?us-ascii?Q?5cZeY2VE1uhaPs/xcaY9Yi4LufoHas/Cz5qDhAwBHwIm5r7viuU6YLdVYVWN?=
 =?us-ascii?Q?11KyZ4gOH3OAWzEL3oPwn4QbT7c3w38dDDCFA3g+CnTH0Bvs2+w2bZpGpRAo?=
 =?us-ascii?Q?k147epViyIataZcZmkj42xmOEPn16oQzwsG3evTGkh2U3LC5+CFvzzA9D/Gi?=
 =?us-ascii?Q?8n1/0SN/C31xUIgp6TvuaIRri2SL6gli91cxAXYk91OoPDtrQVMlvUcnKOQX?=
 =?us-ascii?Q?H4V7tSQ4G+w6X1iIjIgOkW03zUycHmzXt8EsfsisEaoPPC4JvZQpgAPQ3TjJ?=
 =?us-ascii?Q?ixnXMVanDQJZmIU7CYHkJO7SGJijSkpl7vQaMI9PPrFiZmMnWqucHXqRUcFT?=
 =?us-ascii?Q?tlySnvhBsU9tWb8dpZuLtHgEwdBIxSJvAW5RxW+cJVI2wX0ZoHZXYUTZAahO?=
 =?us-ascii?Q?H/IZaxIrefOZfq5DS3dvZFZt26pSzU0yw3bm8N0SEbOBEPt006YoOhIxubFc?=
 =?us-ascii?Q?Cba1rK0ZtRGiPQ4lYqnsienfzDZwiaNoR6MxsOnxDfvz2mgCspNpRQpfNFNZ?=
 =?us-ascii?Q?53VeadJg/NHdt8P/oq/u2AGKLDZDlBK7t+CsEIP5XSbJbV0UZsIoyRBnj6eP?=
 =?us-ascii?Q?EZPNyTo7Y5/ty1G0jsEuU/3tG98OMXVDAoaKmaxXNKQF0Zn81NL2V1IKo3ll?=
 =?us-ascii?Q?Adn5CPa+EXXLfoEhDxeEw50d79c9krdZJ/g0WljMMu31Bj60yHUbXytCbMu1?=
 =?us-ascii?Q?JORoDJy8OxC1ob8TYWNFdMjhRF3Xv20iQhvMjd7xGC4MVq4UhhsaXoZhdH1b?=
 =?us-ascii?Q?2alhjbh4FJ+yL1wXiR6oe+nFfZIV1OPzcKs0Ce/JLD9RRKWKVKdS2LuQAGyp?=
 =?us-ascii?Q?rjotlWdkOVyRfFJl+czXKjAeZP/ZzVSka6W4mD26EgmwPq4w0dhW5wGXfzFG?=
 =?us-ascii?Q?2+A4UXFnOnH1r4leSoTzwUD1TWLa3UFBNJDSPSvrM1Nz+B615pKT5XpzxBnP?=
 =?us-ascii?Q?GGSuFDSw8AgmBsy1SF9bX4Sw+mvFmXVNMggmmeBjbfUeNOqsPB1SFYlU19PK?=
 =?us-ascii?Q?fdFEgLI3t9TY7bO6hponD0cAtaqm1KEe6dlQ+Kcn3UKulXITJeHSDmnOYGZM?=
 =?us-ascii?Q?uSZIgon1BlX6xQei1io=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449442e3-0efe-4a48-e8f2-08dd3a285ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 14:31:55.4347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfduWQIgwKgtro3mIHW58u8GqoqC5f0xiM/H24mKpMFrtPk/LdK3VJv9AN8mRNablq56ubNa2BtM/N9bVnhlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8748

Hi Alexandre

> Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
>=20
> Hello,
>=20
> On 20/01/2025 10:25:32+0800, Peng Fan (OSS) wrote:
> > i.MX95 System Manager(SM) BBM protocol exports two RTCs for EVK
> board.
> > one RTC is SoC internal RTC, the other is board RTC.
> >
> > The current driver only use the 1st RTC. With this patchset, both RTCs
> > could be used in Linux. To achieve this:
> >
> > 1. Support more event sources for BBM protocol 2. Add bbm_info
> hook to
> > let users could query the number of RTCs 3. Introduce
> > devm_rtc_allocate_device_priv to support setting rtc device
> >    private information
> > 4. Update rtc-imx-sm-bbm.c to register both RTCs
> >
>=20
> I'm sorry but no, you have to register two RTCs like any other system
> would do.

It is the i.MX SCMI Protocol exports two RTCs using one protocol.

Two RTC devices are created, but share one parent device.

Do you mean each RTC device should have a unique parent device?

Thanks,
Peng.




>=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Peng Fan (4):
> >       firmware: arm_scmi: imx: Support more event sources
> >       firmware: arm_scmi: imx: Introduce bbm_info hook
> >       rtc: Introduce devm_rtc_allocate_device_priv
> >       rtc: imx-sm-bbm: Support multiple RTCs
> >
> >  drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 33
> ++++++++++-
> >  drivers/rtc/class.c                                |  9 ++-
> >  drivers/rtc/dev.c                                  |  8 ++-
> >  drivers/rtc/interface.c                            | 16 ++---
> >  drivers/rtc/proc.c                                 |  2 +-
> >  drivers/rtc/rtc-imx-sm-bbm.c                       | 69 ++++++++++++++=
-------
> -
> >  include/linux/rtc.h                                |  2 +
> >  include/linux/scmi_imx_protocol.h                  |  2 +
> >  8 files changed, 100 insertions(+), 41 deletions(-)
> > ---
> > base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
> > change-id: 20250116-rtc-3834e01786a8
> >
> > Best regards,
> > --
> > Peng Fan <peng.fan@nxp.com>
> >
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> bootlin.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C7b5c28
> 0a03ee47dea25f08dd393c2e53%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638729652821885462%7CUnknown%7CTWFpbG
> Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata
> =3DxL23vC4m%2BtiTN8eNs8QptUHgfo%2FuHEUcEewGMdeYWYo%3D&r
> eserved=3D0

