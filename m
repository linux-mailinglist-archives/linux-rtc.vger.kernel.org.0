Return-Path: <linux-rtc+bounces-3130-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E9A2E3D5
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 06:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724493A7F59
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 05:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03526189906;
	Mon, 10 Feb 2025 05:58:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8417ADF8;
	Mon, 10 Feb 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167091; cv=none; b=E3vj0MJ62eT1NzJS3u0Nsi792v+nTtf7xoUyI48X7vdBxyPjduH6/UmRaScnAzFQa+fJhvSOidj2Kun634Cc7e5flstWafx6Uots3RmfZ9KxlLiBlctP+ubyWbnOJEIhJirAZcf1chjwPMHmMbadbrMJgIWTV9GAqaenhcdgU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167091; c=relaxed/simple;
	bh=ab/y7cXj9QgjxXLU8g2+XSI1lA7YeSRH875MKtzI1Vs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nZOgk4DikXK9yjC6oSA/YF47E2+pOLHIg2QXUF4JDhD69l2LpBq88VBe5Fqz56Txbd6cXAfo2h1rOBELnry9VFJcQZD8vS21rJJ3Fqpc4ki5rMM/KB5vchOpgN7Pwsuz+Mnfxng6yKKf2TMhW/ncdW8rpiAdYxB5QTbpRijCHhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yrv0V0TfLz1ltZW;
	Mon, 10 Feb 2025 13:54:18 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id EDF0014022F;
	Mon, 10 Feb 2025 13:58:00 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Feb 2025 13:58:00 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 13:58:00 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 2/2] rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Mon, 10 Feb 2025 13:45:46 +0800
Message-ID: <20250210054546.10785-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250210054546.10785-1-lihuisong@huawei.com>
References: <20250210054546.10785-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Use HWMON_CHANNEL_INFO macro to simplify code.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/rtc/rtc-ds3232.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 19c09c418746..18f35823b4b5 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -339,29 +339,9 @@ static int ds3232_hwmon_read(struct device *dev,
 	return err;
 }
 
-static u32 ds3232_hwmon_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info ds3232_hwmon_chip = {
-	.type = hwmon_chip,
-	.config = ds3232_hwmon_chip_config,
-};
-
-static u32 ds3232_hwmon_temp_config[] = {
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info ds3232_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = ds3232_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info * const ds3232_hwmon_info[] = {
-	&ds3232_hwmon_chip,
-	&ds3232_hwmon_temp,
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.22.0


