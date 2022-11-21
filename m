Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4D16319E0
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 07:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiKUGuh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 01:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKUGuf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 01:50:35 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9041B1D7;
        Sun, 20 Nov 2022 22:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVGmDp1EkVRRAXZ/LK7eID4jU6MRit4nGcEhTmhMRY5eHPjjeF7FAU7+2opFHkf7UMITg04kD6BDXOMIvSnxAsRJ8JB662ETHyHWHj0BVhY2Z6LFyULJAv6J3cxP3KlyIuOmDy/aTbXl9Xk839VzQLruiwKQtTdOJz+10bc3EEhTDNHwUx4kzLrRkIWG4HNRauQw3K3emPyalg3LNVjUH9lBTdNAOtG33qmbfi56cnYepjuwJEuI9YaqiKIRNd/7Jups5OKGGW2r/2r7sEzkuAVccv1RT7BEaS6M1GkbiSxD2vg/EKvgc9XcVJHjbctzIAxUWbFEZxnaBmee4tti+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAmeHWa2LC7fWrTzlRx7N0hL32CxrYHgfrWa3OU8q1A=;
 b=aUwx3k2cf3q/oEb+3NXJsu0GUw/iVxXq5EAJmphX+lseCh3G9trK+ilTcmt3EV/O8RTL8BSmbdE0BBqDhiFnrcQCd5Q7I0UGnvUfMwv78lPkKGNe79PRx320HNWwwPCwhpn5MvG0sdCVWBSRxpWN7Du/Bti61B1NiwUExYTlsHfmPTd9kyBGFWgoYQ8w70gRu3ZOe6G9TUhr4Tqp7ENtDAmHOmHFadb1XRNHqpvzk8Z1CbYKFDauAnhCELkV0ZMySBI0ydwKpVaujnepm3FWL4Ad01TFDs6Oy7414CN6/quNHuGxOe9RUbosiGuXIf9rvlxVJrDibXbJf1UsBFMXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAmeHWa2LC7fWrTzlRx7N0hL32CxrYHgfrWa3OU8q1A=;
 b=TBqlAhTHPwxib0EbqtwRioAJg24VAWOrXKHMoVWKru3uBAwq1tIxtr7DEexVjdHAH2yjNlufPcbYD1goG6rFB833ly5Y19PLyEE7bh4VcSIwEBMrh85a6dpt1Wu5618MrXOJXzGgljksEsGP2H/e/TLWI4XtYHfm3P8olJQfASs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:50:32 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 06:50:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp bbnsm
