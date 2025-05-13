Return-Path: <linux-rtc+bounces-4091-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04692AB599E
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2345B864C0C
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0532BEC3A;
	Tue, 13 May 2025 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="WG5i3hYm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C782BEC32;
	Tue, 13 May 2025 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153197; cv=fail; b=Sxh8pJd41kbn7juyoJv0SpK7rRLIrAnGqF8uKwX4PlduxMv1wcS4F50lJTuCem4Syv9lO8YPK4xAK1Uz8V33why3xFwsmr1OdC/6i0pFRLzPVLA+8SyxlzXYEdnWQSust0dNX6jU32WG47q131eTEgPETIfVToGzvFx4KjJKJLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153197; c=relaxed/simple;
	bh=24WSwZ9HziFncgfmEHdK+CJPI626z4TUWeFg7imzPpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r2JGh94O+u9AK/FQRg6JkxlnvIYTwXsoF9Do10FwesrjSeJOLNiuk2cXwbSTRCbZTV6K42kZlHOpZx7Oeo4vNo+RYD1qBYAX8BbccRibt6REVmJsl0RO9V53mW5lXkPahsua+6WdBkEa78guSTLpgymOoEBw/psi2JyL8WC3yzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=WG5i3hYm; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mar9g0yS5ilr9DUHyOfjMdVWmP9wuCrpWZEEyHoe9BK6+1G/75bdDve9lRK+CWVfiGF71XO6FgzE0QF0jCVR4z8QBP7LaXOsE+/5ua1KkGD/FJj1J/ZvS9HYEkCtePj8v1gV1YI0gwn/FWVgayAYuqAHKkxWtEEKCE6Inhd7MqTq50AVAQkt95/qLJIJqL8S1mOLOD7tlCXO9sntB8LGeEDJsF2iJWg1om52/iNLBmjv4J+kMjMsPG9nOnt3ghK9oP/L7ZQvzH48v+FGrkpYA+ZEZW1dEOxSEUXao5ETGeNbfRfC34BD9yFQi09BR90lbKCpyBBZQ5kUehaToBlkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1STVCrl3CxR+qBC/GEUYJKf9+guog5hYar4kZSpzbI=;
 b=tSJOYOHTmsKvYr4DTACAcr1VvYLRlDo7Ur+jywhKX7EjiWM7IyWD50UhCm1tPzvh5s3ROUTz3JzxcXG8r7Y6bsfAdN7n6skfRPMJz54y+Y64Ztp4SKxJib5M9DgGwjOcBzDVqnRu7OBwfbeHchCtzNXufxK3rw3OLv+31F+/FSa95/4EFeqLTEJLzaUvQs1oOgcIQKdIibbtEwL9t4uxr8nRrxH8O+do9JaMdFFE/pOt/qTjbYO48CrzXuYdDTK00XEWBiQ+E73KfpVDjiJGzQldhtQ24Bmo1J5jzI0eZ5dmd5EZNH7jVySF6Ka4oHcS7hek7CPdBKcMlnc/OC8Hxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1STVCrl3CxR+qBC/GEUYJKf9+guog5hYar4kZSpzbI=;
 b=WG5i3hYmlKGVkdXg34Oz2wZwQQhEEtd4Ym69rWOG0L/FCXQaS7HlAe0gzT3WXLa5pa2akC9qj5jQMomgKkHToWci86YhfqkgqI1toHP/7mKoB4WLboVSOq+r7CdeBMCHV4uOVahmCeaPokqn/aU4WtSumOzXSFUkkQ7KlULkRuZTGUhdOjsd/Wet+W0T8wIuhaWjucV9ltTagdgkUsKJbWuCmKis9mNI4XBC5qebzMeddsbqdR5e7mrbop5kk6kCvOKWk8qhFwO/5K6vGi6Q2Tf4avSov8ywZQug4ZQj+1mhRm/D7uslfGOk5lASbyZd8nE/ByYw7E0EJO1bki8FtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:19:52 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:19:52 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 2/7] rtc-rv8803: add new type for rv8901
