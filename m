Return-Path: <linux-rtc+bounces-4242-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67655AD18D7
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jun 2025 09:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B7A188B9E7
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jun 2025 07:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C969C280A2C;
	Mon,  9 Jun 2025 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TemttoME"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF811185;
	Mon,  9 Jun 2025 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452878; cv=fail; b=FhlybvWe+aEjaxMYug9v8wJt2FICLPrDKUhqVWNfCeubLBJBECkDwAs19Kbvraf71NIo1sVv8B+OYAtPc/X60eIByDNQT95IXP/I7kvLEmYjvUjUcPHsrRuKkucxMtiCE8jtsN3AX3WCtTyXylwRw4EHzaqJx69p624UVhDDQpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452878; c=relaxed/simple;
	bh=yt5zhpyhsn0RgpFDz8ciR6BWJmlyjsqIQ53qFzPjVAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eWcMYP+QQTf0l+GrTpjpIu4FV+9x2mzVKvikG9kETbp8SW6OzR6u4lv75uuac7UsRh+5h1AYSxH8Het0CFEM0vBCx3YA99/mHFIM21p7ml6npeRTCRJ/RCcutWtyBcChAPEoaB8txhDBh3raHu8ueVtTcKm8p9CINvfJnlzDnhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TemttoME; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHrhaPJ5GYq40aWwm0oJkywtqbrY+Y8BwsAAyH2Nl8jrQfQVpb2LX2xs2sSOAm8njYri16qeBS7GWcBBXoG1Flk8xiXBONHyQ7dve1DHWQqg2hZrEe91gE0Q2T7gW4pb765stbrmQfM5FMa1hSNhFL/YeFpYUZAZOTjMWlM/duQ7OjrSyxiawt7Bvo5Zj2hsd13vod/lPfSejh0klM1I2h0lrNHk+THyOGIyUjeXaoGObXLxhYKMwwL2l/U4URj+vzhK9R6W7JRQTeK/NNwkpridwwQEj177ETKaXNzyrOCxbteW4Sof3h3RKJXhSAdpYBtDFwB3MKreHmBfC/br9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt5zhpyhsn0RgpFDz8ciR6BWJmlyjsqIQ53qFzPjVAM=;
 b=Aj/uvTBUvEYiKbUNmRw4xChxN9NrDJfJtMzJBuKfliYi8vQzDbw3WrxTYewiDCHhG1x48fdvhRzu4YD0p6hTd3v4vqSKE6dLedXQSndtQHpJ/E2rWc/lkostl99FZyQUyh8g3zshGh+/XuMOmJqiHXOvhp6sXfgUttXDUzJ7IDVi2y9HUZzZuPw7gdzLmeBUJfhewTLTUrAg1KfGyQc0fZK2a3Umjk0F2OM1SaQUIqqCv3wogCjCM0ZfkKzORooWjr4iBIs2bb8Lu3UG6TnIO0Om2shIDhrUI2+jGtaRAaSCuE4J3IPqn9Eh/AyjM495pFbkyARh0Pgd5vCshzGyJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt5zhpyhsn0RgpFDz8ciR6BWJmlyjsqIQ53qFzPjVAM=;
 b=TemttoMENcG3eJXp380I42KTF4Ws1THZp9EjntKxVxp6nX91OKn/hKltq0OPzYYOQAH4Fj08WZLUT/ufvGFBc+NQ8jtWnhmFMDhK09TuNbHIB6azF8YLx5/OGf+4YEjrHmCnxGa3MnS9Eb/9Pc0eYdWJ7vkWNX7YGdTHuYh3RY1uMXyx5uXBRcpNXOSdcc+QjyW3meahrs/zPLVUoQARpo11qPIrtLOsRiAAQJ0WyRNtjxyLzlQkQT4tm+AT11wgdgYdEoA9CaHb0WSOzwh1lod2bWMEikugiYhe+BpDn9H6kek9lqKmZDicPre3t+W9tx4WA2JwpVaoEZxMZxWV/A==
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com (2603:10a6:208:16f::10)
 by AM9PR04MB8521.eurprd04.prod.outlook.com (2603:10a6:20b:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 07:07:53 +0000
Received: from AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043]) by AM0PR04MB6515.eurprd04.prod.outlook.com
 ([fe80::ca11:63b8:aeea:8043%3]) with mapi id 15.20.8769.033; Mon, 9 Jun 2025
 07:07:53 +0000
