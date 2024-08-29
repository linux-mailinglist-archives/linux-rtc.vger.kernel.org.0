Return-Path: <linux-rtc+bounces-1771-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F43964419
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28FB282374
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815C91957F9;
	Thu, 29 Aug 2024 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MSvBRsEF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2084.outbound.protection.outlook.com [40.107.215.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4315E5C0;
	Thu, 29 Aug 2024 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933721; cv=fail; b=G+pMhblb+WV290qnvoO8gNII9whD/W+VS1NRhESqpMiLodoytMRl7vkIaw2xhbDobxjjrFumK1HVvMesDNvrkAjhmL3T84wXdStPmHtqhZ9ErkFv8wKFgie81rZMNm3tAvI//ewaBTL81XwIA5OQ6bOgCHvZMGlWc0Muf/jf2uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933721; c=relaxed/simple;
	bh=bVEEBr4ewNWxP0v/L3lvL1Vdj/Q7GZjpzFEisYNxeuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q3uM4lXrtmgS7oF89w4YAZT5NM2VZrqFzvrm+WkN+4uwg/pqs1r+P8HnfPGmM77Dr0RfeX9oksQHua/2R9Ei3NX3vBp2FPNAECwimbJr6lfs8Qy8tgHUhfB39DOqZPvOX/YI1uM/slDIlT+1Tj2pE2voHDxVFwbEOlTAMmjBjkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MSvBRsEF; arc=fail smtp.client-ip=40.107.215.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKitntKXWxKt3NeJPVoYVLlu2b9Ee5LjDmR9IJYGt/zvRRHoDqn01Whs5+uqNsSgUJABDWLwUp9akwGL6oQNjcGoPw6DMYJRtbTsi7F2cDiitgZUWZSAhg06uiZVOzIVUCdbyXdyTtc7iJo+fGhE+NWC/caL6HVqY3oUS6sKy7Rp8AQtKGGBr8Hf3n+oTk+gn4E4gtg1XJ/qLb7oMH56QkDINmnCVyz0MLI+oGkCWdiEm+NOX8/7KU8I/RdQOl5NmHkv1Ogy1G1nn1KMkdo1yCP/UANFTbe+M38RzQlpA9zbhRUHqwte1TeN3mcdSbVhJinQgJd05pmEw/RT0OiJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyt2vWOi7reV01AQW/h9DbbUrfax/jMVPV75+z24PTo=;
 b=mTEHMETlqObJZ4igix2dGECzP6TFxWVJLeL5mRwnSmLvD1Mxhtom7jHvcWXavMZH6zG8cEGvm85QVXHoL5zTi60S8KJRJYMfpeK3zYLkqtv0uDmwsZS8ZW624Y33CgZwySiN/H+scp864Yq+XLEzC0S7c2UAmuE8Zr/havV4bOsMu3l3NQJxUjCY33TWpi+gXIy8VyAFy6BGIi6ZHhYtYPCfMe/EE0Iwekwjskcd9jErD4xpPIhCmuQZDCgoIKQmRTpo1oh02c5HTMJV7JGiRdrmQMrZURlVFoJMqPDgvNPTPWGgbN6/SDMp3DE9l99vW30xTzbny92DH0fH0/1PrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyt2vWOi7reV01AQW/h9DbbUrfax/jMVPV75+z24PTo=;
 b=MSvBRsEF1mgfcFPvS4plA5YoSIg0KAplOkXpktOe0gxqNPkPFmc6LejNYhWNjPqscavGb65DEA91jepueLYRgz7otAptFD3houTweIgaAEaKtRVaKQ0FicPqxYBPCn4SnysUaKfCFDXfGFaZy7srgFDPPF0bdoomUhbPaDgPLZ2xNp9WZzGaCfsuNxhsm3jHTSYppxinPlxBNjACfeUDWSEDBb4W5OrZS5tPZvgia9QD9Uenw1Hm7gqnBm9c/fZDvbbTOioPv4VcAao61OwB4ar5O/1grRUIZAOpxDZjzWVsc4h6byflRqa0eO6LJGZZJCcxT9NzsVtEi6frGjltlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5352.apcprd06.prod.outlook.com (2603:1096:101:68::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 12:15:13 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:13 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:49 +0800
Message-Id: <20240829121455.16854-2-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc13fbe-9f6e-4b2a-72d2-08dcc8243c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g4jNOk8lHfgtYA/M0BWQzg3bkb7S75vDCHTQZ2/rdg3r2LrPK7vfP38R69hL?=
 =?us-ascii?Q?wQ5yH0CyBEeYSdAIViX/hO+f5t2acmT7+PmP5LJqEZ7ybJ2XJnxm2rabFtO7?=
 =?us-ascii?Q?qC/PqwHWD0x6eLqiM1/onqZpVO2k0WupFM1Fo4DEgdEZJmoqq0wTBz2eLSgD?=
 =?us-ascii?Q?VnA00ziADZoKY9QxNPxpwMLR34fXlXGZJGhZXfya90Tm2xpcV/wcjORikxOJ?=
 =?us-ascii?Q?/zeMc11SgJ70HbURjEShzne2u4enQqjTXVmFKKJeKCFp43q7UhMO6oRiSdHl?=
 =?us-ascii?Q?gKG50F8BL53eQThaAt5gdEK/pH6Ukh/56zkrALFfvAWjmNYAaruS4s2rzFvR?=
 =?us-ascii?Q?RlrhZQQmt41H9WNB/or2H9bdBzBnEDZpXpoVeX055PveH+xXMKxJWI1uE8dL?=
 =?us-ascii?Q?pHZ7EMIQ4v6rK0YFSEJS/As7Ml9EOPG8TFh3Q22QlCctfLIHhoHwFTFNUmR6?=
 =?us-ascii?Q?CCmdnvBUSncbGpFi0k3THrpUTz44tD1Xsx1Eqcm7T0oaoP1cwndcQ8i2buPI?=
 =?us-ascii?Q?zfIrgL9viLB1E2oI6OEfFGHWd6ZPpvuafSqia1ba9sdmKxIMeuyX0iIhzDUD?=
 =?us-ascii?Q?WPSPwJGKsHSkHTb2ALstrfCkelBTPU0L21Kx0B0L/f8wEPsIqbId1bHJEXNs?=
 =?us-ascii?Q?ZR4MZ/GjU7w13P8mqtdUY8vUbioiL8gox/5FhkuxHdWVKmK7PdLHrhizlQgS?=
 =?us-ascii?Q?lrMLfKBAuXsgN0v4XV/+G1rBOkCzp8rNbFBgp0A1777aSS6BADlZLEU3ZFAm?=
 =?us-ascii?Q?fAW4xcY3yg2IN5pAv3ER2RRFYfmVlDF5NQPZefjJaqZtgP943yRp5iscrYcP?=
 =?us-ascii?Q?X9H8GPIUQX+C0O9t6rWkR6bBj3LD8uZ+xNBRNlI+QogkG0/jt1ZD56yUJ/o5?=
 =?us-ascii?Q?VWJsnMM0TH6OLT7KOp0z6+OgseCCUScqi8haKq3sckQ9JRB1dSUmnBlKU66s?=
 =?us-ascii?Q?AnOwLX0BP/9dfKh+mJP/gHXQIDMhmEnqr9c+EXyyIFY0wjwXUOMWtcPs1JS0?=
 =?us-ascii?Q?Wv2Y7lDFV69EedZmwP+/a4L3r+o7qXR3mPTcHOfYL7FMLOUcmePvBoioc2rz?=
 =?us-ascii?Q?/PVD8cNtFDpG3ZCBDDZC9fG4eJTRxaYFM90MqsauBmXki80mUTOfF4W7WJdP?=
 =?us-ascii?Q?6eSxroXAOWYNbRFpZXr3jqilquVi1ENimISnZkTLyrqhaPyZxm0cI0rTVoIy?=
 =?us-ascii?Q?+AwJyk6VSXzvMvXum53aFbALS1ycaM1lXIt0yjz57jooVbsAneg3mu9ET/L0?=
 =?us-ascii?Q?40JeQuWQRy/LPQPgnLZcbugl3JD3Y/B77Mjuzmi+w0+lm3CxtBG+6s7TZjYs?=
 =?us-ascii?Q?gi4LPWEF+ae3fprbTSzZ/UuLh58OuzSpO3SLTf1y7vR2SvFa+16WQhuVIvFS?=
 =?us-ascii?Q?p5K+lXBFqiTmaeMl87NcUcsAGr7NRv7hUGztY/M8NHo4hnNTVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RI5yGeAdbfVimMBeVd0LqdxkkNNKUfQ3w6hkP1VVOid5i84fSKz5NZmuI60u?=
 =?us-ascii?Q?v0BtDqFzQNFUlsfMRMJKalkoY/NI/qj70TwbQrk7s4mR6L+pR14jz1B6TsZ/?=
 =?us-ascii?Q?hs8flJdhK9T3SrUO7FLyCI+AYJ41P67GUNO/4ByAyuh0VLwTefQTn+C5BiIG?=
 =?us-ascii?Q?WKG6rw7zzYbTe12VdXrlcjf4X/KUt8uFDqwmk5VcxXDr0W4oAToP/+/8BlmB?=
 =?us-ascii?Q?Z3d/sQpWDhxZaUGxQW6eSP4YLCNYBnvufdgNEEJu85hbxmlcTEfvFbsArNHS?=
 =?us-ascii?Q?RZbnP4+t9q1zp+6Le8Tx+StKq82ExtJOF3+ckvGrOBFKLIbNhHqBbZKoXk4x?=
 =?us-ascii?Q?A8ZOoj+izkLdWuoL3hPRhvTX5KAWHqySOxi3sonRQ3M40WLGwo1PKSDQk4fM?=
 =?us-ascii?Q?dWBCQvx/M8coNnOWc0V+MCBTMCunyxxcEU9af462NY2EtCB/SIwrjaP5++LU?=
 =?us-ascii?Q?NOira1DuJO1iJHRckiYv6W2lOwb1gsTtTeJ+BMrw9Ap/qjbPjl7SdXh0Gp1w?=
 =?us-ascii?Q?eQGJTrRIQBdp6L4fZUVjkSHt1p0Ma1dDKmszacHV18QtlkMoyObMzqoyzLQr?=
 =?us-ascii?Q?WuorH4J4PjR0h7EZkXU7ovWxslj88ZkPryUw6Z3Tk+9TrvFt6gKG/1ob6Y+P?=
 =?us-ascii?Q?waN6wXcd1QCYGUX7e65/Sp4WFdGYgOX+iQmSItkSvgLNfTPyB319LC+GLx2D?=
 =?us-ascii?Q?oyaPJ+I71YR04l3PzL3lVxZusLcd7yvfB511xRUi+svUD9EgeE8KwEVzqm2/?=
 =?us-ascii?Q?qwN0hUO47rfxRJRWzowrdFPd5Rz2IJE6XcpXMwkTQHr+RjuvuZmOF9USxkHq?=
 =?us-ascii?Q?cOxyfe9DWDycyt7m/UgKxLsH95uTnw2qFdWx2qBvwbvDLV0KpYsVIMPhnvYn?=
 =?us-ascii?Q?UW7wwjFdWveK9HYFHCI6Vea7RbAxy1t/iqnjh1LIi/qYMSTaKG/GLs0Zmd5Q?=
 =?us-ascii?Q?McPJGV1oeeW6kki4J2BCfEl2wlZi6o0gqNqzEXz8OkzZCSv7znhPJNuaCUIa?=
 =?us-ascii?Q?eHk9Mub1f5p19PrKiyT+JdvOLEscmoCwfNqL9eIVboPREBgcl48jspLaHnHH?=
 =?us-ascii?Q?96VHpt0wvBeZJ/uZx+BiHdexZZs9zt9gl6qbjRwzb92SuUYZkBW+RwjvpsWR?=
 =?us-ascii?Q?qkGwWpm9lJTm2tDvOfBs9MTCpihbY9YfrArEYkzePT8YutDA95gdXhb7vmob?=
 =?us-ascii?Q?joOId5kQCPgUvIqUUS+6i5IBkKrmQnbelVHundnwLkMAy6Y15rLhs2ifRAJk?=
 =?us-ascii?Q?M1Fg3n95sLecI5BP2ZHjVI/8nIH42FuhR4TTAH7QkvSTyoWTIQO0gieFb+53?=
 =?us-ascii?Q?K5MZNhJgejsParkhgW+CGZP4031YUiVyDqA0naTG+DulOiJSqivPaeC6VY0g?=
 =?us-ascii?Q?AkcmL/ftGOJ29AbDNu8uZoYlsZ5PsDUnjgo+XucZT0jjCZztQqFXcP3xB+ly?=
 =?us-ascii?Q?oIb3UevoF1VzeSdZP83EdmaGlKKPTR7nro7OhPPm4Mnk/i99kZc3CYgNKiiJ?=
 =?us-ascii?Q?kuJsNQZSGHMKO3y9t26Tv08vw34a7jAnlWhwq5WzIpDoHyyqVIGu+YFwJtHa?=
 =?us-ascii?Q?s9wXTyLQGEmtRwcS8BCKWkiHu/dk9581CbHMjjkb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc13fbe-9f6e-4b2a-72d2-08dcc8243c23
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:13.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvQyPuc3dgxGBsZ3SWsIz1mkb/3ozAsKd1SvyOX9G2CTFPcttWjBBaH7+07hE3LeG1dYJKUFIEj5mx5JRTVTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5352

Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the global sclk variable.
---
 drivers/rtc/rtc-at91rm9200.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..4d909b840515 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -104,7 +104,6 @@ static bool suspended;
 static DEFINE_SPINLOCK(suspended_lock);
 static unsigned long cached_events;
 static u32 at91_rtc_imr;
-static struct clk *sclk;
 
 static void at91_rtc_write_ier(u32 mask)
 {
@@ -471,6 +470,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	struct rtc_device *rtc;
 	struct resource *regs;
 	int ret = 0;
+	struct clk *sclk;
 
 	at91_rtc_config = of_device_get_match_data(&pdev->dev);
 	if (!at91_rtc_config)
@@ -498,16 +498,10 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 	platform_set_drvdata(pdev, rtc);
 
-	sclk = devm_clk_get(&pdev->dev, NULL);
+	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(sclk))
 		return PTR_ERR(sclk);
 
-	ret = clk_prepare_enable(sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
-	}
-
 	at91_rtc_write(AT91_RTC_CR, 0);
 	at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
 
@@ -521,7 +515,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 			       "at91_rtc", pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* cpu init code should really have flagged this device as
@@ -539,7 +533,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = devm_rtc_register_device(rtc);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
 	 * completion.
@@ -548,11 +542,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(sclk);
-
-	return ret;
 }
 
 /*
@@ -564,8 +553,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
 					AT91_RTC_SECEV | AT91_RTC_TIMEV |
 					AT91_RTC_CALEV);
-
-	clk_disable_unprepare(sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


