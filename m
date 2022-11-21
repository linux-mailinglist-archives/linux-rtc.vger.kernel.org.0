Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B336319EA
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 07:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiKUGuw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 01:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiKUGuv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 01:50:51 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4650813CD7;
        Sun, 20 Nov 2022 22:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mf/edg9DH/oRZE5oruxhMZSyU+GeAOLrwZTm+xqCi9sQiG2HXNVR8qYdrTZDe3bo/LGTiMXIVCrQGhGDnDhY9G8/8Uno90EHgTpB7pt6Q8vLqBsfa2ecs9QNQAr7zYWvuz3iVfB4EpY14c4eN+jvvCO+HNqi0v6DuC0te/jv63bnCBBqTyq4OyrM7cx8RKO1UrpoN2rG06RvwLwAFDkYTaCveLmPRcd2e4aXvabAbvPnzwuVv8k3qJyUmcCb5mxZcfL1q/8RdiyMvf0IIwZy/kRwRB/po3qaYD6sCVh+0/tu1Si0NWXxBbbBF4dxxpO7+xpjxVAZhxX31UOFPmvgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfgLtaMOasLXkbfsXwk1zYDShrsDH1iqAuvASkFjpU8=;
 b=Tqyl3/mzcs0ZRxzcO1AcYKUn7e0e9xD0n3BH2exjJZFhyh8n1oF4Nd+vAwm7WykYdQizw8abcCr3aaARXdDuAKP/5VpZO6wQ+T7GINy9+N76o0Pi6m3N/55J2vERwl4lREREINv8AvxtEzC1f7hkC+JwsOg5yXzoVcaaDnH2MQ2gye/ErNNzXfsOOufz3C1bfdbFSCP9kSylzO2E2Z/w5DUMCteDULFIqTPAp4Xbej8fSGTAxw5WcGoM3+yykNme6uQgI7eY3H3FsSHybkkTiWB8tRr1B3YLAtn8dOFdwQR1Yx7WS/8FVGPOVs+oUeayeOHHYqCx7BCJ1Gf3mW6ocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfgLtaMOasLXkbfsXwk1zYDShrsDH1iqAuvASkFjpU8=;
 b=SQdacSIsI9884UyGzDHEjXhAx+/BmPLzz6Stf3XK1akTC6+s7iR0WPwO8c4X1feqzy4QFxtFNYOk+uaXbOJiQxtxl/tQ1EAdDcWcnFQOvd3eBUMRmz67tgrR1TNc5d8u8/hpsisixZhyha4ofD1VWy4vSzkEi5wud0ElANo8Msw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 06:50:48 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 06:50:48 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH 4/4] arm64: dts: imx93: Add the bbnsm dts node
