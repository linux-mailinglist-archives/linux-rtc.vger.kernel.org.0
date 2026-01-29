Return-Path: <linux-rtc+bounces-5909-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI7pFnXzemmXAAIAu9opvQ
	(envelope-from <linux-rtc+bounces-5909-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 06:43:17 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C786BABFF6
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 06:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0F2A3012C9A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 05:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B2F2E8B66;
	Thu, 29 Jan 2026 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WXiQEk1q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58AB2DAFD5;
	Thu, 29 Jan 2026 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665394; cv=fail; b=kgI9YmQGChuwOR92J6xfGSLV1LLq81qJRUa51T7CSexcJhuzt9SHJ8NAMMksdE/MKxjBjsCEMyO0zM5oqFyxO90o2m55hWSotjBUsTtvBKCHuUux9MYFuhfkdbQf50HKIFVwUx56AOHOqOMyTpnqQsbU0fSkQcLCudU62E8Rwkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665394; c=relaxed/simple;
	bh=+yDB/kQKODJOwPgpdXOzo1MSi2cBvZQKG+8yRVNZ0pg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mpm7EgJwth5rI+npz/KusIz/EwdUsgJgDLbpMYe1MP3PEcBukhGvXCr5cfU0Ftgk4o0KgRGRSQTFe/yQfLVe2GtH2QetpIRErKbEng6TFIi47uekqOJRTua6MA+3W2IPuMNFmZy6VGBjQOcNbcR9Nm4mVRW4SqSFL5RZne9coGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WXiQEk1q; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfMnUqq7jCWXqWVmIILX8kg383tVvbzgTUfo30E7sn1eDnVUOu6Hg8/E9sDCj1sjd1MVGMsOstnmEakVG5w4Sbj4x2tlCpCBttELqxcj0zi7+8wSGkXXG16ITZ+euasaWXKy9ZGs5vvf7pxhICcGBlxftZKCJU14RzH5A9htmqlUtF/kd96lbUw3762++3X7h86bqH5n9ohgcEprLniCfNYgQfV561GtFkwcOihItZu39/1FCHlcJ9fSAGvGK/8fOW1QVbMiLoDy0vgtZgwmYGfiAo+g2EKtyxi+6FMdVkHp8I1f0OoPpJI0WUSrD5w6sDlpCFqse5ElJ9IhuNLL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ5EPXPjUHOe4I4BE42BO9zSYupxugtt0phmpihd2Ds=;
 b=GchHZ7uOABThfDCVN3ItptAbh9PvCNOWoYmoDUkzu/RF7MAgnVdTONnHG9m6iqwjaaPMeM1Ev+uwrdgqrZgy52GciTHlssvnrldzoTYehiMS5EaGmFGsIHzzlDiBUTWcv7UQ+QRf7FsnJffyJ6cozthFm2BP4xcwoS3hTN9E0dNXvBc+Etw9r4PJc7gitCtD+ilCNMAMiTpLNQiAu2yvIOaEKMkocykrrjHeYdMFPUsupFipgNQXRm2Uwg+5C/8wf3viB7FRnYthLCWJrrsnr+fXGZhWmShNNWNtQw5DA+GK8FcxnRWVk4Dgnbqjqwv6a1g/Dn/+S7GyzyR2ItbtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ5EPXPjUHOe4I4BE42BO9zSYupxugtt0phmpihd2Ds=;
 b=WXiQEk1qFd2zww4i+YWk+SxGkiYE9koaEgqEBObkmK2OwXyfsMZgJoze4pqUWxD3AjuUJut5w2W6YRe+f9BuRJKrtoXBA1ayV90RTyI9uODmKooBSA25FGEv1dMa+y0WXd9LaP7LpitOFqvnTYMKZ9/6snF42zvFPMrwNPkLUXw1SW+8FmA6mno16Vxqm8BjxTD3ktgJUhVxo/6PcszOFbiKUGOAm+w9U/Q1bRRJ9hRplV7WHuQOJ84kAS9sxxh+v3Ad3vjmqjb7SGr/J/GZST8r0+p9cKhX1+ZvuTIUeETZkpr0OR8o89bgnum9zncVCdovx6mxgo8NlO1sY/eXWA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 05:43:09 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%7]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 05:43:09 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>
Subject: RE: [PATCH v4 2/5] rtc: pcf85363: support reporting battery
 switch-over via RTC_VL
Thread-Topic: [PATCH v4 2/5] rtc: pcf85363: support reporting battery
 switch-over via RTC_VL
