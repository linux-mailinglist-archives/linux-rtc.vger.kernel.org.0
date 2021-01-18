Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75DE52F9BAF
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Jan 2021 10:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388211AbhARJCg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Jan 2021 04:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388202AbhARJBx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Jan 2021 04:01:53 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F15BC061574;
        Mon, 18 Jan 2021 01:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEk4sPuE3rySn8tOBL65uGQIlwW04zOpAQ0eOvUuccLc2E1JC2liK0BvnvqkYNdIDCxPFuzQ4xaCkPEpwrk4L+Qw/CpoZzWrR8hPs3XeJ8fHAmuxPk1kWaHHCrir6Pd6ZK3XSZCcRrPC6EnicMubZTdZQ7Px9A8cR9bMVasH9Mq5iBfbpfL69DX4opAP3Og34Tnhxma5+EY8ZblrdZ/n81fWV8gtdZQp/ydPZboGL0KeAfFw6w+50FDgmJDtyz3/3t2JXEdn1y/C7lVIEbfApZ7qTximBZRG47JKFPo3lH31wHsJcSYkToWIvuV9p+VDYdLep29ATMMbZmGVpOJZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayV8tHh0DBw9U25QATcrsRzsrZnpGrhGxVzlrkXFweU=;
 b=QbB2VkphFLI8/U0xppjTwmxhqm6Hu3ODPtE87WSAPcCiYSnRlobMJnKVpVD3hRxLvzZTE9b28h6xzKrvrYk0ES6K8u3/1cPSLH57nJ3Pmb/74BhgrIKpD7LXwCy1mNK0NTUuewArTJpbOXHsjdXZlF+5GAq1WT1sE+tKL0hQa3UO6oKB07cSg3SXu/ULQaYNQ5Zpsr2kacIemhQMwuvR/qab1aLB6ZrA9vacFqXE8xaCvvrOfcN54sU1prg+73SGqzfO+7JSKWnB/5uTaGoaKSkNXzX+IaSxPmZlQnsByjiX9n1fzfB0dclDivhj8kA9SxA24VFn05LBClTkDCgsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayV8tHh0DBw9U25QATcrsRzsrZnpGrhGxVzlrkXFweU=;
 b=JtwznjJbG56GMdIuII1xtSyMovhIc3x6Rg/aAYxGwcK1lnD9Ey3Eyf609HesbIcCEgLPRwr8+MtqhdQaje/T14oj5atPWzGNv8JEdOMp4CYXPAM69oK3CphCuXVtyR+BmixEfjpYUi3xYtXSex8YBR4ORB1fSuwjeHWEyGVQEN8=
Authentication-Results: towertech.it; dkim=none (message not signed)
 header.d=none;towertech.it; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1172.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:367::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 18 Jan
 2021 09:00:54 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 09:00:54 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] rtc: pcf2127: Disable Power-On Reset Override