Date: Tue, 13 May 2025 18:19:17 +0200
Message-Id: <20250513161922.4064-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f012b14-5762-45a1-f7a0-08dd9239fdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HayxHCYKQbnQOH2mjsbK/qL0mc0e14jk/HXqEn9ZFyvFnniLa6JRDUP0TYuI?=
 =?us-ascii?Q?xcrURnAwFwBxD2WZmn7OfzuzTW7YVOq3UNJ29ggOgic7YY7iSmZm+7i4C3jn?=
 =?us-ascii?Q?NEcmw5lrg8SVhM9vcg1T90XgpRmlfrFP32oAMm1wnkOsfgQjeRNBFEYoyTwr?=
 =?us-ascii?Q?qpd0YF9zh8BfKfYfOoV/t3wszyueyyBEFhRGud47p7bKYBQdmF8Jh+AlGH54?=
 =?us-ascii?Q?hrQK7V2EObqvFflA3EZeAjY3KzrSU7hVINHRdAhgZ+a7ESKQZlGqpGniyNtW?=
 =?us-ascii?Q?pJIhjKAILn2Ns5v8v7oCr0ssYC3jL2QF6J+0OYZR2Zo79fX2F1UIGnvdRFZI?=
 =?us-ascii?Q?FvCS1yTiAiG89pz2zm9ukPOZw6vuC7FG0pAWLgIVqkE5rnz8SoYnS8UfJYvP?=
 =?us-ascii?Q?I1zQjp+EaU5GI1X73kHoU0iyoHgBRDt5SDJ1kM/wGgQYvngpDUXwQbO0fLYn?=
 =?us-ascii?Q?HiciA8u8O2YhlO/NyOeyyYTw9WdOrCCBjiPZon3cBDIehcy9LfMBArdcY5Pd?=
 =?us-ascii?Q?eoGC6QwhFTPM3L+wP5PDZUD+3GMAIHpje7yq/ouAU3bcCALC5n4+bYmoXC26?=
 =?us-ascii?Q?QLlsfVAsxFNi2Xqyi0I3DnC7aW1UKSMI0VmlHB6b797/A2tN4tNvyLkn0Ay+?=
 =?us-ascii?Q?aMdhkoFNzfY8ymm15onsZV334q8crB01E84ypT+lJ3TYpYzUH6lJQKgVxIrI?=
 =?us-ascii?Q?BANEd8HZBA6Pfv5Niwsefu9mPILuxi7ANdGVHJI+QeU1w0+0bpiyKZ/aXauw?=
 =?us-ascii?Q?n+VLUQFX8o8fj3D90xTtjByd1RwOi9E/63CQNmro+LQkK5aVllCCf6CgpXrj?=
 =?us-ascii?Q?295SKbl/1NJeBjIbyZWDR3nK6ZVhTtjt232b4dL4Tm1xQ4RLPn4+NL9CjHpN?=
 =?us-ascii?Q?BxTY9ihypauxHaa2gc5MWbSn446FrZ5nAy/8Jz+Xix4+FkBfNzdoye6X+16W?=
 =?us-ascii?Q?0n2TLIfq9RN4nE29ww0rgClE9NV5OLpPYfcqG9O0gH7EpdU3AGN4p2oqh1+6?=
 =?us-ascii?Q?hW9l/pusEHZIy5RwfuB/UOsqawjG+C0tf6UnIoVpDpo2pETtIsoybBORtDcI?=
 =?us-ascii?Q?t5FGagMS3jLVSnsZyzpT+2pdEoKujM2e47WhXPsGepke4jG6iZe0LXJZ3g/u?=
 =?us-ascii?Q?tKJIfznIBw63iJaLNu9WCUML/JapM9ktk06BDXaHqdhLUx0JEmIptY5hMQx5?=
 =?us-ascii?Q?YLcj/xXb0o2ZTpdh1ela76WGeEmtMv+k3625XdVBj5sx0074f4j1Yx75F7eM?=
 =?us-ascii?Q?G4sBA2g72bOlnD4eCCLxvqaiCFI1jswwIofwn9KryeSgcShuhj353FNTWPby?=
 =?us-ascii?Q?kF3M1h1GNVVeMuRK36XpL88xLZJWX0lrojzWlsu+E18MCtGAzDQgzkOoeXwB?=
 =?us-ascii?Q?79dl6zQQhnBhNGBwu0+oG8W8cdtXlpBkl1VbQtj9pFzvdqcFp1oGYCA0MwYZ?=
 =?us-ascii?Q?6bMNjIsir/ETp+xQL/v14F2x+g1pF8hebqQpamOydy4tFhZm1JoAKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Ku3VYMDSk6RD9TpRiRrXa7FrL9eCiDZH/XJEecPGFd2gHbzDEbvDIJaY1gD?=
 =?us-ascii?Q?jC3pt9BDcIZCTzOdbrQoK0wZEt8bdL08eU61YcCW9FBjUl26dE97IAfthhQJ?=
 =?us-ascii?Q?GxpXolUWKG3RPl4tWQBG7n71TZK7I9OYALOuHbrRCCKW2Vrd9yAsHS9PIfyA?=
 =?us-ascii?Q?748HtRH/k0p7jqtHphFxGkDGg4QRqXyTs7wy4W9UgJmSGIAnMPvDzKzrKjc0?=
 =?us-ascii?Q?PPaVEugMApMqM9wm9dsEjN4Nh3IJJH+7bwlWUqWV0bTmI5Rz+kU6HQ8435fc?=
 =?us-ascii?Q?g9Fm6kXJXZOwSAqd5fDxA3R/7duHrrOTaXHGe8afwBT3MKM7V1tB+NQma35h?=
 =?us-ascii?Q?ViPd5TS9XX8MnXO0flwv1ursBiesC480IQjxcF1P0/dElcz/B7MLVA7o+Hmh?=
 =?us-ascii?Q?fdIwwHvdaiMrlYzcdNyms3C5kn7HG+XJrAwe4qNBoMXvWZgOcUghdT0J4PK7?=
 =?us-ascii?Q?I2IaZksx4+/bnL7mhLJyqlIe38eaJQElaUvmTzZKCYTH8yfiUSTi52tgTMSD?=
 =?us-ascii?Q?ACKaOxpvraLB2rpVT80YpNWJ96Z2J/txrMy86/OiLcTbDzRyTKq2d9rwKUqP?=
 =?us-ascii?Q?Q+qT7jBsom4YuTWDSVMP2wZNec8VxuUaIIyHp2zuFhqSm6nrBV0CXBsZxABq?=
 =?us-ascii?Q?UxgdMpInEHNURZx94F3SXb8TubqdzSJMY0OtYEvcR4q4IUm9oa6j4/aDjtXN?=
 =?us-ascii?Q?5skkeprzfIYHlYXK2TyvnGT5ul73JoLxu9Jjc2Nb41fVEBaW3xvTs5Eakk8h?=
 =?us-ascii?Q?xnUUVAlliMlMS+imLuQuA2tCa7Ep7GBLKSGs5QCOl1oID/1qY3EMtaa+gghQ?=
 =?us-ascii?Q?WaDofbxakscuqMSo8pnelhSMXJx51g7Q9tQ5XsZlkxD5Hka/GYBL6KSxLoI2?=
 =?us-ascii?Q?SOMfy6CFbhfMlsnt4Y316ebhoSzreWvxguyjLBLtOc9nowIGMmZTpGOW4J4p?=
 =?us-ascii?Q?WgbPbo5MsBzj4EtfZp34MN3ppHnAKnBzw0bwi3QbGamSqgZx+X4SI4s6NdwC?=
 =?us-ascii?Q?Uh+oXpY6k0AhuuyDUwoP5h+K3zQQ5QmBoxAYito0JT6EBXE0gyRua/lePg+/?=
 =?us-ascii?Q?wNED/JVhXHtCKTHVzQU+JpPzqp4dN1xIeFua0mGR8VWtmHG1E7v0BOzdNgdf?=
 =?us-ascii?Q?VaVYGw4AM140JcLuVZEGy20g/a6UNZYWEXjGMfLSJqBhVk8sRR16CmI+B4r1?=
 =?us-ascii?Q?AiYbnKdIwe0W2rCKaoeOa34Wjp6SxD+l1uZWglGYSU8DZ+JR6YCX04NwDVqa?=
 =?us-ascii?Q?u5vdfp8NhcKV4TOh9TqW4u1fvA4pPKFNJam7HrSkHLDUxPhOICAxiKSP5jeb?=
 =?us-ascii?Q?FF83isM+B4mu+oBEjst3yWOjBAi1W+1AeSHA1fKp3Se1pmZElS2W2oihHIPc?=
 =?us-ascii?Q?JsMzR9TMoDIrASGA1qxtBXmatJr4R8WShQeYLq+tVMAMaoRIvJoAGYlpK/9K?=
 =?us-ascii?Q?xZiJQ+J4Xz83GeUPk63MH/KRwVegrsja0t0O0MK7eAk6K9lUedy9GlVfR7cN?=
 =?us-ascii?Q?D/4Wj6hhR0jDOmqveaoTzbbA0MXwQAPr6dW2UkFfqiFAC4sxn70Q+HoMVnPi?=
 =?us-ascii?Q?B0Lfuc86aVqsCB++85/0qZKCXV8CbgkfUaGexMLS?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f012b14-5762-45a1-f7a0-08dd9239fdc7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:19:52.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT1NJSokoNQlPrdyYxK6CY3f/UC+blB7+QN8Vte0ASApYiusCovE/YLyCaWUQ3KPW5RovamFPU8WNvBhQp6Kpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

