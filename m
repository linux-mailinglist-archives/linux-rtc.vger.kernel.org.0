Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012BD2F4A3F
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 12:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbhAML35 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Jan 2021 06:29:57 -0500
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:34323
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728265AbhAML34 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:29:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Twum88eAaDvWUkLolJ6aDoKh8t48Y8CVkLuN4cfYO0jc/CQRDUrtN3YQMjBLu8iRtO6PnoOtw29DtOHYXQRb7QStFfB3XhVbU8Gt6ZDEV7Q0Odj8Wbv2NO/skQRrSrCZsUAmlaIpl3wsyfagzRpn2pf2e/7FCL22GONbIvY0ff6PGMkmsBxZQYh053N1SekSg9KrOgUOcITR8SvcMZLSxVtaHWUWQj3Dgk77s02xXfARkEx0gyYwbmTddJf1jDe1lVuc3wD2Gatt3OItYnBVJMYVhtstWYmtuiaf0hrexDCqMdZAT+RIwTmaNCUFjN37WRv7Thp7TkqP1mV90vVoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydLYe4CabZSxtNCDPoHXan5MgYLc5IUl05RhQfjBhRQ=;
 b=ARzzvzNIJwNIoPysdRY/rLlh9mAN9Rte/UDuyYh/iXRHlvmLqX7kGT6yKRfqXkuh/+L+k0qgNJCDguIomCVP1iL+uDvWVJUhvhuMmxfIl6ajP6eYk1oco7W1LDX8NYeqrmNWcPXc4PAMxzE7gG4iXkd/d+dLzpZKHF6Kj18u6mpDxk06liXUA2jpIGaeJmWey55eRvcppEyBlSMMMPks/hriLd0M2Ztevu2vIVuXdZsAuWjZdmUnFL9iYL7VnxgB9YAAhi4JKYNw95qc8ISsDLi5z3d9htIqIgJIGozuoPH2LlukgIRtmfiAAO1us4IVQNPlWaBtjyEIH7W7szWZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydLYe4CabZSxtNCDPoHXan5MgYLc5IUl05RhQfjBhRQ=;
 b=ZvI4jCvWtBSUH+BwaeU4de3souhP2Yfe7olQ7Su+oZUNqG1v+CmqVXilj/bPGZY0mMZOeOTfZ+K/adXVMSfQg58w5vKKTRkYUwKQyt40wqyZxgXVp6OZR703+Z9ri/DB7ahZg0Ttjwbbtj77QxLyH5I1iL+AYKezmTDzn5V+/q8=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM9P193MB0903.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 11:28:37 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 11:28:37 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rtc: pcf2127: Disable Power-On Reset Override