Date:   Mon, 18 Jan 2021 09:57:51 +0100
Message-Id: <20210118085752.5759-2-p.rosenberger@kunbus.com>
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
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Mon, 18 Jan 2021 09:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52174f97-4680-4354-5abd-08d8bb8f900f
X-MS-TrafficTypeDiagnostic: AM8P193MB1172:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB11727C8CEB2C48519A27D4F89FA40@AM8P193MB1172.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFkKO846FZn1hK1kPw2QIgdLODvEjRv0A3I0KUGWXcdx5hwW4zxIl6EI5Iz2YfL9lI3DFqwZ310sfnrj6yHKVBBUGGVI7bz3eGNUcG+EiE2ilp0axVSLQO+s0FkSn9sEU4lgNJfCOZS1e54yVpApTLJfJuleqlIzLbhiuY7UkfrTAn7AW9bTthdnFBggWKiKW8JGfOjYRtabSvjGVW4PVF4Bxlc1jSLTlUWpB2fJwnDEq/hRMc1YDtlTpSHjhoGkjl7sV+BJj1huInDrSt5IKD+W954Ue1nsacPpz3Bmzck5S+eZeL5Msix5fivbPQX5cVZSdpuxN6VI2wwvMIEKJPogVvx8sL1qvS2Iuo/dAtciOTXMQIgNisecH5DkAXlADpUChc7O9hfxFCon/YSD7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(136003)(376002)(346002)(396003)(366004)(66946007)(5660300002)(316002)(2906002)(1076003)(66556008)(8936002)(6486002)(86362001)(2616005)(36756003)(52116002)(7696005)(66476007)(4326008)(956004)(83380400001)(478600001)(8676002)(16526019)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HaGhNLqwTq+fNmcapTQR+GQCygyfSKRvn29n1t0VCxunTsPNn9dAqGB4eVyi?=
 =?us-ascii?Q?jCJLlgpQQXoRKzBfi/l2wM8Zh9vCX4Yx0yg1lXi9KsmEWcUSFyPtC1HSfHZc?=
 =?us-ascii?Q?rMUs2HPiRYxrHA6Hpe8d+u269Yhq97lnz7mlb2DOtI7YkhF9+4mWua/5CDvk?=
 =?us-ascii?Q?dGJ/9Z9ND9jCKehkyb/kX5ozwXdoUQmVKO403/1ArPuycr4aAsCEAgmSU//L?=
 =?us-ascii?Q?rzJU+kuF7MKOaICbkpH6a5il9hQml6cR54u1RZaO7OwUZ8cyIL0GG3kCTa4n?=
 =?us-ascii?Q?IBSXm3shyo7r5Y0pY9pVXkRl3JWyQ8FivbjZu9jAcOnhWCp9s7yMQbFsk5tH?=
 =?us-ascii?Q?dKuJEtTdPIkB6c+TYk7GB2uieF2MxjxAUyN1istWyNZvCj0w/LJdsrt4Id+V?=
 =?us-ascii?Q?JgQY6NW4o50kDKQ2/toDEIG6tGhLEoHTRklNnHa9WKpzb/oBT8EQ0/TBYlwa?=
 =?us-ascii?Q?bUwzchrMNmYlVvsH3etuKArLamlgjAReIza39sGBjCD9reZzKnEAVN8KtgxC?=
 =?us-ascii?Q?vLZRwpiGEu2tjeVLtw7NyozxaRlTfNHHZM4Zd3D+X6TTh50eKopZopqj3NdM?=
 =?us-ascii?Q?6G6LaiLVvxy2I78PwoSUbFysT+jnmhhFWeOvGV3/y3CIDLpSIptpv0QfABe2?=
 =?us-ascii?Q?LtxK9weYqW+4WGW6wF0GEU1DbF9UWuPLBjjKEP7ZEMYXiuoVnaV1z47Iq3RU?=
 =?us-ascii?Q?+6WTWy/VpjG3VQcZSzq35jedb/ivxgLSHIT+0eOzOW0tPpZnVkYdZgmol0Hx?=
 =?us-ascii?Q?SeCulqHmfiYRRfYswcvQiRRDLlHb81r9dTku6vSe8CAx9CFNuoNYltRv9Bxj?=
 =?us-ascii?Q?nBoZddeJFZ/H4X22lumO6bdNunTjef8RbW7Nj4UANFiZ1WpcZCFk5HpVznce?=
 =?us-ascii?Q?UtK7OQOvC4U1tolzcjJ8N0wRU+ue5niQJqLsHEDN0O8yER1oRlvB/m2Sdw0E?=
 =?us-ascii?Q?98q/7Q0ylzdezpSXrZRFRJuXuKMCA8/vkvfEUSpBx5nhLi/pF3CsYfRVHl8r?=
 =?us-ascii?Q?G3dH?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52174f97-4680-4354-5abd-08d8bb8f900f
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 09:00:54.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWAKEId4tg0uUQCpGXqFiIIkLrbWQKBIVYBjdnRcjSMbw5+VmCZfWEKTL7GTnpbX+DQ66E0myBOuPI0yR2R8WJC4hOc0vFAaJoQH9n6aYBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1172
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To resume normal operation after a total power loss (no or empty
battery) the "Power-On Reset Override (PORO)" facility needs to be
disabled.

The register reset value sets the PORO enabled and the data sheet
recommends setting it to disabled for normal operation.

From what I've seen on the PCF2127 and PCF2129 there is not
interrupted gernerated at the interrupt pin (INT), as long the PORO bit
is set. This behavior is not documented in the manual.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39a7b5116aa4..0e06907d3ddc 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -26,6 +26,7 @@
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
@@ -612,6 +613,13 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
+	/*
+	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
+	 * after power on. For normal operation the PORO must be disabled.
+	 */
+	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				PCF2127_BIT_CTRL1_POR_OVRD);
+
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-- 
2.29.2