Thread-Index: AQHcWuABy0zhPyNU2EiLswzDq2bpsbVpDNdg
Date: Thu, 29 Jan 2026 05:43:09 +0000
Message-ID:
 <AS4PR04MB936215FC06B8ACC0F0259223FB9EA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <20251121121137.3043764-2-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-2-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB9491:EE_
x-ms-office365-filtering-correlation-id: be5429fd-95cb-45e7-e3de-08de5ef948c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|38070700021|7053199007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Oal3zDe+KrDHGC9cp0xnH2fdHLYSJfU6vArZgJRJNL4csD+CpyWhkwMQc1J8?=
 =?us-ascii?Q?bd2TVN32Lmf6RPIKdTII35bjuVwjAcUJglkYDE/o/QsASZG68AfFfLArBLp3?=
 =?us-ascii?Q?BstcvaihGNu7oLl5MA610Bp03/vjwDhCQq4VePz5MAjhdKPsLJosKJxaUA1Z?=
 =?us-ascii?Q?mbRn57CzXTEnSNzWMCVKA3E0qNdLHov+2jTgns7V+tkbAklajJeMRPF+bE+Q?=
 =?us-ascii?Q?PeLxv3Yn4pTgwl2DfTkyPdk3fcJvd5ca+kIENYETswcDP9yg6sNZAYrCt0At?=
 =?us-ascii?Q?b3EMx3GZnbwUuQ3Vl1qQwqVjjTmwf5q7PMo0YsuQ72ixu32V9qRrQ3okyA8M?=
 =?us-ascii?Q?IbDWyfLGu9LerapNyogFyZFFK3buDAIMnhMrJ8aKsEf/meFJdpgW+JYTN+EO?=
 =?us-ascii?Q?44QUZZSFAMUppaEKpjOt0EZMJJuTXV7YG3CXJUDWqWwRSe65vsMCJm4KTl0w?=
 =?us-ascii?Q?+dAoJ0eGPoc7GuO0TXezXQOHLhJjzvYQBLg7DXRamiJjDsw9fUupt0M4EDMQ?=
 =?us-ascii?Q?b70ABO7mufQlmNyQvhGz2FHLBLRbU7szXr6Hr2hirz2DI40lhQz63TofyNa8?=
 =?us-ascii?Q?KufJNaPHmH/uA8RwrOa0x7cvociOtSnxO5djGWchbNs04b315m7sPqwhj33z?=
 =?us-ascii?Q?kLzugY54xDeiIx0wQDa08LDHSycWgszvX3Q/wKFAl0/sQQ9lyJtbju9fTSro?=
 =?us-ascii?Q?5Hb1Ev4ymNXQe6dgv79F3D5y+giZ7UsITHGpGdLw5373rwXUd0R0DaSeIYpi?=
 =?us-ascii?Q?9PUIA3Bi7NT0t362l7HfcsEo+YLOZhQoRTcGOKzfvDkfruk2wDftaeG10rdr?=
 =?us-ascii?Q?Sm7dT3Y4A1iOWzWVScktzNdhN9qv3kJUDGakWmr89YQnV00vl3FGxFsr4YhB?=
 =?us-ascii?Q?JRFmd7Th7gVx08fTfCuIyEXw5BDciyUOzJ+rOSC6dEekcfZz5zY499lE27C/?=
 =?us-ascii?Q?DKbb9jNDXF0kPRZOindyDx/5ksIpmEuJdUJFbuanMipZ9v8IHdYx1M+nfVI6?=
 =?us-ascii?Q?Y3tB1r8BaONe0LWCoaD85Ztych2U8BvYYtR/IFVA8DJy9rUM7aTQnyUwZmvP?=
 =?us-ascii?Q?GfAM4DTRaCDhYBYbMKqB+haLz77G/umw0G7p3If56W/JTMF8W+vTZLB76Tk8?=
 =?us-ascii?Q?2K7c7dHhuUeCvkL/98alfCGMFk2mdrCD3Dmq/2MRhD8YM7e9WUy52IAsvOT1?=
 =?us-ascii?Q?zugzw27ARe4r1WDnk85okIXjF45u+JZ/jbjteGGFCPy621tQFOhaLHtXVCJE?=
 =?us-ascii?Q?cI38V+RqUizauLglqH1sUDL5rJlMTufaEH06tOm3jlw/gHXfN0Yjs6BrUxBJ?=
 =?us-ascii?Q?qkD8bbEcxqqECbcLhResIpQMwKH5BudHXePvwlqozvaW/P6KNGhndzo1IS9s?=
 =?us-ascii?Q?/S6BAnMmMaXWWjrj6PXtmAiw7QjshxbzEuqof63m9NZyK8hnddQvhik/jeWQ?=
 =?us-ascii?Q?hm0WPU1GJ+YvTxf1ql4uso2xwcjEf6oC9t4/TTN2SpcbR5O34PD5Oo9EARXE?=
 =?us-ascii?Q?FFFEqug511KoZkalQ3U5ySDfyBXyzaJEG7F/O2ZDS3ik/ZEYr4GEgM7SaSTh?=
 =?us-ascii?Q?odF/GqfO6mQOLkctNwJdnAAjFzGhy/c/0Q5B/XMPRnfR2E5gDGqplXswPfhG?=
 =?us-ascii?Q?qSk/y2giW+LV3zpen5pXLmqlQRQ0LJPje+s+4sVMsiqR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(38070700021)(7053199007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?b7fcgySphB+OsJZiMFYzZqod8BWEwU+Vx2XIG5HEq8dA7yIfflBIF0twWuAZ?=
 =?us-ascii?Q?462Oq7ZgxDf8x4Kl7Ducfaurl8njKq64z/kgpcCdWVNK5b/BQdzDtV34YsaY?=
 =?us-ascii?Q?5oafBf/CLZy6bi6lTooKQCbmNwF15UlEM1gze82WHakPzSzPZ4MqHmNADilS?=
 =?us-ascii?Q?Hp2q6HrrnJF1dduDEbI62o6w/u9tV+W2iWHGbxGHAe19kDqKdd80c2915ItE?=
 =?us-ascii?Q?c/2LsQAT4Od0ohSNmO+8ZMHNMtVggyiazr49dUM0StgdpUAe6IRNIFkMsjlU?=
 =?us-ascii?Q?WlKFpYskQoqU7XEw3DduWvPl3Q36913DomVnvzSeZtE+6DSQ8L1d51sewdHX?=
 =?us-ascii?Q?7Ef/7pAL6A7DrvOMoco4rFsUd5+95GVpFpPOz1C+6wpBAlii5RnUM19Jooif?=
 =?us-ascii?Q?oHB/5gcwwZwENo+iFcVXuGEHxSICEAyEj6MDhb1r4+bRN2vD7HdYU/Pi5Pmu?=
 =?us-ascii?Q?wPgPO8aUPt51WGwOVRESsape8P0OxYdF3vMS41Z5jhbtJYDvn3ErLkcbqjzt?=
 =?us-ascii?Q?qNjLmlyAeaNl4pVN7ZR87Q0etTxEk328Rnp7dGXaV1881hJ4lyIbon6BOpGJ?=
 =?us-ascii?Q?ASW4tO1K/NtsHywUevXcLAI8NYlVaP2YhvxkhbRXDptcsc5dkiQuatzLiQka?=
 =?us-ascii?Q?XiTJQTFodsHA1TfcLpmUnMzeuh5cnQ/S4P9R1svB5RabSx+QKWFTEWUO/Hyz?=
 =?us-ascii?Q?5hfk53HPcSzeMYQAA73Ia7XA0L4v4/5SaAYnxhhijXpSfte1gzDkL4Rbv61M?=
 =?us-ascii?Q?TWTgkXHObQxSpB3TWUUuO0eW/jvY7rdWgHskYaAya2g74noQhN/oCq3/fxgH?=
 =?us-ascii?Q?6zvycS50WnXXgviotuTq4kQ2T5OS5h18RE2/ke3YAmLInmRHExFqz9LwMdQj?=
 =?us-ascii?Q?WiL4MgLFH2eBOVT7rN4raouh47Jik+a6yyX/hLHHM1AuH9W2pz19TXxQFF7O?=
 =?us-ascii?Q?IuEpYe2E39VfgM4Kqq4TnqFhUoGJIZUgzLtwD1iWDCqdfLUhovoz52dR6BNR?=
 =?us-ascii?Q?fePw7TI17NR/7xMYh6KBfqnP9++qb1e4Dw5jJW0n0zhsqLvXp901iuSygu0P?=
 =?us-ascii?Q?u3jDjTzrut0GQMDm/479ozgNXzvPrOzhKMA/eDor/HAztMPwMDc6TtnFl6Hc?=
 =?us-ascii?Q?sl7QW3Bgvsni0nyr6SXLVTR+KkwaOHS7IgyiIkW5pwcIvHqWTZ8pzJQ2b2kI?=
 =?us-ascii?Q?wA74iMZR21+AKjkA705Md7yP6eDy2tMW2mUfb8i/+xv9cQnmD6DgU+4cXKjP?=
 =?us-ascii?Q?VKmrAsP20XjVVJxQdlNHfqIZyGg3/4Kyd6hxHjElRSe2DDlkOnPmeS+aKmxH?=
 =?us-ascii?Q?ayBOILnGk8TLFsr6Pfy6iRD95BgyZmFFWGeKDFgPyqTAhw3fa3DliGj+OP/a?=
 =?us-ascii?Q?exMcxYWnoSyNeSeDcPwmPo9U6MKijxTAHZhXSyEqnbEtkcf5WUNdConGUrUg?=
 =?us-ascii?Q?k+Mai96WnkjXyhtGMctCTyGNtiux6bLn3mWjeqGnxBmqQsjCYLMESIYcFpz8?=
 =?us-ascii?Q?GBevvC1aOVxfUtBXoVhIE9ZHznA2gRc5atQsLW0YeBHglYkT9WRYXbVcbTCV?=
 =?us-ascii?Q?Gj0EXWigoU9lno7m49778nQvOZ94KSO+15tk39+yo1RFEBHAafcWCoV13ReH?=
 =?us-ascii?Q?Y005nHN0Ggzh6hWalKRi/JLbjcMqm54Zv+pUEyk5TdH9uehu6LfMnp60bJhA?=
 =?us-ascii?Q?O9yPIP7PGVjNrq81NmBBXtEoljzyX5Wl/BbRBzkZBwZEld8BVneHE1ZX+pbN?=
 =?us-ascii?Q?V7rvlRPGgw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5429fd-95cb-45e7-e3de-08de5ef948c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 05:43:09.3406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjuI4GN+9JVONaikwIRhfdTsYhPCVeOdbBueE86Pfce8eydf4JvtHjZX/AeTzMZoK3y8Fp+XFavEBFGjiNAYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5909-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-watchdog.org:email,nxp.com:email,nxp.com:dkim,bootlin.com:email,roeck-us.net:email]
