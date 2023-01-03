Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C760065BB5E
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 08:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbjACHqg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Jan 2023 02:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjACHqf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Jan 2023 02:46:35 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B0EB11;
        Mon,  2 Jan 2023 23:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxkLULHA8QKvvx+DbLUtVHO1MHKNhTANQQGPY2JpiggEMUaSJaYlXSlfL3LgPuTn5QEdQ8Cwj6mit5/CoS4XtRtaYCFFvdfVCmcj68fsVWO/w9RuCRclFcqsIRWHHhnpmroMLAzNwfrd/R1kqUiHMiCH5mCJQM1/7bsSdr4HFJSu3X9wE8dn8mtdYDyFa8zdfpAkoaJRmtUlNvpi8U66XoGZ8N+3fb6IftWMSa2Oya06gV/PXWTd1gLmjj3a/ldg+i8ngmOsSCvPEHvp5NnmfUcrDZTxPIZnhOMgGJwdbuJeBrLNNYQIl3Pr0aZdSqjhC2GL/ssY0LcJRsA2Mbygwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gq7oD/ecklTQwXERUtX4H3x068GDQp+NEC7VxnECdw=;
 b=G9Wb5hHjgwP+STV4q8l15gz3oGSpBCNh1nTuse+SliOP2PUR7HJYMKBwRU+MkZSYEfPshot9EDt8Q1xo2mZNEthrAQdBVMAnuwnRO1yoWn0roVIewzA1fwezmgw4A+eElkdCc3H+63KPu2cYeDQj8Tv6phiDjyL2LS6LbvYRPvRGNWOWfD3okqi/exMoBb3lI5kmD08gAuAq9u3+W2KXsqhC8GriWzid43FGF3G/NOOiJgoHYSmp7ZP2JAYWHFhJ7SuQeTZy2l5htLyK0MkE5LX5XG7fO7zUXY2yyYOcdIcHEFviFPck23VTdteMrRQauBKfKYsR859JnWr4VXYG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gq7oD/ecklTQwXERUtX4H3x068GDQp+NEC7VxnECdw=;
 b=OeCX2cMqWsNua9HtoYbnG7de39M+pWO3cIz0RdV6zfX8fq6RnfD0bHFUuWDFt+5s94OvZw9Ve5IF3Siz3p3j3Jh0hwXYOR81P0M4EVZg7Ynp57Jh6/zkrxKGYksmV+eeCH/VuF7w5Jg02f0am5Dap9X7dYmHkQlk3dfWkRhYW5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 07:46:32 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 07:46:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v3 1/4] dt-bindings: mfd: Add nxp bbnsm
