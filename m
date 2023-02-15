Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF663697477
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Feb 2023 03:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbjBOCkO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Feb 2023 21:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjBOCkO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Feb 2023 21:40:14 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E949234D0;
        Tue, 14 Feb 2023 18:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBRk19WhOZAL1XYcGvw1KQi4adJLTnIksU/aHq8QEtP88aFgZWZ2HZ+QgNGqcbFzT+hBAVnAbEJrsSdgFTDEUFuR0MpPk9jO/EPOc8CT4rsDFM1skTWOyBs+RE7ICQCRv3VPyx0BeLviu5dgxGrg2XymHWr/pTk8ujat2n96ieUYJZICn0swk+5GnwBccO25bALBEHV1pS1KFAy69ch9e8++X5PgJgsk6Urc+ZcWZdf0jtR8sfRrxS9EJML1SnXUUlIHTezPx+r/SzIycMdEO29b1NjJol/brDOu37fPSlQRlOFeJKFH6LffhdeT8wfZjPNFmHm1N36j82DI3KIsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKm85CkjahcjaLFmY87weixpk0tv2xQoGwV6r2lIZk8=;
 b=mwfP/zb0IAWCsdVmxqdXVQIGxy9aNhtf3UWACg+KauEJGg8NgDCOu/lpavN1eyGTeUZ4B+sqpQf+pf6coVrEE6qmUsv+/3dzR/X9qRY1BMw1PtFWUYvEBndn5ACSr4qm/wrN2QMqIoRlakounHw+AnsI56HGaFOBbUuvdC4Rf0hmAITwUH2a/e2EmHGWpsqyHyc7dmQkOT1nMCn0tVh4kj7V+XrPk1AXp562JIxmAxZ8bD6a0xbOUglPnV1P8c4LjfMk/Wt3fpnjCtpj48Q9ADZY6IyWJkCc+/8ji5NJ/8f4O1pAEhztRrRHmUCAaBwT1qnEsoFgMixeRm5h8cJj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKm85CkjahcjaLFmY87weixpk0tv2xQoGwV6r2lIZk8=;
 b=F2zAq0xf0jil33LtzyhLiaShQIu3EGpcz547NCE1ubhcyCQW9qQJSQcufIjSS5ISUdQTB56FSY0YNz3K2XlLPb+hK/VQ4uPBHuSBaFOZE6UYNzVCaFBi/4vJ4n+JMf0yGUTxbX1K+/5x8in6UoLRvRV6gsLOJNgz/e1Wu/VjNi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 02:40:09 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:40:09 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
