Return-Path: <linux-rtc+bounces-6608-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG7SAbBVHmq6igkAu9opvQ
	(envelope-from <linux-rtc+bounces-6608-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 06:01:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3E627F3E
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 06:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92FEE30097F2
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 04:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4603A38D3FE;
	Tue,  2 Jun 2026 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUeiHmsx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E95362142
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372877; cv=none; b=VvsOEoG+YRxQdiewWfvARrCTkIJCicMpm/yKbLGjcybZa1hShLfc56K4fn0+XPBvSyCHa3xsmakIIVgvJvc3zl/kE2pBktQvs7su/m56352RWMDtLqcs1SKD4wCRODvt6+Tj/vgDTd++exhuoORBKn8aQpmV3FAKYn6a2i5Vmbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372877; c=relaxed/simple;
	bh=w4RrS/1X/Cdl103izoQ74z9z3K+9WPbGCMHByz3pGFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=er+/GcqWhosiKY+pYT4O8WG2mGa4yp83B/tdFDcZYXDUsHAfLL6PpBT3j04W5I3fovTS/rZkHKnk/OFny6qBEzp0Jvb1BlX27/w01KdLfpr/okexpM9E3CKK4cL4iig7qjIoZGuzkOockzaNuirpmLjwRBb57AngAeaQOa2zzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUeiHmsx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-91564c3a968so157698285a.1
        for <linux-rtc@vger.kernel.org>; Mon, 01 Jun 2026 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780372875; x=1780977675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A708eqRYyy4JW3JcLFUWL9EArqHUNZcp8V4wc4RJXSE=;
        b=CUeiHmsxVwpsMQJioi1ZbsJcUZZMsxfucQsAftGqMwZoba1k8YbbHKmjWBDW0sl6OF
         56xHtIx6kZOOUWQTdlZKh0sgTXvbevMl3eT8NQd+xfZn/1xU9UtCI0tx3brfNl+oFyQj
         WWTIKMZjH7+XXRYIWCRjEjAx28TS0s+ATruVZlXjV1PQ4azSKHsy/HxhNj4F8be0lL+t
         FYLvRhRUTAUbvj2d0eRfmJocSEJBiI7zOxvCkxtgFUV8TCD4Cb00AO91CqyAI7fNv1Yo
         sqhmF1WMqkXmI4rQ88ojDfZieQNWf7JQUxdjT/BL0pC/cdFpWYUnkNdQs4/9seL9rhEM
         3cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372875; x=1780977675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A708eqRYyy4JW3JcLFUWL9EArqHUNZcp8V4wc4RJXSE=;
        b=Tqpd7pa0rjJvQXWIy1toF5yON0IfiTYS4bZ8Lk1lruuMb1WSNeRpffb3Sp77nC8/Q7
         jrOwIY5rl9N+0IodF2xofffG1PrHAZubT2wOOuRZpZwaOIxvqW6GwYeeF3Jx9Zn0vdZd
         PwbrMZsmHHDqMgteZ6MN9tDTY7evnDHnXaKQkERAUhqj7f58k44wUqOsbJVmljYvhuOw
         fqKS5mqYDvy/Zu7wfJA82u2MF9forcTISpzjop+xFAnAFmq5mKEvJKn9ad7+7BTa23gi
         QeUhpUggw6Za0HvNEZCuBhYcIuLvSGAH+/bhzB9y628xMyey9ixoZ84PQybW+Tu+mDZo
         58Xw==
X-Gm-Message-State: AOJu0Yy7twVQfn9fBygt5IN0wBa3ScOQI1QJGbMlkKvQ1jQDVth/Kew/
	mNVAbHflxRre19AaOwdGr8e6rY1s3f9K/B1z3ZyOTU+W2EmDvKUMbzl/13GCfQ==
X-Gm-Gg: Acq92OHipIfO2aO6JF4G7WwP+OhAMTXYIqCfZtBwLJJRpgbb9iBpJQYX2yXtTv8dHlu
	CHgrD8tOquHrGwMy/svK2SuO+gTz7AXU7v7HHuGVhyiy3WKUgrhJKHjbVX9iCRDgQjvzGfNzkuX
	zww1ipsUamVtv8R+L/KFeKTuWv7DUB+j3INZmGZgJecSfRStRtzHf8+xv6EeKOf+MXmGe3VpM+L
	AouepZ4c1+Hy8+SODgPnIyNg+GUuPXMY0yfZwBsoTsKXvVjVgVG+HXCGs6e3In0qXboEZ5oUjto
	ytHnJwUhfyoTyOl/PgaWxeuzXkp1wGM6SuxijYVeM34IV5OAHbDh7X/sE28fe1jJ1liMUi8GnpH
	e24ebHGzgjecgH5w3hN82SZJLdMR52JmsfKtWS9i/+PaTgGdjPO65HBnLURHN+cO7M2EMLo+2DM
	OVPcn479xKQYDHfaQjH1dLq2UmEyr01IS9JyllUcowWtVsiFnBdmdwMeFOarU7o4Fc+DlhYP421
	f+JdgAiyfQGbjO8AaIy/XyrwNEqwYdF8tfDa+1w4UrAPQ==
X-Received: by 2002:a05:620a:608c:b0:90c:f935:490d with SMTP id af79cd13be357-915780456ccmr319020185a.43.1780372874581;
        Mon, 01 Jun 2026 21:01:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532473bb9sm1177794585a.11.2026.06.01.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 21:01:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	chleroy@kernel.org,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: mpc5121: replace in_8/out_8 with generic accessors
Date: Mon,  1 Jun 2026 21:00:56 -0700
Message-ID: <20260602040056.623844-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6608-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 52D3E627F3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert ppc4xx-specific in_8/out_8, in_be16/out_be16 and in_be32/
out_be32 to the portable ioread8/iowrite8, ioread16be/iowrite16be
and ioread32be/iowrite32be respectively.

Add COMPILE_TEST as a result for greater compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/Kconfig       |  2 +-
 drivers/rtc/rtc-mpc5121.c | 80 +++++++++++++++++++--------------------
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 364afc73f8ab..6d8935250c82 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1779,7 +1779,7 @@ config RTC_DRV_MC13XXX
 
 config RTC_DRV_MPC5121
 	tristate "Freescale MPC5121 built-in RTC"
-	depends on PPC_MPC512x || PPC_MPC52xx
+	depends on PPC_MPC512x || PPC_MPC52xx || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the
 	  built-in RTC on MPC5121 or on MPC5200.
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index b90f8337a7e6..c038301fb86b 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -87,15 +87,15 @@ struct mpc5121_rtc_data {
 static void mpc5121_rtc_update_smh(struct mpc5121_rtc_regs __iomem *regs,
 				   struct rtc_time *tm)
 {
-	out_8(&regs->second_set, tm->tm_sec);
-	out_8(&regs->minute_set, tm->tm_min);
-	out_8(&regs->hour_set, tm->tm_hour);
+	iowrite8(tm->tm_sec, &regs->second_set);
+	iowrite8(tm->tm_min, &regs->minute_set);
+	iowrite8(tm->tm_hour, &regs->hour_set);
 
 	/* set time sequence */
-	out_8(&regs->set_time, 0x1);
-	out_8(&regs->set_time, 0x3);
-	out_8(&regs->set_time, 0x1);
-	out_8(&regs->set_time, 0x0);
+	iowrite8(0x1, &regs->set_time);
+	iowrite8(0x3, &regs->set_time);
+	iowrite8(0x1, &regs->set_time);
+	iowrite8(0x0, &regs->set_time);
 }
 
 static int mpc5121_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -107,7 +107,7 @@ static int mpc5121_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	/*
 	 * linux time is actual_time plus the offset saved in target_time
 	 */
-	now = in_be32(&regs->actual_time) + in_be32(&regs->target_time);
+	now = ioread32be(&regs->actual_time) + ioread32be(&regs->target_time);
 
 	rtc_time64_to_tm(now, tm);
 
@@ -131,7 +131,7 @@ static int mpc5121_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 * between it and linux time to the target_time register.
 	 */
 	now = rtc_tm_to_time64(tm);
-	out_be32(&regs->target_time, now - in_be32(&regs->actual_time));
+	iowrite32be(now - ioread32be(&regs->actual_time), &regs->target_time);
 
 	/*
 	 * update second minute hour registers
@@ -148,20 +148,20 @@ static int mpc5200_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 	int tmp;
 
-	tm->tm_sec = in_8(&regs->second);
-	tm->tm_min = in_8(&regs->minute);
+	tm->tm_sec = ioread8(&regs->second);
+	tm->tm_min = ioread8(&regs->minute);
 
 	/* 12 hour format? */
-	if (in_8(&regs->hour) & 0x20)
-		tm->tm_hour = (in_8(&regs->hour) >> 1) +
-			(in_8(&regs->hour) & 1 ? 12 : 0);
+	if (ioread8(&regs->hour) & 0x20)
+		tm->tm_hour = (ioread8(&regs->hour) >> 1) +
+			(ioread8(&regs->hour) & 1 ? 12 : 0);
 	else
-		tm->tm_hour = in_8(&regs->hour);
+		tm->tm_hour = ioread8(&regs->hour);
 
-	tmp = in_8(&regs->wday_mday);
+	tmp = ioread8(&regs->wday_mday);
 	tm->tm_mday = tmp & 0x1f;
-	tm->tm_mon = in_8(&regs->month) - 1;
-	tm->tm_year = in_be16(&regs->year) - 1900;
+	tm->tm_mon = ioread8(&regs->month) - 1;
+	tm->tm_year = ioread16be(&regs->year) - 1900;
 	tm->tm_wday = (tmp >> 5) % 7;
 	tm->tm_yday = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
 	tm->tm_isdst = 0;
@@ -177,16 +177,16 @@ static int mpc5200_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	mpc5121_rtc_update_smh(regs, tm);
 
 	/* date */
-	out_8(&regs->month_set, tm->tm_mon + 1);
-	out_8(&regs->weekday_set, tm->tm_wday ? tm->tm_wday : 7);
-	out_8(&regs->date_set, tm->tm_mday);
-	out_be16(&regs->year_set, tm->tm_year + 1900);
+	iowrite8(tm->tm_mon + 1, &regs->month_set);
+	iowrite8(tm->tm_wday ? tm->tm_wday : 7, &regs->weekday_set);
+	iowrite8(tm->tm_mday, &regs->date_set);
+	iowrite16be(tm->tm_year + 1900, &regs->year_set);
 
 	/* set date sequence */
-	out_8(&regs->set_date, 0x1);
-	out_8(&regs->set_date, 0x3);
-	out_8(&regs->set_date, 0x1);
-	out_8(&regs->set_date, 0x0);
+	iowrite8(0x1, &regs->set_date);
+	iowrite8(0x3, &regs->set_date);
+	iowrite8(0x1, &regs->set_date);
+	iowrite8(0x0, &regs->set_date);
 
 	return 0;
 }
@@ -198,7 +198,7 @@ static int mpc5121_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 	*alarm = rtc->wkalarm;
 
-	alarm->pending = in_8(&regs->alm_status);
+	alarm->pending = ioread8(&regs->alm_status);
 
 	return 0;
 }
