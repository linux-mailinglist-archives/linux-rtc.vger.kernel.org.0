Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EAA2D8165
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 22:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394256AbgLKV6I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 16:58:08 -0500
Received: from mail-am6eur05on2117.outbound.protection.outlook.com ([40.107.22.117]:12449
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390189AbgLKV5e (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 16:57:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+sQE03W3dR/Bav+No9Hk/OPevPPewxYnRUdK6c2TH85+GIQSOXge1K4Ec3GyFJKgRDk5Z612s+KqnzQKJQtMCP8w3gSN7rFDbPSVNhSv+LyjLyOKZbnoa+DyCR8+mZmJQgUFhJU2tNaZm5Jg2G6ev9nV+xRLOfJfNQDkgPerGAJBdzGT8JUXKn8E4HPm0WlpIpfsruqcJEiKPV6d+qCcBJk2fRKhIlNpbGRvDU/scTdUeDE6G4/ES3dYBqdt6aFDBSSux2Qutn4tMiW+VWgUVtuuYXXfeom19gcKyCWRII5H2Sdgw9mQafNGVhvDdMgR9K+Cmz0XsBRLkF9TLmtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZm0ht9+0DdJoglToXQCIrWlB0TOSWsxWqZGUi5vOro=;
 b=Y33WeTL6AMUIcyyNGGy7nrSKgWPC6YkOUX8sfW94p881WmYbKL/5FeUqI8+eyrPvvXxuK3F2WBLsoiicBzAGombRTnoe/edIYYxMvrpOKk/TwMV/B9XRcN6rDvfcT6Wbl9HYW4+gVTT8Dt/CtlSHycFpqF67QqmXAdYueTsR3L8KXjjh+qfRDUHgoCZWrjNhHEGlZxj40knFM+hsBwS4JJVXRPrislH2o/jFJH+DBhuoc3d4OAA1gyYWOIa4BZpuffexfJzOem9SjWqcwkCMLCqHYre41hQzILuymk8pkFemHv/85e2NWSWuSM0Byp53PFOWLd2xu5ANJbME/vE5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZm0ht9+0DdJoglToXQCIrWlB0TOSWsxWqZGUi5vOro=;
 b=aPOYuPrv41LrKDloA/MXu13R5xUCEKHfa2yKtTdHh9eBcti9Z4mMRRiZmd9vmIBTnWCVeogC71ZFnyMMxlYR+pUyzVyRlsZqPmpQ9aGoALSOMHhqRa89lPdEVXOwt3YWr59gEHyrnvJpPasUv4ojHFmIjJTR4/Gko1RyVZIk0MM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Fri, 11 Dec
 2020 21:56:22 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.026; Fri, 11 Dec 2020
 21:56:22 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2 2/3] rtc: pcf2127: move watchdog initialisation to a separate function
Date:   Fri, 11 Dec 2020 22:56:10 +0100
Message-Id: <20201211215611.24392-3-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 21:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50163c0e-bbaa-48c7-8c40-08d89e1f9904
X-MS-TrafficTypeDiagnostic: AM0PR10MB2867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2867605C5AD594160FA9BE4B93CA0@AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGktfFSZ5gBr1AyHT8KfHOBS/UVwtYTQTD/9LDQ28ZkJhL6sh2I7p3nQS9WSKFtOpFP19sr9GwIGeso5c1+OqhGphzrC/rGnoB0Zi6Gkbu3edjJeYTMtIR89yh4+PGQv8xSRUUCJQ98PlQbqwbONljiS90pskwqs+wC/IR6sGKl3yjvRCpz9WVkj/ryMxQI7ClAMiwppUOKsaWgOsY1oh+5PqswT9q88kbcDhMEWvZIkbNrnW8FppBF8vQRkFCCXgvZ9GCovqs5iw517cPCk3J2PGOpNWCJV4nenpK0J+vLIMhdBsagRhrb25HOlRm3odPKTLiYl9IvUthYRogcqFQ3Vp+BvoyMxOVchf9yXIzLuPadFXcUsjZioxo+xzj+a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(376002)(39840400004)(6666004)(83380400001)(8976002)(66556008)(6916009)(2616005)(4326008)(186003)(107886003)(8936002)(52116002)(66476007)(36756003)(6506007)(54906003)(16526019)(8676002)(478600001)(5660300002)(86362001)(66946007)(44832011)(2906002)(6486002)(6512007)(26005)(956004)(1076003)(316002)(6606295002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnpqNWhBMzVTZGFKcGkvclJGd3h0OG84TEZVem5JNDZwZU1XU2o1emdjYzRs?=
 =?utf-8?B?TSt1Mm4vcElVVTFJRlYzcmlpOUtRalNCUHhJRUtXVzczaHB0UlI3TDVyTmpV?=
 =?utf-8?B?QWQwL1FaeWdYVkFIQXVpaXJaeVU4eXEvTGdNZmF3QjJFRzFPL3AwdTladFE3?=
 =?utf-8?B?Qm9zb0lnZzNKVjhudnlGSm5yWmJtUVhKazU0OGF3MTY5eVFvM0gyUUJwZVdV?=
 =?utf-8?B?Q0EzejNkb1o2ek1MeThhT1BRMUdGbGZtZVV0Q0RDdDZHbmQwcElYNUxRNk0x?=
 =?utf-8?B?U3VMU3FCMFFtTTl4RDY2RUNvYy85eDZyMndNbEZ3cmZScEtka0lBTTl6UDl6?=
 =?utf-8?B?NUNSSUJqSmZJOGNucDZ1M2wzL0pMQXVuVnJJUFc1MnFyTmRzeXkyT2FpcWZr?=
 =?utf-8?B?cnVmV1JWUk1qbUI4UTl6T3lEeEpmQm53N09QOFpoc1JHZTZlRko5VDQ5dzUy?=
 =?utf-8?B?SXNURzd5YVFaVjdLMnJmdEEyYnBHWGo4Sk1KRDljcGRyMy9uRkpCZ245NjdE?=
 =?utf-8?B?OHp5MXluT2l1SGc0Rml3QlQ1RmhsTFY3dFJGd0VMbFVQWjhWcnN2ZEJtcG5z?=
 =?utf-8?B?TkpmRWlIY291cjJFWm9vcSs5R2w0aHVsMFI4V2JndnRoQUZWOVloclZvWnNw?=
 =?utf-8?B?Z1AyVGtmVlhRYTY5TVN6dFUxVzlKU0ZzUWVLcjZaY0JMaWNLY2hSUmM2N2tV?=
 =?utf-8?B?YUZQQkw1NnUvQUJOaHhXYU9HYVNsMk9EZ2lacDRSQ3B2aUJGV1RqUE94eDkz?=
 =?utf-8?B?WmIrdFpNQjVNVGRhWkR3Y2E0bUdNRG1QbC9pZFJ4ZUJlTVQrQ05MZjI5SHl5?=
 =?utf-8?B?VWZ6VXhYaWdxSHRyaS9iaE9DZVRWY21tMExwblFwZGlOdW5JNWNvcmE5LzJy?=
 =?utf-8?B?b0Z1REhBV1NzbnNTaGp6SnJjMmxyQjNNM2dsUWMrTjBXUXZ6L1AzN2NGZFVG?=
 =?utf-8?B?Q3NMY3d0bk9sSkFoc2ltQmVPOGdKZFBSMnZpZURtb29XNUlzWExrbVVKbVR6?=
 =?utf-8?B?UUt3SW1UdkNaSE95dnBIUlJwazF0akU4S1BUaGhrejhvUmhwdjhBMXpYMDVL?=
 =?utf-8?B?Vnp1NURhcjQ5MExWSHFad1pBV0cwVnVBc2NnV2Vwdm9xTHFHWk0ybmhLV1U5?=
 =?utf-8?B?UFU2NEFtQVNqN1oxdVBqSE16ZFhRWFZVVlRHcDBvYlV3RWtsTEdtcnROa1ND?=
 =?utf-8?B?MDJxOW5GY0VFblg2N2tadTZPWTBiZG5yeVpnbUZSSDRTVSt6czZHdXhNRlBz?=
 =?utf-8?B?Mis5anNFQ3JnZVJ0cXMwYUZ4VTBQMWUrZVNOelV4VGpYbS9HbUlvOWUrUE1I?=
 =?utf-8?Q?bXWFLZ2BqybAtpkWk+cSXrhg4VNyNT0sbK?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 21:56:22.0452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 50163c0e-bbaa-48c7-8c40-08d89e1f9904
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+ZueDOJIaHW6tePYr5iMx5tVHRCOOoo8L2dNfH2YG+oBNr8mxEVARrsM4Kis6M+Y80NUjoTRHfYltN5Jzvvt2honbJn5A5a75sMDuhrjBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2867
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The obvious advantages are:

 - The compiler can drop the watchdog functions if CONFIG_WATCHDOG is off.
 - All watchdog stuff grouped together with only a single function call
   left in generic code.
 - Watchdog register is only read when it is actually used.
 - Less #ifdefery

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
[RV: check return value of pcf2127_watchdog_init(), per Bruno]
Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/rtc/rtc-pcf2127.c | 54 ++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 07a5630ec841..aebf85fcc328 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -335,6 +335,36 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
 	.set_timeout = pcf2127_wdt_set_timeout,
 };
 
+static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
+{
+	u32 wdd_timeout;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_WATCHDOG))
+		return 0;
+
+	pcf2127->wdd.parent = dev;
+	pcf2127->wdd.info = &pcf2127_wdt_info;
+	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
+	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
+	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
+	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
+	pcf2127->wdd.min_hw_heartbeat_ms = 500;
+	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
+
+	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
+
+	/* Test if watchdog timer is started by bootloader */
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
+	if (ret)
+		return ret;
+
+	if (wdd_timeout)
+		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
+
+	return devm_watchdog_register_device(dev, &pcf2127->wdd);
+}
+
 /* Alarm */
 static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
@@ -536,7 +566,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			 int alarm_irq, const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
-	u32 wdd_timeout;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -575,17 +604,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
 	}
 
-	pcf2127->wdd.parent = dev;
-	pcf2127->wdd.info = &pcf2127_wdt_info;
-	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
-	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
-	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
-	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
-	pcf2127->wdd.min_hw_heartbeat_ms = 500;
-	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
-
-	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
-
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -615,19 +633,9 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
-	/* Test if watchdog timer is started by bootloader */
-	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
-	if (ret)
-		return ret;
-
-	if (wdd_timeout)
-		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
-
-#ifdef CONFIG_WATCHDOG
-	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
+	ret = pcf2127_watchdog_init(dev, pcf2127);
 	if (ret)
 		return ret;
-#endif /* CONFIG_WATCHDOG */
 
 	/*
 	 * Disable battery low/switch-over timestamp and interrupts.
-- 
2.23.0

