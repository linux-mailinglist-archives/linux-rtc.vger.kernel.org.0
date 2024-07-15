Return-Path: <linux-rtc+bounces-1500-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F393135E
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 13:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF7E1C218E1
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 11:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C6F18A95B;
	Mon, 15 Jul 2024 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mp6TJmas"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C381891BA;
	Mon, 15 Jul 2024 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721044082; cv=fail; b=ghm6MGcBox961uh2Wj5BwpyjhOdIrOafgah8Oo92louxolBS74E8dtVtNvbqA4rDtxn2qRQiiJOAUdwNDkAG2ruZJ7P1jMdYiJF82JySY20PaDF5qQ2vuqFqpm+X9QhGhHId1UumfdYabtpUwo0vocvJtww6Lh5Xfg5dCep7TO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721044082; c=relaxed/simple;
	bh=dSrLSuzV8uD+aRqPmJwm5vrh5n+mObeU1MCpEJEiB4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjV5YWCZNPbylZ0YDtP9aCexCBMM3N8T7jpz72FFWmmINgn7xCu57mqofcJ9t55gPmzCZX1cpZ8/8PWEuqxUr40PdbSb/A1y1j+b/HyHFzdDKkszIDNVL9HsWvP5F3d085jDZFtjGbr2g9ZIuYfst68kGE7WQGDTnjIXCGsaClQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mp6TJmas; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha0oTtEcBvW5WoLahcGxlyQy6pkLSDG1iWKQCgi9TM4buvGS7MRHzlH7WKpsdi+ydx15H69fyzHEBojjlwiiS1f/+yHA6FAilNJRWdkRadXsxNl4Gp96PxTT3dGTi5FVAgUa199mjjY9vlom3PcqrzjcXJWUNyg1DnrQ2Mxb1Raou3n3PCYdVyusl5IKNuhi/jpyu3vTxtg/fP6ORJRX56dAfcW77aauySbkav4tGUr7CIDuyWHqNB2w6fpRzPRa3izqt6PeRVO3dD4nRVRrjiXiRnqZ64LPGIEZSRY/XJg246WGCWogPoEjJooqB4aQ280kPSBCYsJBeSzvB0zktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GM2wdUQ8G9URi3A6JG6kDrVFB9Eo1fTGxW4JRYlS3V0=;
 b=MK1DWf+7IXWTMga2JbG0ArfNKAH4Uh4rHk1qSgnwlELg6GF4EFFlYqTsnCsMLgYZbqQ6gyVb851WD4d0I4Wsz54eN+n8IqpD21Va9vMblssnO9KCf8LIIfV1cCLzMZZixCGbc2vjhPbogQtJDXImwRYnwja8RwBBqujmbKh7+u4IJ/bFy3dAEVC4/DYqFEY9RNEge7zzCUGhrN7QEnJcpP/WTps6+UZMdCG4/YgE2hDcEfmBrZ1o3boGL5UBPmYnrQhi16leYkokgWcHrsVfqU3eP4BSfVQGDaXu8/cf9+Zy1WgDHl7Q9AtHveGH3ZiATMiUjI24lo/Qy/8Mkapkgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GM2wdUQ8G9URi3A6JG6kDrVFB9Eo1fTGxW4JRYlS3V0=;
 b=Mp6TJmasOOhRPKC1GK3xkeCT1HLMbtu61HOGtJ4Z/xl4PGy2a6i8742pWjXCXe5cMspqhbLgwuJNLY2WA3Y2OJvq/ox2UR8yVKanmA9cjtpWuTMuJME87yVxDwu2IoQOyLR34AkeIhqlfrxdpZDr/7XoCvIExBg/Y7tjYTrdMQU=
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by VI2PR04MB11050.eurprd04.prod.outlook.com (2603:10a6:800:27c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Mon, 15 Jul
 2024 11:47:56 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.7762.020; Mon, 15 Jul 2024
 11:47:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95 SCMI
 documentation
Thread-Topic: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95
 SCMI documentation
Thread-Index: AQHaw6gJ3kigbFXI4ku+minp7wB8vbHxoakAgAYwAHA=
Date: Mon, 15 Jul 2024 11:47:56 +0000
Message-ID:
 <DB9PR04MB8461684315E753DAFDDBACA788A12@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
 <Zo_bFnjWixZF6seV@pluto>
In-Reply-To: <Zo_bFnjWixZF6seV@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|VI2PR04MB11050:EE_
x-ms-office365-filtering-correlation-id: b91a56fb-ac1f-4c2c-e31d-08dca4c3f7c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rsnoev//MaU8uQEoomqUwLqCsZPiVA0KyfdazBpRjrHHAHjUK89y0MDd9wTM?=
 =?us-ascii?Q?kGlahkTZJEWYuf/fNhIOfcL2Vh3JncmUuYzqQJUrwtS8MssxHdfYL8d1+Drc?=
 =?us-ascii?Q?t3LDZswwpfFe/g+IUNL/FYHNB7uUULW2vuTCfC5lKRNI1DEF/gp+EX0sjzuB?=
 =?us-ascii?Q?eWtSRM92KkBD5aKkXqR0Ns1p92ituO02uk06CyJ+mXI9W7jjQ49DQxL55b3e?=
 =?us-ascii?Q?dPMBFa4npUKJMn1YkHpCo1QdxpeB8/DxqFXzAgZvzFaA+0NVRFVGhix1hVU0?=
 =?us-ascii?Q?fRUR8JMDSdJGSEfdwuw9nUeUgmDtqXHaNqrQ47R9bxEoNGIuQsXXw7faj3nd?=
 =?us-ascii?Q?6aB88fHn5uTmCkIoQpadJWGrB8o5a5g3Nimds3I9OxsGuGHbdqIsvHgIAUlV?=
 =?us-ascii?Q?k1ZfCxwjekCJaQU5Po66UekdMwqhiy53Fz021jnp+8PGqFBM0MQY/qhggwgf?=
 =?us-ascii?Q?a4H5p7BGtvoTEFheStNEHncFbzkw6/M5kcaqSUOhWjzuqtbXrDzg2JTGynaz?=
 =?us-ascii?Q?WPVpy/WvIVW/wueZbNO3qcZsyoazl01Ovg5JQCB8m1/I1gzAmgjsRqo4rDTm?=
 =?us-ascii?Q?CprjG27viiDTYfL0ZNG6XfvwLOUixXiGoJ//LH8FpT5bckIFAnqAzy05usOn?=
 =?us-ascii?Q?TZSpq8r7lCWRqj6I9nViv13j28hnYofNVrF84dTnejr+RsrAe8t5yaXaW+dJ?=
 =?us-ascii?Q?lGaD6Hqkx5Fz5bJ7DPi9q82BaikdgApWFCv3A1I2LgEMooNpfbC3oS6+zYLE?=
 =?us-ascii?Q?DKNy9xUNORfmP+xYQ38rn4k8RM6zrRGZAvLTnAmFDRw1WzNINKl/lyo3SmcM?=
 =?us-ascii?Q?NABQ3G5KM7lWiS0EiAOy03GG/K060r9LZlUraJTy19tVrOCFAAXPHqYgRMVf?=
 =?us-ascii?Q?i5x6dmH7s82n86Imq0pdfGap4B7q7QvJjyq7q8qpMMeTVc/CwGxLulqJSsuj?=
 =?us-ascii?Q?lo1lPCQKCE2lWlHMMuFRCRiSdSVkPr6CF/9m8x2VCRHLuF0XzV7jCGmrEavM?=
 =?us-ascii?Q?ExVj0uPC5I0GhySasdHvtZp8qxmZnRqkQPzq7pi74xYTHv6SjP5x3goUSxcf?=
 =?us-ascii?Q?a+zq0MLPUDZ1qC6zrjool0ZBBZwB1xlxT/LW9LjaIJWeZbkZZl4Z9oUFCyz2?=
 =?us-ascii?Q?t46i9qcQv152rvR5CVqsA1DMX3LMJYnYuojn4bcnZAXE9Pzsz+9HS2nJlYOz?=
 =?us-ascii?Q?4CUHqmIAkU1+/BwsjcrOec3k1MtZDJ/08q+Fbme8iHMTsXliTYuG5b+KBQz+?=
 =?us-ascii?Q?mQwx6ffsUZSXf5HCGRcYpoFLQb507Ya62/BmVS47WRYny+3D/iEt2EBIVBw6?=
 =?us-ascii?Q?tFjlfW7iUeT6M2Z8tqZcAldIdgAKer85c9H0A8VYLMwR7n3VYisNaUqA+bFC?=
 =?us-ascii?Q?BF5OC/YOe2/DvWpaUEq7NHehvBV+lNK7QFXmU/EHHG08/a+++Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HWu5/IK7J5K0OHbDonl6eGwBO+SSf3GRNJSxaE63OGDLmttAgwbKXtR7nZJd?=
 =?us-ascii?Q?hT1Etc+y3r/Pu8CALS0/oAXaE542omHe0YoTNM3xbERuValhsccfFS4mHS+q?=
 =?us-ascii?Q?DdxMkldLh25fU8zTyNkvgImaOtPuoO5lWJDauFclJ5ckcKmrTxV/5SK2YC0e?=
 =?us-ascii?Q?hyInY1uaftMF4nk/P/SBNmdan9oPFDRRqK3kGcJMWfwCPLftS5HBIc+q/0/S?=
 =?us-ascii?Q?axrsJRDECqME6bkX4/9SL0jg0N1u5Zg7WPw29lCblTq3B4i1mYV4emS0edN0?=
 =?us-ascii?Q?rYNw/ZfmJWF3XSQBfqlSqPrvc/JoP1ZN6ASvwh5tAcpmfCs5toWi0i6XnS1M?=
 =?us-ascii?Q?XehKqKzNpPAuSwf81cw1F/m5ut9qeMkYZNmmdmL1MW68w93EL5pcGW2bwYfQ?=
 =?us-ascii?Q?rO0qZ1+QCIkAWQFc58e1/6rO5d6S54KolWx6LmEnHtOmxWGI6WUTJkVBTnJn?=
 =?us-ascii?Q?Fw2YIUIBFzODPqHsnkjUNuQLURnuAparQVutjMeVMYxCzNCdmFROpTdEE4Hg?=
 =?us-ascii?Q?8tpRO6/Urx/2P0R2amxjQorOnhkAJiKvFPMqcEcss9TxNzeVEXf68Kt8k21j?=
 =?us-ascii?Q?YUi7ZPXoyIBmYAWo1lGqVn1E7jaiPywSYZsHbgiR5XWmwZ39fVovhF0LKA9L?=
 =?us-ascii?Q?n4DcVidK8f9NSPa23fd4dlTI310aycXm9HwctCVN0WNykzXi/tOBYAFzpbOi?=
 =?us-ascii?Q?imlOrr6gZigsig+cIqGtYXfwCmtVNhaBK/VIO+s2NNUbP7gll65XBefCZ48f?=
 =?us-ascii?Q?R1ul8yzJkeaXbgAqXdlHp6/N4WlK4H8+46mr5e4jcIEnnh5iz+QJ7ehNgq4w?=
 =?us-ascii?Q?iQBI5JHGqBCwxGVavPuBW2EegtWplFujOpxdVoZGJGBsjR5nVEVh6981F2Mz?=
 =?us-ascii?Q?aiXcGzErmXVbm7g9PUFJdiXYYj9L4qNBxWzOFNsd2UICqzz1T/An6ZrqUAa0?=
 =?us-ascii?Q?BDMh9IumaFPGKwtjxpcoO8vjZCkuRQS+PgzAlVrbdD5dMzLpQe+0mj+R+51b?=
 =?us-ascii?Q?PGc5i+myGLQPa+M8ujbcLrMygl0rmIIbt5PGliv/m77l2a2MFl2kWf/sUIqJ?=
 =?us-ascii?Q?wHcELI2Tv05njYL6m1BktOEVyhWG9zqp60h2QI/9OE1X12QZ9r3Ra/XCN5el?=
 =?us-ascii?Q?c1VQt0O0z2CTlHStqtHGfrBY1J4xSNshorA52mb8Z2EkQGSu98t9oi+6JaQU?=
 =?us-ascii?Q?Pv+NAl46Augc5XdQuStIzZT6NTLBL420OTKyMxe/kTNqd88f7m97+n5cV4pF?=
 =?us-ascii?Q?O7gQ8T42zYT/L4/btOCEMTAIyCyN864GFow9CqAJG5sCLvraZ0wve7vERzpK?=
 =?us-ascii?Q?g27OlO8s8iTvPnOdiNG7u8rcveXL3TV9CtCGjCsPXwKUbH2oxBD9IOzRQyFy?=
 =?us-ascii?Q?LLj2T3xnB7kkYgq3x1BvwtpwTJyS/DfplbwfBSBbs+fnl2Y6zAsSBRDATY7U?=
 =?us-ascii?Q?LvkDDyzTNdDbOcZ0IY++5tcC1Rh4ow6107qW+foBomTn3NDFibm/9uKMWm9S?=
 =?us-ascii?Q?Nr21U0Tyx6TuS2xp1PLcRmL5fcAREDqtlSNqG8hUBhJzULPt+E4DmtsyoBrm?=
 =?us-ascii?Q?DcU7oAzKpJa+C2VgDEQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91a56fb-ac1f-4c2c-e31d-08dca4c3f7c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 11:47:56.2301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKo1Fa+/A9kXARTcqC6r/S2+daVb+9ROU9zQq4eTec7NO2/N/IU8CkzEOUMZqcCz9Ox+ifpnXiFSc3RE9TQZGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11050

> Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP
> i.MX95 SCMI documentation
>=20
> On Fri, Jun 21, 2024 at 03:04:36PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add NXP i.MX95 System Control Management Interface(SCMI)
> vendor
> > extensions protocol documentation.
> >
>=20
> Hi,
>=20
> beside the final location of this file in the tree, and a few nitpicks do=
wn
> below.

Thanks for reviewing the patches. Except Documentation/firmware-guide,
I not have good idea where to put the API doc.

Sudeep,
  Do you have any suggestions?

Thanks,
Peng.

>=20
> LGTM.
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
>=20
> [snip]
>=20
> > +MISC_CONTROL_GET
> > +~~~~~~~~~~~~~~~~
> > +
> > +message_id: 0x4
> > +protocol_id: 0x84
> > +
> > ++------------------+--------------------------------------------------=
---------+
> > +|Parameters                                                           =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 index      |Index of the control                              =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Return values                                                        =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|int32 status      |SUCCESS: if the control was get successfully.
> |
> > +|                  |NOT_FOUND: if the index is not valid.             =
         |
> > +|                  |DENIED: if the agent does not have permission to g=
et
> the   |
> > +|                  |control                                           =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 num        |Size of the return data in words, max 8
> |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32            |                                                  =
         |
> > +|val[0, num - 8]   |value data array                                  =
         |
>=20
>     val[0, num - 1]   --- typo ?
>=20
> which I suppose means that this  field is variable in size depending on
> num value...
>=20
> In the gneral SCMI spec I think usually we write something like
>=20
>    uint32 val[N] with N as specified in num.
>=20
> ... but I am fine even with this val[0, num - 1] if it is intended to mea=
nb
> this same thing, i.e. variable size field depending on another field.
>=20
> > ++------------------+--------------------------------------------------=
---------+
> > +
> > +MISC_CONTROL_ACTION
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +message_id: 0x5
> > +protocol_id: 0x84
> > +
> > ++------------------+--------------------------------------------------=
---------+
> > +|Parameters                                                           =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 index      |Index of the control                              =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 action	   |Action for the control
> |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 numarg	   |Size of the argument data, max 8
> |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32            |                                                  =
         |
> > +|arg[0, numarg -1] |Argument data array                               =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Return values                                                        =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|int32 status      |SUCCESS: if the action was set successfully.
> |
> > +|                  |NOT_FOUND: if the index is not valid.             =
         |
> > +|                  |DENIED: if the agent does not have permission to g=
et
> the   |
> > +|                  |control                                           =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 num        |Size of the return data in words, max 8
> |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32            |                                                  =
         |
> > +|val[0:num-1]      |value data array                                  =
         |
>=20
>     val[0, num - 1] ... for consistency
>=20
> > ++------------------+--------------------------------------------------=
---------+
> > +
> > +MISC_DISCOVER_BUILD_INFO
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This function is used to obtain the build commit, data, time, number.
> > +
> > +message_id: 0x6
> > +protocol_id: 0x84
> > +
> > ++------------------+--------------------------------------------------=
---------+
> > +|Return values                                                        =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|int32 status      |SUCCESS: if the build info was got successfully.
> |
> > +|                  |NOT_SUPPORTED: if the data is not available.      =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 buildnum   |Build number                                      =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 buildcommit|Most significant 32 bits of the git commit
> hash            |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint8 date[16]    |Date of build. Null terminated ASCII string of up
> to 16    |
> > +|                  |bytes in length                                   =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint8 time[16]    |Time of build. Null terminated ASCII string of up
> to 16    |
> > +|                  |bytes in length                                   =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +
> > +MISC_ROM_PASSOVER_GET
> > +~~~~~~~~~~~~~~~~~~~~~
> > +
> > +ROM passover data is information exported by ROM and could be
> used by others.
> > +It includes boot device, instance, type, mode and etc. This function
> > +is used to obtain the ROM passover data. The returned block of
> words
> > +is structured as defined in the ROM passover section in the SoC RM.
> > +
> > +message_id: 0x7
> > +protocol_id: 0x84
> > +
> > ++------------------+--------------------------------------------------=
---------+
> > +|Return values                                                        =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|Name              |Description                                       =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|int32 status      |SUCCESS: if the data was got successfully.
> |
> > +|                  |NOT_SUPPORTED: if the data is not available.      =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32 num        |Size of the passover data in words, max 13
> |
> > ++------------------+--------------------------------------------------=
---------+
> > +|uint32_t          |                                                  =
         |
> > +|data[0:num-1]     |Passover data array                               =
         |
> > ++------------------+--------------------------------------------------=
---------+
> > +
>=20
>    data[0, num - 1] ...  consistency
>=20
> Thanks,
> Cristian