The rtc-rv8901 has additional functionality (tamper detection).
To support this additional functionality the type must be extended.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 drivers/rtc/rtc-rv8803.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251e527c..50fbae931cb2 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -62,7 +62,8 @@ enum rv8803_type {
 	rv_8803,
 	rx_8803,
 	rx_8804,
-	rx_8900
+	rx_8900,
+	rx_8901,
 };
 
 struct rv8803_data {
@@ -173,7 +174,8 @@ static int rv8803_regs_reset(struct rv8803_data *rv8803, bool full)
 	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
 	 * the Epson RTCs don't, so we manually reset the remainder here.
 	 */
-	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900) {
+	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900 ||
+	    rv8803->type == rx_8901) {
 		int ret = rv8803_regs_init(rv8803);
 		if (ret)
 			return ret;
@@ -635,6 +637,7 @@ static const struct i2c_device_id rv8803_id[] = {
 	{ "rv8804", rx_8804 },
 	{ "rx8803", rx_8803 },
 	{ "rx8900", rx_8900 },
+	{ "rx8901", rx_8901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv8803_id);
@@ -760,6 +763,10 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 		.compatible = "epson,rx8900",
 		.data = (void *)rx_8900
 	},
+	{
+		.compatible = "epson,rx8901",
+		.data = (void *)rx_8901
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rv8803_of_match);
-- 
2.39.5


