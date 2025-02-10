Return-Path: <linux-rtc+bounces-3131-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10402A2E3D6
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 06:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE6D3A81BE
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 05:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377F219007D;
	Mon, 10 Feb 2025 05:58:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3513AD3F;
	Mon, 10 Feb 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167092; cv=none; b=LIv88vKRft0FT607VgHruYPtLCjM+cS0vP0PeHL3ijPiYtLujtLf6AkCFCHf/rqJb5WzkifSz5pMxdSs6pfXL7HiGneiau/kQuqQ2XmYLuhZJQLpj2ej8zfpmP+idCiEQjGE6ap/nrB6mynsmtJP02PED+xAAq+UAVg2M4OclIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167092; c=relaxed/simple;
	bh=26KYzChB3hECJWOSy+Gbb0c0qlL5k0uZ8wlfZh/AObY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvwhZMTAe9ad0K9ERVDcfGEeeUBXmCe0p6iMqNW6SMi0UtSCZ/ZkUrHRcG3epzSAf2JeBG4I3QCxsc226v9xlCd6JGClzjSdTNw8DabFuC/6aQYTzFaV0iuBVqgsVIeijA9vclCtOlvdP8YVgmSt7Anlg6xJgpsYdSK26vD+5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yrv3D0KDSz1JJhr;
	Mon, 10 Feb 2025 13:56:40 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id C012A1A0188;
	Mon, 10 Feb 2025 13:58:00 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Feb 2025 13:58:00 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 13:57:59 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 1/2] rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Mon, 10 Feb 2025 13:45:45 +0800
Message-ID: <20250210054546.10785-2-lihuisong@huawei.com>
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