Date:   Mon, 21 Nov 2022 14:51:44 +0800
Message-Id: <20221121065144.3667658-5-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 80a0eda4-d7d0-4db7-307f-08dacb8cb8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PidJFgIO/OYYt2ttrDiITZ9J87VVZA5Rt5pVHofV+Cz8l9P2PzGRGidcHTIQhGABtlrC2k0zvf40No4cA+gB5AzAio7B7vb59FZRKO630tPhsxou4rZ+g8XpdIq0fbuqFuSwxBnQFF3swub1PR7DbqWRxvi+hC1FJtSQ8+26moqMBu+skFQGAo0qMrqUh7rIJng7zmXZmrnrw2qvF9LgI8SBzWBWJA+qwMOkCo4gS2QQZwIzb4hotl+8NXQHkmM3vBxu8XlpcAgNS4RSt0wQQJzmfdWzWJfKgthmYt3w7tjwljlEuFzpoDXHDVAhLgXtFnUrvQ+1uT/n/4bWiF3scb0CM4uOqXZg0u3vzRztzngZ9/XnmqJxlJBz2ODg2N0AkJgf4XhB/Prz0O19JYdZ41aG9PpM7RQ5ZsnV6KytCs88oTISmKVcWsI74GY9zglBF4ZH4aMrQqdyWDmkkUViYRHj2kofR93umvRGBH/Vi9X7zKC578QaaCwpgl5FefE5CphwYOw6nv/bkAzyFHGSp4jpMpBLAWounFl6MgCkxzyefMLoHsSFyNWXJzK6NoQW9dPBVWcB+1r969CyJ2QYlk/2tyAN7kM9X444GhLt0RmCoqLQsecAy/b8Wc/W6TWA3D9IrffmSjFqQR0odwhRTWy+utpldbNyWPxNOpY2e5C+NwcuUtTTArnx+KaGsYT31goJcXFWtFkk2kUzZiaiZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(38100700002)(38350700002)(41300700001)(2906002)(83380400001)(86362001)(66476007)(8676002)(4326008)(66556008)(316002)(6486002)(66946007)(6512007)(26005)(186003)(1076003)(8936002)(5660300002)(7416002)(478600001)(6506007)(2616005)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kj09Ui2pyBr7RdGdXFRz0rd/hC+TWheNB4r6Nrtm1/60A0D+M6kU83mF6oP?=
 =?us-ascii?Q?/0AiJax1xGpYHIfrBTw2ePfXyN3UUcBKmb+Hsl5oVe2G6UJr/Y6F6nqy/gT/?=
 =?us-ascii?Q?s7mHs0hajz38QlG9sqKe3DcWh31pLxIEt2lEMV/4w4L2D0y1HABYqkAPH5E4?=
 =?us-ascii?Q?gA/4bdKr6p9p3u1c9/1Ss8czZS2SiYRnWTPR8LV+d6fdZb/d/2qyB3P701cj?=
 =?us-ascii?Q?K90BOdUEoD+1aDa1YpuXMgONhlKxPUKFReAs3S7T/QHWvJHFk5owDW6lkYRM?=
 =?us-ascii?Q?NKr8ud+VtmGqOCfLEYsRfhbBHpNRxJMtmiFX+A0kO8lnlg0OL4IwSSSc1HYS?=
 =?us-ascii?Q?X1XxP+UPXeKblT2LYNT6qtVeIMRt4jAD70n0xEXvUH8HJY8ERMm2cIUb/4B5?=
 =?us-ascii?Q?2rw0nNbo//qUPCzfwlgp3Dor1WgQP2qPRXiLJCRA9LeQyeyW9gaqDoFnmIEz?=
 =?us-ascii?Q?XsRu/ifMNN1WZm7mc7nCFreZi42RkqRO9cEsJTo3M9GfSe1GNXfHNZI5+YDf?=
 =?us-ascii?Q?pQtdRSJQXdDJ2LmpkRjE8V81XAeV2cp1t2uyWgf5S/oLaMX/r+cGWDKGQnEc?=
 =?us-ascii?Q?wXzlyj44WqTO0/6lq0afRinRavH/BtY8t46IfpO6tmpIuVflrOuP2WAGIiu2?=
 =?us-ascii?Q?Aih03XF0CwfPpv0h8zPiEMotBzK6lpWz9B4JdEf+IkXJ43S5wY9/N675+lhG?=
 =?us-ascii?Q?rxQtGwXTmbWZ5lmLt5FDEvQhcFEQKV9BYVooi718PHzWRgh6Nub5okJ5TZOD?=
 =?us-ascii?Q?WRKIHO0bLvgIelUm4WPCJE/X1jyiRndl+nAjox+l8JOJicNpMTZHVYTJxGxG?=
 =?us-ascii?Q?9WUkDu8J/4t9e0YDns53+F7G+5SSr/6e5blT6M1a0brpmZ/lQqCg0bDkflFw?=
 =?us-ascii?Q?1OfEMsOUMdmu2g3a1zo6XAobqJu0IYRo75xAzcOLV+MQWHH9BAeDIhkRO4AA?=
 =?us-ascii?Q?YUmOTOAUGFGQT9VZicV6HcewvtV6GqndXX00fzu3E5tz05HKQdq/YZCu/nPw?=
 =?us-ascii?Q?vMsy5n19Ewqu9MMzfYWRPDXYx4mn71k3wMh1g4tC0esX99cJMCFnuF8KmsfX?=
 =?us-ascii?Q?cLX41NoadJHiJXJQOdZ5mR7TcCzdfBAl7S8dExCLninuZrA5veecbeAD93yn?=
 =?us-ascii?Q?OX8Rog0x890VVV8Gq6kXK2GJGOQnnRVbYEH1J6SgAzYDZ/Fui9077ulQqt4A?=
 =?us-ascii?Q?JMDKsUNki+cRSV6ZUNXpi0N5Mfa76Ml5BNddRjC3mBbnEKpvdF5H61SUNP2m?=
 =?us-ascii?Q?dyRabg3cPaFHzcaw3mqWF9fPtv+HTjy1gTyol1NJzNlj066GrHi5mVtDaH53?=
 =?us-ascii?Q?iuUUmmtGLcwAi/C2nh/S0I72nBaPH1pURPk+EXZt5Eygfcidtd+E0aBcEhc4?=
 =?us-ascii?Q?/CrjFp2ZkPh/faEGd3OsSjc6xGJh0kqVR1Vd/T9GYUgIejEKs5OrdMuD16LX?=
 =?us-ascii?Q?gqjGo5AF0Z/MN449wcyQDJDzhHS7gOJHmapz6p4d3zZaR+aTpgH57tLKPaYD?=
 =?us-ascii?Q?tFm3vHsKvbJoVnzEvU9z44xeNWc8Wlu7V3DoyyoDncYbTSr2ZcO8+RkrUJTK?=
 =?us-ascii?Q?ZN2tSNYGNRABM+Opkweav7kmYpVr64c0VdRvNBzj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a0eda4-d7d0-4db7-307f-08dacb8cb8a4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 06:50:48.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR7xlF/Y+hA9BtMIjvyGY54QbNjc1gh1fNfvQrZc3aASf4vDAQ1R4nyRoXdk0Ci2wBV0CJQLdF0n8EY/UOgYbw==
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

Add the bbnsm node for RTC & ON/OFF button support

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 5d79663b3b84..ffc4f46c4820 100644
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
+					regmap = <&bbnsm>;
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				bbnsm_pwrkey: pwrkey {
+					compatible = "nxp,bbnsm-pwrkey";
+					regmap = <&bbnsm>;
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

