Return-Path: <linux-rtc+bounces-2536-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4699C5B73
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05971F23198
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ABC201255;
	Tue, 12 Nov 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NnGaa3np"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAB201011;
	Tue, 12 Nov 2024 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423977; cv=none; b=rBueD8Xe6N8eQ+8CSQmOjQz/GffplQcEF7AsHbXjZghMes5M7IztuhaxcyeRHwYXrRASrxY30R9tCWKVu0bSkTwaSm0060GvDc80PBF8PMNQ1SXX9X7J93GTsa/Ei3vrMrJMFhBOr+n3ckdnm0r+WWNk2niLsGUrtMeiRXwAjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423977; c=relaxed/simple;
	bh=N4YbOxm/e8Fp5i5GgytIcVBX1Z/+wWgRXp6q8OY5vS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5WqP/50zfq/iAmBj7sSzQDgSIaiSGfS51JaFR+DKwYQNHArCf2f4R970ux2fpxfBC/MHjc4IFi3tzpIxH0DUfFGYHJX1wEdziCI9s7h8ybZiI2oCFKVFUmpOV9LwaNd3Y+FqrBFMNt/ZcKUqFxOdielH4jUdN9dDxOn5UWLOvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NnGaa3np; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1640C0004;
	Tue, 12 Nov 2024 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731423972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IMAhFDfTpmZ0UC/egHK5T4BtGQbZCoxFYJ8OAxhJDPo=;
	b=NnGaa3npu9O5toVQeNHWL4WwOFwDUpAqaoj9b1wf0ZbrURim0fjE3nhWjn26iaso4swTJz
	vf7CWaoZpw5kWq2QvVPoT692PkaPXdPDaSEDOuxY9cID9rVl1cD6v3o2HBi/55ZcIw1bxH
	GuRJNvyEEuCTOgJxxqSwk+iBrNWjvbTORiAiLiIZffU6ldZRhb5Zp5hffPoVX5aOg3o3f4
	3lYjtgp/NS6ZNK/idGbe73QS3BL/W6S1WYnhIt1TRbeOqT2InN9GeHOVm+ldiQ+5U4h8xh
	gc5rF49kqhyivyMc0mtI4Ca7Q0bxSyBzsJC/T2oSyJuHezM0Z3yCmxteU9kdFQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ab-eoz9: fix abeoz9_rtc_read_alarm
Date: Tue, 12 Nov 2024 16:06:07 +0100
Message-ID: <20241112150607.3450063-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

abeoz9_rtc_read_alarm assumes we always read the alarm in 12-hour mode
while abeoz9_rtc_set_alarm will always set it in 24-hour mode.

We could support 12-hour mode in both functions but it seems very unlikely
that the RTC would be set to 12-hour mode now as the driver has been
setting it to 24-hour mode for a while now. The setting is undefined at
power-up and unchanged by subsequent resets which doesn't help us.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 02f7d0711287..c9448c279ee1 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -64,7 +64,7 @@
 #define ABEOZ9_BIT_ALARM_MIN		GENMASK(6, 0)
 #define ABEOZ9_REG_ALARM_HOURS		0x12
 #define ABEOZ9_BIT_ALARM_HOURS_PM	BIT(5)
-#define ABEOZ9_BIT_ALARM_HOURS		GENMASK(4, 0)
+#define ABEOZ9_BIT_ALARM_HOURS		GENMASK(5, 0)
 #define ABEOZ9_REG_ALARM_DAYS		0x13
 #define ABEOZ9_BIT_ALARM_DAYS		GENMASK(5, 0)
 #define ABEOZ9_REG_ALARM_WEEKDAYS	0x14
@@ -210,6 +210,7 @@ static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 	u8 regs[ABEOZ9_ALARM_LEN];
+	unsigned int hour;
 	u8 val[2];
 	int ret;
 
@@ -221,6 +222,10 @@ static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret)
 		return ret;
 
+	ret = regmap_read(regmap, ABEOZ9_REG_HOURS, &hour);
+	if (ret)
+		return ret;
+
 	alarm->enabled = val[0] & ABEOZ9_REG_CTRL_INT_AIE;
 	alarm->pending = val[1] & ABEOZ9_REG_CTRL_INT_FLAG_AF;
 
@@ -231,8 +236,6 @@ static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	alarm->time.tm_sec = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_SEC, regs[0]));
 	alarm->time.tm_min = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_MIN, regs[1]));
 	alarm->time.tm_hour = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_HOURS, regs[2]));
-	if (FIELD_GET(ABEOZ9_BIT_ALARM_HOURS_PM, regs[2]))
-		alarm->time.tm_hour += 12;
 
 	alarm->time.tm_mday = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_DAYS, regs[3]));
 
-- 
2.47.0


