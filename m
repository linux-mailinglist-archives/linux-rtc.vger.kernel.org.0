Return-Path: <linux-rtc+bounces-3000-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCEA17FED
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 15:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A720B3A1695
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 14:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72411F3D3B;
	Tue, 21 Jan 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V9ISmtUV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB51F3D2D;
	Tue, 21 Jan 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470165; cv=fail; b=iP2vjLA8AVJCCZgSeO6txfOqFih0A5ip+uTNwnF6cbi14U/CkNQHyYNVy896vZIG6xetA3G0huguaLWFlzwck3Ydff/Hk1VAnxGDwSDACNUvNHV47BQ/Y/9vBS678tPRJyOxUfic8R1kFfYyz7x24ijySUaShoIiLUNvPo6/kLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470165; c=relaxed/simple;
	bh=4SljMN+kmCrF9IMxzjOvFLqDGKcvcdhIbzycdPUwgs0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cZn1R9ohCR06YkVlgTHkNFOPPKL35mP5Z9fwZjlZkBCknTzZK8R+z1nfR5zJ742RMw2iSQIPnOVmPIJ14Sy3FI1gF+wlg34VsR40m0BgWXiXSf7xiUN4R9L/7amzf9PN1H48+ZLsPTSZZxktoNzC+imCUL1gARDc15svUHHSKr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V9ISmtUV; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgPhbCX7k9WZuP//u8fBJr/Fw0sRjs68WqLvVC4sANucgsLIDBnJbWJH+KADV5n+defxg3NYPd1Fw36XHZJ0krZ8yupVfetDW40eYnffnbY7A0qX21MsJizZMkCMA6SMi2ZgKGEsyPfnQIE7/k/bemVy23Pw1z71Qv1PkgOxLVTrgr/WXw7h2A5ISN6HEWFEd7zirTTOZJrNGg8qVnoXbhnWnvY06nAYGe5yyyqEB+G2lRGUI5rZ3+KpJ6z6SkUdkfvy0SaTEgbZLzuKMRPexkwc+LWV353KvMHLX28waAEN7RW8RsGKOJ+QcgL3wRdqMco3A6Il6+pGJ4azJBh8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdUxGdGzJ2cWECTAanQL+rYmNOMbIh2PWlre1gfU2HA=;
 b=TfYm6vo0fZ0d4aL+IQnhs61PGGKR9n9y9WXylZ1EyORzwBAfsa7TNHWfNedkdRmXOfSb1GKKzgSIixKbBd3N65lZSYHKSIhS1eCysccDQeKzbeERZZs52P4sU1ai2ZGqndqe38jEFn0YvXAk0dr/jYKNklrGcEQ9YacT9lxRm0lBUE+KLh7M9uzjcH77+Nq670CMZqRdOQBCt1uS/mNSd1DEH6C57eD0hYjao7xLMK5XLNeurgz/0zknTt66ncO4n9i+NmWXHbku6VGKJWQXhw9bEQS5dF/t60VgQPfApCobsC0i1Ym+3p9A5mEp/NYPufsT64BebGBHMU8ERap8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdUxGdGzJ2cWECTAanQL+rYmNOMbIh2PWlre1gfU2HA=;
 b=V9ISmtUV6+gHrwB8WzZiNeTWA/rQJn2ivcJI8+agPOXjz589dqp/+9PEVDc/xHYriX/Y8kh7aYha1ultKFojl6ZbGLNwou6h/qpFGk67gtBP6N4ykSIanjZPja0WJJM6yMDXzN4SYNXeL4Z8srl50wqVOt5VPxTAkSicwLeuG76nP3CV8kL3iWOE/XK2qdaFYg7A7Vfj/GSj4YVFZqiY8x9K1SGJeGqrbZeSxC8bHof25CloSsbWTLwnJtfU/8ZAlgei3ltaNJFixpw7xi8UIMn8CUDeNPmQCrDQPtNiZYcrdXfQG9FzA6rH0K0mjCCyGBCDXggL+Agk0Qw3l0z6Ug==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 14:35:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 14:35:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>
Subject: RE: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Thread-Topic: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Thread-Index: AQHbauK7Burf7NnYekiV1L2ZgFEsFLMffk+AgAHOysA=
Date: Tue, 21 Jan 2025 14:35:59 +0000
Message-ID:
 <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
 <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
