Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96AA267FD41
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 08:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjA2HHV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Jan 2023 02:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjA2HHU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Jan 2023 02:07:20 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2054.outbound.protection.outlook.com [40.107.6.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCA2227B4;
        Sat, 28 Jan 2023 23:07:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dANkvxWk5bv7CMERURXArm1K6TTBoc11v23xojrZzzDse7aduypNwYksZN+/AkW/eYsVGLhpty2EnLexWYPzXlkSP+wG/tx8H4jfgIpf+fVy3DwoppihRq7vrOGeFAkyZjJMKryzPJkC79iG4rksutmEy2JqJugoTD1KoRnjMc+/Ytm4rFj3TOjaojBRqZg85ew8xd6INa2CZ8sWTSjA8gNausyWHKQ2XZfp9LOsvgbTQOa1khK+SnJWHohrJ9PbP4Xiolgq2mBRo0zcXEJXm/fmjM5Ga24aSuRVkBWynMkfXA1AYZdnGym2GBMUSpYAm0d75xbFhS6/9kwWTwhn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdno9/3nzzp92mz2talKnfGcF1jnRVNF6jgaSs1Sc7Q=;
 b=OmgDbx2vjuE0i+TTW7PJvHf9i6vxDzXfW7H5luY/6v7axztfM0ge69D6D4ZBPMuUKlOm7lKi9LppRNUQBOdcQm/0Ck63lqNDR9zjZghiqn10TKR+2qegR1Vo4jKg2IICE/AMmKz7m0Lv7kChdtLsw4Mkq7aXgd6iq8hJUIE/tbgyUMdpnc67pliDbJelJvL31SBUtlFQrx0nX4ytDH34zebtW0HJYDjS7XwA7IkbAd0aVyZMNgIDrWXXYCG3SdBuQhR4e/VD0YP9ivHdBxsNuTct3jtau5CsM/5BG7TKLPig+2F2r1C5CdZ1XkriF/KCUkB9PADiB/blC478FIkqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdno9/3nzzp92mz2talKnfGcF1jnRVNF6jgaSs1Sc7Q=;
 b=YBVYJ1kz0I2hVZ/FDsQgYNxALhj6cYSWaxfT/0dswD8Ld8DmMRT+KLTVXryt5bpNKC2EXX9SrSRujCBz8xlo3nOnXJwrLDGBOnlMslVGRa4pNDKHQro3oTDogbVqQMTjoZh5MnVRXzwVhKXQNk2mFFyJaPg+n/G3kO9eXoeKNkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 07:07:16 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c%3]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 07:07:16 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v4 1/4] dt-bindings: mfd: Add nxp bbnsm