From: Pankit Garg <pankit.garg@nxp.com>
To: Conor Dooley <conor@kernel.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Daniel Aguirre <daniel.aguirre@nxp.com>, Shashank
 Rebbapragada <shashank.rebbapragada@nxp.com>, Aman Kumar Pandey
	<aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Topic: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Thread-Index: AQHbvyFWcjUresCpX0SM58nE89m7ErPHOM0AgAD6hsCAAJgWAIAxzuuA
Date: Mon, 9 Jun 2025 07:07:53 +0000
Message-ID:
 <AM0PR04MB65150C8930FE1A49E4BE99CEE76BA@AM0PR04MB6515.eurprd04.prod.outlook.com>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
 <20250507-zap-dyslexia-924cfd1b6ec9@spud>
 <AM0PR04MB6515B27367279C935A295379E78BA@AM0PR04MB6515.eurprd04.prod.outlook.com>
 <20250508-goal-harmonics-e8c286f74954@spud>
In-Reply-To: <20250508-goal-harmonics-e8c286f74954@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6515:EE_|AM9PR04MB8521:EE_
x-ms-office365-filtering-correlation-id: de904ac4-d6c6-4b18-c131-08dda7245a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Wvmhgu+1IRMDPGm6h8ym0mbX8BcyRaKFggJpNCGBNvcqdfJxjPp+J6kmDNDW?=
 =?us-ascii?Q?V9f0N7siRm/zCBvxYu+2glD2bbLw9+q4jvt8deWgdYGJXK1rm+GSEVNHUyen?=
 =?us-ascii?Q?Pvh4MuWIgKyrMODbyymIhGmSRnakqoC+u9XbeZ5/KuNIMKIi+j54tJkCsuuq?=
 =?us-ascii?Q?Z0Rv/7z9jiWx1p3fseC+OFp1mmyREKwW2Fkh7X4mQc2MLuPtKR6GqVuclBMY?=
 =?us-ascii?Q?ojiABD0LRb+IS3GjNDGj1YIfFtE0zoXArDOV1zeXJaBepGthta3Zq8idpkmm?=
 =?us-ascii?Q?IWk5PAwh+98lUQ1Ug833E7EwUqO7OxdQNniQl9vb1r9l/Sxi5aT89pSrYicj?=
 =?us-ascii?Q?t5mBlc3LkK3UEs1EzjCJs0hDXUE37CZKBe31L6a1P8b0OdbP5U4nqUOVAWnW?=
 =?us-ascii?Q?ubwrmb6eB+NRbWezGs/D2sWcmXyD6TAZri0k0xj2PfFTCBXksIOAfSaqI0Ip?=
 =?us-ascii?Q?bpnG6XNMNV3yODeo8tcxXnaxuClGjOXWlGR6Wd8QFmU1Q6D+XMxjYZRwWc8u?=
 =?us-ascii?Q?386DWclFJOCBF0vjJgGEdu9uDVVxaadH6hQQgY7Sr3cQ9Ysyu/qdr3deqodv?=
 =?us-ascii?Q?zKDmOqrBZ2OsYMzoYY/7Rw5mdM9Gl9MeNmckDDXX7qj2TATTNROma2SGLlZJ?=
 =?us-ascii?Q?SRGzQiyh+Q9SWdaCKzyOyh5Es6Ycf6oS1/LUeL7ESGV7fd2lfDFfbJptszck?=
 =?us-ascii?Q?VNr5kjMdy+X//PsaOsRIjUlAsHRBtTVr2e0RNK9Avr+KAIz19SArDUemK4c6?=
 =?us-ascii?Q?XKOdtDVnqkcxeJVojek45Q/ts1Nx5oUR4+hLuHKeAqHXr9bnmPTew/WAED1r?=
 =?us-ascii?Q?/XlfL5SOfGZ5TtWtZtqqmKYjhxtgDbq5PVMK04I52g9dqWxAP2d3mrdIbx1W?=
 =?us-ascii?Q?UuDBr1THySd0qUo+aNfDszRKDg56f930mFCFyMs0/95PAJ2W6ftes6+/tNQG?=
 =?us-ascii?Q?icTgyAITgsthT1L7i/u7d+MyO8eOMwd+hAuD+cMUUSPqoNlQq33cyeI/ZGTI?=
 =?us-ascii?Q?HXgi3/OXHZ1PP+9k0F4chdPGzLEs6VBjcNicASTuydcw7fj3v2T6zMHVb0J6?=
 =?us-ascii?Q?6JkdVNKiGBZUL56slzjDYZLsppqXqShh4uZ7uKCIHEFd8kuyhcxBXcys7SCy?=
 =?us-ascii?Q?JUwZef+34AartN4YPJCwQGsvQHl5jq01eAqrc61F/fFDItRmcUSkNuXxBOrP?=
 =?us-ascii?Q?jTgPjWdyuwKrE1Yyxoc94C1Cc3nQ9Izg+Ud5WzbJXdteOFhT47cUmLfqNMT9?=
 =?us-ascii?Q?E0veNrkMj5usZWcvYtEXwGmp1kRP6WdYFw63L2a7Gu+pBF7kux0rLmHzkYA1?=
 =?us-ascii?Q?Eyzs/HZ884N/Vo46wHAliFjTiC2FPlper65nN6Cuty8EPH7immJRLCMC8luv?=
 =?us-ascii?Q?tPLZhKA+KiuPweZOmRPDv8Xd+BaMST47fHAlsoWgwYYC4mtBEXsS9bHU4L+E?=
 =?us-ascii?Q?blz45YLfshO9icchhVZm/zdt7M9Q8Q4If7csB8aOGbUjR44qXH8TfYmKDDTH?=
 =?us-ascii?Q?8poyM9JGDUhhQw0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6515.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wh9ON+4tNuEMFrrw8gvqIkMS/0xvvg+V3Z58OyGa9f8871T29OYeAuD84z7m?=
 =?us-ascii?Q?ckvRRYe/iaS2QZ7uEvbgEcpHp2jk9Agriq/IH0dRAk32maAQIyYgnpfF7DNN?=
 =?us-ascii?Q?kLOS+IEBDWXc/J6akRLHqqTIyZ2FrcWYUr7ulBuQkP2in53ZZcH0oUU9J+Q/?=
 =?us-ascii?Q?7nptKpVWs2n/QfnWE368/vagEO1tQLtdW1wBHk57nQOJKsqgjoiAo5k9PUkO?=
 =?us-ascii?Q?TdBfUrrWIa6JStT6WgzDkoDnGvufKmMpItZJ7TqnG7FeZc1Koi+sLoS8uFzB?=
 =?us-ascii?Q?lpXf8no9IQSWyBWrXC2QX95mZBLzqcAnoJ8QDRMNLo7KYS0bI1OyPKyqqCxs?=
 =?us-ascii?Q?TB9R7Eu4W3G0+Uviaj/fNOBQEuB7Y9DHGaVBMl0OsiQpo2oRJKKc2dITD8M/?=
 =?us-ascii?Q?NHeK6Ls0rij6Nh9AJhEOGWB72iNlxvKUa+5L+Aclkl+wYtBBMfHpWGTh0hpl?=
 =?us-ascii?Q?fcYXsBX1H3DFK+pFsB9B6Z7NFmVV2ABlMqu/ArJ1daK7f6gvskwsjwVFtOsw?=
 =?us-ascii?Q?XWWgc5F0U+JFc94+r1BDROm6HPSdmgE+eqnWQU+FOy+QkX6swB1PbyAc6F/K?=
 =?us-ascii?Q?fySQu5s8s8AM8b7xhq49dDsKaY3Whk3+LoWUYnMSuKnclaBETqi8E01Jp00t?=
 =?us-ascii?Q?hu1SDB52bSjWPqBQRN0/hntCy19s+sVLi4K5BvFVAIChkDqHebBDGDEU5QNQ?=
 =?us-ascii?Q?dVhFNzLwiaofLOX6B09RDeJtAJvGmpnld3IxSjUzkUrcAsxAxMcZBWXIft3p?=
 =?us-ascii?Q?3i7wRfDI6i1Xork36fc/TIhElOSW2XLL5cmPe3fCsDau6rGQ8Vt5NelzrQ21?=
 =?us-ascii?Q?5IJMRYIU/xLp/SfurY2Gtwiag9idTwgDBcwp9DO5HKVJdcgP9j8q0aViwXHN?=
 =?us-ascii?Q?dqfCO0WlPt7x2qSZ+g4AIxmtBcKSthZ1778IA48/Cm803CfsjmeNRRw6TtQ4?=
 =?us-ascii?Q?9xnzuSOm8HYonqUIIOgegzsEhDFi33WhxPnFiHDv6dwk+9/2OBTE5r/0brbm?=
 =?us-ascii?Q?ueKYfqN5ps0a5pa4aD1nNTRSWbF11aLQKUmH98SEFc/VITEUCzw0iUlwmjJX?=
 =?us-ascii?Q?HHH99/Hd51ZEo3tg5S+YWtgF9faBD858fQ9QW7TQ1/FsuX1cjmf+CPS3BpnV?=
 =?us-ascii?Q?OVxt8TElu3VMXybgSO8itxY18JaV/DpSKFJPdiVReGceMKEODic3SB3mOOQ/?=
 =?us-ascii?Q?DXwpGgelAQFk4NH/nufdG5izm7SJrUA0kXZ4ZIXu6vN+hqWuh2M8RodjgEsH?=
 =?us-ascii?Q?WEab4imgHenowQmh6XoKfSPWDZqHl8OKDHwU7utfkJzEzsB1r36PV83STCZT?=
 =?us-ascii?Q?7t6r+9tcrSoIdfLuLgHYteEUHE/cyUGxU1J60+S0iUqD2rD8YLH/C7DffuAR?=
 =?us-ascii?Q?pU8wVWLyuGQIeGYQXVAh3gP123QZOnfOGsYnMjlJSAfzDdVSYn5rrMEu/Fab?=
 =?us-ascii?Q?+Unjlv/QvbAioXC05taHnIMiQ/zI/eJ0xYZURr3pRXyNy2WiXN58uZuGpYBC?=
 =?us-ascii?Q?hL4f93QWJRHAbqhbUJIpVD5y4fwfretH1TapRuBGw7EM1hl+1lkixGE4f2Mx?=
 =?us-ascii?Q?0n6kDbyj6mMBpc8KYyQ+K9JkykpAlggS+1fNVBUA?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6515.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de904ac4-d6c6-4b18-c131-08dda7245a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 07:07:53.3690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YT/sPMc/FrIc4xpwfIwE1pVY2HkOJf9y1UvKGNpRm2J9Nv5coH8jiz390s+idq44dHpb1Nxrn5+NjmUVLqVr4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8521



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Thursday, May 8, 2025 7:54 PM
> To: Pankit Garg <pankit.garg@nxp.com>
> Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; conor+dt@kernel.org; robh@kernel.org;
> alexandre.belloni@bootlin.com; Vikash Bansal <vikash.bansal@nxp.com>;
> Priyanka Jain <priyanka.jain@nxp.com>; Daniel Aguirre
> <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a sup=
port
>=20
> On Thu, May 08, 2025 at 05:21:47AM +0000, Pankit Garg wrote:
> >
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Wednesday, May 7, 2025 7:53 PM
> > > To: Pankit Garg <pankit.garg@nxp.com>
> > > Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; conor+dt@kernel.org; robh@kernel.org;
> > > alexandre.belloni@bootlin.com; Vikash Bansal
> > > <vikash.bansal@nxp.com>; Priyanka Jain <priyanka.jain@nxp.com>;
> > > Daniel Aguirre <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> > > <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> > > <aman.kumarpandey@nxp.com>
> > > Subject: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a
> > > support
> > >
> > > On Wed, May 07, 2025 at 12:56:17PM +0530, Pankit Garg wrote:
> > > > Add device tree bindings for NXP PCF85053a RTC chip.
> > > >
> > > > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > > > ---
> > > > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > > > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> > >
> > > You forgot to add my ack.
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Yes, I forgot. I will add it in v4. Let me wait for more review/comment=
s for
> couple of days.
>=20
> And if you don't get comments, don't resend just for that, the maintainer=
 will
> gather the tag.

Since there wasn't any feedback for this patch, i want to send a gentle
reminder ...

Regards