Date:   Wed, 15 Feb 2023 10:41:17 +0800
Message-Id: <20230215024117.3357341-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215024117.3357341-1-ping.bai@nxp.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b9b863-5b68-4b3a-bec7-08db0efdf464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUvQi5tSFUZQuxJTJG+PSb/I0GutX6Lm7C+NswKCP3eVqprGoeh1THqaQfuxucHGC9aPCy9GEqo2eilNM3IKgBTcHls3/35Mpui5m2e/Ma2R9+SsrDGwObxMpuIJrY/Ck7wXWm/VT24Jxo3FZCQWhINKJ/OOfxvMhONpw4RqeQIZOr47MRGfDwUq3Es5R+eysA7TfAKbRYlKGApzHVPC8TZN2SfX1TpZQMVEdD80PkA9VUrtMK1wo/1Nvi5zaaE5aAHC0zAwd3J5XBo2f0/MOFkcfifmoIqRwoi2CN8zvetwdiA88Txo3IviCnYAtnfs2ypfOKZ9gv49d86k0A09XEuC3Z6nOwdNJRwXMcIiM+0VdpY9P2GrzSXoUZcDRR0LvNxbKmm7LaDUhQqiTxYqmGkIEnEJR8hqdXapOvjmixR5s43MdLhvXW40iteOtVNAcVonb3mMhTrFSgVyUikMEV0GeCcIyWJADuv5szKLuzxOa/cvvORAG1GV8I6sK91++Hpwcfv9PQ2H60Bw8nTLCPcsc/I4Cr3D7mBNSNVPFsJxcQP+N03O84twFqj7qwB+CbQ8QlD2sexg/qjprB5j1waIqByVESfRLt0Uw8hJkCMwPZNaEUn0l2AW0+rl+B8C3FF1bb5fjp+92UbYFA5x9rQ+9Pe7MarvlSqylKyoZ3Vj4oHdi/DWKkEuxG8fg9l+ayWPbrLPH3jErh66u75H2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(38100700002)(38350700002)(1076003)(6506007)(6666004)(36756003)(52116002)(316002)(7416002)(5660300002)(6486002)(478600001)(6512007)(26005)(186003)(83380400001)(2616005)(66556008)(66946007)(66476007)(8936002)(2906002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xFxK0z/USwxMMqR5HoEcX6ZkxRsogAG/6Qa399RQhG/8yUjlR0+f1Ld06ade?=
 =?us-ascii?Q?3CCPJxJSek4+xl3aLK+2yUdCVt1wZp/LKM60HF66tjQvPkftdGkcHIUNWr/U?=
 =?us-ascii?Q?9x6hu3nkm7qHIIVof2g0hPV5D7GFFWARSMhXitBxsCb/LvXWxXWn9OnsE1kI?=
 =?us-ascii?Q?t1OjfuBQAfY5JJuv3jfjDl8mbo/G2vnZfTisvpBskgr86wIRTW6LAcxcKKAS?=
 =?us-ascii?Q?lttro0QNtaSYAEMKmtQfUrdcZUZ2y7tj+6l3HtK9x3lX5wJHmBivBRhR2R64?=
 =?us-ascii?Q?WU2PPQC+kLCx9QiP2WfYHfWA+or8RC1/No+2WHsQmEiN1ey1oDE2f3Gx5hxV?=
 =?us-ascii?Q?HxCBD+OJ5D+Dy6oiPlWsPuwueojW9PMdJnUURfDsj+Qq6pUQbnzym1nB4HVu?=
 =?us-ascii?Q?q7dYb1rDXNbIPP+InfxM1LOnVYQaSA2KCCq8U9MkyGcMkfLy28/UZqSUU/TV?=
 =?us-ascii?Q?NxccamCKeYjdeLk7khR6iUJ9qdSyeI2AflRB+7GC5wT9P+BZJIaoach6lAAZ?=
 =?us-ascii?Q?LDb6Rg4WH3JHyBLlB/bAYqFLDs8Bg4Fsnyzdal5j8hLVb3T2zCdPO9AptRp1?=
 =?us-ascii?Q?u30N6QABHTnVudFLuHttWSAWL0QzrjV50kPImi0HRxw6AInOBWWhhQ/npaEm?=
 =?us-ascii?Q?DgIzbgTB92cEMZ9mPSBwmWmmjJRs1rqrXU17n46tquqmwI2p//mOwQg4uw1R?=
 =?us-ascii?Q?83RgKDcpjVYaZA77MXZ+rc31vs+sc3Hu7t9fC7OhbXJeU4IrAhlqFrhB2wCq?=
 =?us-ascii?Q?Jv1ddGKyWQDEGK/W0vGVjDM/4rKe0AOy6iZZnr9c3Kdm9B49EkMgnl3+Fieg?=
 =?us-ascii?Q?Ca6B110marUAtzIBFsq6/3DR6Z4IgU/MYpMYOkiNnrUJFWxpZ/rOk9eU7pCA?=
 =?us-ascii?Q?ef3jhKktUccmQoWs1/e1mtGNcz64XZFwmo3qhUL35nKuUnnlNsaKhURrs4V1?=
 =?us-ascii?Q?xFQOrnLKV6/J+cKDquoye0UkAS5C/ur1PPUgPc/eRxaw7wCtuG2b9FxK0Z2m?=
 =?us-ascii?Q?aUw3FXgQILv6/3m1jYblceAf46CH71eTHH0u8R7omJi2NlXM4VZbjxMA0Km7?=
 =?us-ascii?Q?Y7Xfp8fyJ1ZWmH5g+NhcF7lwPbMPf8Xm/idAPtbxzmQDMf25upyBHbk2JPZc?=
 =?us-ascii?Q?7TfspYZNRxLBxGQC28zZNLkepWN8FRmU0N1/QzigsSHVYO24b3z1O21YTcwh?=
 =?us-ascii?Q?wVxqSE/EH0pTfZRMnfFFsuYPvVexh8E/LUyGBE3/Jzrlm2jqr8eWCL2fl1vV?=
 =?us-ascii?Q?VpUDWrhMv97SOF9GlRzJkFYh7x78N8Ytr1JiW3FXD9bUzPG+ZA7IKHNbALh4?=
 =?us-ascii?Q?m7u4bfFZnrSOw9Ya6zzc9DAFKK3MS6AXOtKEDLlGxJIGfStpApBwc6rV5hve?=
 =?us-ascii?Q?OwzUvGAABeNvFv/Qhg9PrsG1sECP+jn1L6Nc6sMS2OJCPHIoDzHKr2EWuODW?=
 =?us-ascii?Q?VUxYUdFT9ZIJ1a4/is5aoYzTpgVHWfpTiCP4fLRnH4GComQHBS2T8sjsgGp0?=
 =?us-ascii?Q?9Wr65frs4lpGrAXl4gpxzeGd0Nw/7QOlo8nfHmDAum+OjFkNvI00K64d7JA4?=
 =?us-ascii?Q?Bnss7+/YAGeptBCo/Jk1gEv2XlKh/pe/xqRxqXJw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b9b863-5b68-4b3a-bec7-08db0efdf464
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 02:40:09.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FISFfBoKG6il5xpPTJtajEqo4Rl0RqJCXhdkyZBLT8ADa56gudhcP/8Ih8MbM2jMYM0DfvQS/YPQ8PyRU0EgIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the bbnsm node for RTC & ON/OFF button support

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
  - v5 changes: no

  - v4 changes:
    - update the compatible string to align with binding file

  - v3 changes:
    - remove 'nxp,bbnsm-regmap' property to align with binding doc

  - v2 changes:
    - update the regmap property to align with binding doc
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 2076f9c9983a..e772c136e895 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -243,6 +243,22 @@ iomuxc: pinctrl@443c0000 {
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
2.34.1

