Return-Path: <linux-rtc+bounces-3031-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CEBA1AE9E
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394BE3ADE11
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80821D7982;
	Fri, 24 Jan 2025 02:38:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4151D417C;
	Fri, 24 Jan 2025 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686323; cv=none; b=U7Vckg7/9ePagn82VMDfHXz8EaKoQjVVZLZKiKr+3yEoH3GisVj5yyi9qZzfXOBymTyIjU78p8BY2I+wyNR0CSi9vFiD3gGeG4FPYkwhBVP4xWj4582XxD5VeAVEXwXBmHRqxtBbQ+UxJl99BLZpggko5pSn7xhlA/wowG3ELfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686323; c=relaxed/simple;
	bh=9R4EBb0QHSNQehDQA1zgOuXZJ9e4ixUJtG9sqepfvAs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKBCR5qv3JKEvteq5mvFj4aOx5kdhWFPC/6ZdP85dgrK+DxA38qHtxlMSC6goi5vwKwWoRguw6hx27JAg/YWkDIRSy0VmuARGE0Vv4HyZzUAoVTofeyWF9m26JKvVHyOFAmrpUqr0nMQqnC+1sCcEucDdsNe1XxHtzqlRNE5lqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YfMRP3MRCz1JHym;
	Fri, 24 Jan 2025 10:37:37 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id B2988180216;
	Fri, 24 Jan 2025 10:38:39 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 10:38:39 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:38 +0800
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
Subject: [PATCH v1 4/9] net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:30 +0800
Message-ID: <20250124022635.16647-5-lihuisong@huawei.com>
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
 drivers/net/phy/marvell.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 44e1927de499..dd254e36ca8a 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -3124,33 +3124,13 @@ static umode_t marvell_hwmon_is_visible(const void *data,
 	}
 }
 
-static u32 marvell_hwmon_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info marvell_hwmon_chip = {
-	.type = hwmon_chip,
-	.config = marvell_hwmon_chip_config,
-};
-
 /* we can define HWMON_T_CRIT and HWMON_T_MAX_ALARM even though these are not
  * defined for all PHYs, because the hwmon code checks whether the attributes
  * exists via the .is_visible method
  */
-static u32 marvell_hwmon_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info marvell_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = marvell_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info * const marvell_hwmon_info[] = {
-	&marvell_hwmon_chip,
-	&marvell_hwmon_temp,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_MAX_ALARM),
 	NULL
 };
 
-- 
2.22.0