In-Reply-To: <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7191:EE_
x-ms-office365-filtering-correlation-id: b2878da9-9ba5-4cb0-b385-08dd3a28ec72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+oA0WnDDOhZaUEKdnRhOYOimm4v4qfFZha+SKN+xetzKpIHO9knLf1uMSdzM?=
 =?us-ascii?Q?SSYEoSjaClikR8KRMf75eovEjL+mNrUCIR2wqkvABROETNIH3S7jyQkOe2Wj?=
 =?us-ascii?Q?zKS3jArICZZsXhVF9sqoDfuF3CQRLZxSw00sWsCDwhl+mhaQVRQ6wYFAG5Zv?=
 =?us-ascii?Q?OsI2kPadN+abcIYk2QBzvOoAIk8WFxH2Z+eK57PqOiu3M/mxSNmPRP9p37+Z?=
 =?us-ascii?Q?I1xp7IRYEUGobvITD5rWV8YUtk7tiWXipJWCEbN9HvmKz7GodNegiJT3sCEE?=
 =?us-ascii?Q?DX8+u/lTaAIdZzc2MSbe1IgH4Oz5kaAPFxxmAGF/LmL/getkBwWbnJOZPl9g?=
 =?us-ascii?Q?e8x3pv1U2dXbaqDN2cdfHgxKoXQLgG/RLcdlAEDyBbnagj/VAtjC2Mqagc5S?=
 =?us-ascii?Q?x4vwKfr6r89lddiQ8AsfBP1N9+zKYPY+pnO0O8ALNdyKA3FYBSuXzFC2Mt/Y?=
 =?us-ascii?Q?rIfaE+E1Mt9wlv0cb3kRc1mu/fik0Suwr8hBP+VXIYXQB0F3SZO56P2Qv/AO?=
 =?us-ascii?Q?ZCFhh0OtxZgUMgQvwcnrzou6dWq9UIlytjHBcGW7Ie0q4KCPj5jkSuYJSkdW?=
 =?us-ascii?Q?kUUGOTeWfv7LAUFcvoonFuyx6p/wCQpeLuOnbY3zViiwSrcQed6TGEaDlHOi?=
 =?us-ascii?Q?kM0B8PeISeyL974qgefuMYySw26ZsPYc/brHIWojaNvQHF9Kt0oYT295K7l6?=
 =?us-ascii?Q?y5zrw108tLYJmlHP8EhkFO47C+hg46TtU3CdBiEokMGcS49Q4pM5kCWbXcGh?=
 =?us-ascii?Q?meq17nHs7qrZUbPbOJsdcBV0y1C6DyVWGJdDXmDkCJZ+u7yqw9eVHN0NjYdt?=
 =?us-ascii?Q?t4HMAUubi02iS4sg8Dfs/Ie5gp8o/nlMyIHaqJ9zvL/3dI+I0ykcMxlBqlyb?=
 =?us-ascii?Q?WC0PazOg3fvYG0+a5nIe2qkVyY8dawmxlKixyzPRFCIC27MSkv3yu/5KvE9b?=
 =?us-ascii?Q?MowoUkm1I9JFZAtf13MdW6ZhHaP1C4OVPP0Oqs7OiPfrAU1H8ZkE2IagOmhj?=
 =?us-ascii?Q?h11uawfsShYChzx0lxgQ4oCEEEx5bF9NaCEEcFbpmqZfmPCYzbyb+xpBqqAt?=
 =?us-ascii?Q?mLM9GEuxVmbTJ385GLtMgDi9y9St2y//SNcx5+HMktZsrD0xyhR3npFFzHnt?=
 =?us-ascii?Q?uvrKXVCIsNg3s4AYfl2skvDhFScoLnzMX2ncsrTWTY2JCAA4fp7y/e4x2sR9?=
 =?us-ascii?Q?h2NUuqe17zSZQzfwqs11yZir/0Kihla3y1CnZJHbgthNwsHmiJIbZUoix3//?=
 =?us-ascii?Q?WiXDsszuG3NMrEBTHeRYW95/KQ3xAuGk4ls8x79URlTMmUR8GGf87AOtUazP?=
 =?us-ascii?Q?f6HCfnCFfqO72jJU6fSXCnK7OePYZZeVhbT4gBnZKJfNNUNQ7sQf0tYgPTRk?=
 =?us-ascii?Q?B8R1/nx9wxFigNtu4TCf1PaHUx/alJgkwWNAGZorAx9yjyljjgJ/vJeMSfss?=
 =?us-ascii?Q?kbciqwGQD+TnkYdAEWfjCsh13udAczyA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GMbMeDLLotF3Stj133M7QZ1ZctaXVcfiUoYYPVae8xtmelU8smv25+V8r706?=
 =?us-ascii?Q?4wY8BKHvxVP3VwadYj6qe0txmJlvcm7d9r/yuO76OlafpmbDn/9dUq/lFJow?=
 =?us-ascii?Q?LHiCXkhURQG+ZXf0cadecPrfSzGliwUTe3zDchjaiAvEshwYbScPIPxWoQYk?=
 =?us-ascii?Q?8nmehZ0TE0TgnzrBJZvSeH6m/sTck1dxNTpmnnCsET9tb0ovy9k8pCAcK9It?=
 =?us-ascii?Q?miW4s+OTCS8shbztLBI2kX/79IzhoVEqRHxsZl2DSihsMCKQr3IklJW0fAj2?=
 =?us-ascii?Q?fbNivw36Udxup3twZ776tQXOjCAK3SvsDVAxk0wGbKpu9P9cniumrPQC9dwR?=
 =?us-ascii?Q?4ccE9uP/abbNLWbJ/EcEYgdRnUWkyyIC3qpPUpp/sQi7Yc/mN70V3nJQOhTq?=
 =?us-ascii?Q?Imq4MBndpPupfiH88sNOorWED9cVCo7t3FPNKSO9iCM40WCAKQH31l+ROq6r?=
 =?us-ascii?Q?5+u6VVyHxfZM5x6vIkKwsU7oMO+DRY4505DmO61LXk+5fs4maVP8oCndauBX?=
 =?us-ascii?Q?GreIVzlzqhaU/KmeUhXQIx1dW2RKdTj0VCbobfkDaAZG6xWbldEMcLUvYWlS?=
 =?us-ascii?Q?D8jF6P+sLVGQSeHk2bogciwWIRaO5YZVV2mKj3TvqELHVVQuPbdOU4VZoltF?=
 =?us-ascii?Q?Ncd4+GLyDQPW1bbZmOys3LHywVmn7SZOwnlCt566V1xEbvZfu90+Gd38yqMH?=
 =?us-ascii?Q?7Y4tI6vbsoeTeSRIJA1pLK1QiH8lccSTVtwTHEsG8eXQtohMe6Ax3eQwQARG?=
 =?us-ascii?Q?xglWd+dcpuO2zaWQmkRGzrAs9bkp/o0odUx8erq2CE8wNnnyxjxivZwU5F4h?=
 =?us-ascii?Q?FVUB4igLJr55pydS5mE4yXoEL9RClL7YXJAB8sa0Tjv9gN3nASY3ddqY6srv?=
 =?us-ascii?Q?7OznqlJGJT70joMFKeMiR7G7unbP21WFpC0qbyW2Xfq3t4BoKhno5QaXejvE?=
 =?us-ascii?Q?71n/KnTXoZOgf1bv3q5/9bdt98EqLuWnsZSI7cY1odKzxtzbTaJddynEYtVu?=
 =?us-ascii?Q?ysgFAtvIKbGFLa2yezUwbN4I+yUbHIKqFnWpIXMZOEUTQz6SJcamHqOox/0y?=
 =?us-ascii?Q?5+CSMMSzcIUHKoE189BAE5XVIcxXDaJ9HANqG0RtFiQ4T0dw9C923YK434kl?=
 =?us-ascii?Q?gNvh3YKzBybig1zipdwNBCG0nfFP4bkcPzOSU4m4ktqv9J4k/fb9NOI/6Ltp?=
 =?us-ascii?Q?kFzqS62MAYDy+4bXkGR64W/mYeqlNkeJ4H+gIoD2QFWbmrd1UUDmf/QZ/xFu?=
 =?us-ascii?Q?O2PGc8OBdce0FtqL0up8ctwL7cSdgDMjDXwjLrvoEAVf3rhLPZV1b/PGanwW?=
 =?us-ascii?Q?/GApk2wHFIl9AIHN/RGhK8FArRo/7mTSzrl1YiYaX7FO5rXeCXABxqow/N4Z?=
 =?us-ascii?Q?7jy3619p2xRHQF7Xw0mWsOoKIEioPbhjtEPuxpvsZ4674NWFUN2X/5OMgcup?=
 =?us-ascii?Q?Rm5f9DBQ6ooeIfoNeGj/v4qyQktF6bzDAgBJvj/6akZ20cZjF1yukfeXxPxw?=
 =?us-ascii?Q?7LfIqS8Z+fOqdSLeKUJZqfHrZCxo/QkH1sHN8WkEC5J3HplFNBnH/dkMqVdP?=
 =?us-ascii?Q?hRUPu9sBbdrcAxvTX20=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b2878da9-9ba5-4cb0-b385-08dd3a28ec72
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 14:35:59.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0erVIyh5Ee3xCmc9xZciQaVl3bnWD/Ii9rEi0XYSmIwndjvwTM4EYsfsSsQRjph77nXr266z26g/jJA5A19n6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191

Hi Dan,

> Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
>=20
> On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
> >  int __devm_rtc_register_device(struct module *owner, struct
> > rtc_device *rtc) diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> > index
> >
> c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d
> 7c9453490d6c
> > dba510cc5db5 100644
> > --- a/drivers/rtc/dev.c
> > +++ b/drivers/rtc/dev.c
> > @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
> >  		}
> >  		default:
> >  			if (rtc->ops->param_get)
> > -				err =3D rtc->ops->param_get(rtc-
> >dev.parent, &param);
> > +				err =3D rtc->ops->param_get(rtc->priv ?
> > +							  &rtc->dev :
> rtc->dev.parent, &param);
>=20
> This seems kind of horrible...  I can't think of anywhere else which does
> something like this.
>=20
> It would almost be better to do something like:
>=20
> 	err =3D rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc-
> >dev.parent, &param);
>=20
> The advatange of this is that it looks totally horrible from the get go
> instead of only subtly wrong.  And it would immediately crash if you
> got it wrong implementing the ->param_get() function pointer.

Thanks for help improving the code. I will include this in V2 and post
out after we reach a goal on how to support the 2nd RTC on i.MX95.

Thanks,
Peng.

>=20
> regards,
> dan carpenter


