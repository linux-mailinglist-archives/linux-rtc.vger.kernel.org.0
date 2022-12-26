Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F26655F32
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 03:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiLZCio (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Dec 2022 21:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLZCin (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Dec 2022 21:38:43 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAEC26CC;
        Sun, 25 Dec 2022 18:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnbiKTx0KWXYs40mk2KSpAV3lVHEPyrcv1d8R8MpX56jLJBob4uGdUGLgfo1zKYn9/AWHU3aO3KNUUkRe4jxLbYrZqdPUjyrNl55I61AFyI537vy9OShfWn65z/kvb8YJGmx1laHyYor2FwG4hI0D8y/Nl2ktC728MVmPaOjot55OQ/rA+lwaaaTVQvCualOQI7iheGNH3hmMcrBMh+qiomfhquYRw1l/qAxKRAx/Eqt4MR+L5U6F1YQN9zaqSFLbwG7sLOZOPhk4be1iQ4YvDj/Fnlav16uWT7N6uPbbAUKceRPk+8dG4R/p0rEHEGhqVIGHDgSp/wxx3bOqj/SNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MpW+Z0cRvf8pK5GbfwTu2PmsvsvPIdxYms9vwP67p0=;
 b=U3T775zVRxiSjPjsSfJ4MqTmdyQaMEFQ14dPzaEqF0oO/Dvb9WCGEZh0Zxx7Dk3F305AXeMEKcgKzrclqMK+ZnJMFGrZ9XwtpBBg/oz9ZaynIfSI5x5UFJv6VbYL4QaZiDbjGhU9BNuspNmMUPFI8SBbzBgQAWptOt3nlYe0AYXBmGOS7XIu0riKqKFTRvy98JS31wvqwzqXqYyn2TxE6+SW/rOvptGxdD0Xx+hV6rXdIfAj96afOBb8Sv4XZmjZY6bzxEYNQqEypRlPpq5kFWUHvnrxC6RBpD2QMGQTubm/xF0VBh0pugqvw9OTRTwDMYr+P5gia+xHnQfcxNl6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MpW+Z0cRvf8pK5GbfwTu2PmsvsvPIdxYms9vwP67p0=;
 b=Xfk1XnDXgHftm/1ceDiH3iW1sDo4DyRT79498W/wVqB0isCCvWeQf/KwmUPkdop3DcFYu1LsQw/1tV/Ik4KD+0If2mtYaS4r3Yjq23KnGyG0yyLe9JGRyQpX2PMm3jcQ9DywOjSvJBxXXQZ88SY2sahS1Jbs5GwH0PPGtAlL+yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by VE1PR04MB7328.eurprd04.prod.outlook.com (2603:10a6:800:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 02:38:39 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:38:39 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v2 1/4] dt-bindings: mfd: Add nxp bbnsm
Date:   Mon, 26 Dec 2022 10:39:39 +0800
Message-Id: <20221226023942.1027270-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221226023942.1027270-1-ping.bai@nxp.com>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|VE1PR04MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: e98574e6-3cb7-452d-25ea-08dae6ea4b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fijtdm6z7Gb2myYz393ZWj2M+yk5A3SE/gYea4Y09XzAiVqSCDhXe2HI53ZFqOHvRgUGExaxhTVXhP5kMyX552IUYFRfTyblMy7kYXc0S2mcW/7Fv9zMfVEejEmCglh4EiPiJTwBAUJyDxsGCWCNrDQCHpdEVttr075I0zrTDbXeFmpyaNP8wFSh26SuKKAG5lr+53lG40V51RA5KWf2swYbNuEUWM+Vq+BxbAqnQlx/84c90PFQSuHjk8kdg4dDZ5Cz0Tm34011IPHAYMeYlFkTrB92URlRtW4Z1FfCkWWjUsSTCLQCc8/MqfAqyzM3NvixU6Qb4r2WRaf3LnCdzeG8bnpUvLSE1JczR60ew7ePyDKvdd3VQ5tPt+RzytDB9Xho2qxJgN0gQit/PAKgAiW76qiBJiW+ldfibDBsz9Iz3wjw0YAYjRpv3ia5WOfYGILhuTxbXegJgBsuywEY6NpnCisKkLPF5G8YesoOXI7p+/keiQRsBFGv5HlyPoJUiUbi3ZNxULribyBORUbhxFvRY+r3LCFVyJxIuTKHIpdJclaVFOIDl4vtlVYt1I1aLO0kGVNvy54fgNiIWQvhRNm7VHa8E0ukFGHQfkNP2pDNoNjYRsq4WnKtyT96+8fcItejcOu5AR8994bhuRSLGY7rdtHQGZvkwN2zWEIeQD8zgj27Z53hagmjKTGzXV1pKTGkKUuH2JrveCwhsySDa5/eZhMZ+QqfxRy7Ucy7+YIcsg17eZjI7LuHV+arnq2j0pQzYGe//3RMb6b4i2qBlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(451199015)(478600001)(6486002)(966005)(2906002)(316002)(52116002)(36756003)(38100700002)(38350700002)(1076003)(2616005)(26005)(6506007)(186003)(6512007)(86362001)(5660300002)(7416002)(41300700001)(8676002)(4326008)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WboX4/BPhWQvsTw8Z7Nd5Qi5jo6zuHnYXpHW3KGba1JyCIzgl5EPuqVyOmZw?=
 =?us-ascii?Q?+fbAXMijthmB6fqfwCHsrVY2t6FDV9m7TAI8lclcWIn22VsY59kELMRw986E?=
 =?us-ascii?Q?HVc7xisnTnAsAaTUTompGFyqE6RpDJWjY6329V5TxoPEsVIKoXSS2k7GEpMU?=
 =?us-ascii?Q?fl5XlXtkVDxX/v9BhFAmC58ljhDhf8EUfxBiaIExLaIzRoP6wHdM/YMa4D0J?=
 =?us-ascii?Q?xKtXE6MkKXI7Q+Mlr03QbswLVWsSPuFbE+hGgcejJ2T3DTK4L7dS4vi7jIhS?=
 =?us-ascii?Q?RCxAWQx3Y2b/PQzk5DFPFnmkWyRMBiTwfLZAYD2V39Vq7Xt7hTNHR/N9Yui1?=
 =?us-ascii?Q?uijeUJWPloX/GutLXDittpTSPSFN4D/UMMFCr8cxaUN1wxzMGKcxRtTcn1ym?=
 =?us-ascii?Q?QHTRvz6REwNlil6jMTUUR3vbTg7k11cQhVBnHwjcr5V/FdBvXZVptOQJLcAN?=
 =?us-ascii?Q?s7lJf3YmTGbgiXl+cXjYzphLV4YNy/WZaxjiG+/jUI/+xRlZET3BSWleekXD?=
 =?us-ascii?Q?FkiauROot2YDMDCP0XiKxwp9wDkJTSe0FtYTg4nEMTzlr//XI+QGMAGxrW8j?=
 =?us-ascii?Q?2MMvSSgX0vUy2iuUC9BT+peUk9uVrDNy38YQxo6E89GeczOgjhkBnr21O30t?=
 =?us-ascii?Q?HzdotybI+6sipu0AXPA0ySdx2rB4UI6uaFuShN+PIhNAHlNTQAhumqOv77g5?=
 =?us-ascii?Q?jpfU07xIJgxTC6I1A4vWkkmUBQo/LwL4DjeglkWKzDgob+pH+N/6Yga5u7Mh?=
 =?us-ascii?Q?m/fCao4von4pmXputNXD/Yy25SLSNhL/o8AgKvm5IaSv6UjIwHC6iXu/ElnP?=
 =?us-ascii?Q?x+xmhZEXPxwkvdBAWHLriESFk5pNn4UydP5UUazAonkzIgUqqLdz8Dw9l3Zu?=
 =?us-ascii?Q?1j6kIWrvYu9hbcL1Njc6vF32bigWZKtsn7Ky5rQGHy3tGPZFlwNhGieqzfal?=
 =?us-ascii?Q?DHxTsEIV3sLk0+rJrAozL/yd6mlHWI27A25BI63HNzAqMAa3qwcHSKXecgVz?=
 =?us-ascii?Q?DQ/8TYQ0LLsoUHQzbqRH3QYeW2EOud8BBs2V/UspUmKauCahID0tHqP5faTL?=
 =?us-ascii?Q?uvo7Gm5GJat+CpQXMg0T2EZwnbhb58fsMheTeJdOM02Q11QEqx1YZmgPrnrE?=
 =?us-ascii?Q?FLDDkUwpI8phRRrUYo4tbY8I/HIXgCNruQXoZAoiUdZDxNsiCfmv1VHp2O4z?=
 =?us-ascii?Q?umg6shelPs2Z7+AjuESQP3OoLq/KV8+0bK77/L/qRnXQuKGV1ll4MVWGdINg?=
 =?us-ascii?Q?Vv9Vyssl+masV8U8ulp1xctGJmCAAEjq0ZdTmsmmjSkKxxAxikIBN5sJ4GdK?=
 =?us-ascii?Q?1tv6UqYFiwsdnK1U92c7rRi4BURss6M+hGGZlzhYnaabyIopfLVUm2zGI5JI?=
 =?us-ascii?Q?+W5ZUxUGPFhToz/FAkX4lQLeEPo3UJ18IYY3cMjITNw8QSQpDDFABdqIjrau?=
 =?us-ascii?Q?ZBwhPajZBGZXb1ff/NTPWyK21KoImFI4Qm/GeuW6yMd+TCXYBHdGOj5m8ZCt?=
 =?us-ascii?Q?t+UTuQ6pHjZszjOQEG8xkKNh1XBVh+CCQmlsvQLrYalaPRxz84qrx6dF6KpH?=
 =?us-ascii?Q?yq558U3/WuGp0b6NpdJF1Z1JJLOLarA6/RRBD5Bp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98574e6-3cb7-452d-25ea-08dae6ea4b93
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:38:39.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2f6O6dVR/rFQnWf7eoCXUOehb5vy91nztgdLVMip3TO+km2dtLcZ/4S5fC7MZDcneuk1MdYv6K23XSYcivugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7328
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
---
 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
new file mode 100644
index 000000000000..8d213bce9119
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -0,0 +1,113 @@
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
+      nxp,bbnsm-regmap:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          phandle of the bbnsm node
+
+      interrupts:
+        maxItems: 1
+
+      start-year: true
+
+    required:
+      - compatible
+      - nxp,bbnsm-regmap
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
+      nxp,bbnsm-regmap:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          phandle of the bbnsm node
+
+      interrupts:
+        maxItems: 1
+
+      linux,code: true
+
+    required:
+      - compatible
+      - nxp,bbnsm-regmap
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
+            nxp,bbnsm-regmap = <&bbnsm>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        bbnsm_pwrkey: pwrkey {
+            compatible = "nxp,bbnsm-pwrkey";
+            nxp,bbnsm-regmap = <&bbnsm>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            linux,code = <KEY_POWER>;
+        };
+    };
-- 
2.37.1

