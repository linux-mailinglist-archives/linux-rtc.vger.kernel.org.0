Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538A3655F3C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 03:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiLZCkf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Dec 2022 21:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiLZCke (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Dec 2022 21:40:34 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EDD26CE;
        Sun, 25 Dec 2022 18:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ080PzxlCdTB+mpXCZ5wKYgzoBh6InqXCAqIeJNsv2UlQJgrCFUdfrDZRo7+r70ufXRcdgayUXo6F8/VR+gMUtzKINvJEKSwXkbyoa72k22S33mkdESGHYEOlaz8YquWYxbXCMK38Guq3R8IenKKoy/Q3z8O9ikZBNbEsysZWPuYI32xuj4qRfru3MmN8X3zlN0lc8uK/qPTd+Yzr4wgiYbTalKEn30fAzSwX7y4HNSU0n+3MibMNYAjpHDxuDCnsvlc0iKsRN+1DROc70+y3RwtdK8/gcod59P3RuvmtPE/Hms4LqToWMsFfijEAphTDS14mpl2Iobeo27aAbfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3ANuUaZeHdjNh8mAtIjTsBv8P1s1mHWAJrMQk/TSdY=;
 b=dJcypKDva27LKC8b/cfloOiioX7CWfut01ISrHW0aw8gy++FjdeGusZsVisHDX4LRwCievIvxSUsFZsMj0Kgp3PqFriQVd69MZHd9NMtjh+6Rnj8+EMm+HtY4ax6tyDA27gWSd5MUiD/t5lDISRMBX6qJiYZegt9DiRsqpnvr8G3Y8B6F9ZOJq4f2+uiOct/OfGXiZ79brwXZuOdBa0cS6VR1AIDCIhOuSY4rlYnJIbMwSmFCuVGG0OmTaJA+OqoWp/Z9IfKYzzJ0dgiWH/K7dgBg54Y68Uf6RImH+ktT3YD0mma0rzn2PX/aEWvOYFXXO7I40zLSOdjk9DGw8kp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3ANuUaZeHdjNh8mAtIjTsBv8P1s1mHWAJrMQk/TSdY=;
 b=CZInMSxHxXblybKnFL4D4mQW2wUqw4pnbceRqo3c+Eg8ey7fdA018KKpMwf4oQfaopRYSoW5BjbzFQK+MGu3alb3i0g/UKTfUwa+3UtrC17BmKHVC9hkmRIL76RUd5E0glgp7Sw0z7t2OPux5cq3IM2jL2yNP5TNWWNA5yedTiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 02:40:31 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::ebf:5645:b490:166c%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:40:31 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v2 4/4] arm64: dts: imx93: Add the bbnsm dts node
