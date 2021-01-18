Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08ED22F9BAE
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Jan 2021 10:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388219AbhARJCQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Jan 2021 04:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388201AbhARJBx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Jan 2021 04:01:53 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF6CC061573;
        Mon, 18 Jan 2021 01:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrKNrMEeCPqa5HUIsNGEMJo0FYyzW5T2Qdd+ppy2xza6iww4r+pHMhmnJr56CzfhLwBDVJcjJGpvz4hmgtO57h8F0i58c62Qu86qqYLRZCTvA9fVf/wCWDPCs8erNVRfkBkJ7q8uwANJDQo3ghnUDyNko2B7q2FtvaHO1VBj7Ejs3xqRxTLLZX//0OeI0Xfw//Gn/4ZYfoIb+jQB+KQWZL/729OOsJ4N75BVxoC5l0S8QAN7ESChCNnWiHsWmI4RvFcRlXW+Cr8nBf92l24JW3bxbR5CIl9ozlV9GRFe6twUPaXjI514O2YM8yayoDlIK90UWI72JP5FnrVEORxEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUoCtIlnBp2LZWIMg7uzBnElBWTIv8KAvfPzG0dlROE=;
 b=lFlUuYK9CCWZyQYa6DghaZvuvKl7lAeGdHtYsBQC3c+593sycEzifgvo1EOQ8Ey6rzCs1wb3eI4Zuuj94p2+VCcLiZjn7zaKZvi0hfwJdrgfAY9Q9dGhwre1UMeZhODByqKbQP7pYUecpBH+LV1oN4fJ5mq2lP2ai151V3wU/uYBykJYMznDphBmSXgUk8fKbnP7K/OmsWdFCo8xMsP8/F7tdAa74PMKihkE16CD/c7H3gxQHH+QmjjidTrSCMjxuTjjkl6HOiNT68QnqfmeG+Bgg4gyyJ+yluC9cxxN7MDHzh+vsy+dC1TDcDDC/6TU0UZwPuAmx7guOTt43V8t7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUoCtIlnBp2LZWIMg7uzBnElBWTIv8KAvfPzG0dlROE=;
 b=yOFUoXZkZ0+bteXu6OxGFZa+VbgGxquTJkVU9g0rexISbPmYkDHvdRsTh4UmJu10pgiJqQjPJC0mHj3cfzmJLT1Zoahdkr48+s0BDXUCLWRdAaUFz3TBis7rqiP7FFUuXukuMmJNek2/kr716J1Av0g2yiY6WFQgpLnYL7OWLhs=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1172.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:367::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 18 Jan
 2021 09:00:49 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 09:00:49 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] rtc: pcf2127: proper initialization after power loss
