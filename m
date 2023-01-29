Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE31567FD4A
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 08:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjA2HHh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Jan 2023 02:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjA2HHf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Jan 2023 02:07:35 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2082.outbound.protection.outlook.com [40.107.6.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF14227BD;
        Sat, 28 Jan 2023 23:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGcBABGjR66i7cZHZ0agmXxaotrmQsWXLVnYhQrRBvCStmF5XpzOWD7D8SriCL8E+cj7sYLjyB+hBtDWse+KNTD7rhmPEXN/dZVgADZPbpa7Fdk3fnZ4SHgH/uDM/9dhHmQD1ERFNVRfz9z5zoQw+2q16lox8h1bSSdGfzdmdbgascbGzP34UfzDX2bCG2c05CeU3rQ1QfJINBSA3kwz3PWtTrEO2hmm3jsm2yt8dcIIvW/VQO+/INocPV0xwo46cCgGNEV+yP2c3DFwkhOfwxTYL2ECp9Jl+nSELEkUFn08RMChu1tgCqtYNd85xPgVFGoCGn7ZJTREFAJX7idlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08XpzoY6MDmMWUCcTtlYSXKj84FTUn8gfyKsjDO9Cwg=;
 b=kZYlNxeC/MIm+5UDi5sYU+IJpdmK85dKCIyKQMvQ9DVmf1FQHEWF5P1cz7tbIvGXy1hhNvOVT/wFBIFQc0sFsAN1uNEr6C8HgMcoW0r33V2iIpr3Z/rxaik2eoQI5r9+Xu8BppDmEeejEYvJxlaX5HCkfvx+J7Zx50xgAjgyCTvqElwtze6DDhR2zpu3La3/55oaqYi1jYcWQIu6pmXJ/8SWiHSezAy57GAuiFsWQj6Y2mbP7qQWfv1xlvqMcLpnRm/nO/ATRdQXj1HU0W7fPaAdZNJ3FrnFMMyYkWqnhiUGKpMkr/CKmTw/42ziMR7cLqDOxhsipkwvVrU2lzpEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08XpzoY6MDmMWUCcTtlYSXKj84FTUn8gfyKsjDO9Cwg=;
 b=WPw8OOh3XTgBpWx0bkGv7lmDqvMQTqmK2fhqT+ouk8weyGHSggOp3gxRDmShZBXUgAZ2yP/siHXXBmwwQjGdDx35EkiO/7m+CtOqIClYpfKxDshg9QVwPnFtjvQyugBXo3OVMjF84ahzPcz+/2ch1coPfF1DdOaZHekz4MneZAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by PAXPR04MB8815.eurprd04.prod.outlook.com (2603:10a6:102:20e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 07:07:33 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::4ca4:bfde:62dc:4b2c%3]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 07:07:33 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v4 4/4] arm64: dts: imx93: Add the bbnsm dts node
