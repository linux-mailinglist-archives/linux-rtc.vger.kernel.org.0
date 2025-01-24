Return-Path: <linux-rtc+bounces-3034-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4E8A1AEA7
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97329188C915
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FA71DB123;
	Fri, 24 Jan 2025 02:38:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C61D9688;
	Fri, 24 Jan 2025 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686327; cv=none; b=rzSEWkIpAOJY59ox78ETNhCFoN+tVVHXUkoZQJiA9Wn4fts7wBHluFt/99uhGpi5g+3Xv0Rip6g6nLdko1UiiZNtzVDKY55ym2qqwshOYixcyYIGOfIGtG3+MlRn8FRVNq5LsIjeR45JqbVZaJw/TrXiDwcQyi8SJotK9F8aZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686327; c=relaxed/simple;
	bh=PKFWxvHFx9wxQ8urCnfMAZp5c1gBL8z/TIwH0zZIVCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkhMcaeHHfCJ27glV0g2cE5JOSDoMqoA7L645EXuNmN1xdz9TbXwb+Ve8hx89NxUEUhSIQSHFCYTfSi8qtOP3cXKzr/xXXYJ6H4UVN/d1o4K3rTLQ5mMYK/QH9iSNpG9CdngvHjs/6CUw4eqK2/kirF80TMmAebMiGz4ac4tP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YfMNs4m11zcll6;
	Fri, 24 Jan 2025 10:35:25 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id BD46A1800D5;
	Fri, 24 Jan 2025 10:38:37 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:37 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:36 +0800
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
Subject: [PATCH v1 1/9] media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:27 +0800
Message-ID: <20250124022635.16647-2-lihuisong@huawei.com>
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
 drivers/media/i2c/video-i2c.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 036a6375627a..0dd991d70d53 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -264,18 +264,8 @@ static int amg88xx_set_power(struct video_i2c_data *data, bool on)
 
 #if IS_REACHABLE(CONFIG_HWMON)
 
-static const u32 amg88xx_temp_config[] = {
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info amg88xx_temp = {
-	.type = hwmon_temp,
-	.config = amg88xx_temp_config,
-};
-
 static const struct hwmon_channel_info * const amg88xx_info[] = {
-	&amg88xx_temp,
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.22.0


