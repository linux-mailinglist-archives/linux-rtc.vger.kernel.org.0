Return-Path: <linux-rtc+bounces-5491-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06672C8F9F8
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 18:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4A784E213A
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 17:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C7F2E62A8;
	Thu, 27 Nov 2025 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hd3exJFe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551D253359;
	Thu, 27 Nov 2025 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263760; cv=fail; b=FMmWeBBML8O0wtczCh4sYWPAGxDrqFbM2zcrlCfZuqGFJO6MZIJjXeeG01a0JAyZuhuIKzKeTYACD5I+qUKKNHILf1Zmv/DPXo7S7W6NAt9tar7tbmXCKJr6h0u7H0IwbUaLWnHX1nuwITAYVOIoPspNhrgMnxWAe7ScUT/1Buk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263760; c=relaxed/simple;
	bh=wAFTZGLzDInvfcB9SlpusX1MRlcUoBPkeZ+OjN5G+6o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KJiB+Gv8x65zrMsAQJtxGXrXrrW0rrQ1bZ5xqrFbMrwS8HvwGJ+XKjVW76UKwikN3Y35E8z5IEHkqF3T5iTuqSC2PAFawjhAfeaQeP/2hOkp3SJUnZeWKhaLIrCw8nzcj040hEyINQtH8YxcgO4ef2uLVqH3VMrxrNzD6r20Aec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hd3exJFe; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGyLULU3mQ2Ao0BJEdB4muue5pIX/l7IHDbF/dWMDBBX9lNn6H12/lf9Wsu99nWgDzwW/KyXAGeaQ6Uw2+pqgChnhh7nYtuZgwnrYwBVEZ6BoFe/+VCyKKTL1Uk1gJhKnbYKmWKz9HkKp0Po7ckPBoQiL8B+2n/gQPkEMmboecB5n5hLdTPTZLjl+Bt/lvqV6prNmiKGKRP78eJEFZfqOYcbLMj0veDjqgqyvuC7m2hMKabIR1Nh78G9gSE/WjuhESYM+5yN9rg24NolUNKUAdxAPhr1FtGzdwvsj9UTrkcuIO+pgckgxnBHV8ZqxMfG0zQKeSL6qCkKeHNMQ02iNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIUuKzQ3OSX3kN6W0GJ/kwDjzIU0+c1shlGDZ6wpODM=;
 b=ld8/sI9IRP87rO8B6Kd19lZ5CFlQxLRjv8KOjK3vEgyFBHUWRVdDixhX8EJ2Zcgd2XuDy+A7hy060NsU9/iQJzxYpSNsiZ8JVlCTwxOzkH9xiENfGXNmog9JGKT8nQwcmTXJ4obb010hFN0fpoQWfWzPWSw2+0mHAl7Bd8nMJF1IlUN0sJaeWnaubn3338n5wu3/eKQYew3H07UQiFtxp558Nxp24hCNK0sF6fTKw42psIp9jMW8323C9U5WeGEFbzgLJGJY5CYhrVs2eQsNK2G7NrzXNWVB5Jl31eU5Cu/kWQ1gjbjYRCsazNF5lO220/r/mLBezObPFTZJ8AffNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIUuKzQ3OSX3kN6W0GJ/kwDjzIU0+c1shlGDZ6wpODM=;
 b=Hd3exJFemb8M1777SW5A/JognUgBpKJ7vZra/vmN8zNXDnkV+Mj/WrXXoF5aMAFJ6wkhWXef2eA9aF+EeEama5a1Zg9G0KcUd/Eh/SUcW4euAPTdiW+0f8I+t3VjA+wGycxobe8NZGto1TkKYpXNNYLIRJJXd1+zdVIMAdRBRjXA/5BAT7prrqBq6nKAR95ABTzL5kqO2sxhC9QR9eBPZAbTZknGC0JBizp2UtQE2YaK9xD3b3q9C9H08N1myDDrwsCWieuyUktICcZ/1ziTacnCfpLCqVoFMSs4xXD0/dW+AuETJdubu+TgMOY5b6MQ4rxU+nOr2fpSIM3Gb/BEuQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by DB9PR04MB9625.eurprd04.prod.outlook.com (2603:10a6:10:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 17:15:54 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::e196:11a8:211:feaa%4]) with mapi id 15.20.9343.011; Thu, 27 Nov 2025
 17:15:54 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, Priyanka Jain
	<priyanka.jain@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Vikash
 Bansal <vikash.bansal@nxp.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>, Pankit Garg
	<pankit.garg@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Topic: [EXT] Re: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Index: AQHcX5YSbxaLSC8IOEuGOO6UoJ4wY7UGgIuAgABCzcA=
