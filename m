Return-Path: <linux-rtc+bounces-4004-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69BA9E660
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 05:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5AD0189A442
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3241885A1;
	Mon, 28 Apr 2025 02:59:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFACE1DA4E;
	Mon, 28 Apr 2025 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745809197; cv=none; b=NHUqwg5VxwCA61GGJAPiUk80nTcQjFV+TVu7EdV586GQxIOhWNZQvGnqRw54w2ZN6I4FmuY05KRbQwz6aJrjwGfRw7VQLTAZCbqhKTXrrpmV7vmshSc+qRTUhrMUDFClXuuH5dB5h79lyIV9yaEOkagAuM+oeKq34oT+fF9aMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745809197; c=relaxed/simple;
	bh=/QcFu8jTMwn4D7EBmAXB8sLko0XzPZNY3u8sLFMOwlc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=eT5QmMwu2do/7XLMQhLe+n/RZ5NnUUyoQWqdYm6KFnO/ZiriQuYg0G0Ntm7x6OqW7a6ZKszluABNK/FVKAdMIFxkmDolNMvJysVRZZv+I0HxIjYHJGJp3sm9bbBsk3EGA5LOtfbvwTcLgwE4rldVQBKyyY9tcz5OpKisXr1VBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=none smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpgz1t1745809183t446ab101
X-QQ-Originating-IP: yt5W9iMGYhv6nhUbpzCKD90bJXJC/iXzbFaZIaC4rV8=
Received: from localhost.localdomain ( [175.9.43.233])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Apr 2025 10:59:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10774730210279231519
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: loongson: Add missing alarm notifications for ACPI RTC events
Date: Mon, 28 Apr 2025 10:59:40 +0800
Message-Id: <20250428025940.980313-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: M8BaT0GEeXPxg5nrbAvk+UCRcnUxWSxI+pVua2GjS5uSb3Ck2wbqch5J
	UxHh9z4FvGYZw7jE594J2gXbe8D5eGwpeulyTaQ4RSV0wsgmh5JpxrvGVkGy/qQcHh6d0mB
	1z7wLJOavE/mrOFIFrrV8ieBvd7HHWD49ZFuD0ey1zg0TX794sJlEPzsRDJVvEC1E5uc3he
	EY0/uNbbMyrRUHWMIUImHBa4TrONMCZAjaTSuJuiWW1FcpZHrZMLQwxTA8GyMSeoCgsd/aL
	ptCgUrHIIxo7nSQ7RoNKWWdTU+IdWaADmqJji6il0MiNC2PPj2DBbDUMWAKAvnigDFpBIM2
	uXwkEfrXb83JUmLMoKJyIWWGXPFqtr/End5P4DI69ToJGzs1fnzcdAXoFKU6896EiM9ezl0
	KvG94lNPJc20laN1M6MKJ+t4dwbAewRaVT8PnkHYubi6Q00j9IwnlMiufy5+ZZOSbVJH8R0
	Sgyr6q/YsWwybbCF4BHfNwVXKUs8NzU49AIZYXY2ScW2X1tiJGWBL/tONNoVVfCoMNg3Jn3
	kv7YP9hsf8d4z55llCLyOjawK3FBc0C/PBDN/WUZlQO5ky6LpJh9HeQ1X6PD05bXNj1g3WP
	kpwhBnkgMCkjTWDxTDHtXvjH34Ri/sSs2zT4ZxQfQNipOVBa1V6856THIMy0VE4GfCBtfqg
	5ttN0bX9qzrFd268IjMbZhifvnjuYvdR10XeuRSjG2U6ePyNJzTeCRWdOO27tCghX0g0fdM
	o3mH+n3t67RkYvx8QORM1/cOAGT8IVIcG+Ow3Pn88dEYnd5U1z9qqnPaY795V3s+v0gC4fa
	oEAL3Esr+ynkHrlm8yqIqx0kr9/ZH3nopPzdJfZF9hiUMjYulnPXWPuxMaPyfFLwuI8VAZ1
	PWP3q5JWcCST+/pyBCg5ETpYQsYZg+8coKHczkt/2YFI8Tb/YQqwJqDL5wRuEUgIpkr0oKl
	1GIo44kOUxcnLmH74cWPdbwzJjOfpSiaMJ//wqtYxaigb2A9I6VijSQDXE2pqiIalBFoN90
	ftCpX0m/rWyMI6XvTN8J1RatoA/PvhFXZn71qHlNRFHx92Gg2DzoeOxhEaEAB/Kz7xmOe/z
	kYTniAnCLdz9GIQoY1qV5chHrRQILECvQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

When an application sets and enables an alarm on Loongson RTC devices,
the alarm notification fails to propagate to userspace because the
ACPI event handler omits calling rtc_update_irq().

As a result, processes waiting via select() or poll() on RTC device
files fail to receive alarm notifications.

Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-loongson.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 97e5625c064c..0c573f198f63 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -129,6 +129,8 @@ static u32 loongson_rtc_handler(void *id)
 {
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
+	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
 	spin_lock(&priv->lock);
 	/* Disable RTC alarm wakeup and interrupt */
 	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
-- 
2.33.0


