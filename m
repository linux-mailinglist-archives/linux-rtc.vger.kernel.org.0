Return-Path: <linux-rtc+bounces-4521-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EBB060E6
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 16:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32B4B1C47887
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jul 2025 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2328CF5C;
	Tue, 15 Jul 2025 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LGenW84/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9A28B7DA;
	Tue, 15 Jul 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588525; cv=none; b=XI1rUbhEB57vP503GelVwOF8fmdlx1JhBL2/+q03UKRXYPbKcfD+hItogOdF3Lcx1l4kC7qg0otto1HCvc4fyr1OcgxezVp3bICF/dy279NbFecVwK5y8zdC/INgdz8O0fQb093p1uBHf6QOQ6iNwj3BBNJZOMv742Uyw3gMWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588525; c=relaxed/simple;
	bh=bD84GEfRQR6vG778sNfeT88KmtZvwXtN6RNOeceDXVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ednk/VBaLT5Aq95Cl3TPg78pg4on18r89idKW7QKShJIsK5W1r7UJWNIoGJ8Afq+DOiBFMSy3tNfTpx7A8CmABr0Pnda26NqPFvS6DagQxVWGCdQOgKJzKbr4xJr3QcuWeZon98UPoAnei4KzHgMAafl8jrNIX4cWI4SJZiBvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LGenW84/; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCHV1x025665;
	Tue, 15 Jul 2025 16:08:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yR8g1TnehdXPtqND1guWgOqQk7y3bbB49iAAeS8Eoe8=; b=LGenW84/agl32pbZ
	GwigvX658DWTobcrJ+pT9MxM5t30LUsgrpU3y9nV9rUsQDCrR1Yc5Q1xV7tVXi9G
	2nmBsOH5pDWMLdmAmO1glR4IXA6ngzObODaMVyOn/zVLQqPRpGLCRWm78CizJX1p
	AXfsmhc78BchuJzIibZm4fDC48CxYmMpbFxoc+cIvLPJLL7ZBtCbPxb3uO/PD1iG
	YAMfbHXtSG+MrHBkccO+9vq5o7uE9WeU35n10ljIbvLIkKcvhxjXax+ynJpCktI3
	ywjd4oG0PBEOUZyIFS3Q5TeRaCHcH+IpoMtYn2S7JPDsSCE2RGt8T+veM/aMPuA9
	c+4C8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nntncp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:08:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27D1040053;
	Tue, 15 Jul 2025 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4C02B9C3CB;
	Tue, 15 Jul 2025 16:07:25 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:07:25 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 15 Jul 2025 16:07:14 +0200
Subject: [PATCH 2/3] rtc: optee: remove unnecessary memory operations
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250715-upstream-optee-rtc-v1-2-e0fdf8aae545@foss.st.com>
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.15-dev-7616d
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01

Remove memcpy by using directly the shared memory.
Remove memset be initialize variable to 0 on stack.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/rtc/rtc-optee.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 6b77c122fdc1..b65953eb7ca1 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -97,18 +97,9 @@ static int optee_rtc_settime(struct device *dev, struct rtc_time *tm)
 	struct optee_rtc *priv = dev_get_drvdata(dev);
 	struct tee_ioctl_invoke_arg inv_arg = {0};
 	struct tee_param param[4] = {0};
-	struct optee_rtc_time optee_tm;
-	void *rtc_data;
+	struct optee_rtc_time *optee_tm;
 	int ret;
 
-	optee_tm.tm_sec = tm->tm_sec;
-	optee_tm.tm_min = tm->tm_min;
-	optee_tm.tm_hour = tm->tm_hour;
-	optee_tm.tm_mday = tm->tm_mday;
-	optee_tm.tm_mon = tm->tm_mon;
-	optee_tm.tm_year = tm->tm_year + 1900;
-	optee_tm.tm_wday = tm->tm_wday;
-
 	inv_arg.func = TA_CMD_RTC_SET_TIME;
 	inv_arg.session = priv->session_id;
 	inv_arg.num_params = 4;
@@ -117,11 +108,17 @@ static int optee_rtc_settime(struct device *dev, struct rtc_time *tm)
 	param[0].u.memref.shm = priv->shm;
 	param[0].u.memref.size = sizeof(struct optee_rtc_time);
 
-	rtc_data = tee_shm_get_va(priv->shm, 0);
-	if (IS_ERR(rtc_data))
-		return PTR_ERR(rtc_data);
+	optee_tm = tee_shm_get_va(priv->shm, 0);
+	if (IS_ERR(optee_tm))
+		return PTR_ERR(optee_tm);
 
-	memcpy(rtc_data, &optee_tm, sizeof(struct optee_rtc_time));
+	optee_tm->tm_min = tm->tm_min;
+	optee_tm->tm_sec = tm->tm_sec;
+	optee_tm->tm_hour = tm->tm_hour;
+	optee_tm->tm_mday = tm->tm_mday;
+	optee_tm->tm_mon = tm->tm_mon;
+	optee_tm->tm_year = tm->tm_year + 1900;
+	optee_tm->tm_wday = tm->tm_wday;
 
 	ret = tee_client_invoke_func(priv->ctx, &inv_arg, param);
 	if (ret < 0 || inv_arg.ret != 0)
@@ -241,14 +238,12 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 static int optee_rtc_probe(struct device *dev)
 {
 	struct tee_client_device *rtc_device = to_tee_client_device(dev);
-	struct tee_ioctl_open_session_arg sess_arg;
+	struct tee_ioctl_open_session_arg sess_arg = {0};
 	struct optee_rtc *priv;
 	struct rtc_device *rtc;
 	struct tee_shm *shm;
 	int ret, err;
 
-	memset(&sess_arg, 0, sizeof(sess_arg));
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;

-- 
2.43.0