Date:   Mon, 21 Nov 2022 14:51:41 +0800
Message-Id: <20221121065144.3667658-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221121065144.3667658-1-ping.bai@nxp.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c775f-e57f-483f-9dee-08dacb8caf68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyYTta+1umOFbyrbGu6RPwcTo4WpmHsYtEBXDCwamkrXcCiCa3RI+YAfDvlmRij0CnAoqbgn4DUO2ngJZtWhJIbnGwkw2RLNE8aKPeWBfvOt63hdiJgUIbRTrxk/rv/zqRBOA9lXn9aEdqipdXMnoS2SOn6unIbpObREYWyf8KrFt0OXb28SRI0O9KMbs+L72iG5JVRAJKKLv593t0pM42gtp5SzwtQzUdAlXiv8hu+bkgj4TCTv//2xMt4kLFPbjq38QshBsTih4quku+WQRH2UVkyurh3JytFp566vBaIXPJVG9ILKdJ98YDJKnsQOpGMMsoxwIyUem5Mmf93cHNsCv+tvmdGWgb3z2TATxpuaP1ZwtdVNWhDT1hMxQPt2JTmiGOpeJ3OylM867twaBBrzSnxf0h1kYVGmfEwQaQ9A3XFUZcK0/g9RSfhKJ3vivukbtSTsATIbsEobwmESV7T0ia1EVgfEjEnzT7xfZYHMxSEvqnOWHAsS//hdGZTibe+QfShnKWDIezG+cI0TmNg5D2QiTU3USZTptPGnlhskMXzhm6whoKYUTKgeNHhA8k69BCCk1wVBF45NFNbYUAYtQG5yzfnB7EV77D1lng6R10b6Wlhr7HeAZ/g9+3dx5jAwWr02RAvW5jhtzrVxxKAuaqUiOnQ+8Cj4qGRMNJXsSLc65yhL79tknhFw8IZuYf1jVUZihoGckL6htTy/A1BsRbwBy8A4DkkiPYw6wxa+E1BfDXnhTKujwTJB/WG1bGu4q8lnSFnpBDJMQusnLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(38350700002)(41300700001)(2906002)(86362001)(66476007)(8676002)(4326008)(66556008)(316002)(6486002)(66946007)(6512007)(26005)(966005)(186003)(1076003)(8936002)(5660300002)(7416002)(478600001)(6506007)(2616005)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apBW7VhEUNHkUGniVMqRTSl7/1h/qQ7Y3embo688qpUIfzvBDQ7Y5HS5zTLC?=
 =?us-ascii?Q?pPgTo3AQ1qyy2YOa2s/JfwolPdDpP1VhqOSMnW8dsEX/edjhboJOpDm689RZ?=
 =?us-ascii?Q?YYPyjR6x67WcmCDyInSeyuhTx+ZaY9GQ9KfiJ81PXaS1YfSRCy58r+WNsrdz?=
 =?us-ascii?Q?GUlrj9cGnbQDTCSkYhtiOLyKObA/hAtyB6wgDrq8UnGT9ZEehU982CBC4Fkb?=
 =?us-ascii?Q?Vttq1yM8pc35oAlrasqpcqtUsmX3uJAbSXJHAinwdwE+yIJpmyhUxJ32Skqh?=
 =?us-ascii?Q?5s9R/gAsRXLo/tRvJFGJ5BPCEPq3Zp8OuJoucKTlgRhYMsceaM8YH48fwsuI?=
 =?us-ascii?Q?q8etAUad48Fe6/0WYWi6CKyqPRsReETUDxzgJ0Fw3fXQXzZ/6aK6enZeiwCT?=
 =?us-ascii?Q?Op8uQViqD+rDmXYKppu/HrzoWngs9YpEOyMs3TjqIAEiu7gsQbQX2ILGNHNP?=
 =?us-ascii?Q?AGJsRjbKE03cRZtWviaOhZbVgO4VMKf70rV1UJtJsZ7tj5ybl47ZfEd0S18a?=
 =?us-ascii?Q?zgEfMbY3LpsuDnik9bAGNs2xLS1uKd6A83OLrZnq1CvO9kXpZwqRy3ti1KY3?=
 =?us-ascii?Q?pCxjF/RpALlOyQuhCd4bBA0BhVASTEe1tVwbtZRVwQqH+ZNrqVgkrFcxi3MY?=
 =?us-ascii?Q?yZ6N211cWeJI/lpEUUE2sIGXZ0U1Qyhzcz4SNkjtHuiozoLpVFJKJ28/LRYZ?=
 =?us-ascii?Q?68SHfm7Zu0JcvctB5KSH0q/0VYAQyyVibNBlpUlOGXjZa//lm+ReneMDewMv?=
 =?us-ascii?Q?Um0yp/glx/xL56ZddA9lWHyaHzorxNcr1hLBCm3QAaoQnebo8tC2GVXKkyE+?=
 =?us-ascii?Q?df+zXRwa2L38JaksYEKLFwvaxLlTwskgCoxawB4H7GspuD0LmzAxNsEF3g51?=
 =?us-ascii?Q?8D5IUKNcyAdS8SvqBCXzqiEsfyud8ti1nq4UEzk7z706g2iZfQn8L2ALAcZv?=
 =?us-ascii?Q?/LhpCb+xCkB9ivrYr02K554zWoWBTzmfu+yzYTInmxbjv21c/DOtQtSkwLRI?=
 =?us-ascii?Q?/dYePcxfe6fO3sqMgHZtk5Oyg/y8mvijmX19JoPbVl5TeUNKrxiYA2S3NZBW?=
 =?us-ascii?Q?wLvmtIbjlNTn53MF97GjZY/nUudSrjJj4NQqYx+roZCz6XlnLtl68Wg2Q1zx?=
 =?us-ascii?Q?xFfS5EFz27DCycbtj4qyREoCEdFwfvjhNKm9jofPWGaiJSNJRfzsyUKBjn0L?=
 =?us-ascii?Q?L35mXGln54hNcJignCIkN/FTjjHcjr8RScjT/AcdiopDC6t1NgVJ9k39OVrm?=
 =?us-ascii?Q?7fj9D7FdxQmi21Watr6/03cOaY6lYGkX/40N9lMkoL9wJIkjK1ZoLMyh932C?=
 =?us-ascii?Q?Enn24cej6y903xoN2wZc+Ht033DkBVz1M+Qihm9a70qi1Dlau3MNxsmIoi0u?=
 =?us-ascii?Q?ARd/o3nvATzcRcGDinTesSb/oJkEdFF6fjSsjDtyG4TU+YdYuvGY9uwCP2CN?=
 =?us-ascii?Q?C4PsSHhdimi5+tI32hzDrij5rCFrRxPVMTOrl/yQBfZT6ay8jtuutG8NdXVR?=
 =?us-ascii?Q?KCqYD2j0wL1+Nt8R7Y3FT92CSz9ZbPs+GhuP8nL4CCs9A+E8abZ6IsLr0FUV?=
 =?us-ascii?Q?6REMta5qn8lIjrutjmkZcbSIhjCOPwl0fS57jqd3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c775f-e57f-483f-9dee-08dacb8caf68
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 06:50:32.7574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD0OIoErWlpXsJXDz446CZAl1BzebT627By1Uiw2fIlhsfTyQTRH8L7FrybwgujEEqxDrLDPQQtagH48s9juGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
new file mode 100644
index 000000000000..b3f22b0daea6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Battery-Backed Non-Secure Module bindings
+
+maintainers:
+  - Jacky Bai <ping.bai@nxp.com>
+
+description: |
+  NXP BBNSM serves as non-volatile logic and storage for the system.
+  it Intergrates RTC & ON/OFF control.
+  The RTC can retain its state and continues counting even when the
+  main chip is power down. A time alarm is generated once the most
+  significant 32 bits of the real-time counter match the value in the
+  Time Alarm register.
+  The ON/OFF logic inside the BBNSM allows for connecting directly to
+  a PMIC or other voltage regulator device. both smart PMIC mode and
+  Dumb PMIC mode supported.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,bbnsm
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  rtc:
+    type: object
+
+    properties:
+      compatible:
+        const: nxp,bbnsm-rtc
+
+      regmap:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - regmap
+      - interrupts
+
+    additionalProperties: false
+
+  pwrkey:
+    type: object
+    $ref: /schemas/input/input.yaml#
+
+    properties:
+      compatible:
+        const: nxp,bbnsm-pwrkey
+
+      regmap:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      linux,code: true
+
+    required:
+      - compatible
+      - regmap
+      - interrupts
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - rtc
+  - pwrkey
+
+additionalProperties: false
+
+examples:
+  - |
+    bbnsm: bbnsm@44440000 {
+      compatible = "nxp,bbnsm", "syscon", "simple-mfd";
+      reg = <0x44440000 0x10000>;
+
+      bbnsm_rtc: rtc {
+        compatible = "nxp,bbnsm-rtc";
+        regmap = <&bbnsm>;
+        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+      };
+
+      bbnsm_pwrkey: pwrkey {
+         compatible = "nxp,bbnsm-pwrkey";
+         regmap = <&bbnsm>;
+         interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+         linux,code = <KEY_POWER>;
+       };
+    };
-- 
2.37.1

