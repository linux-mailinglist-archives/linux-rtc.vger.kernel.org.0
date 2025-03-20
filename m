Return-Path: <linux-rtc+bounces-3558-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8EA6A37D
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Mar 2025 11:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27824233AC
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Mar 2025 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021AE2147ED;
	Thu, 20 Mar 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bEWy3jUV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3F223300
	for <linux-rtc@vger.kernel.org>; Thu, 20 Mar 2025 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466153; cv=none; b=dRiO3w4CZcivN2vEUxYucbdzbQrLrf8WIXCEYPx8iAXLOYHWFJ4ftZzAzSt6PX3hJf6GEIPLH15ofhlpaLCDVnkqivMWpaaM/PqJ52KMrMlpiJsOyfOFiAodI1NOgOGxv5jlDS6j8VihSNLL/yYSLAGL6ZZ7mqt2kxmRlPXv0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466153; c=relaxed/simple;
	bh=xc4l5quk1bxoMTXbEGj/k5zFg0CCvwEq5viPzoMAzzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwPcro3lIoRgJjUEcXCh/MeDDa7f6g4iD21yR6ekVZIaRdUjC4v4KObHq8/J/8NBlvb79MFf1nZ3nxhABAD5pOO7gaVsYUiwYG1hDPP8/745yAGHbeDfGDaejKe8OcKr+ljjswMsXnBATem5dX9vmn77IYfEWoZBWnuRN5b/YD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bEWy3jUV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=xVpjTV1/PofVwR
	bI3BsHQzQ4pOnhYkcfI7KpJG2ReHI=; b=bEWy3jUVRl3bvJV2bDd3C2nyhQL2n0
	NgnPG91x7sF6XTZnmXiupuOwoowr0PPy1BLsMHmUD1iF+9Ws3pbkDp2V+KzYvg/8
	juM8EG8pRRoOsvgj8lRqY0cC/BOQ33QH01179lcsi2HMxdqvmdG2twjZidvTS/NT
	h1OksR6/9AJ1mMkgTbVVtbf9tG+9hQq3iSWvu2lRpJtqcD0E8LfEpvt6d/ypxIrU
	nQUXenclbruxOeC1WgFo26A5qlAPQ/8J87n86H+J4a6OBGgXiKNwlExumvL7RE2d
	5BqUyBNewBkuUGzO62tUGo+2tCDpmBSvfyteha8/OjRNqKvoacv6kVLg==
Received: (qmail 603974 invoked from network); 20 Mar 2025 11:22:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 11:22:27 +0100
X-UD-Smtp-Session: l3s3148p1@TUC2g8MwfoAgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: da9063: simplify irq management
Date: Thu, 20 Mar 2025 11:18:49 +0100
Message-ID: <20250320102218.10781-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code for enabling and disabling the irq is so similar that it can
easily be handled by one function. Like in most other RTC drivers. Save
the duplicated code and one layer of indirection.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Renesas Lager board (R-Car H2). 'rtctest' behaves the same
before and after the patch.

Originally, I wanted to implement UIE support on top of this. But when I
realised that only the oldest variant of this chip would need UIE
support, I decided it is not worth the hazzle. There is no real need and
later revisions have alarm seconds to make up for it. So, this patch is
all that was created.

 drivers/rtc/rtc-da9063.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 859397541f29..d05b8be98087 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -194,26 +194,17 @@ static void da9063_tm_to_data(struct rtc_time *tm, u8 *data,
 				config->rtc_count_year_mask;
 }
 
-static int da9063_rtc_stop_alarm(struct device *dev)
-{
-	struct da9063_compatible_rtc *rtc = dev_get_drvdata(dev);
-	const struct da9063_compatible_rtc_regmap *config = rtc->config;
-
-	return regmap_update_bits(rtc->regmap,
-				  config->rtc_alarm_year_reg,
-				  config->rtc_alarm_on_mask,
-				  0);
-}
-
-static int da9063_rtc_start_alarm(struct device *dev)
+static int da9063_rtc_alarm_irq_enable(struct device *dev,
+				       unsigned int enabled)
 {
 	struct da9063_compatible_rtc *rtc = dev_get_drvdata(dev);
 	const struct da9063_compatible_rtc_regmap *config = rtc->config;
+	u8 set_bit = enabled ? config->rtc_alarm_on_mask : 0;
 
 	return regmap_update_bits(rtc->regmap,
 				  config->rtc_alarm_year_reg,
 				  config->rtc_alarm_on_mask,
-				  config->rtc_alarm_on_mask);
+				  set_bit);
 }
 
 static int da9063_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -312,7 +303,7 @@ static int da9063_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	da9063_tm_to_data(&alrm->time, data, rtc);
 
-	ret = da9063_rtc_stop_alarm(dev);
+	ret = da9063_rtc_alarm_irq_enable(dev, 0);
 	if (ret < 0) {
 		dev_err(dev, "Failed to stop alarm: %d\n", ret);
 		return ret;
@@ -330,7 +321,7 @@ static int da9063_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	da9063_data_to_tm(data, &rtc->alarm_time, rtc);
 
 	if (alrm->enabled) {
-		ret = da9063_rtc_start_alarm(dev);
+		ret = da9063_rtc_alarm_irq_enable(dev, 1);
 		if (ret < 0) {
 			dev_err(dev, "Failed to start alarm: %d\n", ret);
 			return ret;
@@ -340,15 +331,6 @@ static int da9063_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return ret;
 }
 
-static int da9063_rtc_alarm_irq_enable(struct device *dev,
-				       unsigned int enabled)
-{
-	if (enabled)
-		return da9063_rtc_start_alarm(dev);
-	else
-		return da9063_rtc_stop_alarm(dev);
-}
-
 static irqreturn_t da9063_alarm_event(int irq, void *data)
 {
 	struct da9063_compatible_rtc *rtc = data;
-- 
2.47.2


