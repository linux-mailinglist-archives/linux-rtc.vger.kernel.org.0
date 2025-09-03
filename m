Return-Path: <linux-rtc+bounces-4796-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05038B41224
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 04:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F3E1A8579F
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 02:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007301DE2C2;
	Wed,  3 Sep 2025 02:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bl6KjqE7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013017.outbound.protection.outlook.com [52.101.127.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0411CEAA3;
	Wed,  3 Sep 2025 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756865072; cv=fail; b=ILOHfhufPZGNwFOw4yQ5jlhI15BxtaGLLXQpdG2oI3pBYVxRREAZ6bGMUV3ZlRP3TSLd4JWVZIS4028OpQPYNxbHoPLdT5Leef9yKk3Mioi7by/9F8rtjAEAZtegEwPYZCINryl994tFd0udmOLoA87CaEZdWl8PJGTVcIWUZDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756865072; c=relaxed/simple;
	bh=RjaYowFJOkBbl9Rudd7jxGkLg26sN90z1kW9ee0kt98=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=siI2bb0X7zgbn0fEyszD5m4Q513xNJMwXylOwUyBuxUcJIys5hTvjTmoNfeCf/5420ZdNvnsWmGi8beg5Vc4a2heHopaZoTv5tcaZAVi9FlAoRcYtyh+gFT6OdvJodfoyJRGL2fL6zlGSozbfBK3AC7X7gBpY4HK3Kr3ogtf1l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bl6KjqE7; arc=fail smtp.client-ip=52.101.127.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0bZT+xV+Vb3WKsUTIaInPd1dGzKN7v3An4g5TkXo2l9kSUEm24PpntrzzKWWgp2W1TD/3ial90IlFZMvwZlUBnYBwOcEYqVDkkKwnSbEs6XNQnaizapVGkDoRaT7zL0Zj4aFkTZAzPL/pwDMyb6oGz6R4ZHDb8xrYyjnLy+ku3Z4osILKaMLUXznyeNk/7bCfjdDMFa8cA4asLWouwbvUKhT1zjCjaWXRdQboD9KgMBjFW7IxDNd1HKcqTQPBnmzs1y4uVU/UeUTRuzejxlS3eqcI6hdFrbe2ZTYrosF2UjDkgQ54gxui5wS63UfRZfaOs/59f70qrym78avNyeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge24E2KTpLBxyvCEis9/kew7mTYfAhj30BJQsuuRsxM=;
 b=fXMF1D730mlBq4Qv560L23MVl5NzcaIvjl41SaBGlkOdKDDEYfDCyEsMbiNUU8OF68rlbZMEV3BwedGMCHMTYA75JEfZSdlaCL0O8hL7SJgX8h7zg2e+iesrAav+yNU5OweGSEoyVfF/FQtTI21tBanM37wLhQ0XkL704kLiB5EWGwvPs3LBGOMMz+w7cYiV6eyUNu5tNl9NfBtirWMxdZ95aQTLLUd9PT2Kr54Oz7FfR+3RYaELsDfpjs4IznK64GKWcehC2CZuKm+R9PZ/45K/5SsOwL7UX6QcAHzYSX7HvJnNGhLD3riwv3FATMTnjnRmCPHkX7am7C5mGD6xvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge24E2KTpLBxyvCEis9/kew7mTYfAhj30BJQsuuRsxM=;
 b=bl6KjqE7QKiwplp+q4hjxMwQ8loHTtTlLMK3TfVbha5x0U1l4K6kFR4+E9x86WJ8FkjjUusrXv2JwOrFo6RUKf7RF66VUlt1Q0++RCDIKe7TI9umFgip0OLpeCCIIQ18AkjY7EzGIRn4LzGATpRUE7qz7btd2ssOUPjRX2g/j4hXY9h0T2kfRRSl6eQEaxU+MOWQhEnJ3hnqnN1Z5kbL/ty2F/nFr6B2v86WxStGT3OWT/XdZELsaMww13xEij+/HwfDOc2e7uKOk1TrJHPEJBgidID5A4hhEw0Qsu9ENaKgZmy3oiMbTuyz1ZWsWhpz9ILPbYuzh241UWmeGCXxsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 by SI2PR06MB5316.apcprd06.prod.outlook.com (2603:1096:4:1eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 02:04:28 +0000
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5]) by KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 02:04:28 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] rtc: correct some spelling mistakes
Date: Wed,  3 Sep 2025 10:04:19 +0800
Message-Id: <20250903020419.563282-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB7330:EE_|SI2PR06MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a62c59f-b1fb-402a-09fa-08ddea8e36f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VWIEztRuvvHYGPV4yNvXNYgMKS+Iq+TOB//2069jnaLXWbjwA+pzYz+RyR/2?=
 =?us-ascii?Q?fca9W4f4uDpUMAmRRIeBh9dBwy5Ywrz+QT2a85TJoQh0M67Z2bcmCPRcdw2H?=
 =?us-ascii?Q?wwBQCz8jPeJorfoMvgAcnsygQf8wquV/by+5BOZkLozMGnuurq3TV8FIz8RV?=
 =?us-ascii?Q?n7rJxqxJaY2GjQr6KpS8OjFiiObOmr2IxoVnayFgmty4mBD0ce9Urlu3Y0y/?=
 =?us-ascii?Q?SMkUxrW9DvF/XAR5JqQJ+dbjttumYPKSu2Nn+op/vud9vQ6ajPYiCbvsFama?=
 =?us-ascii?Q?hadowfkS478Z6ASPexnoetLm04FTJjgKSYBB1/ePYUcIxGwnkKG1RXHhhs7g?=
 =?us-ascii?Q?j9rd8KwWr8cGXrfB5Nf1HMobGtnV/3UfjVUvda3IxbSE33vf3RkRpzEsgPvA?=
 =?us-ascii?Q?gkRTom7K5mqZRNRtLasNddeqodwziWC1VJgfYpb4dWF6egsyuDB68QQpoY1B?=
 =?us-ascii?Q?JoPk/QAKni2MudN6etNADXXYBnBLnJN0/cDxg0d57xUzbwHhdMOIq0cXKRcN?=
 =?us-ascii?Q?sZM1rfIqzrdjaTbhI1h0Zt6SouDs8ZEVgqLFAfghTIjZRRHzVkvE2TYz98nr?=
 =?us-ascii?Q?H6mr1+SXgwAWQuWXmMQRlse/AYbryby+Hoi4E1yt+6qFvw9HVqiC8QxeUrcv?=
 =?us-ascii?Q?grehHyliasZbzW0lbUCRAmhqrPm+0JcuRL2AmfxzBXuTSP3EsZFboB8oS51U?=
 =?us-ascii?Q?D562/6AvFsurHbot9vhUuKd6+jOelwNTA9vMVdz+S8DfDDcKEkUsO5hGpD/d?=
 =?us-ascii?Q?XMWAibeHNSWMgJGYNGHiSGRlCDAWBVzMdV9EzLvWwjX15WpuVQZAiqYqPAW7?=
 =?us-ascii?Q?XPku4GKFUjb2LPHrfCITDhEnqSKfdk1DOapcld5YR6F8GbxAepAJU9RT9WGy?=
 =?us-ascii?Q?fGgjHQNuV5x3bBvedswXjOZg5mC/H/wkYlWnnBaHxThiToKmS2B5brk7Anj+?=
 =?us-ascii?Q?kfwIWI46FUf2+UMuIONJb87uhTg3QdUJdaM4XVyQ6AQc8Y4aIZ3XL325u3WV?=
 =?us-ascii?Q?OVIF47QNRk/1S0dPCx4TXZNs+086hAr8cl1GVvvRtKe4HVLd13Aoa3upEIRP?=
 =?us-ascii?Q?MLd7cC4NX9fEjvUeNp14dpJU4eM+6p6AWNylcDn+jTt478zqBhszI2xi17NN?=
 =?us-ascii?Q?KxnhTKZM1mPpbtlWcOgVtuFYKRPNRK33HsL80J3WSl6wvL2e/Ogc/SVply+c?=
 =?us-ascii?Q?ncfPuXZPBXIj/W2hLMTCtuiQhk+v5ctCQVgbCHLT2GpKDyyqrMFJEu18Z1Qo?=
 =?us-ascii?Q?M8a53A4D1VotZ2C2LjIfcj/46oSucyjZhdAqMg0b+seludGG6ZlYNmqDKv2p?=
 =?us-ascii?Q?J/xDdfk5c7xZnACa0gJy+W0djgG1keSju9m/p+q4FfAPIM3d4u/glIwe7HQv?=
 =?us-ascii?Q?WsJDaDc2L7KzaN2TmwKlxhevpDJolrF/C+PYbdWZin9zGwBA8OGDHS8wHOjl?=
 =?us-ascii?Q?rUJCi/OwTxG8lhHPeNqS+rpnwz+zPs7EQYwy0JFMpoFRwOTyaYLnfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB7330.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y6E8tb/Pds7ikdztJ2YDwRh8BbG/CS7FanBTiWcZD8mAsN3oUNb842Cdi60n?=
 =?us-ascii?Q?vkUvTISyQXewFF1X6qq36cglOE7Sv9sgZeuMRYLNGu1Zd5s5AKiQW/VGiNT/?=
 =?us-ascii?Q?BjgjMw36Lr756ddAMi1GikUhDISqmVwtqXQQx9Qy8b+xgcKfmdPTRDvMhbTS?=
 =?us-ascii?Q?jP5Hm7AtWeG2tTKjD6IpNhQFfxln2Gz6pqm7yZ3Z6Vk2mahnCB/twHXVKYDT?=
 =?us-ascii?Q?bNqjlS/eXA9yMGYteeueZkud7WF41huUA12B5m9WF6Z7+rjNrQFxqpZhLVbK?=
 =?us-ascii?Q?RysTPZBD2DD2mMrspf/7XYEJ5bPa7rNQEdIkYsprIlFL/EZv+JeAQcmfVQ3E?=
 =?us-ascii?Q?QoQ/O2u6aaW/lbKEOQ8H9AUhV/aVF0m4sYj7+4lWUXwZ4zUEPdIk4MqP/MXi?=
 =?us-ascii?Q?zCcAepPzSoCikl5OrhMY0VDjNMGUzpzEIVRootE4PUvsp4ZxopUKKus7qpH1?=
 =?us-ascii?Q?ABLCBJm/tG7PhMQZZznpMa8stzOK5SAI7pL/K5K0QGhvdBJTDwv7lw1MgmGD?=
 =?us-ascii?Q?OisKoZllS4ALgo/EU+7OEu6gBdHajs7gcKKzKFgHM0T69B1l2WSXJsj5g5uP?=
 =?us-ascii?Q?yH2cEuiuBl7X0+N3zdLihAPz7Bf6gY9lXMJ8+f/J9l84GD23ft8a7Vrgp0M9?=
 =?us-ascii?Q?CDkthUiewZXp0uMlzQyyRNDZJmyBBy04qocSymQhx6jHjevXqKjuBVY42QYK?=
 =?us-ascii?Q?8qpLTtNGiWVb6evH67vdCUz4AlUwO7kHXStkBVzkE5a/oLUGka+mf0QmlSxk?=
 =?us-ascii?Q?As1GG4467YozRCfLAGdneZcrT5leDsgrgkYbCH1EtUV78d4jFOOFhCZcueqY?=
 =?us-ascii?Q?BPkDY7E6aNwn8PoG+5G48A6QkNqeC37fFWDMUuujOuUU7IfgJPzt8jpi1df1?=
 =?us-ascii?Q?ZrCMTpcNcShN1krwpm+P7be3JmFdPAYU//xdt+sN3S7LEv5yq0/bGXBNB72z?=
 =?us-ascii?Q?pM86om8aZrRP3F7EvId3j9G0ODEqG4NZORFAnmvGfPOTLxSKFwRQfw7eZmGi?=
 =?us-ascii?Q?zn7m5LfPlOmpegxNIskmj8C8tFUUlccsH1xsBRZAq+yswwrKCQtYrE1uqptC?=
 =?us-ascii?Q?kmdG0EqxqCCsY8MVOIqrWoTLTiga2Jc0nIm14fCZ38DdzLHgM6grgnqFjZDz?=
 =?us-ascii?Q?pal9x/4tL2y7WbUZaYl3JyS5/JqgAYWtiuzWdgOjRJTJPCj3ahOiLfipsjKH?=
 =?us-ascii?Q?UtJ2pmLU/tHLUmhWj8SDAQ56YGFj8sXo0GZDybpo9eeea0tZsvjhPH78HoYV?=
 =?us-ascii?Q?UszYOSAmuh2GO6G9JVhQKQEBmPULESUGfhYURutU624nQAA1wuo6oys8ZjTW?=
 =?us-ascii?Q?QxX0EBeK2YK+KNSlEryhAfjrqnOfdZMg5NWRL31fcttYrMk1IIQXM7pbK9Th?=
 =?us-ascii?Q?i4YAHAP3LDJetfrrgecjYmvlVdEhF4XZRXo2UDOfRz0mzqAMeMPKnZPn29de?=
 =?us-ascii?Q?Ds+kZUDu5FZ6ukgnf6fEXDcYhDHT9n+rD5/Z3ESfJWrAOPMzr1fF06diLNIX?=
 =?us-ascii?Q?gy4W9fusTKmuEN5d7dfSRgDPrlgPrdw3D2kQd1KgQ7V1/sHx4D+h7fWqHWlW?=
 =?us-ascii?Q?UK7EloQVycqa23lDQfPjKgdLwzUuaW3YlIkktNaW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a62c59f-b1fb-402a-09fa-08ddea8e36f9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB7330.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 02:04:28.7017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8NC4dw27Oo/pV2f7/0eesO9MI/NcaaaNMPMf+wtIATSAkdyOtXvtQhN3r/UJIDgEvzTjBgYgGI94kLApuGjSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5316

Trivial fix to spelling mistake in comment text.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/rtc/interface.c   | 2 +-
 drivers/rtc/rtc-s35390a.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index dc741ba29fa3..780a636560fe 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -608,7 +608,7 @@ EXPORT_SYMBOL_GPL(rtc_update_irq_enable);
 /**
  * rtc_handle_legacy_irq - AIE, UIE and PIE event hook
  * @rtc: pointer to the rtc device
- * @num: number of occurence of the event
+ * @num: number of occurrence of the event
  * @mode: type of the event, RTC_AF, RTC_UF of RTC_PF
  *
  * This function is called when an AIE, UIE or PIE mode interrupt
diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 3408d2ab2741..2f673f9fbb31 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -296,7 +296,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	else
 		sts = S35390A_INT2_MODE_NOINTR;
 
-	/* set interupt mode*/
+	/* set interrupt mode*/
 	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
 	if (err < 0)
 		return err;
-- 
2.34.1