Date:   Sun, 29 Jan 2023 15:08:20 +0800
Message-Id: <20230129070823.1945489-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230129070823.1945489-1-ping.bai@nxp.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To AM9PR04MB8650.eurprd04.prod.outlook.com
 (2603:10a6:20b:43d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8650:EE_|PAXPR04MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: cd884d7a-8461-42ae-8db8-08db01c77451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vPYKgvnENs1CutuEMNQdp0rwhG8ByhxQVrXEtVeWVcXMd0HOE8p/X2GKOh5A6N3CugzI9kWeyhQUqxAb+tGKLwH9UttNVnv4EopLWNjKBr6eG2R9elrwBWODFwoCeenNx/A4gaDI0E/VKm1mDWrLWGr7bGrhw2QUYrLAeUdfQ+vkwD5Ft0bo9/dQi/Y2IDOwHJrrBRzhnjyNtaMJqN9zzgnK/xl7X7Aka6SfSuOeG7og7ckvS9tGQvk8Tud9Poxi8yJvbHweGvc7DMoGCiYsot7IVTJGqFFBWJ+5vbCLy9bnwolG0zBj9MsVwwb16bb0za+p5Drll+EQB7f4PtsdCDFVfE9zMKZuemHwwUIJ5aDxUvNrLmpT5mquieZ90kHJPR9pU7jjziZm6sE7spVEXf2vkuRb5S0FbQSWnVE8SRJgC/qWWrr/pLLh96/Oz5yEZoC84VPjNM9mTzc7NBLFneZ9DJ4JamCjYXTORrh1aTMGjsD4h9g5DqDUN3ezMOJKQ3GA3dZJl5a9oeaFw8YQygizE8JrTCRjUQto7FG1klQmDERFCyuIiupwFiO24IHEccx8Keb7pIUlP9+BC3D2CH5xrVKm3HrE+5MP2OKOM7Pt6OkO3bil0RxDekufRqXHhqaJ7Bwrk7UVAdo4iPbv4iBccOc96ElFODkwYnQf5Ud2tzV8/NEfLy0ORRuX9AJ075H6/eDgNbsa95aHY9J46EtmldtPPel0QkWmIuobqV++QczF5l4WmezsD2ZKGxJwXX1uctCP6bDZIwfF+Ylpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(2906002)(36756003)(52116002)(6666004)(7416002)(478600001)(6486002)(966005)(38350700002)(86362001)(38100700002)(41300700001)(2616005)(1076003)(6506007)(66476007)(8676002)(66556008)(4326008)(66946007)(316002)(8936002)(5660300002)(26005)(186003)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKKaIj042KmPVP2oLdgB836TYh4pjWdn69TmyciXQvz3fQEGgk2/oKiRSRUZ?=
 =?us-ascii?Q?IcD9EwbwdlAIbx0MZeQWpRhPXbhQ98aVAFjxE22cKHy9GG+3RczoSVHUEvrE?=
 =?us-ascii?Q?4sUL/k5AfhtQM8qzZ6x+RopBe01jrYOZLa/KlvzfjUcmFtpiKg4j0ZwUIspX?=
 =?us-ascii?Q?WfZ0YGmKCuyTo5LuEMPrfSDql3uv3g2Ly2dwKb+9qcQoT7XLNQs8UCi29TOV?=
 =?us-ascii?Q?EP5/+u87aPR/Y1d0d2ptHUmbyr1HogSCLM3pmBPvbOrnFKa5Ki7P4TGQlor9?=
 =?us-ascii?Q?Vo2eE80G6DVN6vWThBtcgXmvGMUd/RaPyDPbJlHqyBpOT5+/Mw2i1oIi55GL?=
 =?us-ascii?Q?O8bdnKs8qbIvcP0bixhjRGRwnIJIjrg37HuUoRKsVLYI9Wzi8dlf4yvVvmXI?=
 =?us-ascii?Q?yErH4w/4Z8GXRKjBMjlZVSdJVfBG/N4bN5IOtbL0Olr36j/z7C0NisJG0hFy?=
 =?us-ascii?Q?DwHB+B7KRSidU/QDT8vKw0Ss76U79JHTSVDeRIrDna/VY9rSUleUhPDhLPQV?=
 =?us-ascii?Q?jlhDsZnmguGk2tDQyq10J5PyHMic/nmbpDq4qLE6vS961Ppp3aw/SQ1SIJGK?=
 =?us-ascii?Q?Ck5jG5Vb/3wLhrW7Tnn8t6zDNavryChiEanJHoOlAB+AuCRfEPnLomiBQmNN?=
 =?us-ascii?Q?tPRmlWWu5YDPwShDt6PtBh5AkVTNap1W2f6GzYwv9oFZ8epDzKDihv8JAL2n?=
 =?us-ascii?Q?3U6a2c+D0GL2OOaQL+kGyhwXyipDjc6AvoFXoShzozw7bPa0bECEjTr56RFq?=
 =?us-ascii?Q?es6ds5GcTWTaGGRORRqcuEArp9l2TOK1If4RIlGyfuQx0wSy6T9BZMoBAUQ2?=
 =?us-ascii?Q?EgyOnE//ikxTox8CeOUHY2zHV3U2YBmXveqXIBhIDZWHkZgUPgfY+YOUS5gC?=
 =?us-ascii?Q?GSDtPWYk8ZCPWEHYdspoPLRWrINh4OFU65tYD/N7QrUQdjTf28cv8uqeUifL?=
 =?us-ascii?Q?7oaBb1TefRGSJv1HyFJ//kwTI/LqnLIdS+6zoxPSl6q3hX5p69ifGFsK84fV?=
 =?us-ascii?Q?4GVqMgYunnmlVqGr4SlyFu5SX6QTcNKV7NCRkNf+2irXr8TjAwqb93e69r91?=
 =?us-ascii?Q?hJR5cMzO/Rzps9juNyFFVs0liMseSZkaNuiKAv+IDWt3N0VAjLOaO7ERkdnm?=
 =?us-ascii?Q?+QdeCm2ndTOq0BEO2rtszTmGPD1ySYONBRA0OLnn++spcjwLouKX2A8KZY4Y?=
 =?us-ascii?Q?gnGjfEziI5bUeUI5VyNtaKOGB40btt2J6vCQx7rK/jebNKwqgmqvqp5IvZ5Q?=
 =?us-ascii?Q?xlcZZErYWY20nXZykdVjleMlJkZ6FbYNu1fqMH+c7Ipv3OXy1XUPpNkA7XFH?=
 =?us-ascii?Q?DRe5AGJgO6eaAt7oU9C9DuXNo/9eXM6IOB9ZwMHxtnsnhe+Gk/UHmI5aiTTI?=
 =?us-ascii?Q?IB6T+lf+nU2ITVYnWYMCnoEKrU7dBvBCWsk7cBGshy4Vo39bRoUVzXT/1WyC?=
 =?us-ascii?Q?tjYAOUW5E8hvz6N3c4cJFIJTKvH2kbp89lqo7nsxKgELqMyp+qo622Rea+q3?=
 =?us-ascii?Q?62R70Wz/WxozXilR6Q7/VPPwJVZS/0h5VNmcgNobDBHDwljsSrO56Y6qKnc4?=
 =?us-ascii?Q?3W0Un3PX3D2VsnMFLEJin7roxk6PAMlEwlNPUlBt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd884d7a-8461-42ae-8db8-08db01c77451
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:07:16.6866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzNfXVmL1JlfS+l4paDaFV9VDCMSEnd84rSU8SAiMT3swFkqVjRRWfBlTqLAwY1ECoPf26OgTuMSCuv3nLoV+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8815
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

  - v4 changes:
    - update the compatible string to include the soc id as Rob suggested
---
 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
new file mode 100644
index 000000000000..b1ade64a1554
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -0,0 +1,101 @@
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
+          - nxp,imx93-bbnsm
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
+        enum:
+          - nxp,imx93-bbnsm-rtc
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
+        enum:
+          - nxp,imx93-bbnsm-pwrkey
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
+        compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
+        reg = <0x44440000 0x10000>;
+
+        bbnsm_rtc: rtc {
+            compatible = "nxp,imx93-bbnsm-rtc";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        bbnsm_pwrkey: pwrkey {
+            compatible = "nxp,imx93-bbnsm-pwrkey";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            linux,code = <KEY_POWER>;
+        };
+    };
-- 
2.37.1