Date:   Mon, 18 Jan 2021 09:57:50 +0100
Message-Id: <20210118085752.5759-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Mon, 18 Jan 2021 09:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ce0f46-f58c-446f-ea77-08d8bb8f8ccd
X-MS-TrafficTypeDiagnostic: AM8P193MB1172:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB1172E23614711E260C4937229FA40@AM8P193MB1172.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7VR3MEViFeKz/jR6mGQ0HGx+XKcfYymjb2crJiJ7p/WX1aPIYuuBy90ZZ9S6OnuonoVUkWbJSuYr6QWERpJcESoNrIVEJlraN1bhXVi77aWB/5ea4ffXBCO7Jvt3eKt+ECydMOSlrSpWgFiqARS3iduCU3Daoa+U/S1jvxmGav3FqKsOlU7/jxOBBtJLX1JFL/jy+vm594INhQIrczv/sCAKg0EQjFdZJxQDshReTDBnkeJebTWu7A/DWglTnROegZqN+0ES8YBXHg5MNUlxvf7Pf/WSUV5Do0m5Jy3hPHRu4TBuir7bnDu51jxd5VVVI4ZlqLbxdeKuHLkw7bOYaI1HiRzeh6cuOUhrpB5kF6ROfAnVr7rB8YvtZU71Kjfaz7zWp169nRJYv77xS3wlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(136003)(376002)(346002)(396003)(366004)(66946007)(6666004)(5660300002)(316002)(2906002)(1076003)(66556008)(8936002)(6486002)(86362001)(2616005)(36756003)(52116002)(7696005)(66476007)(4326008)(956004)(83380400001)(478600001)(8676002)(16526019)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yGQ4hQVV9jx+AHNpBa+tW6Y4H8STidTjhu9jmWMczKheRmP1iijFH8ut2LCr?=
 =?us-ascii?Q?xPY/efE0VHl08r2ebMcu91m0ICFcGJgqpoMjDb+x4K3nqikVgIzlcxvN6YaI?=
 =?us-ascii?Q?9/8UKXbJEIVVuHOXM1/AuIQXH72LNlg4DLa/wALhLqhOJ9W5pJ5iDsvdA4uk?=
 =?us-ascii?Q?MIuZKdnzA7rUsOg320hq10OKFgiIUayXTN9pnjdke7RVgliG8dTobUpoqyFC?=
 =?us-ascii?Q?ctyzsBnMWfUfdtBdbb05zg67pHN9Cb+VU6vA4pCneOSuH6cPKIjMKIS10UIO?=
 =?us-ascii?Q?w/Z0eCT4homYlop1mdNLjQq6PjUnPxFJI02Jv/pp8Nu9lvLxx0WhQt3dPgP9?=
 =?us-ascii?Q?pqko66OVfasJ3wE9F71ItA49iIOONCkqFuAJspOQRStiMdhkbaFaM0jZd5ZW?=
 =?us-ascii?Q?UGJcyxEo0G4MaWG58HYD/DYxXLNucm4FIaAPy5/ziZD1SpfQjStPdDmqO5y0?=
 =?us-ascii?Q?U6vh6W2NXSZSjQvVfy4T4QyoW7qw56sW+vKM7mdIgIhkRLQXcTzUR15r0GBq?=
 =?us-ascii?Q?avIKbQVV7Oqz8JMl56ldoGFwXtURoypkhXmkpttoEekVQXaLaqKp57o8p7Am?=
 =?us-ascii?Q?Ky/P8r9zw8zcFj3jWs2ewxtU78mU/f5Ek5QqzXMDBZR1Qjx0LLJTmm5ymonS?=
 =?us-ascii?Q?xgfSOiBk0JP76uiGDQfYhXjETwcKYwVln1iBoMFoRAFgaqODn0UdYm1htEpk?=
 =?us-ascii?Q?GQeaUZuv6EgMXawG9HXQOFpRCQAJs4Kr57osgDXSN41KOT/G9mLj49Vzti3c?=
 =?us-ascii?Q?IxGO8IhWkKbMIh7DnTJWXkofEq3p2C9v0SsWREB1dHh7pZfZ9cTVOiNgksyc?=
 =?us-ascii?Q?IG1LC3yeZFnhYmvkp1ckX/0NxTPbsc0Nd4hmHuc470lFTu387hqZKaoAgMln?=
 =?us-ascii?Q?+NymgxcgZ/lAeOf/PTEAB4Ye5ccAhBz0lv0bkUFuGJf7nftCkI0QvUy5XI93?=
 =?us-ascii?Q?kIfXv802FVQNr5T+O59kCcfyfaF3cjw761786k9g02QFQwe99zy/5QVJW4Ek?=
 =?us-ascii?Q?6Uvr?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ce0f46-f58c-446f-ea77-08d8bb8f8ccd
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 09:00:49.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+fuut5igpleRDxA1sPFMjId/Yj8IeYW3Hv1ESFj9fSozoFNTccbp7VPRNs5kdW6bN+pPtaJOLrRTw0/MB/QQKLWd+a9l9qowNPKxH8dZcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1172
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the PCF2127/2129 loses power it needs some initialization to work
correctly. A bootloader/firmware might do this. If not we should do this
in the driver.

Changes for v3:
- drop the test if clearing PORO was successful
- only run OTP refresh if OTPR bit is not already set

Changes for v2:
- make commit log and comments more clear
- check if PORO was really disabled

Philipp Rosenberger (2):
  rtc: pcf2127: Disable Power-On Reset Override
  rtc: pcf2127: Run a OTP refresh if not done before

 drivers/rtc/rtc-pcf2127.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Interdiff against v2:
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ca56dba64e79..b48fa27cf093 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -568,6 +568,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 {
 	struct pcf2127 *pcf2127;
 	int ret = 0;
+	unsigned int val;
 
 	dev_dbg(dev, "%s\n", __func__);
 
@@ -622,29 +623,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	 */
 	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
 				PCF2127_BIT_CTRL1_POR_OVRD);
-	/*
-	 * If the PORO can't be disabled, just move on. The RTC should
-	 * work fine, but functions like watchdog and alarm interrupts might
-	 * not work. There will be no interrupt generated on the interrupt pin.
-	 */
-	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
-	if (ret <= 0) {
-		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
-		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
-	}
 
-	/*
-	 * Set the OTP refresh bit unconditionally. If an OTP refresh was
-	 * already done the bit is already set and will not rerun the refresh
-	 * operation.
-	 */
-	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
-			      PCF2127_BIT_CLKOUT_OTPR);
-	if (ret < 0) {
-		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CLKOUT, &val);
+	if (ret < 0)
 		return ret;
+
+	if (!(val & PCF2127_BIT_CLKOUT_OTPR)) {
+		ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
+				      PCF2127_BIT_CLKOUT_OTPR);
+		if (ret < 0)
+			return ret;
+
+		msleep(100);
 	}
-	msleep(100);
 
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
-- 
2.29.2

