Return-Path: <linux-rtc+bounces-3032-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C6A1AEA3
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84EFD16D3A5
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927D21D935A;
	Fri, 24 Jan 2025 02:38:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29C1D6DA5;
	Fri, 24 Jan 2025 02:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686325; cv=none; b=cw3bnqU9X/3DSUMxgZZGF/UGmD83uKapF94cVQ+G1tVXa1El8mXnNIAiscJOZtHFK1JnSxx3eH1tLYvA/wG1tW5o9zWF0/M1z/vopIFVohRLqCQgOLKIJcQcYHSbHWz6NpY3zCeYI82NOFO84BlOO9gXfFszNTj6MZk0nYTJWT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686325; c=relaxed/simple;
	bh=26KYzChB3hECJWOSy+Gbb0c0qlL5k0uZ8wlfZh/AObY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOGTLY7Y+ieg0qdAd4LGn4lvvYGT1X4MP/dcc6tOTa3sBolkuq+kLx5Mx9W+jgM8/TY1Soxed495g0zRMv6vESls/0XROX5RxBClphLeJa/PYjOJaAKy8UI5a6dipilSd53Mi6gIyDSU6ZThtJ+kfXTc8UeFrHq1tyOaGjwdft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YfMNl0nVhz1V5P9;
	Fri, 24 Jan 2025 10:35:19 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C26F180216;
	Fri, 24 Jan 2025 10:38:41 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:40 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:39 +0800
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
Subject: [PATCH v1 6/9] rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:32 +0800
Message-ID: <20250124022635.16647-7-lihuisong@huawei.com>
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
 drivers/rtc/rtc-ab-eoz9.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index d2b60487d462..de002f7a39bf 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -426,29 +426,9 @@ static umode_t abeoz9_is_visible(const void *data,
 	}
 }
 
-static const u32 abeoz9_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info abeoz9_chip = {
-	.type = hwmon_chip,
-	.config = abeoz9_chip_config,
-};
-
-static const u32 abeoz9_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN,
-	0
-};
-
-static const struct hwmon_channel_info abeoz9_temp = {
-	.type = hwmon_temp,
-	.config = abeoz9_temp_config,
-};
-
 static const struct hwmon_channel_info * const abeoz9_info[] = {
-	&abeoz9_chip,
-	&abeoz9_temp,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN),
 	NULL
 };
 
-- 
2.22.0


