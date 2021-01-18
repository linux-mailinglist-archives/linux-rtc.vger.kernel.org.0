Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208232F9BAC
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Jan 2021 10:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388212AbhARJCN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Jan 2021 04:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388204AbhARJBx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Jan 2021 04:01:53 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634F1C061575;
        Mon, 18 Jan 2021 01:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpKUro7OvweizF+Z5e0JwlB0xP9fiZ0rDppjHI6R2hcGwCujKWRwlgZq3UlJXkluqtxR3ohAOiSU3TLmE1o75tUKGN6+F75qQpHIxWj91/FStAT+BuViqjBXHO6KmzF9MUnk5dIDCJygk9uI+V8JWDYAc/2HDqDJYGjpl4tH4qTeBOzk/i/Uz9rf9z30uBpilwSUA/UeotqD+iheoH3eh9CHkL5hcsTeVoDzbkzsUAyA81rzJGyCwmAIx4RDEinM4eVGN4tiJhMTbJ3+UJRPzHh9blfN7JWW/DXCGi0jij6+argmyh1J6LaZL/T32Xw06C1lkWeyHj3U/iCQdeOgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrgYEnex9y6EnSeajshHSSDJf1fHNMm9FVFpQ4dh/r8=;
 b=bgX73pND9h5kBnN+zUgKLPrFopr6aGyDxWlOKYh4QbYteDt3fiMWgjGqPZTEFW/suyh/4auK7pxMs3DeGpNzShqdtCieUJskLlti43NC/jnt//JRiznJ+NEP97r9BQ+P4pOcyOKR4VpVKpzAZOi6hmQ4OeIhTTcHd1nR+2Wet5udc+mf/Y30YKqN/8BmkQ7yjIjJzRopamXO9OZsE3KIk8C3yLweUEtYyxl7axndhfsaRb0rNpewBbmisajqGdu2Dp3T2VNsH9cu/ukc0h/BhYUpN2w0zHV4XWSD59chXl9aiy1LFkz927/ILfU8m8u/9I9bWASxiqdPAE3eaEBmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrgYEnex9y6EnSeajshHSSDJf1fHNMm9FVFpQ4dh/r8=;
 b=YJrja5Xzf8wW5ofINpqQNbVaCtJ8z4GuNw+SoBH4b+QG2v8k9bInyAR0NT0+W7rNvRss+1VmcYDCrdQA5VkxQ9iHlHpCKjzft+8F4vNzeJgTY5s7/HpJycBoQBnXSbwgHgMEqmvjjcVmlfnMxXCQZ+bm1dWOSxdR0v1whvPAgc0=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1172.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:367::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 18 Jan
 2021 09:00:59 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 09:00:59 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] rtc: pcf2127: Run a OTP refresh if not done before
