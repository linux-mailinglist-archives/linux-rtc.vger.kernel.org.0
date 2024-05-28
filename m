Return-Path: <linux-rtc+bounces-1221-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8A8D235D
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 20:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF691F23D18
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 18:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D30116C866;
	Tue, 28 May 2024 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mMg34ppu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A121C6A5;
	Tue, 28 May 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716921861; cv=fail; b=la7u/rMJLdXArrMVBfBH8Kx9bgCdLep5Xn0RMbFoZSxYXxUzPAoh4ufv0+YKo7jztk9nGsi23bEQSxWkuLxQMZWv2siNaaH0pB2vX+drIsOj5jY2IJKd3726/taEpnFQ0gravd9FSQNlSWZ1h7IjXENWBoF/r9NnHlfMk9/T+oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716921861; c=relaxed/simple;
	bh=VnseUBLE29rvt1rUYWHjrR8KV5DC/vQIYjj1R4oX+YE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HXpMnLwRumnwz6EbPwJ4sVsmj9n2MA20iGsIAOp7NNgdaaRDXJeUB2GN9TgWPP7QwLpYX7BhIkIx1p+eJZIoPuvXLWsglhl9yuyptTeitWXJR3Rix1fdU6xNtLnWEzzmmoUfy66h/cS579+5vEkea3y/XrqX2YYnjOiQ4FBd2yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=mMg34ppu; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcwWYWkpiad8cw2BTnY1a+9N/m60533XAdaYi9UJ+G/eVC0tbbnkBT2HjnhYfjir9hN2xEUWNFIOF7MbEB05jXzbP2zd2i1c3y8MKMME8eVKETZaULSQpzghy5gVBcxapNLOpyuffQLNIyqSSgMipEqKC9cPMSxJp7wYfrhNys7cMDOhwpb3iaAuZDKOl1xtUR0KdnSc1B2CbTGH8ubSy0l7EEOaWnl2UZFU0Ehnj836dV6bankGaKRDZRBq69+NVDcUQXGP9amwaM3G0989VyCJlx1blVOkM+chbE4kqgSQj5oeteT3eWivPCJF8IEvDLswuZSGTncZA3RtiJM+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzXphW7F7dQjmsyWmz/8IjYBVs2e1r3WkVhZKKdcRR8=;
 b=mWgIB2rCuMMe3bA/8IrS3ye2m0mXs8xKogOVQOVTBtSSRWYUHlOrgN/+yVplKiiXYHxMso0WhEdnpvdx6mXeK1XazRUcqtcEvtZQxa3SD1kfq6FgMiimWenv1MsNL799OUXm7/v+U9CUV3g2dfN4yUN/s0B/Ew4D/QY5276tcDsE8wmC9k23WFi33SzHxnmWxKI5pRf7spFBp82mOw+fCY5ErXr/iLI81tDnCRaKELa4VcDAOeidXbFd76l5y7mHzyqbDAjTTVSAbt1nUxVt+lEro2+cRVqzclTLmDBZMajf9XtawnFortjmur97ulvyF72MbD4Dx1TL9RrJPIuqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzXphW7F7dQjmsyWmz/8IjYBVs2e1r3WkVhZKKdcRR8=;
 b=mMg34ppuHsztonFbwhi7PuaUy0TEUb1fkSRIfiFalQbpgDQcy9NNr+ZdpzFWeGzILpvMRL6/NNjJaC089aKTEidkFn5wUPhTJAYTgeBRaOHAz5IsPfHIZalUiTZlzjDRcVJFCSh5dOU3NEv8XAZSu1gZCz29VGyFR4cTFbe/2Bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6856.eurprd04.prod.outlook.com (2603:10a6:20b:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 18:44:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 18:44:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: krzk@kernel.org
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to yaml format
Date: Tue, 28 May 2024 14:43:59 -0400
Message-Id: <20240528184359.2685109-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8b4dc9-7dd7-49ff-2e63-08dc7f462cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ver0NtFFSNXDKMur4KBmdOu0xStevd3lON9cZkSMgVIl2PoDO2LvN+FwrSOW?=
 =?us-ascii?Q?eZt+G23ZlFBvxlHs4QHa2jyONEaub4S4366JFL1w9V5tXeWAwA332xfDwt52?=
 =?us-ascii?Q?oWNyXmANCxF4l3HVXVDNNYAKrUBBOYLNK5B0ZcjldA4CBugxZ8vDiM5jQ1En?=
 =?us-ascii?Q?eTMHZJuvH6S4jBV+0dMYzZ0Qj8quGYA7debjIfwJ8TqzaYSJJX+lomGUFcs2?=
 =?us-ascii?Q?AibdwgENGfupCxfS9/2CRT0CqDGudK9mJZgtjffGsG2kyqWEMAoEDnLqJqMl?=
 =?us-ascii?Q?CJ/drU/ak5Ckt2N0iC87UY4vHSzjkywHrkZynvLZ0tMRzLZzJ6sME12NxewG?=
 =?us-ascii?Q?ICYzufCG6Js9yVfRiBqvRqm9uZ/MCIYFtFa1hP+JufNuOvfJsL6t98MGadl0?=
 =?us-ascii?Q?7vYo0ygG8jvAeUwBKTYHqonuqQEUTkfvEX6ZuFW/mpeQFmw0/nTPhkxQjOZj?=
 =?us-ascii?Q?3POX+1Ou/ZzIJWcg/joQnHRDZwoxb+YTLv2eysIJF0jVnD4ARKm+5PhmOFkU?=
 =?us-ascii?Q?pG5v45pGhOWd5DXGp/0VnomaOumI1dzLHEje3znQYmFgrOgehnB8INFHYBXm?=
 =?us-ascii?Q?E0OyfmtdfJIGCrZpyCedHObStVW+sSQejli7rsfkff0vK3R9ok0eWtPaVDpr?=
 =?us-ascii?Q?Tp5+FKSc3hYkEjcurqJ86svxshtxPM3fg+VB8EoL3JaT8RfOtvBQNw9t66Wj?=
 =?us-ascii?Q?ftbBezrSRecEg8hA83itMkFCLYh17FE5ZR3mNDHOUiO+f3+1KzLmRsIXfcTJ?=
 =?us-ascii?Q?06locM9wNximpPmz9xuVd8Tg4rhKESuGOO3qOFMaP2EEWu2DtSmbSFx8Fnao?=
 =?us-ascii?Q?bPhYOcvN52IetlttL6KdvfN8foSitf3ZBcg+jMpoo8Cdb3HJO71+onGpkeWi?=
 =?us-ascii?Q?IcgSPczwU2c25quppRojbPse8NoTlryFNT+xBjNeA5Q3UGcHw7yJBffUSdOX?=
 =?us-ascii?Q?HoDlfmt5SxBSkOa71t/RIGYQBf9lxgHL0017gkrQUWPlLqSn9pCFSV9KlsmC?=
 =?us-ascii?Q?78rakaVKu51NmWKRXH3FRK5bcoupYRyzrj8OYnZfdXC7zFeuVGK3+ri92M7G?=
 =?us-ascii?Q?K3vuerS9R4DKZxau82CkTth8QF/5g+dKWsFIhaDYonvGGIbSe5AOzU6vOBUl?=
 =?us-ascii?Q?jELv8vxWGiT8qEq+5Em0wkM4lnsXEt/AZdcruEyPuei57cn/ie99kC+5xgw5?=
 =?us-ascii?Q?l6l4C6Y1YpCVqYPjv2k+O28jUy1RYg/pAJqwac5YbatRW82GtlnOtv0VldeB?=
 =?us-ascii?Q?gQkFz9fivIlMR9Ns2CoQ1gi228M3vvCT/5EXBrUOw1tBCCoHWldmdOuB8rUy?=
 =?us-ascii?Q?aQM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+zMWMh3b0VEagZD8S9JAV13xZXd2izO6cFNKtjpfpkZDZBAULCeF3F4kaGmc?=
 =?us-ascii?Q?5wKxo/cnA7khF+jo7CLCaJPgAHvNVxU4tIS3ZXB2+TZqmMZUlWPxJGKtdf7A?=
 =?us-ascii?Q?Kjs6vMhNOLvNfrShk+g/2fiwBAGBJ6wjAjfZKebwN3pek+vCZ9JmQMZ1PvfS?=
 =?us-ascii?Q?LySrjxF8ZjXkEozxrLewMkMd6B9LjuofBMKSMBuYNU7D9k6ZoSB2CBXQfW1S?=
 =?us-ascii?Q?OOo9T6mAm3XO4Ujit66kaZaykMZSyKIj7GyYbCGgKMS40VSaPOGtGe1zHkOq?=
 =?us-ascii?Q?W0r2J/IFCCjepgvgs2rTdRt99uZif3UTzQZgz5rnY5w+CWnvZuc8XXi0CYoA?=
 =?us-ascii?Q?SDk07+IdwS0rrkeGZXXxgHvrLhfsZxw1cVmY36t4hQrYDkvF87cBr4uWPAep?=
 =?us-ascii?Q?Oj0ByoduEMTpZk26wC7oketAPL9n8wDGC4rMuVUavcFB9wJqDSo7Xj/hj7ma?=
 =?us-ascii?Q?gmw91xlSCRICdmUg5VaXyeqriECGBumiZogy6CtM6xjwYy4vaEstYayBBC0s?=
 =?us-ascii?Q?9P18yQg/VpFSQf2YLWeVNb6Jgkl8gfmCQqPa2iztQETxJxmIByYW1GFWGEAl?=
 =?us-ascii?Q?CDRn9vSHMK9uqGV0IRpUQOKjr2zu3LCTA8+DDfN8SoCmtgZEyJox9nI3l9sB?=
 =?us-ascii?Q?3PYcNrQ526NKqJS4bjFZcex+E/SCbN2MZPm2rPNoUih3olaYxHefqJpT2gaU?=
 =?us-ascii?Q?CLJOewajeRsv8BbfKEcHN5cFWrRxlWtteyTQWD8nwkI4sOs2jw7xIqbJ7q3k?=
 =?us-ascii?Q?Xn5M2L01BOkGfm4j4fTu7N5nL6nK+Hltkgl3qpRWzDqowgmzvPcH74cf/uIi?=
 =?us-ascii?Q?FfIpnHKssNolVCWwSjEWiKksGzq4ycGRljj0R+ezr4/EyhCPGqJw/JnAyuw8?=
 =?us-ascii?Q?5bk4pSzljwpXerzZ1644ai+6PeT5OnilyO5etA2S/tlWJWeBd0NZgvU47ih1?=
 =?us-ascii?Q?En5w7OEZkc8KC6LKFEtkmfFNwaYPiq/9gTZhoh2PPqg/bZD54d0G9X0Gx6dZ?=
 =?us-ascii?Q?WGHtabFkg1zKcGHPYwla1O2i42fdI6sgXucWlc056hwgOsPckxZaAYDKliy3?=
 =?us-ascii?Q?mcKa57yAu6czpHO3oN8oQoP5kPUzSZqxQk4vFdc5obm6uUTerdhDPOuqSgZ0?=
 =?us-ascii?Q?srG6PhCFIp0ZpGbEpCgpOa8thndFhLo1vYhEGaTjSLTCffSnnFUuTMx0menO?=
 =?us-ascii?Q?JwMFgNGljkHI5AlEVsci3Zh1YXAjV3W1+AZj5R7GxlvXuYh95fBOuMYkvfmX?=
 =?us-ascii?Q?KU2M1AEKGo08ZdQL/SfXDTUJgvoK78VQHCRr5sfJnByasD4XZUGrVo3b2DZN?=
 =?us-ascii?Q?+NKom50WobNBkxw4QhrTJdPvi0CUfEVv5+fOnL1c7TM8GO8vV3FoAtMfLED6?=
 =?us-ascii?Q?n7Cruscx9gSc0T+0UVeAtcWyfzNzTwQPUDxyaXuG1fNu+lmsF/OtMaTXVhjh?=
 =?us-ascii?Q?HQhi4aoLEz8CIxDxs6VYEK08HiIdbfVcEKUyrVec/qmeqaEqkDL5iQVfCwoQ?=
 =?us-ascii?Q?bAhE1t7Vw0AZFJFnMuvHaZmFmYxf7ywaMN5DqQHykpoz8aC+RL+d8Cu/GyxE?=
 =?us-ascii?Q?1SR4NZ3sSyKHRTALbcmwyxUBwD/iVCfs3t1WHbp3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8b4dc9-7dd7-49ff-2e63-08dc7f462cb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 18:44:15.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiALtqZgG+j53aBA4Qpjzg2gGaGmN5BHc9pHZTX8YaJGcGfDdpcTj2ZhK0lyo7MWylhfX0fy3sexRPCfcyUn8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6856

Convert dt-binding doc "rtc-fsl-ftm-alarm.txt" to yaml format.

Change example's reg to 32bit address and length.
Remove unrelated rcpm@1e34040 in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - file name change to fsl,ls-ftm-alarm.yaml
    - drop description for reg and interrupt
    - add descript items for fsl,rcpm-wakeup
    - add allof rtc.yaml
    - example use node name 'rtc'
    - example interrupt include gic.h
    
    make dt_binding_check DT_SCHEMA_FILES=rtc-fsl-ftm-alarm.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTEX    Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dts
      DTC_CHK Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dtb

 .../bindings/rtc/fsl,ls-ftm-alarm.yaml        | 73 +++++++++++++++++++
 .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 36 ---------
 2 files changed, 73 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt

diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
new file mode 100644
index 0000000000000..388102ae30cd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
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
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  fsl,rcpm-wakeup:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to rcpm node
+          - description: bit mask of IPPDEXPCR0
+          - description: bit mask of IPPDEXPCR1
+          - description: bit mask of IPPDEXPCR2
+          - description: bit mask of IPPDEXPCR3
+          - description: bit mask of IPPDEXPCR4
+          - description: bit mask of IPPDEXPCR5
+          - description: bit mask of IPPDEXPCR6
+        minItems: 1
+    description:
+      phandle to rcpm node, Please refer
+      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
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
+allOf:
+  - $ref: rtc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rtc@2800000 {
+        compatible = "fsl,ls1088a-ftm-alarm";
+        reg = <0x2800000 0x10000>;
+        fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
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
-- 
2.34.1


