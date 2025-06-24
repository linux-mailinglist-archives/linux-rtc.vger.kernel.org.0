Return-Path: <linux-rtc+bounces-4348-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3EAE707C
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 22:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACD2F1BC4409
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 20:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402CD2E92CC;
	Tue, 24 Jun 2025 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IpHOboIG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D32E888A;
	Tue, 24 Jun 2025 20:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796269; cv=fail; b=TBYGvVU51MIIra0spTkqbO/zMk77U5NfBZI+q6rdky4VbRS6YbS9XGTkrv43RM6HQrX0BYQ2yrD3q7koF0BHzoVI+WHvWMInmI/9S8N5tTJM488bglLuD3mpAFvHaoV/nQiY37Z0cpjKbvdGehI+ynT0bh435dqHCj/luYNE3V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796269; c=relaxed/simple;
	bh=v/JsPpFYlfnpElOSUP1XYLQpfZwFWiYYjuyfvnZskwM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RGBiECYhfTU2sF2vcob2wK6A6tWUQEsvXG/9IC/b7jkeXlFWYkRJvPDFPWqEkA9WrC9vPNVSb0s1VNWjd/5VGdhTqqBDUKPe9Upih4a6fM/lCytVAJwLrngWfPqOHHlZx20jAic5sxk2NYVAmyOBwXiIy5ooAC2t2vnzxVzrc7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IpHOboIG; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSj59pt2cKR77Nl7iLg66fWIeJYzzHi3sw45UFIMf4OYZLR+RtlkRtmcPKLJOXfWjHqvgM3TYIplLvL4uVzGoR+YJdGAeh6tR4Wig0QN2ErfgFKJNq+cf6b07peUbSpY7asmegR+7S0SVZLcrm3qa/vYxb7u8Bh6bmCIlJbInNAhp5B29+iQA3eCGmoCixJzNTe2yqFU0a7uzjatD6bCZW0hePVe0jNARDHswQHfhsXW1jtziFxLMn0mSbCxWucmBm1n9YFRYPbf3BKsBVFQoCSOhDCqk4IA7q7o3GZTdA5HI1cJv4PwdqY+kJwR1AAfTgjU4dWpdeFxbkQG2zbhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmymiQLN8FXnNCIhvg/aPmB5uGpIMP26C6s/ATZz/QU=;
 b=Au4QxDnUe0vsGgGLzWAjrvCM0R7aoSaS20RovkkC4y1dPqFbgNKlpzpWFJVjL3cnI5arUjaTqB5BNHbeRzc+5BQe/S6vtVvLgL7lpidLhUE9WErlcbYZO/CPot1NJ+PHgAxeG0XFr4RbA7Jbi+3VxXA7ejweA+0kjhnd1g51xxwWbm2kf5OPHlIXsaF7GAdnGQAHTTCJQSH4XpuGL0MLgmZ2qPDMUemxtz2uvwjfNBAe48k4qHWfc1uxv+TBl5csUvTgjd2OygMri868M5Qk5S/PD8I+Fkd9xODtexkOuK1V1jjcpA19qSK3Zn/PQF5PE98BdXq4fhwgiEHm+A+o3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmymiQLN8FXnNCIhvg/aPmB5uGpIMP26C6s/ATZz/QU=;
 b=IpHOboIGMS8LJ8WcTuK9kOU63YESBG3bUHTNwIIjD3l41gmTERKMZgQgIeh1HOc3gAIQ1AwF8U0HDv9G+HNdgHSUrjn1FVKQse+mWSdSnAiqy5tTxLMMAJD99wWdxfB8GwT2C6yj7SCS0EcVRTl3xaMKzBwYfNpGOmtMoEvCcaWNAsc8DCkyfVwhG/IsRiPRpunkngcAanXEoyJ5jMkIg6M6NDXxW/OTF29TnUcH+d7bJ827ybq1oTpEUDboVzEfuRUNsalYDB38Xg9ffGm5nBJZhrnj8EtYslWhLZHLNl35VcR8wGp6ieStSH5MvV1hyRbQ5lJmSxlgkdHBrtANQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 20:17:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:17:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: move nxp,lpc3220-rtc to separated file from trivial-rtc.yaml
