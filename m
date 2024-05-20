Return-Path: <linux-rtc+bounces-1203-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D410F8CA3EF
	for <lists+linux-rtc@lfdr.de>; Mon, 20 May 2024 23:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009D61C21804
	for <lists+linux-rtc@lfdr.de>; Mon, 20 May 2024 21:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D6C139D0B;
	Mon, 20 May 2024 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SXUlwACX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839881847;
	Mon, 20 May 2024 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716241595; cv=fail; b=SigDcNOcU2evwlLaJBG3HOSN9metwuPSI/iNomUPVG7xRKy2E9iIgQwINCrE9UE3fRWdQEYQNHX4Ol8o/JrumKzPp/5p2ugcNw5Xr9xIigEuf0QU0gilCDct7h9phpl49sZ3m0gV22m24ahmcnUGwfSgxdj9KrzRUSkNY4B6Ao4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716241595; c=relaxed/simple;
	bh=5BFBKQYLcxryyq8fqHTidvXrmfDKJ0Xbff7ycAUw7TE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=J0BbyomHnQkiWqdmJ/v1MqT3hz9VXw4QjAYkXUrwtmSb4/KdupKfy1XNhv6TnDPFci/lKznwMFmHSGlbtM55ik4up0ltA53X6YkIDGJurwohCM88HOU4RJoX8d6A/CpPJbBF/Kh2PjFI1fHKBzFu/2bJlb3ye1djGurHJo/tyq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=SXUlwACX; arc=fail smtp.client-ip=40.107.7.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvAysaARb5cK2Hf7Gn9xL8+O7tMWGVcaSYXx8sk/pmEKVt75M+lHLZPMujS5niok/ClqK8dBRFGTV9LcWYWhDpIHkz/jtfb1ATGnCsB2KtSeVQMXD7RKS79tRCcSocB6BOWBMRNlqV9lUGyEelgxAHPhSRBpuncjn5CvXX1FR4GHnBE9dTIfFuaOAaR+qycwwEgK1I5/ufdl9SERDQhuSNE2fqhjeVbQOHtJ1+iqtfSmr08ArZ5hB6cFLLnApl1Ondr1Ucvk6M5CtsMiTZUhk3pTFvFSAzkhqnxvE8Xo+t3WCdtyQfB1N8ITJzgr7zi6d9q65E1k+Qn+YuXzZOYMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pLlm+E8LJPOQpHl7oDGYjCUAVsPwl3fA7HQXZd0WMg=;
 b=Xjg/ON0IluxodPr31yLC3RrRXrbAVDJykCo0dUnAls9JGx+oGUEFtVCXRjYpH7kLud4gnXrNM3tkNpLcakV2iY+ptGElEKHFhM+RqfJcpQjj3kV6ZUWNpjb9drwt6ZnYbKqwq8V3Up5UkM9Ji08Th72C3WtW+uKcutAS5gSAbooBNyZUbA5XpxYolN5410L6Np/wzAlxAkUmicUS1Xd0NYTpu7wv7zwL2MMA5GN12xbiH0Vb4yvca/NTNwwvstNqgDTARvUeDYn6lnsdL1ATS7OCnu05fA+mslS6UqamXnuslSgopolsZEepOl5+56e3ImHycyzOfoRe4PS4I7TOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pLlm+E8LJPOQpHl7oDGYjCUAVsPwl3fA7HQXZd0WMg=;
 b=SXUlwACX72ckUHk6vk0VSwdmZL4fL2740HNBTlUhr+lll+URUWSX4ifSkNdxlTQLMgjAp04h4sVTnoIxmWgmVStaRm+zOgHCluPtpPAT50DpUNCUFOrEFxHDsB5EneIZcGFMFHV+Gra8A6rVHIbHWbbUQ9U0PdHrdHzc0U5KGuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7112.eurprd04.prod.outlook.com (2603:10a6:20b:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 21:46:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7587.035; Mon, 20 May 2024
 21:46:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to yaml format
Date: Mon, 20 May 2024 17:46:13 -0400
Message-Id: <20240520214614.863539-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fc1ad9-c050-4521-39ac-08dc79164e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z7plvd/Hko8/qVicT9e2mCBwSa2TTTnAgvPELP2xTyGc8H7W2amFslD4cj9W?=
 =?us-ascii?Q?j32WE3r15Q5n1TFl6FeWk4f+vIyUYYOQYgj7RfPAkG4uR4UlOI8mcYbhE6jX?=
 =?us-ascii?Q?Weu2LMDVd87qQQXvgeARb/GrW3VyN5K4SqZfVE2bLBw91cz0iG5nQZNSs5XE?=
 =?us-ascii?Q?+lZGPQAZLx9PX1j48DyoHapClkfcPO2Mbi3TExYrvlVLF1VPIFdNdVJnOrBA?=
 =?us-ascii?Q?C3SClVDbqiN/c8aIrJOp5Ji+pbRakZZQVUXUCYaxHZllWkH9Prvedq3aEZ6L?=
 =?us-ascii?Q?LOe3S3xCldx4qXsREByg93xQmqCGUcnBY1WyR+YACZT0a5ajpw2qa2clLNxw?=
 =?us-ascii?Q?YeDregNxK2Jl37JNPtMZDAboORcGBKJhr+PoDD6VrErDMW00FxMYpUy/Gco+?=
 =?us-ascii?Q?5eEMfEpkFUqePRM+7VNTA9neJh+FEbeb0RTTGotD19mLwZ3xl/NkLYu/xCag?=
 =?us-ascii?Q?etu/7gdE8Fk5wERRrmNnjJ8IPpEhCJfJ8LCsUxA3VuS3DAx3kG14swxjywlK?=
 =?us-ascii?Q?cgTU5fams8KMu8+7HmhbapP7Jakn3RtRjRdp7e+AOg3fx9U6AJ0fBJspjbvA?=
 =?us-ascii?Q?MLrLYPgDlXN/2x8GY5h5yStpaxRagXKOk8IrOUn1FXkhGujjBtykUZmjg6fd?=
 =?us-ascii?Q?nWDur9zugq/MlKkYCa1Xwsxs1aI6jzDxUNKpmm9S/7mPw135rSFW5silbiPo?=
 =?us-ascii?Q?tCkCUkK3Ev0hlCcjs9nsQHjhyvcpl2KuNNA8OE+63N7YQFbF9mH0IbRS4DS7?=
 =?us-ascii?Q?Ks51WyjQFLxmDBdKuvAlHoV9at1z34iHilBSCWGLsQ04LDvfYpCz5DhegXG+?=
 =?us-ascii?Q?yFEMlhNTNHr6JusB/gEHGzIW/x9SWea7HxO6XaXg3qil/cTPBkoNxZO3nv/V?=
 =?us-ascii?Q?wCTHjkZWr7GiCvcfEUgaK9Bqd+ZpP4ve+MPJwPNqtCdM6fWSMDmKNlmJaZnH?=
 =?us-ascii?Q?KM1UQm736fQ7HQXXDj+gaoK3Z6/455VMpQqws8FlbAlh+HWZ7pxQvmQqojLg?=
 =?us-ascii?Q?vS9o4Gwns9oDTl3ZBtmD/30SxVgxA7zS9M0WvIcHFce02z2iO+JfNtU6XBCr?=
 =?us-ascii?Q?DzbYCFiRsr7ytlmSz1zPZ3bLgS5tOXSFHEsTSoq6LNiv8QfY4ad7vbQE10dy?=
 =?us-ascii?Q?KKGbTkSxlEDUZvVdcR991fU3RFMcRZFmcXGp3rc21hO6ynUjhBpvdhXtHQ8v?=
 =?us-ascii?Q?BuKoWMm+b5XsgeYMLJvNWB2uzHj3H6LJkRI6XV3kqm/u8SN/Uxkbn6HXDhG8?=
 =?us-ascii?Q?YvX4NBkQpLpq5gwykCvSWXC9mUQAJh9apXBxPvqTFehOOjRZxAXtBlLzEDLj?=
 =?us-ascii?Q?yKA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fqpxM9a1rNH4pwFKsIdgk6TRorb4SrnPVPndohbnwd2KFTt4jtKPTfokJN1I?=
 =?us-ascii?Q?gfezV+pD4hxV36XrD5PYNK2M8VnsgU0bkzeFkY0AN7L5s5W88ugVRfi/Zdis?=
 =?us-ascii?Q?ECWjfY52A2kQr54bkRY2G1bmTDikOiVh3kCfFGmCay4xiewIzOY/a5t0BIbj?=
 =?us-ascii?Q?jncLrYb1FkgI4kETTwfdrhiIVwvwA15SvpsnM8eqc/E3xhXl7UtRQlY0+rqK?=
 =?us-ascii?Q?PHu24nP0BXvE22edsXDQ9G1tzNMlS/oStPDo46Yip39NjGVAeICPsDaba4Gs?=
 =?us-ascii?Q?jpkMartYp0bfmTPuXxZc7olvwJneTy1HUI1iQbJOmZST+L4VRisr8qvFOUG8?=
 =?us-ascii?Q?hzFVchrhy3tmCOluJzLGsZ1Fw7aZm71iNgc3kQRU2Xt1zhEUfHhEi+fRRQXn?=
 =?us-ascii?Q?0uDzt9b/Vlu+7zUMBMmDe2WcaP3PmXl0T5QB+dyi+stJEJj5ZBNXYGxa8SyS?=
 =?us-ascii?Q?PwvFnBusWR9EU0mTvcjoBUakVxV2ACVYej75uNVRhUwxHpxLhNpG9mHtttFY?=
 =?us-ascii?Q?F32Sprx9Gvbm/3InV/P+jM/qZKk4sOy03DQ4jRtockDbTnYVi/ll65/Y+9TJ?=
 =?us-ascii?Q?6Y861wPRl2HBJzb5Spc57IiVCYLL1SnDviW2eAjeBvcSUDYbznhKgnzSSncS?=
 =?us-ascii?Q?X3zn75jrHHa3zwkmb7w/abanu1jVLOQTDdPMM0U99eWPzJMD97TLv+L3WUi/?=
 =?us-ascii?Q?tf64erUeMZoOrsCGnzrlXfGgAMUfGClK/ix5iA35St2mK0p4bgrV/qoIrCp0?=
 =?us-ascii?Q?qmsCax+n1p5R8i756F6y1thAv7BaiUd+b6rYySjCX0GENJzvOXwTrqIguTd8?=
 =?us-ascii?Q?8ZE2Qog2DpUHhXV3YcKrKMUPkNHWrBtklhDdcZ8z0S4tZ9+DInShqm2BWVAk?=
 =?us-ascii?Q?h0HA3YKaXXAxo5gNPVyO2Y6VJw6zUnnFKXdhIMcRLdvplhFHvEH1469pJm3l?=
 =?us-ascii?Q?5zby7rA0UTkh26HezYVLffkS1eAjuEgVMT0j3ZUjrkTM3rriBmWI+0p8fFbQ?=
 =?us-ascii?Q?UJEkQY9rWbac2JPN3LvsC4RPBD1zQ6iK4ij37uCksRZRDVAMaYMEovdCziOk?=
 =?us-ascii?Q?kJu8XlgTIrVA03qSke1NPMMrcgt0p1LtBXmD749C6iV5BYoAtDYTRF8vM+i+?=
 =?us-ascii?Q?wuEIGNffFTXt9466bJdUAcfTtG8zR6yPDRPEz6ZbSswpp9O9xCbBqTIaRK03?=
 =?us-ascii?Q?9r4DcUdAgyG2WsZeyQ92IQg2G8S/Ma+4QfEANecZ7T2O+QbYLMEx4sarQY6L?=
 =?us-ascii?Q?WB8teOYoZNCn3scqaMWONq33sUdfgQca9edFy0EcdqXDCq/09+eM0tJO1ghr?=
 =?us-ascii?Q?S0ntIjhw5BKn5u29mH6uDpNjTOOf6UoQLxavb5V8wO7xv69EXDcu1Ut1n6kR?=
 =?us-ascii?Q?d3vN4fjUMOCXJDHhYP9tLSL2pf3q08j7s2GAzhPNDwrMwHCwCkV/NCYNkplS?=
 =?us-ascii?Q?3/ltvGpbIa7NzfOy4dJ0llDYRN+Ku97TRFmQPFUsNXqTGR6EkEquVd4orbkx?=
 =?us-ascii?Q?39EFRJ2Aj/qNMp6kxTJwoyuz7SdmXdeK4vPOeMDlc3TDO1gJ9LRl5eVE+S1w?=
 =?us-ascii?Q?jIvoYn9MblN/wCWbJJHWaEPEaZGGN5NBJDAIBH6x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fc1ad9-c050-4521-39ac-08dc79164e27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 21:46:28.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddu/ttQpWJhPbCbV6Jf3izJhkc+YsSup0vaJ5o4HSqBbM17DbACAQJmxEjqXJB3jsqwGfz1uLoFMu6IQ7TkzWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112

Convert dt-binding doc "rtc-fsl-ftm-alarm.txt" to yaml format.

Change example's reg to 32bit address and length.
Remove unrelated rcpm@1e34040 in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    make dt_binding_check DT_SCHEMA_FILES=rtc-fsl-ftm-alarm.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTEX    Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dts
      DTC_CHK Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dtb

 .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 36 -----------
 .../bindings/rtc/rtc-fsl-ftm-alarm.yaml       | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
deleted file mode 100644
index fffac74999da6..0000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Freescale FlexTimer Module (FTM) Alarm
-
-Required properties:
-- compatible : Should be "fsl,<chip>-ftm-alarm", the
-	       supported chips include
-	       "fsl,ls1012a-ftm-alarm"
-	       "fsl,ls1021a-ftm-alarm"
-	       "fsl,ls1028a-ftm-alarm"
-	       "fsl,ls1043a-ftm-alarm"
-	       "fsl,ls1046a-ftm-alarm"
-	       "fsl,ls1088a-ftm-alarm"
-	       "fsl,ls208xa-ftm-alarm"
-	       "fsl,lx2160a-ftm-alarm"
-- reg : Specifies base physical address and size of the register sets for the
-  FlexTimer Module.
-- interrupts : Should be the FlexTimer Module interrupt.
-- fsl,rcpm-wakeup property and rcpm node : Please refer
-	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
-
-Optional properties:
-- big-endian: If the host controller is big-endian mode, specify this property.
-  The default endian mode is little-endian.
-
-Example:
-rcpm: rcpm@1e34040 {
-	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
-	reg = <0x0 0x1e34040 0x0 0x18>;
-	#fsl,rcpm-wakeup-cells = <6>;
-};
-
-ftm_alarm0: timer@2800000 {
-	compatible = "fsl,ls1088a-ftm-alarm";
-	reg = <0x0 0x2800000 0x0 0x10000>;
-	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
-	interrupts = <0 44 4>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
new file mode 100644
index 0000000000000..69b44e9920033
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-fsl-ftm-alarm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale FlexTimer Module (FTM) Alarm
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1012a-ftm-alarm
+      - fsl,ls1021a-ftm-alarm
+      - fsl,ls1028a-ftm-alarm
+      - fsl,ls1043a-ftm-alarm
+      - fsl,ls1046a-ftm-alarm
+      - fsl,ls1088a-ftm-alarm
+      - fsl,ls208xa-ftm-alarm
+      - fsl,lx2160a-ftm-alarm
+
+  reg:
+    description:
+      Specifies base physical address and size of the register sets for the
+      FlexTimer Module.
+    maxItems: 1
+
+  interrupts:
+    description: Should be the FlexTimer Module interrupt.
+    maxItems: 1
+
+  fsl,rcpm-wakeup:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to rcpm node, Please refer
+      documentation/devicetree/bindings/soc/fsl/rcpm.txt
+
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If the host controller is big-endian mode, specify this property.
+      The default endian mode is little-endian.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - fsl,rcpm-wakeup
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    timer@2800000 {
+        compatible = "fsl,ls1088a-ftm-alarm";
+        reg = <0x2800000 0x10000>;
+        fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+        interrupts = <0 44 4>;
+    };
-- 
2.34.1