Date:   Tue,  3 Jan 2023 15:47:39 +0800
Message-Id: <20230103074742.2324924-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230103074742.2324924-1-ping.bai@nxp.com>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|VI1PR04MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: ce795f44-60d5-4baf-849b-08daed5ea169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgXcGtBtSRpSV/2ovlpoRofqCfcpKnNv/iu01slaMlNce0zOYW0Zr3EqKsv/Uu6lqvuXVzeSBkvIKBP50aKWO368b0kORD8qfi1hdOoXRlFVgH4bdDOwgE6iP0zgTvaftycvAM3eWSVPn4R7bqsWvuWn/QtRfnjbXp+/MlaHwJYnULydo3RXp8LpFF//xDDEzhPdAKqkthsAW0Xv/dVBTKgQdZVHc6+ecAI2K5+HcpQADVw1Eu+FaWMbnJ11vLvosycdQWSr2+FujARdqQSUbYuIe7noqb1zWXdih1312veemE2dL0XpFwqv8r/czlytbBVllnYcLiEhzhl3p+CMZVSVsOqq5XTlRraKJLQgouC6wGRC3o6vdYZ//JI2P5H6/gjPKl4bKFZ902yv3Jcz+kldst1lMtylV9/19dGhHdjO/Y9x62TPBM+G1qRU9izQ4lPPRAJ9um2rH1dPeRjDtdBmay3FzOTpClnQCXxHUJ/IvPC/w45L/kP4pmeTyLWEDSDIigF1DCYsYM78DsSxugdtHCHBuqFcRn2zt31Cq0dgqXJRVocwH2LNrHZVwwEjBrD9i8z03d1VAmsv7BU/FiCzF0zfhYFwFgFUv59hb+faJnkg7tIeq56euYpql+Z/RRB1ZNym3T3KOYrjL4vzILosRwHuWkRL9BIld+R78s6e7J7AOHecxrwYYra1ZpXw2hB1Zow7AnUUwfb73g1LezPor6YaRL/LvMg7sdm5/YPot0Y5JYAUP9kmidWpm8yhtkmIYYc9VaC4qY7F3wVzCBa5c8w5he9Ce5WjKUvJ8Lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(8936002)(41300700001)(2906002)(8676002)(38100700002)(66946007)(1076003)(38350700002)(7416002)(66476007)(5660300002)(66556008)(4326008)(186003)(478600001)(6512007)(966005)(26005)(2616005)(316002)(6486002)(52116002)(36756003)(6506007)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uFNDkPCyVQfZd03jDZp3zXKeMrP7AYt7uvZ/L5YfpG/Zf5nhq8Q/IABc9yr0?=
 =?us-ascii?Q?Y5zCdqR3KbQRxFuaZjsJpUltqBobt3qTJ+BNG6uBEOJVPrBlhVyfPVGdLn+A?=
 =?us-ascii?Q?nck5mxjY/G6KAJG0dusQfOGegTTSTvHv35ItjtxjWcOdVtzYPVa7e4DqxJMS?=
 =?us-ascii?Q?Ne2mN35npw3Nx5jsW0UYz5knZy2olM+Xks+LHzOGp93Unf/xFzZcFGevB/Lt?=
 =?us-ascii?Q?9qEkTxMHkePDBK0nfPtyTa3YLbfaAkIPU0LpzIvnLAoTn+lFZ1kwUrlFedEk?=
 =?us-ascii?Q?vOjUYiI0gwuZfeTVscN5yTmPPWqlRtfFZRpO//+rUN2QOiXOpe41JPW4esH4?=
 =?us-ascii?Q?2mrQD6uQ8Q20DVuD1rGQoAinQbFQxPFRurojU+AHw59mZQFM3WKru/E/mQ0X?=
 =?us-ascii?Q?ac+czhM2bPkLoh53J9v1U3/wcbCe65UAQh6gVyZSR3kXnnFu1EyNxUx1/2rB?=
 =?us-ascii?Q?KD9o5xA5Bnc539nyl1O9ciL+H2Ggv8Ds0SZSNXlSVJVCxe/u+o9+h9VCrbCL?=
 =?us-ascii?Q?b8B6vGoYlzggHuILhANWUCBOtoE2d9kta78aohlb4E7D8dqKhu+4nzRzo/mR?=
 =?us-ascii?Q?/0PpROB9EJpTXKfFiWdacaN4GalJPwLyW9IMOKU98+D8pni7tuOlEl6h0uhS?=
 =?us-ascii?Q?lNz7dnoNGLIme8cnnM/e7ghGqTwSR8w70YksB+T2rm6kHaLkpR2M9hRPxDFh?=
 =?us-ascii?Q?y0hE61Q6/g1rfpI7d32NwYsjs+p+QUwstWkoV9EVT1pgObPuO+RthjsWS1XQ?=
 =?us-ascii?Q?OIIjbwPZ5TMCzAUFiK2tA9lXupCws5FwLlWcXIdLnRJYda78A7tb8+IHva2s?=
 =?us-ascii?Q?dPP82EdTyMcLaeGmjTwiHsjzxlVZbEoHYkClXUoe0XUXHvg7ieAo8pPNr5Ev?=
 =?us-ascii?Q?QhxjbhPyV7z7U0Y/PIsIQW6ftevhcSHvSU6OcM0PdRVLT4BdI1z1VoROBOZG?=
 =?us-ascii?Q?mVTTBGZ9/EUYOk1h5oNCwxFA7jxuNJey18ttBqq3gt/J4msmuetN0japn15V?=
 =?us-ascii?Q?xs2NejOOmSbXYuxF5PavGzlr293Mfm6Qfr59Dj/Pd1qj5T+8vBvMDagkuXfC?=
 =?us-ascii?Q?RxHqkv7CGpC7ucqwa0iw1NMwKnTOBCbstCsdJ0SCPhgu0x5Rre93i7qwGWJK?=
 =?us-ascii?Q?NtqX/z9gJ5s77EYqLzX4NPSz/ovtDngkF4f4hX7YV67+dtza6jlVitbhhg1s?=
 =?us-ascii?Q?HGXGgVYrzjEtfh7gyu7x6epfB8YNBdKxIFy0UZcIoRX3qQ3nkf95J1Bzy8gl?=
 =?us-ascii?Q?b3W03yRBfBwaPmArGqx+H7KF1c75nzvvoJpnYtBUAa/jOgK1R1DWSc+FpFHJ?=
 =?us-ascii?Q?ywmBrc/JIEP0eO7MQzowr/HqmRe0Ml9rwoaQMxpnQp28/xkdFZKwmeCEdAac?=
 =?us-ascii?Q?MJpBS7cb6VxYm3brFAAgaiPazipAHTwLgPJGa18ItgRcDQqZCv3DvrdkSCwN?=
 =?us-ascii?Q?Pk+gTTI35YNeF4+4XaCOK2qcsRNdayXktaotdGR7hCXRLwd96cx0iweO7XEG?=
 =?us-ascii?Q?33zTGiB09WbyP5gMrnsiMbTJibBlRFKDYmKVpnfZU9LvajuIZmOCsRbP2Iio?=
 =?us-ascii?Q?RqdDd18BAbiJB4FESBNlParmTx3WiVsylISGHe7x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce795f44-60d5-4baf-849b-08daed5ea169
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 07:46:32.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1c0ud3M80diEZXqQEiEoQ2hh24xjoaerHwO7GKkGZ1GNnqJ3M69htb5aYUu2DD8ojQUJpShSIuU84ZMZBEvtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
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
  - v2 changes:
    - remove the redundant 'bindings' string
    - add ref to rtc.yaml
    - add start-year property
    - rename 'regmap' to 'nxp,bbnsm-regmap' and add description & type define
    - add header files including in the example and correct the indentation

  -v3 changes:
    - remove the 'nxp,bbnsm-regmap' property, get the regmap directly from the
      parent node in rtc/pwrkey driver
---
 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
new file mode 100644
index 000000000000..bcd8fbc6e297
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Battery-Backed Non-Secure Module
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
+    $ref: /schemas/rtc/rtc.yaml#
+
+    properties:
+      compatible:
+        const: nxp,bbnsm-rtc
+
+      interrupts:
+        maxItems: 1
+
+      start-year: true
+
+    required:
+      - compatible
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
+      interrupts:
+        maxItems: 1
+
+      linux,code: true
+
+    required:
+      - compatible
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
+    #include <dt-bindings/input/linux-event-codes.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bbnsm: bbnsm@44440000 {
+        compatible = "nxp,bbnsm", "syscon", "simple-mfd";
+        reg = <0x44440000 0x10000>;
+
+        bbnsm_rtc: rtc {
+            compatible = "nxp,bbnsm-rtc";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        bbnsm_pwrkey: pwrkey {
+            compatible = "nxp,bbnsm-pwrkey";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            linux,code = <KEY_POWER>;
+        };
+    };
-- 
2.37.1