Date:   Mon, 18 Jan 2021 09:57:52 +0100
Message-Id: <20210118085752.5759-3-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118085752.5759-1-p.rosenberger@kunbus.com>
References: <20210118085752.5759-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Mon, 18 Jan 2021 09:00:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a893d411-398a-44da-92d0-08d8bb8f92dc
X-MS-TrafficTypeDiagnostic: AM8P193MB1172:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB117287332177554A55A2A4369FA40@AM8P193MB1172.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/a/Hc7bE/tkRO9Tcdfnsg51zvq3QT5a2FZrGbvTtJ2B8EmlgoA76xEq5sT0QsJOAMrdm+DRZ0XLQ3GT6v9wmHXRXOBBIifq216krhrzV8vNYrEMpAF3QX94SSlMTMJle6k0RNsz3i8DTVbpO676Q8UlzTQ91i6Zmk7dkbjn+fL8stT1fd7Djx5lI1l4rMb54QQ29oIUK3o0PPmXSG0BozgcwRUFDC6Zm6DWWdwCHYw+dRNh9KmaK0cRiG+hnae8J15RHUCoqKHl00mQVeR1vnPR6wNOe/uRp/o6pw/+8cWSxaKH0jnGfy2+W8yiYV2f1/IoCr/VD+O8kwGcX9SGJHZx1Q8Sw+kGmJ7U5hotOaYeF9sJBqiAJJDdIEby76iab+ntIFhewfHa/lN5wVsgkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(136003)(376002)(346002)(396003)(366004)(66946007)(6666004)(5660300002)(316002)(2906002)(1076003)(66556008)(8936002)(6486002)(86362001)(2616005)(36756003)(52116002)(7696005)(66476007)(4326008)(956004)(83380400001)(478600001)(8676002)(16526019)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MTP6+ld+TH6aAPJ6vqbPm5ByY37rjINZNsaOKiSs/OPLUGwF1dlOmIZlSij4?=
 =?us-ascii?Q?uw39oDJNCGWXSFW2PNfHc7pWQ2i/JGddqiwu8e2wczq1ug6aHJMrsGfexhZC?=
 =?us-ascii?Q?BzHBFqv5q4CSZzS05qLSp+bSONbaSNVN9DmrWGVEU070PSm9d7yHfTwdUZ8b?=
 =?us-ascii?Q?ehzcitdBI4gd+/NL0gUfpptx3yvy3GysOdShz9akksAFyvRKSsXcnCBBBYfx?=
 =?us-ascii?Q?NrVRrmHR2tBoc9Ah3MmtE8sp7Vr5dCyO+r0Q3cY8XNP3U0vNefFEOLyYBDl5?=
 =?us-ascii?Q?Z9xgiAcrYoYzmnA9+2EOMjObMvwJVcU6NbaE+VMrAdHotq0mLa4iymBD+Rud?=
 =?us-ascii?Q?QpKWdDtvdbSbQh2GVC19jYEMFrcr+iFZbNTOgAMlgPZlcOQIT8IiDsF4k0ou?=
 =?us-ascii?Q?QPsnPHY5EAbSrqECAE5A1ABuNRM4rPAwI4LkAW3R7N4sK26FiswyDO8IxYnM?=
 =?us-ascii?Q?dv4i079SJEQrdkAmfpCPsx6JEuP419lGS1AHiV7lMbSyw1rmlrV1/puJLR87?=
 =?us-ascii?Q?RPj3sOO7LnYGOE467onncQJ37uc9GuGvTDYhKyc50XpZTxbZrWxdWiHbdfS8?=
 =?us-ascii?Q?WQwkcBj2ptmsifp41giZX9PirTTk63Ik2y7UI6fNt+i017KFuAvmAK6Uwph3?=
 =?us-ascii?Q?IcPbUM401HZq5zF21kATOkpdu69W2QloltYiF0B0Cs3pWwuG3BuUdfqfNOVK?=
 =?us-ascii?Q?RAr5zJ/nOZ3NCBeto/5IdQvmw0I1gUAMlr5kInaa0eErKvQaj1sZ3AWhC6Pw?=
 =?us-ascii?Q?mNFWiQb7D3WByj1ajvPlKemhyPdHVpzBxr0btOXn9KWO3vCTm1DizWBFyqlv?=
 =?us-ascii?Q?e4zjc2gidHUvbGiouIM4e75uSA13LtEvYKKB3t2Oghdq9u++runccU/Db/sg?=
 =?us-ascii?Q?b4A8Q/by8j8kz5aJEJTiKEANMfgAi8vdiN8aioyc3piH4XdKe0hmZog6hhzV?=
 =?us-ascii?Q?3si93LQ3uQpqz5Nv5y2TKlMGLfomqA7frJJkb57Y4nRaQ8fizaJxSIfQzge5?=
 =?us-ascii?Q?wSyG?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a893d411-398a-44da-92d0-08d8bb8f92dc
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 09:00:59.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLHREzIC1wIwLIe8qf9F+XRFwtRvuOuvl1uMjAkscxAoBBB69rj4RjYJBwujnvFumMHfccFkmmmnO16cOiety58m3VGRrt+4WQVbRmKtH84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1172
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The datasheet of the PCF2127 states, it is recommended to process an OTP
refresh once the power is up and the oscillator is operating stable. The
OTP refresh takes less than 100 ms to complete.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 0e06907d3ddc..b48fa27cf093 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -58,6 +58,9 @@
 #define PCF2127_REG_ALARM_DM		0x0D
 #define PCF2127_REG_ALARM_DW		0x0E
 #define PCF2127_BIT_ALARM_AE			BIT(7)
+/* CLKOUT control register */
+#define PCF2127_REG_CLKOUT		0x0f
+#define PCF2127_BIT_CLKOUT_OTPR			BIT(5)
 /* Watchdog registers */
 #define PCF2127_REG_WD_CTL		0x10
 #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
@@ -565,6 +568,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 {
 	struct pcf2127 *pcf2127;
 	int ret = 0;
+	unsigned int val;
 
 	dev_dbg(dev, "%s\n", __func__);
 
@@ -620,6 +624,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
 				PCF2127_BIT_CTRL1_POR_OVRD);
 
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CLKOUT, &val);
+	if (ret < 0)
+		return ret;
+
+	if (!(val & PCF2127_BIT_CLKOUT_OTPR)) {
+		ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
+				      PCF2127_BIT_CLKOUT_OTPR);
+		if (ret < 0)
+			return ret;
+
+		msleep(100);
+	}
+
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-- 
2.29.2