Date: Thu, 27 Nov 2025 17:15:54 +0000
Message-ID:
 <AS4PR04MB936263171B3C1B13BB849C42FBDFA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
 <176424931148.3999997.8332932232270023828.robh@kernel.org>
In-Reply-To: <176424931148.3999997.8332932232270023828.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|DB9PR04MB9625:EE_
x-ms-office365-filtering-correlation-id: 8d77a240-8f43-4f5e-59a4-08de2dd89f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Gry44nUtKvNSbeQ4AaWO5hU2mLw0MdEVyyMaxmL/6udnZj+HeEyuXOViMEcq?=
 =?us-ascii?Q?ufgOWxb4iVwB2KDvY5fb0mPXZRtR6WJzFTbM01BLtM8s3WzGkHkyo5qOWcrr?=
 =?us-ascii?Q?w+XP+Oqmh1kJgPk8bs2RhZAX4QAY/5TPo9OdcvHlrf0oLfbzm25YjLpg4TTB?=
 =?us-ascii?Q?/cvX/lyNdOr2i3xla/QGwNrooRF7LOhDuxXUCoj/Hue6flzCATFNm6p/bKSi?=
 =?us-ascii?Q?PeskHcG9oJxgHS9PvRCWORaXcG7BhB57sR/hepkDwLZd+jOO10vTRInBMYNg?=
 =?us-ascii?Q?w01PfNHZYlRHdqCDuByVoY9jnVAnLk9NS4eIOMPEIwhtrffl6EzbuXNgKmor?=
 =?us-ascii?Q?VaPff+Wfd7ybwGD3c4pN3WbwmubiGbXuXQtjWE+JkBuvNl1KB2djAme/Eg0E?=
 =?us-ascii?Q?SDpdh1yx6piyjFHBPpzHWhNscLLVRpjaPFq9s3Vn9M7KrvCBOSHDZl4ZcCtZ?=
 =?us-ascii?Q?e3QL7288ZLzv0tYc2H3xcJYp+s9EVhLZnrF+L0W0FIGX0Su2ZediYTt/C/JR?=
 =?us-ascii?Q?S8yCGatFoDZeoHSX4ymxXyQjvnx9dPRb+Mf/MSGyG1aJDr/REld5zYaGP7Dk?=
 =?us-ascii?Q?1XD6bGVcQQyRRWXMf2wVxZvAPDaAWLVoSYSftaV3iJv88w+DkuirreRX16zC?=
 =?us-ascii?Q?StyFV9IQ/URJClK5RhqdQ8N9tGzmza0wMeVyfmxh5MPW4B/qPIWS2rTIDQ1+?=
 =?us-ascii?Q?HXSpotsjmvkJucfzKX/J12/uUJvLu7oQyY3C5kzyCJYXtuYnmc+2MicVxteM?=
 =?us-ascii?Q?h1Y0o+QHtGH5tf/yU0cxBlyBvvDUn5zup5cTSNW7Z3E/Zdb2DvIborbQJq6c?=
 =?us-ascii?Q?U0VYkr8iRdkqOrfRvoppMEEqpqupy4nyS0YPjZVCTzQV/qkvC3AsXhEoQvIT?=
 =?us-ascii?Q?28epjP3eLFwU6fKn1QI7gV6y8rQQ5cudYGx9fD9l+zqkS68NjdilV/zI2HfR?=
 =?us-ascii?Q?Pi7mU8uCfYGLuYZzQ/uBDxTVdZDXsL/oPz2xY3BD1ddS0erUhq5PtKMkS6W/?=
 =?us-ascii?Q?YrC+kYM75r2uyByOb0UfA3FKW7aOMi60iRag/oLHhQXI4H1EeI9x0Fces2TX?=
 =?us-ascii?Q?5lqE9BXuLNamAusGy39nnZz2IOTx48F1kZ95dGosKcSNNFkMwE27Kw/tyVKZ?=
 =?us-ascii?Q?LUr5hM54cuF4J1MsF+37jFUs2NKtonerToxH5BcjCrzxlWgLg030++A3X3nX?=
 =?us-ascii?Q?mUXLIOZ0+7tBCkcvz+BbvNFnWfojEh7k4etkfaluHLdLs66vQn46SZIZnCqb?=
 =?us-ascii?Q?UrrSp5Ss3xxSqrkXszPG8tXajOUOu1ZnHYiXpK+fMeLLtcLQ6LMCfsivp90i?=
 =?us-ascii?Q?BeLat/J2uJTOXiHz7XAOMDEtTP/qraWQg7CAGYkVo2qiYe1dt4YE7+STBq64?=
 =?us-ascii?Q?Vu1RLClvv1sOwyjV98K5U36aK3TOMBGSC8n1Up/Z0SOdw/G19hnBrof1BAH0?=
 =?us-ascii?Q?RhERN5uhoxUjRRSwUKbIwbLgN3WKr1c8NdiVOFSiMV1Oc061S+d7OZep0V8h?=
 =?us-ascii?Q?PD03+tCH28sNBbXgZz7kFtqCCEGvp0J1GGxo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oybzljeHWmQNqlLhhE1fW8fYmF1v6rdup+OKJELY/HRN6jNIQI9/QtT839J8?=
 =?us-ascii?Q?1any2cxxO9dpW8p8bUalCDdPjI38QaITa1AnEWnCP1UC3eA/7jhiZZHecpkk?=
 =?us-ascii?Q?pPjnGSgJ3rWL/8txLskVGPeVkNtw0OZjTBqg9q2iCocwI+IHcQ9upT0WS5N/?=
 =?us-ascii?Q?kgPl3F1/WAtctexf43KYLZfVk+6QV2PTHaofPztgjbCio6Pgtkh11/3VZ+PO?=
 =?us-ascii?Q?svVeCcJrT0CKOAEXpONIEvw2YVCMzVAVIfErkArRdFlDKw3aU9CAfA4ZlljU?=
 =?us-ascii?Q?a9rtXrEj4XiE6MXIFrsnr2Ag+LAFmBIUo26xf39aU2NalL3FtRYCDZUlSt+b?=
 =?us-ascii?Q?/DAhNxdmG20bkDlOKEdfsst4NPq9wnQrfAIEsmTYWpd+1PNXdzI1++zUwWA8?=
 =?us-ascii?Q?O8nv+mNuxSvuwQmJjY0gvgnFbEAlvEm2umVy7X5Zy5YC57mkuS8/NmbEO09r?=
 =?us-ascii?Q?LHU4zqSnnkR9yn73BBiKRgT0vwiEG+LFauOdj+vg350LrQ4jiQ/XdHnt8dwH?=
 =?us-ascii?Q?TrJzhkydaYBVmp5CpNgaRJWO8RCvIsFq91IZuZ4qNsHXh7oACNhxk4dBAos6?=
 =?us-ascii?Q?gx7l+EkbJPmwZMaWzHQRfCy1MjbJGfGwPGYEsEHKC1F5m/15QMyEBh7RwaQ1?=
 =?us-ascii?Q?PtvVC8ymrfuCYrK6Y/iCnHmKDfMYlN8B0lzSv6+mrUdkOdc8rZ3tAkCuT6yC?=
 =?us-ascii?Q?0/Am8kXusGpCzMYv37uuPXgNAb6Pj4QOGHHUeXylI3oe8hPPQmgbAcb0DXrw?=
 =?us-ascii?Q?Fy8jF2ZxljGi9ioDU4HWnYhTU+gDUEHkidnrZhqwlAbxhgRM+6xIMN8OwLdz?=
 =?us-ascii?Q?HuuKwffKqmzB3zFnKDdBHzyZwhoTHqSKRSAVhQmtS3o72+7gMoIbGG7b/P1z?=
 =?us-ascii?Q?Ht9Yu14uI3v8++8mtRqm1Z+YvMq2vtLkHaT97rnZbDWV2If9g57WCl4qHrKn?=
 =?us-ascii?Q?gt/wFjBcft+LFio0xIaUWW9o3WecBY8lel3C+/OUX3GldA9QWctb3AXvseVG?=
 =?us-ascii?Q?qRORDaaP2KIfmPGWaqrTMr6+w1MrfSzCxezHPPU4AL0+1BhrHwi/wRKCAobX?=
 =?us-ascii?Q?ws3rYb4CAL40IMTKsj7BNpGYOCJLOR7RUiEIKJ7d+OEuw/Lv0XiNg2VQScEn?=
 =?us-ascii?Q?tTyHU+nVfK9jF6fbwpf9/uUKQsCE+sZL17EuG6ZeJSQ+UX+1bhTQ5LkpRwvT?=
 =?us-ascii?Q?J/f2H3BCIUcYI51WgeaZ4VAynoHMVHQzpcktAUxAAorozmX4zv3aY4JTqaiJ?=
 =?us-ascii?Q?G2RhCWIPoFXNv0JfHJXCJwx75RfvY2Y5hvqKHzL8selH3qceZi+IIpBTyGMQ?=
 =?us-ascii?Q?R8ysIIgNCXUvdtMXqQFRsW3cbOTo3Op22xNM/kMz35ukSQZL7pMCukoS+w+V?=
 =?us-ascii?Q?1+bMpqp6/XQ8X0ckl4s5kuSbI8k/jvLhtQLKDTJJGZsrmxYDwPQk7cBBGvQ+?=
 =?us-ascii?Q?YzPa5Z3vpa3B6vMt3dWelyT1W9Xt3qTbJjMznTigo2e9ETSgVJ7p6AIVxg9q?=
 =?us-ascii?Q?SdUYYRSNLOgVaAMTgafOuTwWT8HZVHKZa+17ykaVvh0DT1Pk6GUNePh1n/1U?=
 =?us-ascii?Q?LcUN89A3unQpTK//H14jcvkJpCH/e4PuYgWIaRea?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d77a240-8f43-4f5e-59a4-08de2dd89f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 17:15:54.4145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kj2pbK1qX9iX+9JArhGmS7fOcPv8ONWuXGxYmpDuCErDPsE9+lECSHD/E3q+oqwoGpF5xJ//2R1KJvdDFGnCEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9625



> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Thursday, November 27, 2025 6:45 PM
> To: Lakshay Piplani <lakshay.piplani@nxp.com>
> Cc: linux-rtc@vger.kernel.org; Priyanka Jain <priyanka.jain@nxp.com>; Con=
or
> Dooley <conor.dooley@microchip.com>; Vikash Bansal
> <vikash.bansal@nxp.com>; krzk+dt@kernel.org; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Pankit Garg <pankit.garg@nxp.com>;
> linux-kernel@vger.kernel.org; conor+dt@kernel.org;
> alexandre.belloni@bootlin.com; devicetree@vger.kernel.org
> Subject: [EXT] Re: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> On Thu, 27 Nov 2025 17:34:55 +0530, Lakshay Piplani wrote:
> > Add device tree bindings for NXP PCF85053 RTC chip.
> >
> > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > V6 -> V7: - no changes
> >         - Added Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > V5 -> V6: - Dropped driver-specific commentary from property descriptio=
ns.
> >         - Simplified and clarified descriptions for better readability.
> > V4 -> V5: - Updated schema validation logic to enforce correct combinat=
ions
> of
> >             'nxp,interface' and 'nxp,write-access' using oneOf clauses.
> >           - Refined property descriptions for clarity and hardware alig=
nment.
> > V3 -> V4: Add dedicated nxp,pcf85053.yaml.
> >           Remove entry from trivial-rtc.yaml.
> > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> >
> >  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 114
> > ++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb:
> /example-0/soc/thermal-sensor@c263000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb:
> /example-0/soc/thermal-sensor@c263000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb:
> /example-0/soc/thermal-sensor@c265000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb:
> /example-0/soc/thermal-sensor@c265000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb:
> /example-0/soc/thermal-sensor@c263000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb:
> /example-0/soc/thermal-sensor@c263000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb:
> /example-0/soc/thermal-sensor@c265000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb:
> /example-0/soc/thermal-sensor@c265000: failed to match any schema with
> compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
w
> ork.ozlabs.org%2Fproject%2Fdevicetree-
> bindings%2Fpatch%2F20251127120456.1849177-1-
> lakshay.piplani%40nxp.com&data=3D05%7C02%7Clakshay.piplani%40nxp.com%
> 7C6d7bbae4a787415e631708de2db700c9%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C638998461167266618%7CUnknown%7CTWFpbGZsb3d8
> eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPps7Ic5ozHTrXGDeb
> lYEOBSy9MKZo6iJi5zhHjGB94k%3D&reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.

Hi Rob,

Thanks for the review.

I have updated dtschema to the latest version and checked the binding.
The reported errors are not related to the patch I submitted.

Additionally, this patch has been tested on the latest mainline kernel.

Thanks,
Lakshay

