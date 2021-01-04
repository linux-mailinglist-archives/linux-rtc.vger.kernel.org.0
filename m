Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501062E9AEF
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Jan 2021 17:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbhADQVc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 4 Jan 2021 11:21:32 -0500
Received: from mail-eopbgr70079.outbound.protection.outlook.com ([40.107.7.79]:25828
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727843AbhADQVb (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 4 Jan 2021 11:21:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDHDC6hiwboOSGionuCvTBP6jK6MSKW5pBGyJkw11mtDRmn6d1Bqy/U+y69wQnO6l2+Lqkg3r6ZU23CfypVl9U8mbaNAr105Zw59wfDkkc5tH5DnNAlB2OjqpllA4ngo8tqplxd/w9EkbDuiBpCtZenqUa6Pi5gtY3a1uTffoJJ4mLsQUsinsvfh5rQUK7W1gS7ttXYenLp0fVT1XV51XWHibxyI4++dz4CpWp7Ezv5e7suZhtQc5uxRrA0970sap8jEaT+Klxwb0iKKq6EwKiGRY5n5FipqFVwsSEMPQgV0T8Ya4LeW6NQ//KH4lEMVtKa6X8x4kRvmmvpgFJwrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5Gt75TE/lHKb7RHhyW0gwW25963Qpl7rzgeT+XMjNY=;
 b=gKJd4fsyk2dnCa29BWufyVkJvSmkvOYVAdVPQHeDVdDtXpYYjZTEEOjMi/2ZwUiln4b7JEchOYmwtxoIpfyGYdVutZwtGV1xsSejFr/WpwjKWRzNnSaarpja9W2dwNbyYaZiTqpkSbyFY7kTCcYWJYVPGE9FOzj2aGG/C5DlKNVp8FFuGBZEzor8XK/TBlnYQpwfOvc6VfQA7FuZEH5DzXnr5dp5boqPW9QYj1USn4xLc7jG0rrut+WjY7FiwT6ouLXci9t2gOo9ELCr+2beNriRQHlqN4NEloyQ9eBD1NshQkRFaKyYbNbXUJkZxfT2aTWj9/6iup2MkP+R1eTnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5Gt75TE/lHKb7RHhyW0gwW25963Qpl7rzgeT+XMjNY=;
 b=poYCUAQ2ZtxlpvZbK+I8iRtngGvoOFQmb29sUBmuOaFSBXswpD+f9YolivmEdWGSdcL3ItFWRFsRgtcAiJ1Pi3B8z9JxTG2kIiO2QV6HAk2FNP+LkMXUJeZb5K0LH3nOk+li1/Qg7CtSbW7iQbZ+cAKkTpEAr/5e8RS/nk+cceg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1185.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:36a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 16:20:09 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 16:20:09 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     linux-rtc@vger.kernel.org
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: pcf2127: Run a OTP refresh if not done before
Date:   Mon,  4 Jan 2021 17:19:10 +0100
Message-Id: <20210104161910.9144-3-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104161910.9144-1-p.rosenberger@kunbus.com>
References: <20210104161910.9144-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 16:20:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f32b2c93-9d2b-45dd-f65a-08d8b0cc9b34
X-MS-TrafficTypeDiagnostic: AM8P193MB1185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB11851702257C33FB6E450D409FD20@AM8P193MB1185.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHl49Unqa03NRY0l7ft5zqKmthcTpH2RijoSx0VvVMIpKxEhLtto7EwJZ0qhEP55wftjLGTZJ/YIppGfQGztN/82jqDGbL0kLJ0zVOctkRfb5BrYbqFuHsAuPT0MVv5iM2/nPHamr+1wzXITEgcvopFIVDEDtBu3kd+fgIHZ3cJGUxFTyPBki4kRxNwMIAPu3W2zezQKhO3FG9dK4/YmEyvnQiL+Iwn9LXWHzYTUSOCo+9/N5ZPC8Hiwh6OP9kYykIDSiTeuvaf7E4fc6agKjtjO1HxSf6DTQNhRg17SgXt4XAsJi/pNt2ieDK3pxzefLAk8onNJcN/oGBzzTRfNEwFQe9hmF254TXAsu6kYUMq64imIcklVrPMnujcdL56YeoHbI5A6xO0g2hC6Gk7v/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(956004)(2616005)(6666004)(54906003)(66556008)(66476007)(26005)(316002)(16526019)(478600001)(6916009)(6486002)(8676002)(4326008)(186003)(8936002)(1076003)(5660300002)(7696005)(2906002)(83380400001)(66946007)(52116002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lpyZvrxLcvA4d2jizLOTM24F7Rjaycv3i4e3ZlH8RXf5ikBIc1BlxZXEw5Yv?=
 =?us-ascii?Q?V48uLUiliKU7B1+TE1A6bKlMi8620uyI3qD13nUrQm06NJDM2h3v0MunIZgj?=
 =?us-ascii?Q?LYZ2/h5+4ZVgLeQMUEKdv81cWeLM3NC+wE5Tnf71GKqd97mB1+PbZP8Sc6dh?=
 =?us-ascii?Q?88CUi8/SOa/S+54hiqUcKv2t5uxdjZ8Rarw4CJxuRp7T/H5HN/Y92rnPXjI/?=
 =?us-ascii?Q?fX0TkhrLJC8VWTT9l6VH5yCHdvrymVshYJBdrB9aBuCqnA53/w60qQ7UlEUw?=
 =?us-ascii?Q?OscHjepTcBL9OyRE3f2SOy1X/MEQ5fN6S4A1TiUSiEmbu9chbl/nFGUN34qr?=
 =?us-ascii?Q?5oGM/6dtjnbhxsCfUOvb1y0SqoGj9TSPQfIpRE5lyFbYHmMsgzyxfOIC0mhB?=
 =?us-ascii?Q?04+pKNWmpjJZ+JDrBPNJLE8Lvor2GLOJ86DIQJJxh0JhvzEuGNDkw3ZOSUW/?=
 =?us-ascii?Q?5SuDocGXd1wgOhxcrgJluUDv0WkX8rwkqyIsMNqhxYqL0Vc9sziSn+jNr7Ru?=
 =?us-ascii?Q?1c5gdVSeN/ACDTKd8y3YX79z1QEysfbQB8Cq3oLp6J9w0Vso+nQCzRXYNkqi?=
 =?us-ascii?Q?ODurZstHg02NAX4jF6sOBzTNlaB3PeRH4hMpDLEqfWl6SbJf5ga/6qkWZu1w?=
 =?us-ascii?Q?mNI2yzpgoWzXFVRtayqtrcP7Eg8uh2MISorZbwaycHuPF9ttVGyp5JXCxxRi?=
 =?us-ascii?Q?+fcCwjrCK9zbG4xptQ0R45P0Edsao6KjnXeMnnXRfB5n6UOr1omSu1Gn0EYy?=
 =?us-ascii?Q?uywWJthydchJiWZFWaCJBqiwOVxb4hhlawyppUkuOEzSXC6HX5XzildawV68?=
 =?us-ascii?Q?rnqyTRZXjXXuyJkPUrto9AYl8VeMw1rQ1x0kHuFa7ZWCT/5yNKRoKPejuZOA?=
 =?us-ascii?Q?37sy0DhWJ0N/DeBZjKGxWn9rr3Hh7MxmTws0hsPFf0GZz0JU3Sc9xzAvu3vZ?=
 =?us-ascii?Q?+gJ2aDFQTa3h0cFTTtre1xtUQ1WQP31Kn+ga50B0sDAz/XrhEXoXAj0HeRlT?=
 =?us-ascii?Q?M2d6?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 16:20:09.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: f32b2c93-9d2b-45dd-f65a-08d8b0cc9b34
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKFT8eOB1gWAC7svRMLH/IRlnrCxBxqAAOCvjwa6ypgyZi9d+73qgnfcWoUVo46WaY41bXmq4luw/Kza6cWI4wl8BQdpUE5A2AIUkSS5Vkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1185
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The datasheet of the PCF2127 states,it is recommended to process an OTP
refresh once the power is up and the oscillator is operating stable. The
OTP refresh takes less than 100 ms to complete.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39c28bac4d1a..f012b989f2f2 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -57,6 +57,9 @@
 #define PCF2127_REG_ALARM_DM		0x0D
 #define PCF2127_REG_ALARM_DW		0x0E
 #define PCF2127_BIT_ALARM_AE			BIT(7)
+/* CLKOUT control register */
+#define PCF2127_REG_CLKOUT		0x0f
+#define PCF2127_BIT_CLKOUT_OTPR			BIT(5)
 /* Watchdog registers */
 #define PCF2127_REG_WD_CTL		0x10
 #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
@@ -625,6 +628,14 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
 	}
 
+	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
+			      PCF2127_BIT_CLKOUT_OTPR);
+	if (ret < 0) {
+		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
+		return ret;
+	}
+	msleep(100);
+
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-- 
2.29.2

