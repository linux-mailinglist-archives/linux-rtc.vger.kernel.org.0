Return-Path: <linux-rtc+bounces-2531-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2AB9C5C77
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C3D9B41C27
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 14:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9E61FF5EB;
	Tue, 12 Nov 2024 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jc0Cclrg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FCB1FC7FC;
	Tue, 12 Nov 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422220; cv=none; b=Wm4BPajDKEdn1LWw4CHpCm7ZA5sopxH48i8RzHuan9A/xboRTNd+9XKUQizsAQeUF83JEOMysuTtm59iPvhkfYkuBUTtSvbFx/L1q6gwzF5ubFTO9Kihzbbm8qn1EBZPPoPRpRfivVHlAiNJ5CU2ogZYA2l8NRfawY6hiIuQze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422220; c=relaxed/simple;
	bh=8gGQIIylhmu8fK521DLpqJ2S5oBS7nCYZ438IkIqU7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bL6DILW711hWLMXBJW9UVfX6N4VxfrmOOTXe52I2Rh2IszZlbK6oIqzHBKtLaK8A9v3OwUuWHFv7DfgU/P2Xc/SBIdrmXS/AZwDMd0Fe8phZbzB4MhXPiDlU6dqhvFBxZGKO+nRM4g6a/kvKvhvikxLLva1qxcqmYWuKq1D8FeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jc0Cclrg; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05EB3E0002;
	Tue, 12 Nov 2024 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731422216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aJFnJDAFTBKSIxX6b5Pe3koShCEbFS2HnrAwtx42ffc=;
	b=jc0Cclrg0P6NeE/g2h2R05ymYh2BbiAaXrZJDL2mXdBja7XqKDo8+6DxTvWVdjxJIw0nFp
	85kXoFYkwGQrBZDD40Tve+G8MAspmKsi1262SId7spG/eIolHidEZJ6jR3EmH0SaUcrGij
	lmTqH4Dof7ulzgfFbKu2zv9x6c/suTshCZuogfmLqOrOZx43xyWuiSfZjaq2ZYEo4pqnaP
	P/rEwg5bogCnZJMnuGqszRji7p0AueKkebL3OVK2lUhN27KaWsVBIwWP8HtwmZrGp1gO13
	StOsZKz9/8D3Ev9AnCjG138MCCf/FqroUkW1aG+Ql/2EMd+THm8yGz+Chno1tA==
From: alexandre.belloni@bootlin.com
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: amlogic-a4: drop error messages
Date: Tue, 12 Nov 2024 15:36:52 +0100
Message-ID: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
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

Drop error message because there is a high probability they will never be
seen and the final user action is clear, the time has to be set again.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 9423dce4193d..4960790c4b24 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -102,10 +102,8 @@ static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	u32 time_sec;
 
 	/* if RTC disabled, read time failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read time failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
 	if (rtc->config->gray_stored)
@@ -145,10 +143,8 @@ static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	time64_t alarm_sec;
 
 	/* if RTC disabled, set alarm failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, set alarm failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_update_bits(rtc->map, RTC_CTRL,
 			   RTC_ALRM0_EN, RTC_ALRM0_EN);
@@ -174,10 +170,8 @@ static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	int alarm_mask;
 
 	/* if RTC disabled, read alarm failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read alarm failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
 	if (rtc->config->gray_stored)
@@ -201,10 +195,8 @@ static int aml_rtc_read_offset(struct device *dev, long *offset)
 	int sign, match_counter, enable;
 
 	/* if RTC disabled, read offset failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read offset failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
 	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
@@ -231,10 +223,8 @@ static int aml_rtc_set_offset(struct device *dev, long offset)
 	u32 reg_val;
 
 	/* if RTC disabled, set offset failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, set offset failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	if (offset) {
 		enable = 1;
-- 
2.47.0


