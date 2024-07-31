Return-Path: <linux-rtc+bounces-1651-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B849430D7
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 15:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85BF1C21D18
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1E31B14F9;
	Wed, 31 Jul 2024 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MvC/6inP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA741B7E4;
	Wed, 31 Jul 2024 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432587; cv=fail; b=csPUyzwaAyojTRgOHpgv/fKPM6QhMdBs4zrzeborV+uu+Rkw4aGR7yLslSOpoIDtrefDNe/l6cVFtxYSyq4hjALkah0iUDckglks3R26vGHqGNCZ9/KwOX8CMypE4tIRPpkkNw8uwIn+RXuXBdAMsj1HADptYzjm3wfYZPYm4YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432587; c=relaxed/simple;
	bh=Km14hJLFBgDh0IyghkLM5jjKlH66jXPAUzHFa4V/lvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BxEGdka0hnmwTiIXgb0Xwcp4uuvQHh3EbroCImMQaol1gO44XEheoI91Sv7Fim0zfPhQ3fkPOCpWiS03OVSk6ZKXWYTPinyo1Rsy6avsw238fgB+53WkVClCWsO6BOXPHI2fMBMK3lCyUmXequGoy+vcAiUxVozXZ1k4NJnodCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MvC/6inP; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTNSaPj7Isx+fsqH8A3PencrxrjZ9aCKl7Osyi7HyPU8vW7gSQ36sKwb6HUy6Ssw7HJC5eHlwlds5Ns1aEZ+L5PpddmummpIqwLo73ohNdOnRs5BKFYXQNOKFJB3lO3Mz4RZE/RQb26C5F9wewqsP0+exx1yjPe8HfTZ1ryE17peyygVa2ROGoeLl4wlc9vqgBUmgb2uv1hQOgAGJCkNP1bsW9xJ+8106J0BGtLEFuxHwPJqv/Xh0Q591ZMSZxNwnzxp+PPeoK8VFhNrqP3E710NirF4L46V3H2yLzqgLKrGfLcmMEiHygCFoqf3gmgVhtqYQtEp81L/8k9N6/Nf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqRLIic8FPmyU4idAxhlHQyukle8t0/ntaTzodNYKPE=;
 b=DjjClVAJd748LjbPN49DKcobVe0OuniDniAY9VzEpM1btQzDpNWu4BkFdgFvy6DX7q4JzZoR4afy5S42boy8Y1DxwkP+zo7aHLBgfcRnV8tPzF3BwXy92d8q3bDgzrRIq/k9/a13Nt5TBa85Ah5XnRNXhfdQzxUF/lHXTmJei1ddpECERkRA3Wgnkhedt0Y0CSPA4vMz6QUwS3OKJ5wB/BpH7z6hrpdveeO5axgat5aH7xVLj/W9BkLA2zKlbr7FG7KVpMvYeENTjYCUr1I18Ry6qEaOT9sOlMUBNjFS75RmehdrRaqTbF3Af/gJQbv/alTfMLjdwO8G+Yrovk8f/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqRLIic8FPmyU4idAxhlHQyukle8t0/ntaTzodNYKPE=;
 b=MvC/6inPP4WBXJYr+JM/brOuZOV1wOJy3ArjVQ8SC/S2OQo4u8XET/UuSn7vKagwn8jcYTIcILDtGVEbN/cuKfxqrqbByhNcvnGC4hISJb6xbt9zCHVklCaV4SdRFqTBtFWm5bot7qQyRYsRfAjxvP4qIVjEDPQg4md5p6bUnelYnrDiqXfWlazeo9AwTtVrf6xMt6g/i1huM4EjT7kWiMI8iTYjOE4BAozqz47iSUzDZIQ0ohsOO/e/gcG18WlBGROOwpYSmmA8cynBalJ0kmqgHwrQA3brzHuwXKOyWEii+K92UfJtqtOvnMmjAYmjyCQ6LkCWB0yZQJccuEhkGw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7584.eurprd04.prod.outlook.com (2603:10a6:102:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 13:29:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 13:29:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Topic: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Index:
 AQHa2OS7+2aa3wQFTUOvpCXejm2gC7IBNFWAgA+fxyCAAAY6AIAAA6BAgAADAgCAAARbUA==
Date: Wed, 31 Jul 2024 13:29:40 +0000
Message-ID:
 <PAXPR04MB845901BB684C6DD6EAFF6D3F88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
 <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
 <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
 <PAXPR04MB84592DE4592FC5D270F0820B88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <ZqovdlPcnBbZn0Ue@bogus>
 <PAXPR04MB84599389611E0E789E425FD588B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Zqo1BpZ9i3LC_TIQ@bogus>
In-Reply-To: <Zqo1BpZ9i3LC_TIQ@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB7584:EE_
x-ms-office365-filtering-correlation-id: c96c143b-01b4-414e-7cd1-08dcb164d4b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k5Po/xe69QR3p6AuXfvUKI6MMDjT4hpWIQ26iRQ/TEzBtofw90jxHV6R3ZvM?=
 =?us-ascii?Q?N62BCF9G9wuDTKdg7889MYRITaHaph6e23MNpXibUGeURekEiJvWzDbeCrCV?=
 =?us-ascii?Q?quQ3Ld7nSQLozN4dhqDp9NsegR4Sr6iL6NnCsVHO+lZTkhAmwQjIlq2X7tMC?=
 =?us-ascii?Q?v84wFriHzQQqwY7xScW2neeGpwu4e0YNtH2mZ3Z95shyQR8I/qVGLuAz51JZ?=
 =?us-ascii?Q?8RfqhHDgB9ZqTrhJtRRvk/fQYPVGxczwqMAahZFspVdmc4EInYakpks0o4YB?=
 =?us-ascii?Q?hBMG/G3B+iT2FfdQHYJ2KXiTVCf7fE/OLCslWa8BENvHst6bU+HIvw9hF9vk?=
 =?us-ascii?Q?WRVEUqdOcTRbOFoW7N0mova+OCP5czohE9Lol4ByiAjKSlSw6UvTe1jvkmzn?=
 =?us-ascii?Q?mWPgr6ttLV6F5PJdX0cDYxtgFE0OEsaBbf2vbp4hpLDPcaedWgOU/VEUPNX1?=
 =?us-ascii?Q?XDZiG2zWERYwtVWAanUgsfJxPk86dkVza5as3nSkIea5/iXw5n8AmVM9vkgQ?=
 =?us-ascii?Q?AekX9Lul102u3OfsYETDf8tAFeYUHE/SIvdq361w50X3D6YzneQi+ZuA4hKU?=
 =?us-ascii?Q?+Zr1pq/AKQ4bTR45faIKFZBXNKSjWU4pVPSRW+wjTFC7YrunaDk2bf66CljK?=
 =?us-ascii?Q?iW9lKgrbfFpyDzmQdW30nM6T9mP9xyI2jrxHo9ykP2o9+RCj8j4UFLGU0bOC?=
 =?us-ascii?Q?gVXihUyTD754hhGknzrbNj9X2OW+gmJVOz3w9NqphZkqm+aNbKn0Xie2WpFk?=
 =?us-ascii?Q?MXQ60rlHG1aVDj8kJzgZ3BQiyRrSEmySrFUWby4/NrAYVLKLJIHF6rWk8vUA?=
 =?us-ascii?Q?GJlO8nxeH76gwg4LQFqXNB8UgXLBDCr+L201gJP9RXX7n6Oyy2sKhcQBM0A/?=
 =?us-ascii?Q?pvkOUA7GJMZe52Q78/d0P690huBGCwnS/utwUa7VtZkTypuwY+un8r/RRh4Y?=
 =?us-ascii?Q?FLhFgriECy2fJ/k010Cm40TTXusripIKG698QV0ZeKzufM9VDGbPzA4Eg8wx?=
 =?us-ascii?Q?73BXxN/DGl2/T4uEj42uPIV/o7lVcjXKcAcUiKK52OMUKHpwziUjFAI6cEqi?=
 =?us-ascii?Q?qQqb9ctmVcrLI0XP1NBVunqfVxhgrmlWD0K1YuKF6+kpbhs9GgTjgF1wRemT?=
 =?us-ascii?Q?AOkauLMsX491ZJrOx0iDxNtluNVp/sLxioydo2hvbQOCqE02EL1DMRHiIxdH?=
 =?us-ascii?Q?0a2kuxjSxQW4LK9JX4ZhaH4Q46e2nO4DMSQUATzaOZ4RGPOZfm/doEd2GvEK?=
 =?us-ascii?Q?eTtyZPEC5JdJrz0S6lM3PupGBJwh3aM/XeyuDKUWb9LeAT76vPo7yrhr1Q6Y?=
 =?us-ascii?Q?MxZaYSQqeuYKGteHyMDk3dmVsh15lEjYZqbCzb5kQQT7xwmZny//O7VPy91N?=
 =?us-ascii?Q?J0kMSQ3C9ykHFd3uFlW+8dwyfvE3BYbhbQcEZSjdKEMLp3epLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2G0N9qkol1RLMDFi78OjqT7oQfU7MjTkanTEgcXV28eKcfmh4sMLCAEb6j3b?=
 =?us-ascii?Q?QcnlVjSFuiBKj5Du3qkS4OYuOEhg40SNMfY6ebXzK+/WLvdUu3w9Ckib3t2y?=
 =?us-ascii?Q?IbFbuvsvoduf/stSpH4OdaV+ZP7xu50/xkmUC+Iu0F8+21JW52XbgB6L8bvm?=
 =?us-ascii?Q?xD1v52p65cnR4YveJyceSjXlvDpR20LWbNoyOds3n+p2KRgG8YfMiB0N79GL?=
 =?us-ascii?Q?FKBzbMSAGxjpviGfnJzC2bH9aQROK2jry12eL2RDfd5LkjhhBdo4zLfGNpqD?=
 =?us-ascii?Q?yjxw51AcaPWE8z88t7y6zXjRwJVvXSVrRHVWe55OUfrWnDQDjusgj0G13aiN?=
 =?us-ascii?Q?2asmb3QC5Fa2Lelq2TVqoIn5djJXQp593CK1ENKwt3VJCRm33gI1Q/vnVUv9?=
 =?us-ascii?Q?vLYQ0czTslkHydw8ypcfStTxzE/bvwhlXA2aPyr0pnlx0G+u1CEz+RUzWNL/?=
 =?us-ascii?Q?/Jf5VsnN0trvBMHg8yfp8xfYHI/z3qcK7GKBKeZpWZtlC2cun4StWRgxjeYf?=
 =?us-ascii?Q?Xk/xidWf/+qgJTOgzESJryQ6oFQZpzgD1GVonXNYbfFautnwJpIWgG4kg+nC?=
 =?us-ascii?Q?PAL8fXIDeqkWj/NDOUO7ExE7X2lVTD1gN4DjClFKsPip4XcjMPskodyBj/O/?=
 =?us-ascii?Q?dArmvOm55a5AbjMokRCya5fPtmzeoqm5afuylyf7XJM9eQlqv3u602R4rKmb?=
 =?us-ascii?Q?5v4nx7eaUG26Hf+TxWpwEIhreO021GqsFEqJ9Xlfx5OishDyhlDM2xmFhHeA?=
 =?us-ascii?Q?mpbluOheOifx/JlCG/cST2sYOxySDsPi1QqW96DKFgLCRMgP9jD3twMSwMcG?=
 =?us-ascii?Q?SeBcrL46BbOaYkATynFns0WSHl34MohWerJ4U+WE5qbmVANrA05xZ+hCLksg?=
 =?us-ascii?Q?Sr16nZinVvAe4goy0LV5BAJK9FywoFEIAQnUekpMG6Pypv2GKEv8jguJ2iBn?=
 =?us-ascii?Q?OrChsd9CeNu6XbjVoGhoGje2qQcrwOwA7GI5sebJRQk3+lpArMFtqjBt4Fze?=
 =?us-ascii?Q?RhZc4I31MdTWVIVzyZ60/esZLezwSBqHsp/O2fNDUvoMhYViT8j2HiIcjHFb?=
 =?us-ascii?Q?GzzE5CSIFLUkfPlpZ1Yw8vr8ylXQJDwKZvj/lrjStwCdvvqq1rZMdRf4DaO4?=
 =?us-ascii?Q?nHeifblV6TxDw6ljbMISxGU8gQCT7cq3XkxFt2r43H8+3NesHaZHuDyPqShK?=
 =?us-ascii?Q?cm6eqedLhIrxD2potN86L7hhwxi7czi6nQdhcmEYbfLo3qfzM4Q8UzKfW+DY?=
 =?us-ascii?Q?WKFJyMD75f/VXchkqq+a4x/5ha/QUs6pcyoqrhNOpOeUJadsLDPMVZYbcvAC?=
 =?us-ascii?Q?BUwsgb874jMbRKwmPkzPRu/v/tcIi7nok53lsdq3gsBAseT7UFESw3CRSEO/?=
 =?us-ascii?Q?0T/DUZ28LPrVrU4Eu51gIBUemSsiG6wqcLdr/GEIeruaWIyw1TO1if5w16za?=
 =?us-ascii?Q?XyY8tuRD06aBvgFZVCtlxKqho4WPgyqOlpCQu6+0LWyyfRUgHKAxZXJdnElo?=
 =?us-ascii?Q?EIsw0Y3KoqroFKEI3lUlASQcumcwCk/CyBVpac417npdTS6c+6bIr4CY/MIl?=
 =?us-ascii?Q?E5CDYVujMalTM3RSuuQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c96c143b-01b4-414e-7cd1-08dcb164d4b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 13:29:40.3120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Der6bZmPxp6M/bm86WGPrTof3w2j9XSHKzFTbfX0QuvBQKmamtNVOUp7eHs4a1oylKivEdevf0eYourwFOGJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7584

Hi Sudeep,

> Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI
> Extension protocol
>=20
> On Wed, Jul 31, 2024 at 12:49:59PM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> SCMI
> > > Extension protocol
> > >
> > > On Wed, Jul 31, 2024 at 12:18:28PM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> > > SCMI
> > > > > Extension protocol
> > > > >
> > > > > On 18/07/2024 09:41, Peng Fan (OSS) wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > Add i.MX SCMI Extension protocols bindings for:
> > > > > > - Battery Backed Module(BBM) Protocol
> > > > > >   This contains persistent storage (GPR), an RTC, and the
> > > > > > ON/OFF
> > > > > button.
> > > > > >   The protocol can also provide access to similar functions
> > > > > implemented via
> > > > > >   external board components.
> > > > > > - MISC Protocol.
> > > > > >   This includes controls that are misc settings/actions that
> > > > > > must be
> > > > > exposed
> > > > > >   from the SM to agents. They are device specific and are
> > > > > > usually
> > > > > define to
> > > > > >   access bit fields in various mix block control modules,
> > > > > > IOMUX_GPR,
> > > > > and
> > > > > >   other GPR/CSR owned by the SM.
> > > > > >
> > > > > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > > >
> > > > > Why quotes? Which tools did you use?
> > > >
> > > > I could not recall why have this. I will drop and resend the
> patchset.
> > > >
> > >
> > > Resend only if you have any other comments addressed, no spin
> just
> > > for this one please.
> >
> > Sorry, I pushed the button too quick to send out v7(just correct this
> > R-b tag and rebased to linux-next) before checking my inbox.
> >
>=20
> Just makes me wonder if I should wait for 3-4 pings + 2-3 weeks after
> the last version of any of your patch set without any version bump
> before I can look at it. Otherwise it is quite impossible to match your
> speed of patch respinning and the whole review process gets
> complicated to follow.

I think you might be busy. So just after addressing Cristian's
comments, I post a new version. Then I think Cristian's R-b
is good enough for the patch to be queued into your tree.
So I did not wait for your reply on previous patchset.

I usually wait more than one week, near two weeks. If no comments,
I will ping.

>=20
> Also it is bit sad that you thought it needs to be re-spinned just for th=
is
> which can be easily fixed when applying. Also I haven't even started
> looking at this series for the reason I mentioned above.

I did not intend to bring trouble for your reviewing. For future scmi
related patches that I do, I will wait for two weeks to collect
comments. If no comments, I will post a ping(if you have a patchwork
queue to check, that would be better). I will wait for your
reply before post a new version. But if Cristian's comments are
enough for me to do new version after two weeks time window,
that would also be good.

I hope the upper approach is good for you.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep

