Return-Path: <linux-rtc+bounces-1659-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8619440B5
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2024 04:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27A54280F5E
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2024 02:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D061A38FC;
	Thu,  1 Aug 2024 01:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jHQx+hr7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2069.outbound.protection.outlook.com [40.107.247.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A921A38F5;
	Thu,  1 Aug 2024 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722476176; cv=fail; b=WZcf2S24mIn9AJOErfFyYgipYRdRZnL3bjOng5XHDw4FFbj97Un21pNhuJT8v48DhRtjLmzjcMDFysLpOR+prK1J49R/GfwJCTQ7RUOBiOips9FlaIEzFNsOsBNSizRBYBQxh7R5dikhWV3kHx1QYdM1ASxRaVFUD/trvJlLRPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722476176; c=relaxed/simple;
	bh=gVTfGhF45QxfGVy1xSpjvRKRE4pFdq4KJNdWlheyZsE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QePmjYzSYFi+uYtBxCc00GuDE/xcYqjnsmQiUlDg0YDdbNIJo5EOG0pXy4jhL/4G1GfyE9DvmgcOLRbz1Li1kvf8TqGNF9h81st6RPxrLs8DpFwPH8VlcHlWQ1DHQZX4wvBRnSTTNFi+7rvn2aOVyJijWngjklVfURuvBBL8E8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jHQx+hr7; arc=fail smtp.client-ip=40.107.247.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcZjj5374b3zphhz7raEJZAkPHQJl6885BACnGwLBB/raPvV0Ukx+miQgbwXCjsQsX3Uctwwx09LZLfYT2XSnr3ZUJdBq947rdJ5ekzs28+dUVa1kGr0KqBNT2oIIpQMyHukEv/k+tyon7vWqmQr6X/Bjv6UF1anIi6YkhaWWrUymCg27JNdlUC/zStmXcyE1OxRyn8dDqKo11XBlpwMtbf4BaXGaCPXA9SFFBZl7DpykXY77fHDPcV9YYhjAsjkiEgdNldnryBLzEim4m3Mn5VJV7gvDi5SnTDrDSKnVI0i2X/ucgDehc5fXnCAyqsyLfPliqVwayETzPqD+HfH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5BTEXELbeNDNTUMxqhgTFFudwaBnj5kXcegc38+924=;
 b=GGR8ctIGQUDuRWtm0NYGf0Fv4qo7WoMrZgBy2e+4iwgjZndaupifMkn7JqGH6/kQBlndtR0XU2lO7HKQ98CwJMVIPviy5Jyw6KI6fD4C8gh0vSIESxUx7r7XbGOUFgz+N1biIRGR69rK2vb3GV7pDauKpDw91SPtbIIk4Ugkg6JJQOWnTNBQXQ3Ek+E9Jc7SQYLmF74f7yEX1R/RppyUlfbNF2Y/5yoHr+dubIseRR/JEr8K3hUJwRcrPXUIpGfyR0DMPXywqXgDp5Ygd6RXkAEPZ63F9IRr/p5Q8FVfQPuY7QmS5QskDH4Mx0Ei/ltHFWZ/rVSsUVE5ITTIa8C6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5BTEXELbeNDNTUMxqhgTFFudwaBnj5kXcegc38+924=;
 b=jHQx+hr76gDu5C5thu3Kkn14cl4BAA6mukGFjbQ0WTQWFdkeYm9JQnShzz99cP3zj0PyvZItpWo7T6ulSFmkAaxMvUIE3a6UWTjKPEXWuAbd0lZvcK+XsVj19uI+3gpmH6ghmerBI4yxeasUGNFUbuQ5/UREg/wG7QDkmfynAbmSBPt8Gvbf4eazxoL4F9GqKE3eA8G20/PVWRxGDd3hvQp9Er474QEaZqq07HuVs0TwnZY2ABxawX2RK7S6tnr8se07WWBdP4A74Klywpis3Sc3PafInueWrKMR7xv9q0WnMR81LZIHVEHXVmCkAVbAk0maca+MH23fLBr4JwAEkA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7130.eurprd04.prod.outlook.com (2603:10a6:10:123::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 01:36:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Thu, 1 Aug 2024
 01:36:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Topic: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Thread-Index: AQHa40fZMc1qZndYQk+4NNhqZFIIlLIQ3I8AgAAZs4CAACEqgIAAewKw
Date: Thu, 1 Aug 2024 01:36:10 +0000
Message-ID:
 <PAXPR04MB8459CE89FFF5662AED66D9AA88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zqp0IZfUobg6dq8G@google.com>
In-Reply-To: <Zqp0IZfUobg6dq8G@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB8PR04MB7130:EE_
x-ms-office365-filtering-correlation-id: 74f3fc79-f0f1-47f2-0a78-08dcb1ca5279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8cwtjIEuB7jCWNaNh49r4bs8I879CMtbH8j+usUIuT/6p3N7AiJ1/c4BLkAl?=
 =?us-ascii?Q?/zKKcS2Wqw7SRRETuqBshLIGpU24VODI7evetmbTqk9jqHPXHvWZaGzz0Hte?=
 =?us-ascii?Q?gyPveUJvIO2UWBmv0a+Ac/H+z3c2XEAlMDXWJ61s7dy4mE4j7dKiaNn8l0pQ?=
 =?us-ascii?Q?1t/Ax0lYIO2g5axtBpvZ1OJNowNfYWYn8NdkeOwZ0LHAQHZwoepAGGGxXPUA?=
 =?us-ascii?Q?BM6AM6yIT8DmriIiUgobTyl7MLQWZdVGLg9R3WxeaR8+KrX66OKSwWDYoKwG?=
 =?us-ascii?Q?qR6c3SDbCbvjtxdi2nriNTwsgfk125uk4gc7svxmw1S5Cn4RynUiG+GHzZ4f?=
 =?us-ascii?Q?/k6cnebf1n1NtW+XSiwTeD/3ROtSv9S67yx45RbZFMGG9dATr1Fmnyes2Phl?=
 =?us-ascii?Q?a7IehdVOQurWRkRRTvvQ+c0mUwUQq7f/Q1pxhnskH5QkqeV+zDOJaynRFk1T?=
 =?us-ascii?Q?0kEd30oUh/HXG6ScnnfvOv8QaPrX4xbBSEGmlegyK03sTFKMdeXx1hYXuB1v?=
 =?us-ascii?Q?e3vUmEcXoyDi1MjAiT1x9vWxAhLD1d7j0lzBbEGSm6obK+HBUUTQ8EZqv5Wd?=
 =?us-ascii?Q?eXzYgxA5x8BddGj4G1WlrWPYduLHJU4UOf6woERAOHeTiTjWkJ7JOKBrOPYq?=
 =?us-ascii?Q?pwd6c8h7uqSdEhPpSlpCYAcizCCRdRC6m4TUzSGxwmtoqWqz7ezdvWc7MhS+?=
 =?us-ascii?Q?Uo3s8pEt9tzV3pIgrMKGGG+eTV9z17rvFqfl7vxOmsjmtP7NHvEjCQMbgAdx?=
 =?us-ascii?Q?FCJuKqjVzJFMI+keoBmICXsHjL97JKlw3ZTqeX2UwQuqhdOoDk388LgYOvGa?=
 =?us-ascii?Q?mEBzlWBlsD3ZBxjInorNMjp7ezLPxUU1yY88/1AQqFZWJPcTnc3TGgB2728B?=
 =?us-ascii?Q?00NEv0zJDkEKxY05GoobGs+/Y9iUsom9Qsf/bZKs4FGvltdyXzHb5L1JFTMM?=
 =?us-ascii?Q?chCluhgK6j32/JFAj8FYifwlurEChNpR9b4Ep2G+k69Ag2T7fXyBM3cE7x5f?=
 =?us-ascii?Q?PkK7dRw+I7EeVVB4Ge2HEnwTwjvQcEtwmUiV3uC23WGz8cmZ+MQuTj1SuDoS?=
 =?us-ascii?Q?z4Gyn22jpV5RFhrTpSo/aim2+IdALFlqU7xp1rLuwwhpT7/YDhtMN2CNoRoZ?=
 =?us-ascii?Q?EyMG/ym4Sdq27A/omoeMzvDtqjGUGpSOSK+oO1khbnI+9VzEb8JYHB+dAWjt?=
 =?us-ascii?Q?+4tfLyyLl5hXVKHRZPOq3YUSGTbR2g6G+I9Fp4gRhywmBASb/Q7JbIB3lxgw?=
 =?us-ascii?Q?AOlNUYzhpKL7Zh5pWA68FsNqt3ILG3A2a1OiBAYQWe7YHQPuPn5xDUPKG2Tt?=
 =?us-ascii?Q?nAaBUgbShU+nJGWSKKEIHs/yv7fKV/Ake/Uj1GUfqyOM4Cbgap1q0JfCQw4b?=
 =?us-ascii?Q?mFrEhqXCtMAgzFEpF2IfLKEpQcfC/C2wzScI1+wk+pUGtcvj9A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jJVzZOmvhgXXaYVDA0Rfs9wdJVhfemp6z3SToLLngcngmx5wH8EEiXb3rllI?=
 =?us-ascii?Q?z4DLuq6TLsQXRkPM1cm0hXy/CMapkUsR4wDXgkMlmhVSPnAAOEGMKeHll8eE?=
 =?us-ascii?Q?r9ekJxKo+XCTXEdRPgZ+pdYoZzS3woBQdo6+sqiD1TOWihKS6fYCMiHB4dRv?=
 =?us-ascii?Q?hNsIAeq8ENwf4UYLopX+m/BgF5rUooZuy+M2+LyUor9N+63RiaY4iF53SedE?=
 =?us-ascii?Q?vGLsuZPBwHBy+YJi215/O6lGAOGSr/wcNhMgii9lIXvNOzHUBM5N4JwGNLu0?=
 =?us-ascii?Q?UAPgfLO05kQDfaJSUADiK6nKtgNYN2P036Vzz4sZRP4vVl6OyrbULEyPGE1v?=
 =?us-ascii?Q?t3gWy+1EhnXxEmtmqbDCOxcxPpu/qDHxPhmc8F3ibVvOobIlX0RMp5UxFCej?=
 =?us-ascii?Q?S2KuIw8pcIG1FevF3JQb4dyFJ/SQ7kzm/uMtO1ny6Eu8UJNqSHHECB+Opgef?=
 =?us-ascii?Q?xbgfyNGJ2B3tthBR8LjIgEUwbo9We86CcCdip4nqQZlgVeePkwC5KW5Bo5zz?=
 =?us-ascii?Q?9JzhPDmYeQr1PB5cxTl0d2j7w7bhoR1LPSGYOTQ6mOQfIPjOrhRsEQMg9eLE?=
 =?us-ascii?Q?7jbp97G/kMcS8zTUyuWsyySYFpc5RBJw2QAjnfvI5h9QFzJiQ98la73L+VBh?=
 =?us-ascii?Q?rblTwgCdbwl4ThCIZDA4iuz45V7oGu42dX8oRv6BhIKDK5ZSBIBxj8IJ9/6r?=
 =?us-ascii?Q?U2TwdTxDsANaFXedv1mwOx4X2Du114qufxQCYhLHLRBsGgOf5p9xLbLh8vQT?=
 =?us-ascii?Q?fcnEFpRBCvcHjlZB510ySQcScU+Q1PIEbCg9us4ZItJ1WKNiRu+PTuqgWle1?=
 =?us-ascii?Q?I/89KgPm30ZTrQ34KGhEHL5h6h5EIa/WEBE2uFXf10pCcHC6OPm8n67R9fRz?=
 =?us-ascii?Q?nBQb01agXMg8nn+KvikjemOwH1Z95a03xfEvN7cTlL4AtxAPaap0M7ZD4Kxe?=
 =?us-ascii?Q?csm6eGuQw7u5ASckvgZdba9Lx2NbFxohlSRNfNoCTghIXMNGemJ5UldO1IbI?=
 =?us-ascii?Q?yTiWamK3ATSH7QLZ8yPP3lCs/4qIO5oMu/P1TF4oNKJCGrzVh4rSK2CoYo0B?=
 =?us-ascii?Q?HA0qc01/MgeRWfj5SDnbSty7fgdJXnEdFpn7ig1dxHEA2BW8SRqieikcSCA3?=
 =?us-ascii?Q?d3Gwpc3k4i6j0j6lT4FccxJoQI0pwx8DR41bQpSzhL+bUZ1C5kNyflIuizPi?=
 =?us-ascii?Q?f8PgWGN8/sGahVSJhiAyYHUVqppq7wtU6bOVyGQk+KC8PkJ0HnzAL5ojcOwh?=
 =?us-ascii?Q?vT7KGivxQzaMggB2XEc4s1P437R5mpVQ1d8Jr9rJcCjxHKlPkaD/kYj2h89u?=
 =?us-ascii?Q?DoK8o274+3parS0OX0Sgxjm4scLOrIoux04RnPWqewo/AVlQP7BmY+gwJAs3?=
 =?us-ascii?Q?M2Rak9ajqBLoaZkYE+cUI3uY9iwOTf65nLeBre0d4cf06hRG41hl0KAcF9lS?=
 =?us-ascii?Q?g4/MEdNs/F2QSLF709piT82mr0IRJN6JFi6l5LTtUG8A4H83jR6jV2i4/Nsl?=
 =?us-ascii?Q?fsITpuMamdjCUd3EBzk75SM4tE6mTTIGFjLfmaN+GlcuVALXwlvjJMtLEYT2?=
 =?us-ascii?Q?KGooInInrtNgNhKjLAw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f3fc79-f0f1-47f2-0a78-08dcb1ca5279
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 01:36:10.4353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tmbQPk3iITJS4OqvMLlowTaXyC3u78a0IeEgZNCbqn8NgEXpZaUXSYOnuo1qyVipPZ1CM1/0bQ3kYIMRjjujg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7130

Hi Dmitry,

> Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> module
>=20
> Hi Peng,
>=20
> On Wed, Jul 31, 2024 at 03:37:18PM +0000, Peng Fan wrote:
> > Hi Cristian,
> >
> > > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > > module
> > >
> > > On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > The BBM module provides BUTTON feature. To i.MX95, this
> module is
> > > > managed by System Manager and exported using System
> > > Management Control
> > > > Interface(SCMI). Linux could use i.MX SCMI BBM Extension
> protocol
> > > to
> > > > use BUTTON feature.
> > > >
> > > > This driver is to use SCMI interface to enable pwrkey.
> > > >
> > > > +}
> > > > +
> > > > +static void scmi_imx_bbm_key_remove(struct scmi_device
> *sdev) {
> > > > +	struct device *dev =3D &sdev->dev;
> > > > +	struct scmi_imx_bbm *bbnsm =3D dev_get_drvdata(dev);
> > > > +
> > > > +	device_init_wakeup(dev, false);
>=20
> I do not believe you need to reset the wakeup flag on driver unbind, as
> well as in the error handling path of probe(). If this is needed then
> driver core should do this cleanup (maybe it already does?).

I just check the driver core code, you are right, there is
no need do this.

DevAttrError:
 device_pm_remove-> device_wakeup_disable(dev);
 dpm_sysfs_remove

>=20
> > > > +
> > > > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > > > +}
> > > > +
> > >
> > > ..so in v6 I asked you to add a cancel_delayed_work_sync() on the
> > > removal path, BUT I missed, my bad, that indeed above there was
> > > already a call to cancel_delayed_work_sync() associated to a
> > > devm_add_action_or_reset....so now we have 2....also you should
> try
> > > not to mix devm_add_action_or_reset and plain .remove
> methods..use
> > > one or the other.
> >
> > Thanks for your detailed reviewing on this. I will wait to see if
> > Sudeep has any comments to patch 1-4. If no comments, I will not do
> a
> > new version to this patchset.
> >
> > If v7 patch 1-4 are good for Sudeep to pick up, I will separate this
> > patch out as a standalone one for input subsystem maintainer.
>=20
> If you remove the duplicated cancel_delayed_work_sync() in remove()
> and unneded device_init_wakeup(dev, false); then you can merge the
> input patch with the rest of them with my:
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks for your Ack. But I think patch 1-4 needs go to arm-scmi tree,
Patch 5 to arm imx tree, patch 6 to rtc tree, patch 7 to input tree.

I put the patches together in a patchset is to let reviewers could
get a full picture how the whole stuff work.

For patch 7, I will send out it as a separate patch with fix and tag
after patch 1-4 is ready in arm-scmi tree.

Thanks,
Peng.

>=20
> Thanks.
>=20
> --
> Dmitry

