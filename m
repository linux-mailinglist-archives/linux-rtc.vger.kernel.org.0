Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7FE3E0CCE
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Aug 2021 05:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhHEDhG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 23:37:06 -0400
Received: from mail-eopbgr20088.outbound.protection.outlook.com ([40.107.2.88]:4102
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232182AbhHEDhF (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASIf57duevkGUhOfP0cKQV4EAE1pzYr5cCH0YVsGU/bQaKmGNx9kgJzCa8PokiFl3rEQpyLAM1ub+wf9q/LpPdD8TiPuOFuDjnyX3vNFuUyyTMmli1CsKaHTCPXJzL+AerHhMGfSYga3ceaHkDGkkBv3bAmZsWhuttQHjqKMz82EzHiKP97VWZJ1rfmgh6ZkXbQWT/iU5B+2K5vKOem/tTLhETxbwg2voNVu69LlQnvKFk6Nt2eaWRG+Fxw28tDXF1jzWSTn2q5u4b5JioYP8JrORt1QrWhKRSxpQ+7VVMj27KIUsHZbTsdOawEDyI2Hyaika7SaQVQE0v/LwnNFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxodVXUoOTTH4rlgzsW/vy3hrQNg1RPBvnbPNHtVBoo=;
 b=VPDXJYYJfvVo8UgaxLgQSLBdVmNgRU9BERQFl9wsmpAIOplQ6IVsUtjjK3knJ/Px752EcW4E6eRS6cGL1W6Q0IympI1Opal/tjNTfYNo1O5v0i02/8nMH1avcIRq7I/soYm2YFM3wo186tTrbpf6xIh0dALR6s5ivFf9CPu4oeNfGU1bvpNKybxlqSWgY/0y6xndF674ivurZv6cLsGKb9wXUj3HBJHdLu5sYGR4v/QRb6AEGp/reO5cPIwfmkA2T/jDczK+XP0XRqiChkeN57z91tBWcXN8IwsrGheJub6VtXtqF3t0cVGnVz4yImu7rtR7mT0wuf1s6vgNkzvumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxodVXUoOTTH4rlgzsW/vy3hrQNg1RPBvnbPNHtVBoo=;
 b=Z3Z7fTPGW28S/duPaEs3LmYC99PMonOtqXCLaVsvLOPk/cKlSY++mzHnQRxO8xcKvre9/8DrVUJWCGLFQcQ18oP4UycaVg7MA9N/TyN/m8niTmaswcJt2CzicjO9lbG8jgyaaKEqurdguyn/0Yk3OD6PxBp5qOLZ4mE0fNFgoak=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 03:36:42 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:36:42 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, aisheng.dong@nxp.com, dongas86@gmail.com,
        robh+dt@kernel.org, shawnguo@kernel.org, peng.fan@nxp.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] ARM: dts: imx7ulp: add cm4 support
Date:   Thu,  5 Aug 2021 11:35:45 +0800
Message-Id: <20210805033546.1390950-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805033546.1390950-1-aisheng.dong@nxp.com>
References: <20210805033546.1390950-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0059.apcprd02.prod.outlook.com (2603:1096:4:54::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0764a3d8-ea23-4cf4-25e6-08d957c23dbe
X-MS-TrafficTypeDiagnostic: DU2PR04MB8837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB88379A52BF2985152815BB2580F29@DU2PR04MB8837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21OqL3O9yGpLkJgdMzTpnu1nOcS75MQMDKZLG6LVGs3G/xZfUqzlTZDxYoWETgJNugxZN8JnlcL05GqpmMy5ux9C5qd4O7GDy4RBSHw4eDoq4Vo8l847YScAdgsMvx5TbS3xuPD0qkNGncnN9FFgWJSWFjhqCTuxqY3UsuPoh1vf1lCw3Gk16DWeq4zSQQhD640980yjt1LocgoI5mz/WM0GjYppeoUDPQXdyhu6QMYGZvajNN3i22P4JBn+3eVMwKp/v7mo2Wp+uNhdIDcEtRLTMcgWNoJGJxnWewtqLAARqBMsgvySSbBKENRRzdP5ozKZxYurUBWa6wz6Kz7BYKE0kkGDxqiAyapjPz2XXuIvcsX9DDimvleJXpcOfo9rGXZgXtizGGmeQ3grBY+JVXJ2kIpWxSHnxvjkH+YDqRpnee6s/hMHqvW88CClWZK9XSwX1LHS6TSHwdc+y+6Jb5IghmrDBy6+qnBbN47t910JW/Ht7TqUhPK1eqnF02Cm2Y5MUgS5VCyjDI1QKN8YDcfF4ZlYtp1BCzWjcOvDYoMmVEUZTXeyrrQL6CPcc97lJP8R6S+L5+P6LopTCT3km28Bfgn3QLbc0VetozBB4mIlSRYp+NQp4S/rMEcYI9qYkjg/KmRMfRFhlUrCN219yKUXj7Q/1WW/t4nKpSdpBEwbzo57QfGTFgLAAALRp/iir37wGYOffgTIw23+RtljnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(5660300002)(26005)(6506007)(478600001)(4326008)(66556008)(8676002)(6666004)(66476007)(186003)(66946007)(316002)(86362001)(6486002)(52116002)(1076003)(83380400001)(36756003)(8936002)(6512007)(38350700002)(2906002)(38100700002)(54906003)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3xnQpJX9BcSi5QzAKau3Rqkw1ZYXLPa+QEDE/mWyT8PWKlLuCvfdIdYEuvGw?=
 =?us-ascii?Q?2Qum9RQDDFc659IDe2ucfwsOsmZGVLFE2SYPGzt5XFYy4ggDr/Dy4feQHnNY?=
 =?us-ascii?Q?zhW4jBCmEZhcDtLURHEBGO3mM9h47CPK0hTnMz1gM+QJGVr+tbHb6fE+bY8Z?=
 =?us-ascii?Q?awxM8Gdd1ZKUoaYU8Q+4G9xLaktLvgNzzva397/JSivOr957Ryy22JmfvCc9?=
 =?us-ascii?Q?93hj3hUUZqy/FJkhO8yG1j/eGALNC8ieeyqftJyraRROhKGvRxdfxMuETdZn?=
 =?us-ascii?Q?S2V42S8BMyOjRr964DC7vSQhryr6ouYhLDb4ozJ0wiSACbRlVv8CcjqJmBf+?=
 =?us-ascii?Q?eiJaFUnlFEQAvBK/mlAi55rDR4bIiF+gWFwihGSDW2OIfvso90hFeU/l2LRr?=
 =?us-ascii?Q?rAMn7xwUcNXfENbXv10eTdGV4BhZjqlY+KUQPTrN9WgCVW0DFQZXqsbZ20y/?=
 =?us-ascii?Q?z6Kftdq0F6RJSP7nqNxNEnMTZIyHIa/GzZXXOu9Z/f7CBFdSuTfOlKOEQZtt?=
 =?us-ascii?Q?ZenSU4kEISjJn4mEfX0uf/l1twm8zKudHoncULKRTfM1Nln+HXK5fjuFWdTD?=
 =?us-ascii?Q?NDdVaq1d0qm0RfXtAHmCYvBRXjwJu67YTAW6ZeUojyMb0Ywm53xxIHEuY8Dv?=
 =?us-ascii?Q?LOHX2LCqy3j44tbMn/pejG71517TdYSlx2QW4KYL8muW5a2EimAf8wIoWlq/?=
 =?us-ascii?Q?Icbtig/TZzAOdvMTrhLNxYf+ZOWgMeG/SB8y5st7TLqbXtkdUpM1APZmecoE?=
 =?us-ascii?Q?X4v+meZ08WbVWeHrntJd0LRoqTHlpkrxy/JBPjPwWPe3Gb9XvjPZJEdpv1fY?=
 =?us-ascii?Q?bDA64x0p4/HNzmHlu4YWeXihrT91pS2ntYajekC62ddiReVvUn8EsRx61bBo?=
 =?us-ascii?Q?v4w15TWXY2ddtNW1P/cNIBHgPhmnw//cGhxNODEbziNGkJVeA++r6Ok4ennO?=
 =?us-ascii?Q?DPybptrnSfIjv7c/6SCWUrUNhPCUFurQErWMeRDgRe5N6BFKdLYdfafa+yde?=
 =?us-ascii?Q?ALk0TUysDyqDSnGouzvmiZOkyseb9P1pF17o/G5M8BN+lrKWMbdU/zyshI0N?=
 =?us-ascii?Q?SUU+1JpUtNLhLSXBNQIwJ3fEN8o6C57hFz8g7LSVlQkYF8wNRcr8YGq0N3iG?=
 =?us-ascii?Q?3rL91+KgDYV6HPcpjUCyiUoXnRVWUrf9VXihoa/kuwQMidoslhXR05xg/e/N?=
 =?us-ascii?Q?ZCwu2VX3vA0D4UurY5WujZlWWgnqA+J3iQyDICLF7duc4ALSvWVuC6T//Htt?=
 =?us-ascii?Q?ytawuUV7mPmZX7K6/4GC+OGwW6V5mCTuGybNwtYwaDUwGzKvVYSBBtNkREjD?=
 =?us-ascii?Q?YancrtyR3ugT/d3GFwLosC2I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0764a3d8-ea23-4cf4-25e6-08d957c23dbe
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:36:42.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2WtGAUFfmwTRBEFoD8x0fhPAWonUFTCQGfeFLMIEUqpyLrG1egsTdBEuP5iRauH9ivb5hHdM4Hfvdt/H4c2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add cm4 remoteproc which supports rpmsg naming service with
two vdevs and two pairs of vrings. The vdevbuffer region is
not required.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm/boot/dts/imx7ulp-evk-m4.dtsi | 48 +++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7ulp-evk.dts     |  1 +
 arch/arm/boot/dts/imx7ulp.dtsi        |  7 ++++
 3 files changed, 56 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7ulp-evk-m4.dtsi

diff --git a/arch/arm/boot/dts/imx7ulp-evk-m4.dtsi b/arch/arm/boot/dts/imx7ulp-evk-m4.dtsi
new file mode 100644
index 000000000000..abef0e6a2f25
--- /dev/null
+++ b/arch/arm/boot/dts/imx7ulp-evk-m4.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@9ff00000 {
+			reg = <0x9ff00000 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@9ff08000 {
+			reg = <0x9ff08000 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@9ff10000 {
+			reg = <0x9ff10000 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@9ff18000 {
+			reg = <0x9ff18000 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@1fff8000{
+			reg = <0x1fff8000 0x1000>;
+			no-map;
+		};
+	};
+
+	imx7ulp-cm4 {
+		compatible = "fsl,imx7ulp-cm4";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx7ulp-evk.dts b/arch/arm/boot/dts/imx7ulp-evk.dts
index eff51e113db4..5d08bdad4c07 100644
--- a/arch/arm/boot/dts/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/imx7ulp-evk.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "imx7ulp.dtsi"
+#include "imx7ulp-evk-m4.dtsi"
 
 / {
 	model = "NXP i.MX7ULP EVK";
diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index a917b363da25..b4568eb49f2c 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -122,6 +122,13 @@ edma1: dma-controller@40080000 {
 				 <&pcc2 IMX7ULP_CLK_DMA_MUX1>;
 		};
 
+		mu: mailbox@40220000 {
+			compatible = "fsl,imx7ulp-mu";
+			reg = <0x40220000 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		crypto: crypto@40240000 {
 			compatible = "fsl,sec-v4.0";
 			#address-cells = <1>;
-- 
2.25.1