Date: Tue, 24 Jun 2025 16:17:32 -0400
Message-Id: <20250624201733.2515971-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3ca5a4-6236-46d3-74e4-08ddb35c2d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GH5yRMeRp7iPZJGMrFtHQSnCZ2X4W0Sn4DvtQx//RfTeyWh9kPgFuW5dGFIp?=
 =?us-ascii?Q?0BPCks6MtyjPpFav5LIkK8dGBrRhlUTrHTbndM8qgV9sOcCYyP7wp0DS144j?=
 =?us-ascii?Q?AvOPbcPs02B+AQN+MnrjXjsLp2h3xa8XpdqrXHuZuRl0C+WtujXEBtE343SD?=
 =?us-ascii?Q?z3Aa5CYPc/aKjmRQs7ZfYP4PVSQdDwQbfQlsd8lBolh5p6hS8ONGv+naobwE?=
 =?us-ascii?Q?L61HU2/ENgqc4fpbZjHjYQdw7pHNuMcqBQhnnNEneO5icl5rM1CHe0UaYcCv?=
 =?us-ascii?Q?L2nvYF9+jHUrKvG01oU6xGSHNAaVh+7KDN64P+EthT7oaTTA94zyQMXGTpOZ?=
 =?us-ascii?Q?QGeHbQIdfwwuKDafpwdnxnLsFPccf3YJSXqq9Lg0jLdXzyo9cKyw48pg5PrC?=
 =?us-ascii?Q?oslNxbNUKchQ2XbRwzUbhOqo/46H90CCZx9KcLPSbWe2DuCRQu65f2wYdsbV?=
 =?us-ascii?Q?9pNMn6vEYYbL4fEoe7HYG62acCFgVLiUb+Wj/QikMHjP98oe/NhGv1IBwodu?=
 =?us-ascii?Q?SXgJLnezzi/qUIry+13lHeJFpXJhzT8YeL5ETpK4ODzGPFp2Iy0vQZNJyZUk?=
 =?us-ascii?Q?x9CrgFx6TJjQNWshCP6y9TPodht9x6swfD4S78x4SgfW58x0RbnnlkjolV+g?=
 =?us-ascii?Q?W286W0gU8ftl95lINyXdJw3krt2zwj85xe6eoWINx0hoNFGhhh/Zraxax90y?=
 =?us-ascii?Q?y7tmyw4d//ZUNdtu8CqJjoqdUiU0/v5haeiJFc9kenPGyzwctXYJ8scJCxi6?=
 =?us-ascii?Q?5OQkrZUEWtYzPWW3xeWC/h7fYwpxLkKFJmYKZwQJv/IJ+uXnX1H58/G7AsB9?=
 =?us-ascii?Q?NeYzwCMKdexsEzIRVMrTfwIt7XDWQs9NsB7CqDlxzVoBf+i0MMKc42JATDif?=
 =?us-ascii?Q?k+hLRfjnoqv7kU73sgP0n92EORhIHM+El7CGnGdHpbTmmD1BbiHPTQLRp1D7?=
 =?us-ascii?Q?+eOgBblYndqxmW3GahgkGvWAVKUxp9LdNLfAvRDYDEFMCF6RrKUQZ5O41vao?=
 =?us-ascii?Q?qqWrzXlqa1iM3pXqPmotDo1SwueVsAtVpSw7byUvfgG4UVBlPSS2P+1CfKSy?=
 =?us-ascii?Q?vpXh9x64RP8M4PCUSaWf96X2UGS9luEaEP7pFntPFDNTwtrzzMolpGpKy6kR?=
 =?us-ascii?Q?s2pJWA4bpHTETlXNksT7ao8OFBuYxYjYwkP20T/6umS64IZ7iTkkGGOgDhww?=
 =?us-ascii?Q?149whZYk1leobjR62ygx+9xmfTIo9Qahk/S6/s9Zq2003GrfBV5+97t4pAO/?=
 =?us-ascii?Q?rpzIeXpysYlkDurEpJlcI+uXLB/tH1bT0PeJKN10vPi5X9py8leihe5+Hp52?=
 =?us-ascii?Q?BsKpA9ZBlmMFmjijkdxguSukaJ9lEUx9f9gigZOEmAQUxplDSrFC6zlimlzK?=
 =?us-ascii?Q?Euk9aawxBlNcnPSNQCiJyhOndKaPu0/xjG6c23PWFz2c0V7lBQ8i+ImNxI6n?=
 =?us-ascii?Q?BBiaVkaSSZXkSNJY4UP3OjRO0zbkHATE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7qR0DeBMLSL72efXh2/iy2ioI7iqzJLXGNw1z6eOraN9JJ09FzsH9ITo/kGX?=
 =?us-ascii?Q?0Vx2SJxmRyy+WuwWnXK8NYq4JYSnhKRWnrg/cW6kpseB0u6su9JY2FePsJjf?=
 =?us-ascii?Q?y3n5wKrIj09BdFKQPUUF+fgGH0UuGEl1tFCasuMs4r8aMkC50CGF/oztzG2p?=
 =?us-ascii?Q?+4A6FWJp4Ktrg5OX0yTCDMFr2E9V9azfj9y6iXwuz/3iTL3rhIWqzMfKOltp?=
 =?us-ascii?Q?TXcGUHq8qbaCgR1KG1cz3wCDtXfOTQm1bNn/NtfnGAN5p17Zh4/VzbNzU1qN?=
 =?us-ascii?Q?0Dd622mO6JsCVVXhK6Ldo+vK4EY7hmOMRQKiH/ZtbbhD8EX9Qp4g0e2CW1hv?=
 =?us-ascii?Q?S7ezsJUoc4tt+cjPJUofmROMSWISGEk33hFDtgTtgjygq/LZLKWDXltvpWCy?=
 =?us-ascii?Q?Ufyz7v426fatslqjTOqvZGTDToMjragNR8kThoIuPrIn/7YsgCebe96mqf77?=
 =?us-ascii?Q?/WwM6Wnghx6Gtuv+ZrD1AfBrgK6iDKg+x9G5gB+OBTg9T9yIxwuNqRJjZd1d?=
 =?us-ascii?Q?fZJV86hNX4Pvmrhc5NgwWlY1RLb4RF43zDRJqySHIB5an5REd2HCSZHfMOLk?=
 =?us-ascii?Q?lNek3Qyb2Znq28YUByx9ibF/BEMFwL9qlwWGu8Es7wtYYhdzj+t0IDd+ADH0?=
 =?us-ascii?Q?Z+EE54FcfdBJJiqwTxJPWI3pUz6BSPxOGAHGk+hDFVLu6kvxMv/TdZP3VLxW?=
 =?us-ascii?Q?LAAZ67fLbvOSJmhG+rYoYWd42o9HBKzWlcLwYgxME15BdyeVB8lyv1bjyJzs?=
 =?us-ascii?Q?MXiBJCp1Uaa7SxSjC7Uo2uSVUmDG9nLBQqOwA7/3NbiIUMO8H9KwchMwEyGx?=
 =?us-ascii?Q?tgpOhACiDIo4dMlDs2MJ6mB1ViGsRBb94Z/nGn2SFDKlmODfkqGRRLqWlXoJ?=
 =?us-ascii?Q?X5pvlgEF18IZFQLcP2rgEg8h6+3CZtCC2bI/4jx1Z/CxJ36DpD4i0SoksNyR?=
 =?us-ascii?Q?6BQZabliwe5SxoAZs9lklpsjzYdgf5kKaninsvZLi6h1VAivTAQv7M933L/F?=
 =?us-ascii?Q?BQD9nRSXmL8axWdC4uIQhcszP16JHZpk/Fsd368arrmRECwY1bprhWVFVwzR?=
 =?us-ascii?Q?DCanGW7gg3wEW8bw2+zeiB1QHTNLvvtEhwBTk9tVyg9BbfXycMe4OD4PAORR?=
 =?us-ascii?Q?4XgUY/WUeUeFr144IoITQbSFZ5a3VgHOEgn91ffb733ie7IvJb4uNSvq13b6?=
 =?us-ascii?Q?dCoiHwQ9XwC17wU03ybrSDcabNsNkChTj5gy47ydRkpKmPs98D6XPZzwVIde?=
 =?us-ascii?Q?CTVXEAvy3CIsnjYrhy1AkpsjwSveKM+IRtpMeASKlsSHeWq0bIdwgNBgt9ln?=
 =?us-ascii?Q?5qzttMvn1SLFal1930Hr5KBvRxcqWHkWC/dg6zkDEqUW8V5BB+ajpaBTq1D5?=
 =?us-ascii?Q?Q2Qgaija1shNcqVxRILFC5KEiM6Xxmx7C1PF9CTFQ+k5jqSAiERBsUSpOuKu?=
 =?us-ascii?Q?aqQ5WGkT6nYJG6LdhP/OW4pn9SxlMXJ/d8xbCNBiBLX55wr5qA2rFZ73x5fx?=
 =?us-ascii?Q?jhxzGw+jeD4Vukiz2g1W5u7j2TcZ9pZruFctsRKnIZH11G5AY8NCJYS3gKwb?=
 =?us-ascii?Q?3FGei3vlKBj58ovUtU0s/ryveoZBoLO2hhoIYgzV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3ca5a4-6236-46d3-74e4-08ddb35c2d40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:17:43.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OIvKm0E0GxHQe74m1ig59fGHA7dZtui0Dj+ze+J8q3/eHyajzJTpW948babwIpRd4dL2fekSoEjwLwPSXNEow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456

nxp,lpc3220-rtc have clocks property, so move it from trivial-rtc.yaml.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/rtc/nxp,lpc3220-rtc.yaml         | 49 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml
new file mode 100644
index 0000000000000..53353de4cb378
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,lpc3220-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC Real-time Clock
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    rtc@40024000 {
+        compatible = "nxp,lpc3220-rtc";
+        reg = <0x40024000 0x1000>;
+        interrupt-parent = <&sic1>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk LPC32XX_CLK_RTC>;
+    };
+
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7330a72008312..5e0c7cd25cc68 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -63,8 +63,6 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
-      # NXP LPC32xx SoC Real-time Clock
-      - nxp,lpc3220-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,r2025sd
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.34.1


