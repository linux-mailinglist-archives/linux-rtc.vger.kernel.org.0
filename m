Return-Path: <linux-rtc+bounces-2537-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E89C5B8E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BE51F22C15
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9F3200B81;
	Tue, 12 Nov 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ip0xutgi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963E43AA1;
	Tue, 12 Nov 2024 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424286; cv=none; b=K3RoQTmID49L+633hUuFuHsBTaMb9Z4MECV7Wgtlza7RC0J9jUV1BLoOj6bBAgo4w0aNAzATfJkpVo5FVCyEScsHiXcXS1Qgke9HvrouZ9mvIcEvAXMYxn3T6AsoyEWFsVGdip40EdlpNlBo5z+39RdQReYGEtCNRb9wIoJu+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424286; c=relaxed/simple;
	bh=mNQcuKMKs9WkN4Bp/Cnr0be/5mklf3kyEQiJd0Xw/5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pftcbjy5D2igLgDhFut/Zmd0iB5e0R8ARxiVPp5bwqBsa8L2Q1ZcWxSxuPtuLjCq645kUElc0By6vPy0chfsksiQ1cNwSwE2aa7Q5azawoqQ73TZjlwkCwobTidhDXGoFp2kLKL+e/XJvNROuq6nPRSdUfLnr4cXF/Nklv0vETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ip0xutgi; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A5C660007;
	Tue, 12 Nov 2024 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731424282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wtYYv5PUbJ77a03efiZ4pQ9s9mVP5SQ4dp9o7vG+bhc=;
	b=ip0xutgijU+5oT3vaZ6qMbY0/Fd203OE2X0js6IeT2uBer4qH4NhdW0Ilz5pAnd9EmLJPz
	pIVPx/xI3i+a/p8AZnJlHecfe7y43RYDZDemGavd2j7rj9dCkf0uNnLxhfhykN4YGHXYtT
	yG0YD6B2WzNcegL4UodEG8+FHkCPL1VMB+7Uem12woajXS5AGAnBDrvijxywl6QzKicKZO
	jxuCLRGjM7MLnAfETa1LGC2JsHeyiNgBCPCCNkZ2Ips6daXEMdoflOuu85L76xlmTYgsEq
	N3INL4Gp32+huKZRBHLYaviVUQo+bhJ4hPZVaFVkV6IsrAMpYYcCk6jLJcQ6sg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: ab-eoz9: fix abeoz9_rtc_read_alarm
Date: Tue, 12 Nov 2024 16:11:18 +0100
Message-ID: <20241112151119.3451611-1-alexandre.belloni@bootlin.com>
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
Changes in v2:
 - remove left over from development


 drivers/rtc/rtc-ab-eoz9.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 02f7d0711287..84c5f77808c5 100644
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
@@ -231,8 +231,6 @@ static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	alarm->time.tm_sec = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_SEC, regs[0]));
 	alarm->time.tm_min = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_MIN, regs[1]));
 	alarm->time.tm_hour = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_HOURS, regs[2]));
-	if (FIELD_GET(ABEOZ9_BIT_ALARM_HOURS_PM, regs[2]))
-		alarm->time.tm_hour += 12;
 
 	alarm->time.tm_mday = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_DAYS, regs[3]));
 
-- 
2.47.0