Date:   Mon, 26 Dec 2022 10:39:42 +0800
Message-Id: <20221226023942.1027270-5-ping.bai@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS8PR04MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 278d0f87-1315-4fc7-8303-08dae6ea8e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQtywuWgRjlNY4IiL8RzS9HtZFb7Hx+gfnpRjFhivGBhDe2izfar9zrDoIQxik1pzsSZ3mb/2He6QUpec9wBFbl3Rrrdd7xVaQWqEJWAfcZ/IJEEqKV7dSFOBku6GxOSexhMzbz6+tgtC9CHsLfAheNEHLBQPuksgralV8094qSReun5cQcqpwNCMOPQBahAAMnDBbltm6ZIacAKW6xv8sSa0gp0oTWEqz/4sKiL/WClS3Re7D5mXD5De//Y4I9phb+96L9s/c3BYQcTdLigMvUNeeZtftNsfRh3VhMJm4Tohi94yQt3ERyklQ0jugVsIrOauq+EU9VAo65rmABCFNawZ9kgpNXVgG3797+oX7lBF9tyRiZBVi1rTFFQb1QdaZfplPcr5Z/hE7I2FzTtk0D7g9SN4w4SzysbhPNUmdWKPB99ax7tlLAZ5U24TDJoXistg7tRw83ZojZ4JlWwahLERCARLzT7DSMJ32heNwf3/6k7x6ZkRLzeNaQQxqdJD/FwRuIUiqVlcmSrdWN8rM7a2eGkPdjnE/1sljitgmLMuqJCVeg2/ys0351NZZ2mADXUFeEDTHA3v7ecQlyZWUCkIGQTYifXDToOlfVeqd+aH6DHgVf6lORfXtgLN6AhGt6g4bibtdFV3TnfjEiy4uQw2uuJ0sEzFNYargShHWel7+YF/EUB0ffNaR10utGPBS2LmO12Rs6KPlOcXNccsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(478600001)(6486002)(52116002)(316002)(36756003)(2906002)(83380400001)(38100700002)(38350700002)(86362001)(6666004)(2616005)(1076003)(6506007)(186003)(26005)(6512007)(5660300002)(7416002)(4326008)(8676002)(66946007)(66476007)(66556008)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uG5soIEBJw8ZCk53t2FQi6zfRJXKl5PP68dy3w4epBWe43yI4fscayAq1m2R?=
 =?us-ascii?Q?C0106typchT+6eyrbZHzkDHw/xjfupWsVcilTtfv/FB0bUBeuBnGPD/dr3iw?=
 =?us-ascii?Q?8vfwSomq6EXjwXHJBPwyHsVsQHpgobtnEqRzN0zR0GXbTf1D0r1qJBRgUd6x?=
 =?us-ascii?Q?OsYxvtXriUFvQTkPdjrMTg1j9d87Jwu6eIyfgLXhmdT3xsmn71Z2cYeVn52j?=
 =?us-ascii?Q?QmXLtH95AuAdc3DMxTiNKf9tBXK1Rcn/hG37iGTlMSGi6XisFqovubPu4Bgn?=
 =?us-ascii?Q?2jboB7rs/HEodOzJKea0BWNVsQSoZv5iWIEwpLtcb/IECbCsdXADDJrnBhrN?=
 =?us-ascii?Q?65eJ/CJhooc0FQZ00hB73DbqY2gen2IxiiYgMDAwCBL39RzE7A62UQuHvRio?=
 =?us-ascii?Q?orL2pk1JmMpVRniBheIPpFH/fvkdEMAJ1I62Oetqrlb10zZ/ZMUBdOwodA6y?=
 =?us-ascii?Q?Fj1EQHT4XZiOZblB3D5qMvVJdOF6R6B1N5Ix0WLwmpdrigci7Gvgvh/MA1X0?=
 =?us-ascii?Q?7mGaioGwrsSq3uibwd19S+IS+N9Id3L8R28vvGQzHk22aiFErxkJ4woYRfVi?=
 =?us-ascii?Q?XKce8PxYyOvSKD2AlXVxXX9MjvvBuyb9rmfgy4wkwDjJvGoSVnSCF1VzeKae?=
 =?us-ascii?Q?92l6tBAdDLBQK0Tc9e4NDO6K1gQMcahc52KV3gsexaY5aKQ0RucMorB33UAo?=
 =?us-ascii?Q?lOWIPhP3GegVnPCtMXPEPH+bfFFhJfaSIzTByB9vTyGjvR1SVHhPLv7TXaJc?=
 =?us-ascii?Q?yVLsmquqz6S11031P7slzp0b1rtnTSZGLE7HRbLjFmiiaAm3hbRugtlkRPNz?=
 =?us-ascii?Q?zXJKum+68pcNgr53qOwMiJStG8ONXBmW0qOgsR30ubFjNZ70tiO2zOJvDUlP?=
 =?us-ascii?Q?f1mixxc9pQ7Yb/KvN56O3nIwfccFsN/4+w0fO/MS3gKQkr0QeGeNqujeNtAf?=
 =?us-ascii?Q?Y0MbJMP8GXdz+87F3WRqlOKEJzAVAcZtKNJmyM9mOXzU5A7m6hrmVRfVKuC6?=
 =?us-ascii?Q?+HyGCD07RCPb/oGTtSZNYxNRVOSSMJhp2IXSRWticNjMBAGUjJ1kOgrjSZ8P?=
 =?us-ascii?Q?EXRwMIRm4XL9xjL2UgecYZgSQ1z4ljsFJ1UVvrV4OjR9wC2NZCpkD6B5985V?=
 =?us-ascii?Q?bEALFDfmefTqF9bt0E59/VjmDscuBFXhz/kEO0f0sshcOzrFZ8VvmNs84S+2?=
 =?us-ascii?Q?c8/KRRwPsrisDsPzyr1VeXNdfgN9n0cykFUlKFgWokQwBQxapFmXSCkKMpup?=
 =?us-ascii?Q?TNyBJI+QPUP46ME6TdLgj9lSYZNCATnmuu1ULCHvi8AyBwgKACZ357sPWQZW?=
 =?us-ascii?Q?8xfHSt5tfsg62yxTaa31V79XxaZkiq+M2JPtHxT5vcxRdmqjbqMHt5N3wQkA?=
 =?us-ascii?Q?9eBnxbtgRLhs0Xb2Kc6ViwL3ruBfAXJQ0sz8mrfqonPyxx5OaSqMh4W9feF8?=
 =?us-ascii?Q?vy2uzYQXg0xYgBr4zKm1Ka/HcYD/ynFg60k9Mn137g/BdQ/wDRzpvgN4jWHG?=
 =?us-ascii?Q?lXZSyscqhuJHVsy0uQJu3kOUVi6aGJh0vjnelky7ZdyWqrjFCAU4Gr48hFBi?=
 =?us-ascii?Q?5Gf70f1kpf+kc5CBneVbWcWR3sxO45y0fkMQm5UG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278d0f87-1315-4fc7-8303-08dae6ea8e15
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:40:30.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtevXXXhV/ChF0RFA6OblzFVJHiAAgRlPoQTXbwD5o50r5ej29Lnw62qa/+KPUnwuuoRWl+Ws+vp+qBDZI7Gtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the bbnsm node for RTC & ON/OFF button support

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
  - v2 changes:
    - update the regmap property to align with binding doc
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 5d79663b3b84..5d7cf2d99444 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -229,6 +229,24 @@ iomuxc: pinctrl@443c0000 {
 				status = "okay";
 			};
 
+			bbnsm: bbnsm@44440000 {
+				compatible = "nxp,bbnsm", "syscon", "simple-mfd";
+				reg = <0x44440000 0x10000>;
+
+				bbnsm_rtc: rtc {
+					compatible = "nxp,bbnsm-rtc";
+					nxp,bbnsm-regmap = <&bbnsm>;
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				bbnsm_pwrkey: pwrkey {
+					compatible = "nxp,bbnsm-pwrkey";
+					nxp,bbnsm-regmap = <&bbnsm>;
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+					linux,code = <KEY_POWER>;
+				};
+			};
+
 			clk: clock-controller@44450000 {
 				compatible = "fsl,imx93-ccm";
 				reg = <0x44450000 0x10000>;
-- 
2.37.1