Date:   Sun, 29 Jan 2023 15:08:23 +0800
Message-Id: <20230129070823.1945489-5-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 042c1dc9-a74c-43f5-b970-08db01c77dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oklzy3Aahay+yCwXm6xwyD5VjyppZFF6JlPOXCQjD6/ZoCvvT43yIgK/nYGL1//HUDX9pKkEFMzW9L+vmXou7ha2u7kuSo3gD5co8ptFG2Tu+Mt18N+BD7Jf2oHwFlcDHW7EBs1zxo6ciQHP+dmVMtGxQouXm5yq8y4Q10QU5i+XCgFYIWVlM1jy6uxSd683Un6Ct5XYYml7+2cNYsN1mKlyTaFdSO5cLyXVOBnHIZv7VHmm7NADJK/SjZwP7d9O9X7KirOaVQ+ZEVpP40h7qHoB63NQexTZEOLTSqwb5cWqwTSk+6IhOjjo0OqT4mCOH74aO3Hv0sqqk3jmgTSgTJ/xjR3of2zZOVUyDAvm1UeKjGy+bTAFJ9s3Lw6X5hpswSN4hfGUWgZnYC56JhIHmGeZPE0A/+Gech1sYraVpXN0tDJorZFC8JdBlGedU2K3d17IuTHJMkWIdRVGs9MbD5b6SI54C7APFt/emt7D8XrzgOlMRcQV4BYFzdNDuo8y0rEyNU3JYnyr9bve/+1UNKBmLKnLf8VlhjO5fzJa3rjojz0FmW8ojjHAapdak1D5SX3rvl2mep+8ooJ169DXKUIc11uSCwBkG0CEQ00XU8b1+eA77LF/Nd5KnaoQ8Y/fdybP72gNYk8PNZFGk23NhluczgBIqRJ4W1K36qxghv4cjFbBVDeXvemKuqBxBsHElHRmZzjqtMp6lZPkIZVz1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(2906002)(36756003)(52116002)(6666004)(7416002)(478600001)(6486002)(38350700002)(86362001)(38100700002)(41300700001)(2616005)(1076003)(6506007)(66476007)(8676002)(66556008)(4326008)(66946007)(316002)(8936002)(5660300002)(26005)(186003)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0mY3QV3TfAcxmbCWhxYdp2ETotrBOfOXvLTJBBCOOkRZ/ijBIPHUD5F1DBa?=
 =?us-ascii?Q?NkNfCO/B52RsRAFPtXRXf6a6UGdyVvDfyWOHKt2Pj6dNrGTx8o6QdyeVmUZY?=
 =?us-ascii?Q?XheDQoUIJ9dVUvLBNlcUX/xtFtyASJmU8nKOuQeLkeTY4woIrZCYXvI49KJu?=
 =?us-ascii?Q?vnfQ+eoiFJyiLKqi3MgOJtYr7HXLH31Y9CBnyMdTiSBZG4uHVDZ++AvGQUO4?=
 =?us-ascii?Q?XSOhwm0HcWfylv9HvbnuGdYtKaGAN0jT/XO+QWycZ5jMOU0Z3o2deIoL1qw9?=
 =?us-ascii?Q?7FRP/P+xVzh3JbKAeadQbACEgMa/U7aCP0O26spIeiWSmhBnLToQIXDkzEjk?=
 =?us-ascii?Q?DpbK6lIqeX9w0ex46dTDIBoRNbC0jHzmDZVirsKaocZ6dTfRZgoV/pniu/Y1?=
 =?us-ascii?Q?U3wWzxSa7ZtkFtbjhICgZtGFhYiliYAelZfEpScnonznWu2D/Erp4aznVwWc?=
 =?us-ascii?Q?9RWBFtIqgkcD0F8hlybmd231bRFpFQxCoatNjKvrncsRQ/a5JXDlCHdAd1tz?=
 =?us-ascii?Q?r2Woypy8NsHT8dplprEuz7lGNHpvZ8hRblZJsiJCyWIm7rjitf/IyW/ntygX?=
 =?us-ascii?Q?s6Z/7LBUfTqPAE1atJhBrgDpSDt/Ck4ogOZ9b6w0lz4NXbdJYeSR20IF3VpN?=
 =?us-ascii?Q?tIWaFQviMi+RvSM6ug2ndBii69/qcwha8LLYJLjou5DzXvVIRVhnPWrNXrGH?=
 =?us-ascii?Q?BNPHyisWKTNtG4vg74I0BEaeE9kG6YqQ+vlcRpn3eKnzyBl/rhPMIXh00YMp?=
 =?us-ascii?Q?Aq3lsq2/1p2qFe/mDlDVIinyWyEzvIsmW8eVRqCHqCOrrIxhkKh5b38vIryx?=
 =?us-ascii?Q?VahprwNYY5NudaFBOGaRAzdVXzcIZd5SjStk/4deBWmFmHo21CEb4WWtu5Cn?=
 =?us-ascii?Q?CLZG9THwNS0ujQkdJRjkr9s+JRHOAbkcbRMFGXm9uwk6eVoLZKxk5D7OEFNe?=
 =?us-ascii?Q?CGMAXt/1k9D+slQUg94bCVCha5anjcP5kfFY2YB7lPVyk8oeu/sjtB07cZRX?=
 =?us-ascii?Q?oOU5LzhrJTfiYqIBQfHk60bxJ9XcC0WoNxfro1D/iB0syK2aXdr6FDYG/Wqk?=
 =?us-ascii?Q?fL3gz/KeJh3u+p+9Gr+j52kNjMPyGgaA/MaF+PUktChqtSqOYJFsfOC9vz5g?=
 =?us-ascii?Q?T9BKgOAUWOxbeMjDeNmjKz1y8QqOmalqMBx65/YoWVOUXVfvkq/h2bpltPI+?=
 =?us-ascii?Q?601HvX1o21K+4oXkFpc/NUgLyHKDHUMfmcuI99b9DJmAUAEyGa+Ya/eRfTKd?=
 =?us-ascii?Q?j1Thye18oPr+JJrhOhKea7E+tTysLr8lVDkjCNqyIz3oTqwcatsYMhPonzZZ?=
 =?us-ascii?Q?JYzQTNT+m+eEL3NdkLRbiwkaVsxDZTd9L4K7w2HuRo+uR1FYXt85KaehhGeY?=
 =?us-ascii?Q?p1CluM5yMTOUe0eLjkq1TkjQ6TS84fOyStDqhjEmk2FmnFhkdccMbMcPBjMJ?=
 =?us-ascii?Q?dUBePNgpSdsI6XdeZ+DMRjQUFG9UfxeOsv+/M5FghNUlyIcRymeL3bqZn4Wn?=
 =?us-ascii?Q?0A/YTe6cs9N9nHdAQKHes9lpZeDnZCnXY9irgZVTv3xts4kFCUO34lfEiQfF?=
 =?us-ascii?Q?bMN4SKViBVuYAPgAVZEQaK+B8CtJOKb/ueqhs1vw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042c1dc9-a74c-43f5-b970-08db01c77dfc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:07:33.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFBlP48vYFHMN86xm4MMlTDgtTyP8AVqNw7RHMWRVkN+UgJqpP3K+g+GvHgu7J43i9Q4Cb3xT0iM0h5v/u3APQ==
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

Add the bbnsm node for RTC & ON/OFF button support

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
  - v2 changes:
    - update the regmap property to align with binding doc

  - v3 changes:
    - remove 'nxp,bbnsm-regmap' property to align with binding doc

  - v4 changes:
    - update the compatible string to align with binding file
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 5d79663b3b84..36be18165d4b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -229,6 +229,22 @@ iomuxc: pinctrl@443c0000 {
 				status = "okay";
 			};
 
+			bbnsm: bbnsm@44440000 {
+				compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
+				reg = <0x44440000 0x10000>;
+
+				bbnsm_rtc: rtc {
+					compatible = "nxp,imx93-bbnsm-rtc";
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				bbnsm_pwrkey: pwrkey {
+					compatible = "nxp,imx93-bbnsm-pwrkey";
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

