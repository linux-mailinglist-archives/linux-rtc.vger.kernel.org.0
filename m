Return-Path: <linux-rtc+bounces-1207-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838BE8CC66B
	for <lists+linux-rtc@lfdr.de>; Wed, 22 May 2024 20:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D241C213E8
	for <lists+linux-rtc@lfdr.de>; Wed, 22 May 2024 18:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6A5145B3E;
	Wed, 22 May 2024 18:38:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071BA145B1D;
	Wed, 22 May 2024 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403132; cv=none; b=K8eeR1VN55t1m0EWNwFvJBjATVqmFFt2Tm6mmgcdqMjIrfnXDN23Q1c6Lh8vux8ZiwtfyXArCt5gH4KjixQlHU1tItZWUCHidEnFGfhgSxr6V19/7an+PTH40HHjgMwx2bomPvlKI2WzJs0Zoy+5TKbSx7aQC4ZcmF04ILfE9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403132; c=relaxed/simple;
	bh=GgTdux9gYeqRKqacAiPHtF3+mAjRSMmb0GCGIwvLtfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=taMaHdibzxWze1h9LOADiNIWm7Oz1ph/ffAcOr/D57E5Rl0GncZusbyJ0xaLY3qPauaaOj9WJ9DIjo3dMEdtwuA/agTHbEw2kAk6twLrCtpawr1imDb+lLa4aT6NVJP3KuZB3Or7gu68ETo3IWdo29aLCYCj2HQWYFlxf1MqV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 8226B84B3;
	Wed, 22 May 2024 20:29:13 +0200 (CEST)
Received: from dino2.dhome ([77.47.123.226]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9qi6-0rGXNR0; Wed, 22 May 2024 20:29:10 +0200
From: Alois Fertl <a.fertl@t-online.de>
To: a.zummo@towertech.it
Cc: alexandre.belloni@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andre.przywara@arm.com,
	Alois Fertl <a.fertl@t-online.de>
Subject: [PATCH v4 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC
Date: Wed, 22 May 2024 20:28:26 +0200
Message-Id: <20240522182826.6824-1-a.fertl@t-online.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1716402550-F28FED0F-6FFADA25/0/0 CLEAN NORMAL
X-TOI-MSGID: 45263082-cff6-49c7-a496-925ce572f1eb

I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618 SOC.
On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
operate correctly. Without this change the clock from the SOC is
~29kHz and BT module does not start up. The patch enables the Internal
OSC Clock Auto Calibration of the H616/H618 which than provides the
necessary 32kHz and the BT module initializes successfully.
Add a flag and set it for H6.
Also the code is developed on the H618 board it only modifies the H6 as
there is no support for H616/H618 in the current code.

Signed-off-by: Alois Fertl <a.fertl@t-online.de>
---

v1->v2
- add flag and activate for H6 AND H616

v2->v3
- correct findings from review

v3->v4
- adjust to mainline tree

I have also tried to test this using the new driver in sunxi-ng
manually injecting the reverted patch
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60d9f050da63b
The code in drivers/clk/sunxi-ng/ccu-sun6i-rtc.c is being called and it
initializes the relevant registers to the same values as the old driver,
but the change ends up with a system that often hangs during booting and
only ocasionally reaches the login state (one out of 10).
The main difference I see adhoc is that the old drivers init is done
using CLK_OF_DECLARE_DRIVER so initialization is done very early.
The new driver does the initialisation via probe which is quite some
time later.
Can't tell if this is the cause for the problems.

---
 drivers/rtc/rtc-sun6i.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 8e0c66906..57aa52d3b 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -42,6 +42,11 @@
 
 #define SUN6I_LOSC_CLK_PRESCAL			0x0008
 
+#define SUN6I_LOSC_CLK_AUTO_CAL			0x000c
+#define SUN6I_LOSC_CLK_AUTO_CAL_16MS		BIT(2)
+#define SUN6I_LOSC_CLK_AUTO_CAL_ENABLE		BIT(1)
+#define SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL		BIT(0)
+
 /* RTC */
 #define SUN6I_RTC_YMD				0x0010
 #define SUN6I_RTC_HMS				0x0014
@@ -126,7 +131,6 @@
  *     registers (R40, H6)
  *   - SYS power domain controls (R40)
  *   - DCXO controls (H6)
- *   - RC oscillator calibration (H6)
  *
  * These functions are not covered by this driver.
  */
@@ -137,6 +141,7 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_out_clk : 1;
 	unsigned int has_losc_en : 1;
 	unsigned int has_auto_swt : 1;
+	unsigned int has_auto_cal : 1;
 };
 
 #define RTC_LINEAR_DAY	BIT(0)
@@ -267,6 +272,14 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
+	if (rtc->data->has_auto_cal) {
+		/* Enable internal OSC clock auto calibration */
+		reg = SUN6I_LOSC_CLK_AUTO_CAL_16MS |
+			SUN6I_LOSC_CLK_AUTO_CAL_ENABLE |
+			SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL;
+		writel(reg, rtc->base + SUN6I_LOSC_CLK_AUTO_CAL);
+	}
+
 	/* Yes, I know, this is ugly. */
 	sun6i_rtc = rtc;
 
@@ -374,6 +387,7 @@ static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
 	.has_out_clk = 1,
 	.has_losc_en = 1,
 	.has_auto_swt = 1,
+	.has_auto_cal = 1,
 };
 
 static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
-- 
2.39.2