@@ -212,10 +212,10 @@ static int mpc5121_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	alarm->time.tm_mon = -1;
 	alarm->time.tm_year = -1;
 
-	out_8(&regs->alm_min_set, alarm->time.tm_min);
-	out_8(&regs->alm_hour_set, alarm->time.tm_hour);
+	iowrite8(alarm->time.tm_min, &regs->alm_min_set);
+	iowrite8(alarm->time.tm_hour, &regs->alm_hour_set);
 
-	out_8(&regs->alm_enable, alarm->enabled);
+	iowrite8(alarm->enabled, &regs->alm_enable);
 
 	rtc->wkalarm = *alarm;
 	return 0;
@@ -226,10 +226,10 @@ static irqreturn_t mpc5121_rtc_handler(int irq, void *dev)
 	struct mpc5121_rtc_data *rtc = dev_get_drvdata((struct device *)dev);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
-	if (in_8(&regs->int_alm)) {
+	if (ioread8(&regs->int_alm)) {
 		/* acknowledge and clear status */
-		out_8(&regs->int_alm, 1);
-		out_8(&regs->alm_status, 1);
+		iowrite8(1, &regs->int_alm);
+		iowrite8(1, &regs->alm_status);
 
 		rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
 		return IRQ_HANDLED;
@@ -243,9 +243,9 @@ static irqreturn_t mpc5121_rtc_handler_upd(int irq, void *dev)
 	struct mpc5121_rtc_data *rtc = dev_get_drvdata((struct device *)dev);
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
-	if (in_8(&regs->int_sec) && (in_8(&regs->int_enable) & 0x1)) {
+	if (ioread8(&regs->int_sec) && (ioread8(&regs->int_enable) & 0x1)) {
 		/* acknowledge */
-		out_8(&regs->int_sec, 1);
+		iowrite8(1, &regs->int_sec);
 
 		rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_UF);
 		return IRQ_HANDLED;
@@ -266,7 +266,7 @@ static int mpc5121_rtc_alarm_irq_enable(struct device *dev,
 	else
 		val = 0;
 
-	out_8(&regs->alm_enable, val);
+	iowrite8(val, &regs->alm_enable);
 	rtc->wkalarm.enabled = val;
 
 	return 0;
@@ -340,11 +340,11 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 
 	if (of_device_is_compatible(op->dev.of_node, "fsl,mpc5121-rtc")) {
 		u32 ka;
-		ka = in_be32(&rtc->regs->keep_alive);
+		ka = ioread32be(&rtc->regs->keep_alive);
 		if (ka & 0x02) {
 			dev_warn(&op->dev,
 				"mpc5121-rtc: Battery or oscillator failure!\n");
-			out_be32(&rtc->regs->keep_alive, ka);
+			iowrite32be(ka, &rtc->regs->keep_alive);
 		}
 		rtc->rtc->ops = &mpc5121_rtc_ops;
 		/*
@@ -376,8 +376,8 @@ static void mpc5121_rtc_remove(struct platform_device *op)
 	struct mpc5121_rtc_regs __iomem *regs = rtc->regs;
 
 	/* disable interrupt, so there are no nasty surprises */
-	out_8(&regs->alm_enable, 0);
-	out_8(&regs->int_enable, in_8(&regs->int_enable) & ~0x1);
+	iowrite8(0, &regs->alm_enable);
+	iowrite8(ioread8(&regs->int_enable) & ~0x1, &regs->int_enable);
 
 	irq_dispose_mapping(rtc->irq);
 	irq_dispose_mapping(rtc->irq_periodic);
-- 
2.54.0


