Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7761F2F4A3C
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 12:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbhAML3o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Jan 2021 06:29:44 -0500
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:48198
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727728AbhAML3o (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 Jan 2021 06:29:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyEd55zjvco4WQDWoZdJzs71kpCekePfWIMf+zW4Ax6+Y5ri6uDkVx3yfwfiPHLdvAPHI1p+xzAeCqxNF6baYPR4uW70jMrTGqTHRTlpQnDxx0WzVkyi7KjhZufPlMeS78eDNiZd8KghPCsYIIk+5IdsBLrp+9y1nRp1aFJ4tS9Vax97uHzP5k++Y2ltomp4ChdDRA3LF7cydpwjl01+Xa8jOY4ml5GDLvbZwQeA5pbhyr4uB///yPgOxal7VzGtI8LlN+SCk0KASL5SZJKmbGqWZLB8hP8CUdyeBaLMx+ehQrmi7YFkMET0q8LU8s4RXEWBVUcOCnXx2gM6wvBPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NoA6CE37CfE9NEE+DPGgyH3sYRTVhjhP7AUEym9BZ0=;
 b=DgbSRhMCXkdSPj7pgVFxojnzXKJaBGDR4TwdKi5ppkMqXhRr/O0W5COMqEeBwIRAhD/xET1I91Dq2uUwKrz1HDMLo0umAlUUF8tAeZ3aI4WHyAD1/6xE3q4sWYvYofFrD9jTzC7WhT5nBhNrzv6idvWxHnUF0z3I4Xx5BSk1oRjzFq7fW2+M3cQFfWLjPG//g69z5vcs1wJkd8E63C+EWkA+/KT9Anz8IuHkA+u0H1r8R7TNkGblGD8ClQ3TdrW5CIp4DrUzixhH3qgiB0q0bmFZ+jIb6bs8wDxBkS/IsdxI1yj7OMIkYWP+rIGBbGhXAElcK8l+fWwBKhhxfp6sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NoA6CE37CfE9NEE+DPGgyH3sYRTVhjhP7AUEym9BZ0=;
 b=YckbonZz07YrTQlY3B+zX0Z14efLieY8CZhBTWEJUP1+nANnZEijV0jeOk0o8krajLKM+Pmz65p1lHnzftUZPp+NmsnWaOFhqFZu40ssD8qDMRn1PaWAel21r8WuJWQPlMPmdkRDrWK1mlPpCATBu9L3kA/w8i7zWotgYfAONGI=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM9P193MB0903.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 11:28:39 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 11:28:39 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
Date:   Wed, 13 Jan 2021 12:27:42 +0100
Message-Id: <20210113112742.7354-3-p.rosenberger@kunbus.com>
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
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR01CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 11:28:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf99c45a-e74b-4d23-3818-08d8b7b65fbb
X-MS-TrafficTypeDiagnostic: AM9P193MB0903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9P193MB0903020C27226ADDFD84109F9FA90@AM9P193MB0903.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeJijYNvpyHtA7nrUUIN9s06TkUfQdRbkTgZKNUT+6ouH3pCx+t1In4ej4zMsHRyz9r85DaBDAR4GNNQQ7LelvoSYcflQAVb+I6f7sH8hhaex1gWKzCVAcTtUPIPYwuWjTNKxLJxaYhvonZlkeymHp0r1tZFuFu5bX0CSlhadUyEFDXCpEAXCDtNWZekN/MKwVgatjt9qQoWdtdjh4Stq/2ciUfSHlHMfroje3VCoDtE32ncqe7u655h1RYf9wXN/yQwIVZos8OYUaPxm6Y76TKqTunIXvhjNElz69NOStSEYFlUz4k55GNJX/e5GnrndzcRdR2+bCgOp79xFzQuShbZ/dGiiP34egeB+3if3VhMF9B80VIDxMb8f8wyuxuJNcQpaKbpxNLKJFFZmo92hF+z/myETpMwqXGm6VKwQkrp1PevOCnROGd2Rxrh6c6S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(396003)(136003)(366004)(376002)(66476007)(52116002)(6666004)(2616005)(478600001)(66556008)(54906003)(36756003)(5660300002)(1076003)(956004)(66946007)(186003)(7696005)(8936002)(26005)(16526019)(86362001)(316002)(6486002)(83380400001)(2906002)(8676002)(4326008)(109986005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/tm2zrWEwrFKobsbJaTiVeMO8J09kIBRU13A5h+gP2B32DPdX6kc5wplCdBv?=
 =?us-ascii?Q?cxmGGkb0cpNZOo+da7LAPPDhSNMXmKw3xnzWGb48ZnrRSBtR99u/izb6WtqT?=
 =?us-ascii?Q?HEmmt/lFBmRsAzMQSKQqvMvp2+kofTp8Uth8d2NKFvIo1zZ2+4Hg7d9HwZuM?=
 =?us-ascii?Q?KH5J9kYCO892rBKUpwh51TGsP9XrjP7qJuHaBoMegU+8Xfn+MMHCBXu1tSzM?=
 =?us-ascii?Q?I6TCH9WW3YoOpAuJUBpvE0URblAiRS/WfBrZ0UgtrMxVdNmMtlwcY7k/JJVl?=
 =?us-ascii?Q?ODWVTXURdR92u9N43kWmZX2Ls6J2Pc5je0e0jqOvXyYy+QIWd6nF9ksg3WJL?=
 =?us-ascii?Q?pBwOHWZaRqVu4ElcWfpd7ZTZNHzD3Lb5XBvqErGYIrZUXdYwM24xjYWhVnE5?=
 =?us-ascii?Q?mVtO6oqY+kdVJLIjqT+5dkD4+IFRCv6t1Oop8h7Ot2W3kRSFTmMI/unMengd?=
 =?us-ascii?Q?Tzk6IulXQSRobUQmRd08B1aMrfBFmkq4S1db85s0+GsphkXJ+VHEF1bGrdDS?=
 =?us-ascii?Q?2kOfE/DqpiMaiKi2ll7DEj1go/EH5E7JpyaLUANkO2/UoyBnHRczKO44+ix0?=
 =?us-ascii?Q?CkhLq8+apy6b2ZXmbMYtj5mI2B7YUC38SAVfkNDyCQB8pSW1vxOkGXD2cG8Y?=
 =?us-ascii?Q?eBdrwFjLYAIiEXuBmQDDK1LfwWqvKB9BKDlApXA+wVoE2rS1X6kJCdW6RHKA?=
 =?us-ascii?Q?0yR3CYRhdz7oj+xI1eUdh4pHJb54HLSj43RIZqJhChYs9ppZ8jySuUZR9eLN?=
 =?us-ascii?Q?x1jFHa1VUV/VLMEvIuEcmWuQygku+TeBedx/LdIcmUJt1bkuTWQxOJs9Da6X?=
 =?us-ascii?Q?hM+vjYJ5t6xyY/0lcI80OU8M+lbZbXu0Pi6VaO5VGbzen/1TRFeVf74LAmm/?=
 =?us-ascii?Q?L6sK9u4uLhO4CGmtC+zEc2JrxpfF+6tGUQQy3HrrPYh28c62dtJOj7K8+IsX?=
 =?us-ascii?Q?HiM3qPGVA7HHUjFFLjvY5nwrBxbe2hPPDIe8mWPjVNlURbVzT8tu68wfe5+i?=
 =?us-ascii?Q?kch/?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 11:28:39.0483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: bf99c45a-e74b-4d23-3818-08d8b7b65fbb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvZ38EMnTmRfsyyq7kMieOovS/lyEUaMS06CIJi/dP5XYoKEOBW8Z7YkyTjfYJ98bkpomizsjhbYWL25rN74LDZg86jqw7FAF3lPiUCLMJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0903
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The datasheet of the PCF2127 states,it is recommended to process an OTP
refresh once the power is up and the oscillator is operating stable. The
OTP refresh takes less than 100 ms to complete.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 378b1ce812d6..ca56dba64e79 100644
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
@@ -630,6 +633,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
 	}
 
+	/*
+	 * Set the OTP refresh bit unconditionally. If an OTP refresh was
+	 * already done the bit is already set and will not rerun the refresh
+	 * operation.
+	 */
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