Date:   Wed, 13 Jan 2021 12:27:41 +0100
Message-Id: <20210113112742.7354-2-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113112742.7354-1-p.rosenberger@kunbus.com>
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::19) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR01CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 11:28:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeac230a-6772-4527-a90d-08d8b7b65f00
X-MS-TrafficTypeDiagnostic: AM9P193MB0903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9P193MB09037CB7B99E25D698EB5C0B9FA90@AM9P193MB0903.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xo6UOGSaWYWVOWcqVNH5NkHNuYeORXiqIn1IJYRZ7k1QQ4t+Os/32f168lfnHd6DI7RJOQirX7xXUWfrqI084i3+GwLh3K44phcYNi6QK+wYO99JDIOANPJzKVrC+Tdm+R48cb4SD4ORYMTZ2Tg5zrKRqJYJY4FajkumMOHtyqVDBGXCoM3hZtoW3yKs/aiM0YXqakspgbqw8FmCr4MZB0XFKdoAcR7l7Fl3ThlUWDiSEkoYsKp2adhTeoQ8XaE8/mSkB174BLbDAgzPpX3lmrSTQsO5vqVnu6LvJkWidc30kaQ1cp28Oe0QBnnM3Hodm2FDweXwuWkBAQSL2IIO8PWMUuuWqf9u9kolM9DmscxK6ANnH8W8evNsDlPg1pfmRt0qN5x5MG/DZllJ9FKfEqJU017GOdCGN9u65MTzZQdEJ/8cr1cpC5fL/f8cJeid
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(396003)(136003)(366004)(376002)(66476007)(52116002)(6666004)(2616005)(478600001)(66556008)(54906003)(36756003)(5660300002)(1076003)(956004)(66946007)(186003)(7696005)(8936002)(26005)(16526019)(86362001)(316002)(6486002)(83380400001)(2906002)(8676002)(4326008)(109986005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GsMiOXIptj1HQrRaxhnVakdqiNTffu4Yo62RfBfvFIl+g5GNqPSZDwDdtqQY?=
 =?us-ascii?Q?tAGZqsQK3CfVizvkY2m2e3UVykUioSJzO4T5+5jjgZQQ5AxwAt7r7nLVH70I?=
 =?us-ascii?Q?F9WCYAwusk605DlFvdnaUZIIAOLqF7rMd/K9zvMKYyE/sizqSLQtHn3l4XGI?=
 =?us-ascii?Q?p/esnBhhxB8bani/VTlStsp0+qHJTYkmTuyjV//lWIDTF4A16NrQrkBFzWwM?=
 =?us-ascii?Q?7A4gcCGT29jAPSPhzGONyLVtRMzASZRfOfsIq/RhG3cOIOsoBfT5IMqigSsW?=
 =?us-ascii?Q?UrGgJBFsALqSNwK4x38SMccyksJy066QgLcjMPoVGhjJ+AuClzHkcOlBrRqh?=
 =?us-ascii?Q?gCSOsflhIRdxjtkEcoqHNjYRl3BzoZ4axBwu1JwASXaaVwOMRo0liBY5Nm29?=
 =?us-ascii?Q?rq+/osSyA4y/dkj2QW7O7CqGaz6De1Mj1GDHYOjEAoOhOHyGAeFuKR/kGSq9?=
 =?us-ascii?Q?7MAQKjSAiZxTc3uQrtbYlL7KrwQZFard2AMr2/nVrPJWQ3MRo9LklwopzbAm?=
 =?us-ascii?Q?HqUrjknKTMt6TqCA9XIFtZoe2ojGySvomFYZc3M4Bob5ndm8dgmdu2RTyy8x?=
 =?us-ascii?Q?2FcKqj+OqbD1SHqDWjnGMbTZB4DlLh1wfulKrfxdbzumrp9Xm2lI8emVsiT/?=
 =?us-ascii?Q?25QjalKwFwK1oq1BHG8r5UEsoIF36zdEs85sMD2zotLHHdJI5/Q4fJtbLTWk?=
 =?us-ascii?Q?sZhvx2gqFhcijoXn1PIu87iTBxL2kCPtUCOCcyrnqAG4V/z5rLw+CX8drQBL?=
 =?us-ascii?Q?TtCb0pVemsAmxPtZJ+gJsP1pluWr6MAkhwcNyntYnEIh1v31pZU9kbbuPE0b?=
 =?us-ascii?Q?XcKVRbZH8yGO+WB99tNqy6WbGQxv7MNQE/BRSe0AABfXV3uucw5iuYmq/LFz?=
 =?us-ascii?Q?AUHTxdoLtzCs75g+n+Ynffc7vzFnUnUa86otOkHg69/6KRs52WAK2hXb06nO?=
 =?us-ascii?Q?qcL4rTWGxJ4HPzaAAV6cVY7rx9FVx0I2+y1rnBIcCh1bYd2REtPuz5lJ+Z94?=
 =?us-ascii?Q?+DBT?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 11:28:37.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: aeac230a-6772-4527-a90d-08d8b7b65f00
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7JmL+86DifuPF/J3NsyOcxU6f74SC91wDmRVOY8Jsra3SJjW7GmkE1c29rfPkBjntBFOdr1lCwYDTHcrn19XxIammc3h/5HOfnZWz6dRLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0903
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To resume normal operation after a total power loss (no or empty
battery) the "Power-On Reset Override (PORO)" facility needs to be
disabled.

As the oscillator may take a long time (200 ms to 2 s) to resume normal
operation. The default behaviour is to use the PORO facility. But with
the PORO active no interrupts are generated on the interrupt pin (INT).

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39a7b5116aa4..378b1ce812d6 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -26,6 +26,7 @@
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
@@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
+	/*
+	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
+	 * after power on. For normal operation the PORO must be disabled.
+	 */
+	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				PCF2127_BIT_CTRL1_POR_OVRD);
+	/*
+	 * If the PORO can't be disabled, just move on. The RTC should
+	 * work fine, but functions like watchdog and alarm interrupts might
+	 * not work. There will be no interrupt generated on the interrupt pin.
+	 */
+	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
+	if (ret <= 0) {
+		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
+		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
+	}
+
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-- 
2.29.2

