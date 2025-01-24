Return-Path: <linux-rtc+bounces-3030-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29457A1AE98
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47815188841D
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814D31D63F2;
	Fri, 24 Jan 2025 02:38:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586CD1D2B34;
	Fri, 24 Jan 2025 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686323; cv=none; b=B3MRI7KI3vVuv/tbzfXJEFw0Iz6xIkLIZ8D1QnujfLxJ6eQUenJVrokGvzA+6OOH5qfwAsaCCoDakNqTx8t5ZKOqzW60lU9ipH3Dh/4Oma9XS7O1bfb996JQACTg10vO2PLlcF3ERUBzGtyTngWkmnl6uFhEZn+kj9hCRy7olfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686323; c=relaxed/simple;
	bh=mWX/fp1URit59PoIjt60VZfGFkJQZLYn2jvxHT7rK+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4OuVNwpwCL//ZrcbHTflgtFMlNgWBTN1QNQ4mW0mpq/7QnyvQTaS1no2N9w7SHVLW9sKw0jaDVcYOOR3zXOrkZm+UnLegggNWyMTot8ToaBxgGWQLH4O0gD1nxxP6/1ltUoZU5C0Sfew7MmTqiY+IdUWbBNpPxqgtRYzjXwlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YfMRN62Ztz1JHvh;
	Fri, 24 Jan 2025 10:37:36 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 164A61402C1;
	Fri, 24 Jan 2025 10:38:39 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 10:38:38 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:37 +0800
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
Subject: [PATCH v1 3/9] net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:29 +0800
Message-ID: <20250124022635.16647-4-lihuisong@huawei.com>
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
 .../net/ethernet/netronome/nfp/nfp_hwmon.c    | 40 +++----------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_hwmon.c b/drivers/net/ethernet/netronome/nfp/nfp_hwmon.c
index 0d6c59d6d4ae..ea6a288c0d5e 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_hwmon.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_hwmon.c
@@ -83,42 +83,12 @@ nfp_hwmon_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 	return 0;
 }
 
-static u32 nfp_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info nfp_chip = {
-	.type = hwmon_chip,
-	.config = nfp_chip_config,
-};
-
-static u32 nfp_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT,
-	0
-};
-
-static const struct hwmon_channel_info nfp_temp = {
-	.type = hwmon_temp,
-	.config = nfp_temp_config,
-};
-
-static u32 nfp_power_config[] = {
-	HWMON_P_INPUT | HWMON_P_MAX,
-	HWMON_P_INPUT,
-	HWMON_P_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info nfp_power = {
-	.type = hwmon_power,
-	.config = nfp_power_config,
-};
-
 static const struct hwmon_channel_info * const nfp_hwmon_info[] = {
-	&nfp_chip,
-	&nfp_temp,
-	&nfp_power,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT),
+	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_MAX,
+			   HWMON_P_INPUT,
+			   HWMON_P_INPUT),
 	NULL
 };
 
-- 
2.22.0


