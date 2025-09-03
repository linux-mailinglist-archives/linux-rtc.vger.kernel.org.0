Return-Path: <linux-rtc+bounces-4816-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A209B4298B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 21:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FB7C7AEE92
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 19:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90F6362098;
	Wed,  3 Sep 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O236yNS5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E9220EB;
	Wed,  3 Sep 2025 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926708; cv=fail; b=inyl3PQr4ufUHQmUY84813xh2khgQKRq69aCBFCSNANnH+/U0w7sQR3d0n5BI8koEbZ6jpfXNg+aeleUYhmhCvuwCly7FYW3jLeKfE6bgLsHo7D6dmG9uEc4V6qrn2TzZ18lOtC2FjTT4ySjuC9AYxV8k6r11KT2J2nvSyXtuu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926708; c=relaxed/simple;
	bh=PD+DynnjJAKFT3s0vGnUhvCTO/9Tc9iL9lqOUtXvmos=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Qc5/+wRut1k7yL2lgPMUuzNjetNFjCL2XOpSgwFZLWaYFZm7Y980ihhQMHV7AqY+VvLRt+xNX8jHr4x+OwTDJ63rqBET8xZ2xnvj0Cw5XrLF+aSypHCrH2x184doHebFVgztSfZC58e0i/gOOkpM+CKpQfV2F3amNpcdvdp/WZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O236yNS5; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcGjgKQHo6wkp2NsHs6bE3i34dQNW1oEpMc2szxH0itGZNjfefGwHPbHY2Ku3rp1BomULhiCGbqzEv6+CsxvFe2hakm+Aup3q7BaEN8hmm4tGSyeWpI2i/3/8zuEAP8aSJmo5RWEZOBbTMAQNOi9DikcRgFjXUgvXTsPKitSi8U5IXIIwxDOuA5H7FM8IkQwzs7arlaTgMg7/W72TccKQes40k2DZTsh43um3K/kOmhHO6FbWEwDeWN3QTgEyEoqqdhvxQQz2ss20XJ6z2JjO0wQyLepZMngFFcQDaOJgAmconXF2ELD4c5+/U7nHwKY68wrN6WpbnxRefOqmWqkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXiIjtb2gH+rQzHXqpk7978iyFOwTi97bHEKQib1EOg=;
 b=CB6bA1x9HZyyyQCaCwuz0y01DOd2YHKzxjKtYjXuiHXor31+kEfIKoGEIXImQlio6n/O8yqPMu4q9l6xH7HC5nNESkibzZsoLWMFY5ZRh0sBCjwvUxmhe/c66N2jkst2Ln6wicepqCFLBG4FGIxy3FQiFQRRQb7hIn4ohqbxBo75YOuZiKNGZx3ULazPpvk+KTOUakY+ehURY8E1gWGPEGX8Y86sq2VrHoaR6TtxJ5bYeu3zm4a2KnMhtNTnRtfNj7LUYc0UajghworAzbbgVYSuf7Suvf7NOpEV+gEm8PJlLXsiiSZm4jxY4NkFbIjoYeziizIROD7pOgsenxu9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiIjtb2gH+rQzHXqpk7978iyFOwTi97bHEKQib1EOg=;
 b=O236yNS5cYF3+wH2ZLTDzqt4APj7/1VzYMVAkWAmQaQjrD4Zp8jaJeYVN6MsrO/xuujhXFG3xFIkbCpC6yIuBZdCUB4U0BCg4EkyrrWmyKMKnWVCCzVaY8egp3FszQ+ZT74PdUZ2V2nC5Rpgv9Suw1L9ElcrGKU6Ck+wZnvrEyuILhJPksiZm/qnq2yBrpyHPRMNQWEIfcg2aBntKh4T/weAZyZkocZuvwVDpxk6IpsmT+aLkOW7tPFW+Y6Ryrl7z3XNnfkyscnfEh1g5P7Zsb/n2xd9QTS4XpqfgSD0TzZDFL4zhbmSaj+JxQpobiHxh/myx3ApnFm/cWeXil8suQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 19:11:43 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 19:11:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: pcf85063: remove quartz-load-femtofarads restriction for nxp,pcf85063