X-Rspamd-Queue-Id: C786BABFF6
X-Rspamd-Action: no action



> -----Original Message-----
> From: Lakshay Piplani <lakshay.piplani@nxp.com>
> Sent: Friday, November 21, 2025 5:42 PM
> To: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; wim@linux-watchdog.org;
> linux@roeck-us.net; linux-watchdog@vger.kernel.org
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Lakshay Piplani
> <lakshay.piplani@nxp.com>
> Subject: [PATCH v4 2/5] rtc: pcf85363: support reporting battery switch-o=
ver
> via RTC_VL
>=20
> Add battery switch-over reporting for PCF85263/PCF85363 using the standar=
d
> RTC_VL_* ioctl interface. When the backup supply takes over, the BSF flag=
 is
> exposed to userspace through RTC_VL_READ and can be cleared using
> RTC_VL_CLR.
>=20
> This allows applications to detect loss of main power without relying on =
non-
> standard interfaces.
>=20
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> V3 -> V4:
> - No changes in v4.
> V2 -> V3:
> - Split into separate patches as suggested:
>   - Battery switch-over detection.
>   - Timestamp recording for TS pin and battery switch-over events.
>   - Offset calibration.
>   - Watchdog timer (to be reviewed by watchdog maintainers).
> - Dropped Alarm2 support
> - Switched to rtc_add_group() for sysfs attributes
> V1 -> V2:
> - Watchdog related changes due to removal of vendor specific properties
>   from device tree
>   * remove vendor DT knobs (enable/timeout/stepsize/repeat)
>   * use watchdog_init_timeout (with 10s default)
>   * derive clock_sel from final timeout
>   * default, repeat=3Dtrue (repeat mode)
> - Fixed uninitalised warning on 'ret' (reported by kernel test robot)
> - Use dev_dbg instead of dev_info for debug related print messages
> - Minor cleanup and comments.
>=20
>  drivers/rtc/rtc-pcf85363.c | 49 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
>=20


Hi,

I'm sending a gentle reminder regarding the patches that I submitted in Nov=
ember.=20
I haven't received any review comments yet, so I'd really appreciate it if =
you could have a look whenever you have some time.

Best Regards
Lakshay Piplani

