Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5096765BB64
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 08:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbjACHqx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Jan 2023 02:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236919AbjACHqw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 3 Jan 2023 02:46:52 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2042.outbound.protection.outlook.com [40.107.15.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2D01A1;
        Mon,  2 Jan 2023 23:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSn3i1wyavlqmMlsAhURTLShnqzyKx048gtkyA9cmkEwALT3hH5PNrpLLqCyNXDhoC2zV5IENvCNGuuLmiXOocG8w039Cg6+pqv9fQ/Q5VVamZ3xDc3KmZApviTJO+bQm5Mq4zUXQPouL94j4+9XqUo1cvBWFZyW5AIkJ4fmKNnqgp3+KD7e0oLiGPxKzlkgnduzutfQ2F1GiVGQYQCUCxkRcORISGOqPxkVCi9CCpvs/vSsBp9FHgVN/swcQI6pFq7KZywbOESejtKoPmEuZVPehQJsDdrZGIwetWzpTLk1KwTQaR6JJAhdpiG2JLwjV+7UyBnPDXbQ9eGRt9BsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNlQVwb74W5iMtsoxgWGgPRcmkQt8vMxbn60Ftt5VJQ=;
 b=mRw8kJp5IodycpDGNO4vhlbBtGAvm7rGVD2YHSoaA8/2MUxg6en4RppHOLxP9BFHNkSwXZV8crxBQcQNOsjNWMoNqFPS1xjC+bNtnBvUwZqg5Wan5yLmO1CwNdfSBHZm+aejhNxyTO6KYcyvw441RfzN5lGUJPbvYk7jpCoNv6qR6+j3hsE+BjdwpzR8W8P+J+VpB2z6rTQ3jcVQWDJbXH1/usq5s/zR+vpbP8mqBtBF60WWCPgk2O6DrWiCCcSUSPBu30+K7tw1Rkx/rwajw5WT9pZI62zL2jSvRADTTzXQH+A26YsNnw4/k4BwPU7SZvpzgW1Ze+MNwVUKDWHFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNlQVwb74W5iMtsoxgWGgPRcmkQt8vMxbn60Ftt5VJQ=;
 b=W9B5DIgW1owjlIL85YMxU/2bKaKLcVc5nWolIMSm/4koi8+JF7JBw6zPf8VIGL4rrBf25RvGzvo8bphvrrVIqgaqTVV77qs10WsA3c6S+zh7B7RaXDKDE2SV4QlDQLYiZ/U8OU+37ojqhMnUsA/J8PnziEiT2CxXK4qEt7JEZZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 07:46:49 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::286e:e16f:828f:f4ce%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 07:46:49 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH v3 4/4] arm64: dts: imx93: Add the bbnsm dts node
