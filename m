Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD0D7189434
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2020 03:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCRC50 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 22:57:26 -0400
Received: from mail-eopbgr60048.outbound.protection.outlook.com ([40.107.6.48]:19938
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726229AbgCRC5Z (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Mar 2020 22:57:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMO76fMnF1ICi2i7W7HvBASsih7DGFkzPG4+dFpB/JRNrIHGiAswhV3CWwrpFL4UbzjR8Sd6kaLuKkZw8jstptPPs/5KnUBtzcRUpsDES4wa9EIO3OGjQaOpaoO4eukGMzvDlYktDrR6VdiPWGIuD+3Ho0DCHdPRScTyHVAtEY6OfU71HRFhzhsn0aBBbzSNnh6P2qZjoVpA3Z78UhCm6TnDfqp8WlC0gWaMTgbA6KgjSuqLv/WpSQkbZV1CZRM7EQ+632FjFzx7lV5Kncl0VNz+XPuJl+j4Ww1HA3YXu7ubDADOd95lKrkvdbOqv6t3NIcW+b6ds+vaY8xAIQjmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIZ+ZcEMiqmc7gDiJYUTUf4DNXlO6cZS6v2nldNPM+E=;
 b=jhxj1I/IfRHDMgGdUFUEgrJqcmeTyMJ2NreBsNmyuq0yaBW5mFL9m5ojKp5EgxfnXqhF6ZOQUv5nfSWu54rdOStM+WO46kVaDbb1I9t2EisbVmeEVgHzz78EcLkkq2r7DL3QWh0GGHfv9DdF6bPxiDJ/uAyDW2ZCeyZABhs1K1qrimvrVUQfmeBJDFECDaAUJQEfT0ZFgwcEsykBKLNoSk+T0dp8lwgJcLsvc47D6g3KMxdocPth4/XOH3OZw9ku/FLj9IieSCM9zheb9nF4GdvMdcDvWjiZmBLQqmDCTnsDbY3MeBOFatybtOwaRMiiToy0i6JnrY9LXeq3hOsxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIZ+ZcEMiqmc7gDiJYUTUf4DNXlO6cZS6v2nldNPM+E=;
 b=sXqBcpSGbZ+wcO75kagc3hLAhEdp33xQ7YUjQK0BZxb8k03VDPaJPUAiPMnnequkxn10Lg4yMHf+CukW2LYWlQHHCiJQXxc9zKXIJIGLyCHNoEjDTDReJF85irQD4ZdN0a5Sj8IFATHdl0MOYnx8YzPOpeXx2p3O8bujeUZonCM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6823.eurprd04.prod.outlook.com (10.141.171.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Wed, 18 Mar 2020 02:57:22 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 02:57:22 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        leoyang.li@nxp.com, ran.wang_1@nxp.com, biwen.li@nxp.com,
        Peng Ma <peng.ma@nxp.com>
Subject: [PATCH] rtc: fsl-ftm-alarm: enable acpi support
Date:   Wed, 18 Mar 2020 10:53:54 +0800
Message-Id: <20200318025354.6447-1-peng.ma@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To AM7PR04MB7016.eurprd04.prod.outlook.com
 (2603:10a6:20b:11e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend Transport; Wed, 18 Mar 2020 02:57:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.73]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bfe2e59a-c618-446a-bd30-08d7cae8145c
X-MS-TrafficTypeDiagnostic: AM7PR04MB6823:|AM7PR04MB6823:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6823B897ACD4B6E7DE68406AEDF70@AM7PR04MB6823.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(4326008)(66556008)(66476007)(66946007)(5660300002)(16526019)(44832011)(69590400007)(2616005)(186003)(26005)(956004)(86362001)(1076003)(6506007)(316002)(6486002)(6512007)(8676002)(81156014)(36756003)(478600001)(2906002)(52116002)(6666004)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6823;H:AM7PR04MB7016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oFdEjCaXmIQIWfW3ENDRD+mlYO/J2u2dvin31cgnmh+IqmPhM2HmMrafJ8o3kRDG3U1QA280/bDq329PhRxrwPgDGa6TTe4Jbi8NM5jfwiu1vTQGZGQh8ILHA+XK1PouNPfkRBj8SMiyC6jGmhqISCqL7MpSTLByfp3LmOYgLMRGqeWSxJ1TAA+MYXiP8bOc5E2gPn7BwEv8++ow8T9C9d4XhiG1ySSpNeuGl44p4+b6DYgSJC+s8ADOTc4gOZfWyk1tp9CMhy9JAVV4zTYJiWQeLQsr8+cW2hn5i5bPDHumWpQ4W5Udpm+Z5uYDqsKvGy2R5/S3Hc8X53jkluBxBLip+KZKXfsHqO2e9hWBOoQOWsLzz5+bGLpu3TjCux9X0Fngyo/tiGtww/1QsjS/5Cz7qeUNRfR/kpoL7uaXeECam0LrnJG+ePvcwOvrQx118y0nkkjPjyibxo8jsqmD2lA8It1lXGuTRNuHDeYGu25GDBA7+ElLIatNp0IubYD
X-MS-Exchange-AntiSpam-MessageData: MrzBc4pUlPqkzKFxwuMdZZodIRozLU3NhBgpqseWx6DLMiBxDmZjB1UhXgaYsxNdmxhUcPmJTv+MfFIdGOeMI4KOvURLlq/XRWjMR/bfefgzv5uF5mPZdy+agyPjyLrEatnQzxp6sWgwYvy4ICVnyw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe2e59a-c618-446a-bd30-08d7cae8145c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 02:57:22.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciNNsbfyDBqwJIj2L53oygcDMNrn7/SQKI1TPA877EU8WS7/R/5lsXSb2rXL60d+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch enables ACPI support in Rtc Flex timer driver.

Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 9e6e994..c572044 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -20,6 +20,7 @@
 #include <linux/fsl/ftm.h>
 #include <linux/rtc.h>
 #include <linux/time.h>
+#include <linux/acpi.h>
 
 #define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
 
@@ -265,10 +266,10 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->base);
 	}
 
-	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "unable to get IRQ from DT, %d\n", irq);
-		return -EINVAL;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "can't get irq number\n");
+		return irq;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
@@ -278,7 +279,9 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	rtc->big_endian = of_property_read_bool(np, "big-endian");
+	rtc->big_endian =
+		device_property_read_bool(&pdev->dev, "big-endian");
+
 	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
@@ -305,11 +308,18 @@ static const struct of_device_id ftm_rtc_match[] = {
 	{ },
 };
 
+static const struct acpi_device_id ftm_imx_acpi_ids[] = {
+	{"NXP0011",},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ftm_imx_acpi_ids);
+
 static struct platform_driver ftm_rtc_driver = {
 	.probe		= ftm_rtc_probe,
 	.driver		= {
 		.name	= "ftm-alarm",
 		.of_match_table = ftm_rtc_match,
+		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
 	},
 };
 
-- 
2.9.5