Date: Wed,  3 Sep 2025 15:11:27 -0400
Message-Id: <20250903191128.439164-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 451e8e8e-e66f-419b-f34b-08ddeb1db82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?grQFavzqKa8r8WgDa2V2vp98hnzzV+yuxYEDwewp2DC8ujvqR8YH3vpQjQMV?=
 =?us-ascii?Q?uYYLCpAv30tJErPTwhM23H1tnmrnFQl2W3IXgdDQgilVZKXG+dX02U77k+zb?=
 =?us-ascii?Q?bTz/7Z30ao0DVmIsYYL++SyovVBFTV9DOI5KdRp1XgD34SOJbIPKPkixOuSl?=
 =?us-ascii?Q?dQImCY5v7dvCtGBOebOVCU8GXkpLKXYC7QMuX7vPtIKEw7szFfoEhN1vjeOc?=
 =?us-ascii?Q?1P9CjV7oYJ8blFhFwqetBGqSCz/6F+WnTPXh3SvgkDv29PMwZ+CWZNVLYcXp?=
 =?us-ascii?Q?1ZD6vbRvK/UKzldco03vwx/xhcVv5vMKSygD2puN93GgR+NS+MyzF1P2OQwE?=
 =?us-ascii?Q?CZRtmQQyzjKxdRNpRRpYdRO6vbvinVDKMiYBB2Zxku2wLosnTAVjxpiBuZst?=
 =?us-ascii?Q?CPkJRPbF+WF3YuQ7qQf3KIFAz1J2Gs2elYhfQF+tg7i+31jDT1V1kg7swVdS?=
 =?us-ascii?Q?TC9/vWp1DpJo4dQDKvCyGCOYefKsuLItPUHSi9Cdsm2RRg+vA7zEbne8xjTb?=
 =?us-ascii?Q?8Oq0WezKoDbyLOM86dy+D9OkV4WAfOBP0m92D/ktJAMlnNvQLE9W9hbkw2kE?=
 =?us-ascii?Q?9XrgB8GJCxDgGGnVWeytnbx8occZ0bDbll0u7s9YYkwL/EkHqzybwD2NiX5e?=
 =?us-ascii?Q?PYBOxxXULMSardf/OHitpCzIgrzxfsN3T3n97FKYVEQLvmi+INAz9s2DFQF6?=
 =?us-ascii?Q?qWnDYp7dtbVYZki02I80uyYrqshzrbJbTyYPq7PN/PPnqALfVewH+Z86nAza?=
 =?us-ascii?Q?LvhtDovT31ZGoagZ3BBD743QYG3Uoy9SMw+CNcXCtNZj1GhAeWnvVJ4vwfO5?=
 =?us-ascii?Q?oN98xDTlO82et9OobispUpG4A7xSwRQLNaYmbljN/AmODBEAkIlqyAuISaWQ?=
 =?us-ascii?Q?uR9zHWeGKCOR5xLLQDMZLkKS9ZHDT8/Y5qOsjHsgZlRizf8uGfKOgJkuryV/?=
 =?us-ascii?Q?dufPzEJntleMaDKd+CNi4J9huXRk2YNtQzQZHAuj4mkm7jiuQgFzB1k5hta8?=
 =?us-ascii?Q?HeJk5CZoR34MJQ1DzARLYqWivXKHa5aiIAG6d6M11vE+IGuO+dYOJsp70WmV?=
 =?us-ascii?Q?mHYdiUx1w4GHJzWODxefveRnmF21HJ+bhAhz8dCM2NNmeRYApBIvkqowv3Mw?=
 =?us-ascii?Q?P7EHxPFGDk2JVTe6epYPm8IVh0pGs7HUVX7IzbGhwyOK6ZmRxnZNv3KbW1zz?=
 =?us-ascii?Q?+q2Zp2J3k6iTZt53FciosFoj4rDh20bvxAWE2BdFgAmglNoOWDUbZ3SEV+X8?=
 =?us-ascii?Q?ugnpWZspt4/2sPGABhahcAMJwZBrq8+Ei4F8yZ1zis11TBh/7r/Dvr+gLtyI?=
 =?us-ascii?Q?s1Gz+XSHdKaN2CXNH+TwVSstUfIaC3d0eM3OSJeEmpYlynajJ6WLWuZGDqEC?=
 =?us-ascii?Q?M2aJh30er7eFk1Si1ulxTYNi55l4do0+CfgB9izrUyBGHv7G4P9B60E0F77T?=
 =?us-ascii?Q?x3d9CKTjeEc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?osaH6xj9bICWS0EWc23u2s3msmhr9MrAaPsNS7bcv0PyM4f+FHKZ0ll9lFhD?=
 =?us-ascii?Q?K0Gg/kFfWuEv3Yra3N561Q7s2KQ/SbkPYxfdi79XyikzReFmvFxwFPXA2HpS?=
 =?us-ascii?Q?nr0FaP/+/okwIjKXEZD5qrXY+hTs06T0nKm6DE+pZr1cfHamRh2nrsaIAdm/?=
 =?us-ascii?Q?mwINc/mrHwr80GH4EwZqXr5gKZJI2OX2RZ4uY+T2ZQIhi1e5DiPHJIFCYb9C?=
 =?us-ascii?Q?saaq6updXlCL3Do5Z5UfXe1azdDse8j5ZNVxoRcLEhCkqBLWFOvT//H4pU9d?=
 =?us-ascii?Q?9aoAvthF0fUnXQrasAcr6YR5CIr5Q4swSLjUiKKsKIyIWKOgiFKXVy6T1Xta?=
 =?us-ascii?Q?6kSr0GoH+hrwteUVNmmC5fpHFzsF+iTeVCAofRUnT281UIrTa/RhXV8p7pu0?=
 =?us-ascii?Q?Anf8Gn1NmcRj761eVcrH8cywo6nKMzPNJLvTrnUXUN1GNnxLvdq8gt1WMmzi?=
 =?us-ascii?Q?0fOqM2Envvv5f+FEPexAJrokpIgIqigzeMT4nW3+9xd6zJWUYBWQPq4AiNfd?=
 =?us-ascii?Q?W8TAZ0KQLJ1UBzgXRIYG3sDGnAEkhyV79oHX+o3KAnFm6kDR6gwOd3dZ4xnH?=
 =?us-ascii?Q?biKQJhubf3PzUc6h0e801NrE5EeLyWFYtL/85kCNBS0DtVV1ZgRoDShD0B4o?=
 =?us-ascii?Q?OnIVnldjVGveCF6K6bnzZOZSsi8Ni0zPMLIHuDsSB1/YdbOiDrBevdvr38NS?=
 =?us-ascii?Q?a3rxzPUHJq8ZnogEkk27nxZy27h+plTJ4QghTRuNnS7MhrFodgDThOckyyXz?=
 =?us-ascii?Q?33f6LFYu0HBvlG/BzQ7kzbz1bHbNvwnOEAvJxKRGk7o8vfYtRd4vMoEgj43+?=
 =?us-ascii?Q?NGrfkfCgd4e0q2lsQc3dvuWsRZRuXuav4QbC6UkrlqLVWfdCmkl3Z6DOA+Vk?=
 =?us-ascii?Q?nW/o9rcXuOY0TpqO+SEloFHhtjoalLaNVrBvWd4NwDRhBqbrhke6DIvw9QXk?=
 =?us-ascii?Q?oZJeBXoaXEZZfVTdaszcss7qj6F5RY+gAy4ULzOS+b0l8/zsk0SiOCzpfT1A?=
 =?us-ascii?Q?Ilxf8Rx0ELyEHJNy89uqGc3JSBgL/YQP1omMBOQKWoX4uh0msQvwq+4f4AT7?=
 =?us-ascii?Q?wji6+wD/2wC4Z0zp9JdE308TsBf+8NdoluyHMXj9MuD/KGmXgv+vz6meY+MS?=
 =?us-ascii?Q?Zaq0L/K4grkxfXK4pq33QNjxx6zCmKV1BSQrGJoYvC78/UqOxGDWga58AmLI?=
 =?us-ascii?Q?JR/z5uOSDXsirHkRVFTqplcjYKnd4Vbfe816LG/HheXyuYDY7hvR/XcnqNfT?=
 =?us-ascii?Q?Mc/SQLiyNz+ysY1lC2EOElvozEwndbtcsYR5hedbAcZJpMIpdlqYe82EtA1o?=
 =?us-ascii?Q?2Un+tXUklGT5BufjBBQruM42zYMpJCMsvZKSg9xNtkZL9aDQAJV5Ru03c/yc?=
 =?us-ascii?Q?wEWV0bnvUXlqSNWIZShTshQF9Wxj3g5pWHk4w7YAQMzIxUx9WoDq0xxNXyD/?=
 =?us-ascii?Q?BrfG22zsCKpujbf5wVS1j7b+hkAIe7gybeFoHe+E+/47YY1V9PhM7VM4bQ2x?=
 =?us-ascii?Q?5debEXPTyy63UOoXsvWYqsPCmJahjLW5cc2xkVRJyt15KLxn0JOAX3g2AM8P?=
 =?us-ascii?Q?djLWZL4//HRq/x9Gw1CFzT3oRQlKkoxXUwli4aTa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451e8e8e-e66f-419b-f34b-08ddeb1db82e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 19:11:43.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gLGZGZYZkci0IXHXnjV17a8IZswq0KD1jRT+gsXm731PCnQ/R6MvDTr1DbGOngiALDx0XofiUYeZK+NcBRlgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

Original TXT binding doc have not limitition about quartz-load-femtofarads,
which only allow 7000 for nxp,pcf85063.

So remove it to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
        from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
index 1e6277e524c27..f7013cd8fc20b 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -62,16 +62,6 @@ allOf:
     then:
       properties:
         quartz-load-femtofarads: false
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - nxp,pcf85063
-    then:
-      properties:
-        quartz-load-femtofarads:
-          const: 7000
   - if:
       properties:
         compatible:
-- 
2.34.1


