Return-Path: <linux-rtc+bounces-3037-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21BA1AEB8
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB169188F558
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595121E1021;
	Fri, 24 Jan 2025 02:38:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20151DD866;
	Fri, 24 Jan 2025 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686332; cv=none; b=K5IuJrlpq4FNI4DxtNVtVk/sbIhIP2GyOdSancGNbnxcHu+Sbfu6lpDWoOJq+/avJYRcsVYp2GbtmEKNOSd18J+//NkCEviro84e1/TrDKEMkBJLNRKRXALQ9Hv7J3Y18/FYsqce0W6dnK6HNDOOw+kdyUeWNAHNktvlrHY0API=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686332; c=relaxed/simple;
	bh=58yZtom8YkhzuN+i9B1U2m3skibCey3Ih9LllGAW7Rw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9q1/KtGl9OpMnML4U0qOkJUPkak0qXMWRu1p176poWhewlX0Bvp0GHMHvyHd3yviQWVHZMq7CvjGlah/CY+G+c2Yt/rY7mZE/yjDicuJtJOTwWevsagnB0JdZvTwpk+jt+oUQa8WyDRn2rRJwxdu5aIPR+gU/ycUW570hya/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YfMPl08QMz22lS7;
	Fri, 24 Jan 2025 10:36:11 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id F3CFA1402C1;
	Fri, 24 Jan 2025 10:38:42 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 10:38:42 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:41 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>
CC: <oss-drivers@corigine.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 9/9] net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:35 +0800
Message-ID: <20250124022635.16647-10-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250124022635.16647-1-lihuisong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Use HWMON_CHANNEL_INFO macro to simplify code.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/net/phy/aquantia/aquantia_hwmon.c | 32 +++++------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_hwmon.c b/drivers/net/phy/aquantia/aquantia_hwmon.c
index 7b3c49c3bf49..02b7a2639bbb 100644
--- a/drivers/net/phy/aquantia/aquantia_hwmon.c
+++ b/drivers/net/phy/aquantia/aquantia_hwmon.c
@@ -172,33 +172,13 @@ static const struct hwmon_ops aqr_hwmon_ops = {
 	.write = aqr_hwmon_write,
 };
 
-static u32 aqr_hwmon_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0,
-};
-
-static const struct hwmon_channel_info aqr_hwmon_chip = {
-	.type = hwmon_chip,
-	.config = aqr_hwmon_chip_config,
-};
-
-static u32 aqr_hwmon_temp_config[] = {
-	HWMON_T_INPUT |
-	HWMON_T_MAX | HWMON_T_MIN |
-	HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM |
-	HWMON_T_CRIT | HWMON_T_LCRIT |
-	HWMON_T_CRIT_ALARM | HWMON_T_LCRIT_ALARM,
-	0,
-};
-
-static const struct hwmon_channel_info aqr_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = aqr_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info * const aqr_hwmon_info[] = {
-	&aqr_hwmon_chip,
-	&aqr_hwmon_temp,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT |
+			HWMON_T_MAX | HWMON_T_MIN |
+			HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM |
+			HWMON_T_CRIT | HWMON_T_LCRIT |
+			HWMON_T_CRIT_ALARM | HWMON_T_LCRIT_ALARM),
 	NULL,
 };
 
-- 
2.22.0


