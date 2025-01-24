Return-Path: <linux-rtc+bounces-3035-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F578A1AEB1
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E027716DB08
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79F1DB372;
	Fri, 24 Jan 2025 02:38:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33911DA2F6;
	Fri, 24 Jan 2025 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686328; cv=none; b=YVSldp3nPF/kdUZmARIysErgS3w69NaWH5/AN6kZU79LLnv72m6agFLFH9zP6jAQFuHO2I+Vcb2YpAF5QX8VCOPrVynm+DJJcqdoOOHSPSWDCs+sywW7WauQP+oBusscIRrduy6c8BnBGNgCITyS1on1pKGmWDW6gagHCZeNo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686328; c=relaxed/simple;
	bh=MHb9TyuXgUHeuarU9Yir/7RmkDw32ubVkuACnX19mig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqhzmsRgl1MKlLrm9ML7/wd47fhUezzntLUBlG+XvTfjQo60b7meDvNp28gY+qY1NKNKMUzekSVZcB0+ygjrTxxA4w2JVtnu8GQV/+8SUHF7dWZprMMd0UKTPv6+/KnXI49YCLNfITRKbOPgU6xQqIXvi4Mj0NuRHbIBBM9OGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YfMMw0pQkzrVWD;
	Fri, 24 Jan 2025 10:34:36 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B34E18007C;
	Fri, 24 Jan 2025 10:38:38 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:38 +0800
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
Subject: [PATCH v1 2/9] net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:28 +0800
Message-ID: <20250124022635.16647-3-lihuisong@huawei.com>
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
 .../net/ethernet/aquantia/atlantic/aq_drvinfo.c    | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_drvinfo.c b/drivers/net/ethernet/aquantia/atlantic/aq_drvinfo.c
index 414b2e448d59..787ea91802e7 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_drvinfo.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_drvinfo.c
@@ -113,19 +113,9 @@ static const struct hwmon_ops aq_hwmon_ops = {
 	.read_string = aq_hwmon_read_string,
 };
 
-static u32 aq_hwmon_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	0,
-};
-
-static const struct hwmon_channel_info aq_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = aq_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info * const aq_hwmon_info[] = {
-	&aq_hwmon_temp,
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	NULL,
 };
 
-- 
2.22.0