Date:   Tue,  3 Jan 2023 15:47:42 +0800
Message-Id: <20230103074742.2324924-5-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 501982b5-00d8-4c35-489b-08daed5eab9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzLB1CUM2kAUpPYKzY7Q4PKI/PSYplQT4WhhbEnRk8KWaAA3LmT+2oQGDaYf2MQH4JTXj4aa4+dKVjLfjc34nqeFTIWw91D9ZYNujOqtbF6Xqwk8QmITV3IyP/J7CaKfWRKxXIepsMquVrqx7QQXxMCtr8IBB3eDKWfmZmRhmEn1WJFZTbZ/aRxsEjd5v9TXh1ou4L+44cyROXkRDl0gYEJiyrLHAWEohDOGW7ZwlEj84j1Z8QEwU720fpieSqIKwNeHdy2pd+Lnlb2qJKNAiDH6gzZ1ZGmHr6g5cBePPiaYpLrZhk18ow2qC3W+28PD2LG5qYeN6DrBIQKJ7yQufjRHEhRhClT920cFGaHhUSvAjkoMdXgGr0xuOQyrDYPmfPwquXakKI/wHnmEeZfqORb1iAKtVylbeHzkNX9TJm59O2FRiAza+XqMhkt+WaUfUGkihfw4otiofhr7lTDqnurVGdIJHx7gUWKudDsa9AropQl1Ts0xWzTTWOlK8qYpg+Hpt7/mqPjdZGGdr/qEEz/WJ6Yzl8RpiLKywr59gWf0w5IyVcwEDaEf8zkIqpzqbEX3CQWb6Kca3FFW8taDGnPFfc4FqdG+Gzp/Z4TMMPH1RrOh5Gnz+LvPtH5UpL3WoQw9Egmc7bGDlGorlfy6QFMuV5Ku/Jab/Qi1/JXFNWPk5GMsz1cgz8yt2m74pZ0dYTbWCQ5SO0eW3lrzD0vahKcqj2S1ypKevPyFxNGiQOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(8936002)(41300700001)(6666004)(2906002)(8676002)(38100700002)(66946007)(1076003)(38350700002)(7416002)(83380400001)(66476007)(5660300002)(66556008)(4326008)(186003)(478600001)(6512007)(26005)(2616005)(316002)(6486002)(52116002)(36756003)(6506007)(86362001)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eo5EPRFQHm65OiFmOgxIkOXynnLQ1wb9OzdwPzFyLI0hYIaVsPx5upczDT9+?=
 =?us-ascii?Q?DzL2fOSfPuxTKQubqilC/ycEGhnvrVVKncPIhj9tsnyYRIxo8Z4Z5t4xkh2v?=
 =?us-ascii?Q?uXxbvinqCDqEXkF54Lm6YRMZWZmJBBe8Ia1Mb67lM844hJ67rAkXiKeh8V/M?=
 =?us-ascii?Q?FcluK9kSTQMYlMwOhSxBnVEKx5aZWfmJ9RgFhxLzvgcPNYFyVo+icAUCb5mu?=
 =?us-ascii?Q?aF9jZvtWrKS9DHXapQPRAVB17BH0y7ql5gZWtOB/iuolrXFyt1yW55UigNgW?=
 =?us-ascii?Q?udPu6U8iY/9/7ZznIOWraGRLTcQUKPi5UHb6/YQWfU9tGqkNwiyAhJk77gn/?=
 =?us-ascii?Q?ciriWZDfqjWmcz7C9Xs48vHD6Zr4relbx1pefv5EOG9zHEZHrmVC5sAH3cL5?=
 =?us-ascii?Q?5fJOGl3xIUxvk+Z8VvwXZlnu6C7G2I3Zfv5pnCvu1PDOmb9JQjZXvYv1frNR?=
 =?us-ascii?Q?YY4177PkdOBl8573RalRAuXfRvxZgkB8+8z6Shc/KD4eLpj5IUIObRz2J1Z5?=
 =?us-ascii?Q?/ZSnNnBPwQWwrNoUgbHFoYEAaglqtj+sOQbb5/qsC8+P6rs7fxfv/kvPk8l2?=
 =?us-ascii?Q?GoFxAhQpTpMwFOMtC+bBoIkfy76ipk3AC73AXxDiv6i8SbE3zm6rDkaBexAm?=
 =?us-ascii?Q?OkP74iGnwT5hruwshOqmprQyr2dWINQ6s7Yo4i2Od0pOQFQ0nLqMGsBN1KG6?=
 =?us-ascii?Q?AG1BNtf7vstpNpxveyYBMhrSSe9pSpHwFM5jWI6vOJdW0eWAiyrHi++K3sU6?=
 =?us-ascii?Q?dx5B9NSS7DvSIvS2x8YXp2M2UE/PsB3dD4PGNeK2OJnqlmb1FOSaKS4GwtXd?=
 =?us-ascii?Q?K0HYoGsOByvZ+/w/zoj0sGEyEw++GVCAFha0Dz83bYMg87ZuFNyWwT42TI42?=
 =?us-ascii?Q?wcwvm0xjItiDjlIqUsk0p/lZnzLclFIm7238npW7tfFRKfLIedlKl4sNvRdq?=
 =?us-ascii?Q?B9kHET+CUESkl6Il3BySDvCTs0WGjDgo7G9Npl55Sq4A0MYtsim5QqKs3beY?=
 =?us-ascii?Q?2nhb5llB3VEOzuCGU0hbHGwdzhpUpLH7YaKUEaCAj2viYR9CIR+AaFA6RivP?=
 =?us-ascii?Q?duXA8P9yk9oa9vn76fRoamLHROWRhR2FgCfL2fJz6d6pp5FBZ+dtU6zedi4t?=
 =?us-ascii?Q?wpgrId1u09g8+u3TWd2NOjY0LuaFVssaBQLiCton5xU6HP2TEdI6w9FWnx5O?=
 =?us-ascii?Q?HhNLFtFfGycpps+usAIN9yxTIE3h0KiiEW1I/orc3IEWmfv2zvY0TbJafb4u?=
 =?us-ascii?Q?YaXRwPYn26LiakgUaovqxAry6pcP6Y3o63XcZ4uP3dn5OFC9OIp9N2y9mXAZ?=
 =?us-ascii?Q?hUUrCFzr/04cyu/1zR2633hYVTr7+5vcFPlsdyMBTKVIj8IUD7p17XfQtOib?=
 =?us-ascii?Q?BdHIoNhsyUiA4tHuufK2i13l/IkxiVU84hQ2ajBtHbsMLa+HofYiZmIgZMDL?=
 =?us-ascii?Q?7EEgpkgij3CX3oMaht/TzX8ycHcGozYNbNKUwA72DXv9M8eryeymep2isO8p?=
 =?us-ascii?Q?pInBN5mdKWy+qwPQMOK0Ezf9DLqb6bcz9t/cVFD6GMNP/dXr8maGvC+0oMYf?=
 =?us-ascii?Q?SjopgQopYApVZgWOdXhoCnyBUD2s9WJwrfyDXt41?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501982b5-00d8-4c35-489b-08daed5eab9a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 07:46:49.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCklA6mxXmCn559d65CoY3WtE3UHueTg1UihoYs32AKUSbKeWDyIxBHt/91ic+7p5w3aEQpg2coupbiov8LUhA==
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

Add the bbnsm node for RTC & ON/OFF button support

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
  - v2 changes:
    - update the regmap property to align with binding doc

  - v3 changes:
    - remove 'nxp,bbnsm-regmap' property to align with binding doc
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 5d79663b3b84..bac3fdd0041e 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -229,6 +229,22 @@ iomuxc: pinctrl@443c0000 {
 				status = "okay";
 			};
 
+			bbnsm: bbnsm@44440000 {
+				compatible = "nxp,bbnsm", "syscon", "simple-mfd";
+				reg = <0x44440000 0x10000>;
+
+				bbnsm_rtc: rtc {
+					compatible = "nxp,bbnsm-rtc";
+					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				bbnsm_pwrkey: pwrkey {
+					compatible = "nxp,bbnsm-pwrkey";
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

