Return-Path: <linux-rtc+bounces-5451-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80387C78F60
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Nov 2025 13:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C3C135FD2F
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Nov 2025 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3524034D39B;
	Fri, 21 Nov 2025 12:11:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD034AB13;
	Fri, 21 Nov 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727114; cv=none; b=ZR1l/Jq02xGD0RNA4TxLmDjEjAwlOOGumiorpHj9cj+MLmDJrQ2+UszOVJ0kC2iV+v/vysWMj9N8wnKY0pLDGrEUzO9/gM99s/C844uHDFDNB2imgAGnnpR7PulEORFy9sofztin7fSoSa7TEoXM8/WlbUve49rMQeU0wFQnveg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727114; c=relaxed/simple;
	bh=D+3q7ui4s8HRziAqwfu8QHnqaJo2nk6cZX7C7LOvYzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ueN4IT9hnglfOTKkepGe/S+B/1Aj2q6pB7coEKZ/lrb7PYKJSqaerk7z/3lF/61vLFy3HfspymttiwlifHJR/voBf3Czlrmc7WwSJtCOIbcHjzAlWPtBaPiwpEFBptRVP5dqZDDZK6YZ7mFVOYIZNQb5Sd9+2IBCdiM/ECE6yN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AA03A200EE1;
	Fri, 21 Nov 2025 13:11:42 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 745F2200E0F;
	Fri, 21 Nov 2025 13:11:42 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3ACB91800089;
	Fri, 21 Nov 2025 20:11:41 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v4 2/5] rtc: pcf85363: support reporting battery switch-over via RTC_VL
Date: Fri, 21 Nov 2025 17:41:34 +0530
Message-Id: <20251121121137.3043764-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add battery switch-over reporting for PCF85263/PCF85363 using the standard
RTC_VL_* ioctl interface. When the backup supply takes over, the BSF flag
is exposed to userspace through RTC_VL_READ and can be cleared using
RTC_VL_CLR.

This allows applications to detect loss of main power without relying on
non-standard interfaces.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
V3 -> V4:
- No changes in v4.
V2 -> V3:
- Split into separate patches as suggested:
  - Battery switch-over detection.
  - Timestamp recording for TS pin and battery switch-over events.
  - Offset calibration.
  - Watchdog timer (to be reviewed by watchdog maintainers).
- Dropped Alarm2 support
- Switched to rtc_add_group() for sysfs attributes
V1 -> V2:
- Watchdog related changes due to removal of vendor specific properties
  from device tree
  * remove vendor DT knobs (enable/timeout/stepsize/repeat)
  * use watchdog_init_timeout (with 10s default)
  * derive clock_sel from final timeout
  * default, repeat=true (repeat mode)
- Fixed uninitalised warning on 'ret' (reported by kernel test robot)
- Use dev_dbg instead of dev_info for debug related print messages
- Minor cleanup and comments.

 drivers/rtc/rtc-pcf85363.c | 49 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 540042b9eec8..c03d5a65c5f7 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/device.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 
@@ -295,23 +296,67 @@ static int pcf85363_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 {
 	struct pcf85363 *pcf85363 = i2c_get_clientdata(dev_id);
+	bool handled = false;
 	unsigned int flags;
 	int err;
 
 	err = regmap_read(pcf85363->regmap, CTRL_FLAGS, &flags);
+
 	if (err)
 		return IRQ_NONE;
 
+	if (flags) {
+		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s\n",
+			flags, (flags & FLAGS_A1F) ? " [A1F]" : "",
+			(flags & FLAGS_BSF) ? " [BSF]" : "");
+	}
+
 	if (flags & FLAGS_A1F) {
 		rtc_update_irq(pcf85363->rtc, 1, RTC_IRQF | RTC_AF);
 		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_A1F, 0);
-		return IRQ_HANDLED;
+		handled = true;
 	}
 
-	return IRQ_NONE;
+	if (flags & FLAGS_BSF) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_BSF, 0);
+		handled = true;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int pcf85363_rtc_ioctl(struct device *dev,
+			      unsigned int cmd, unsigned long arg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ: {
+		u32 status = 0;
+
+		ret = regmap_read(pcf85363->regmap, CTRL_FLAGS, &val);
+
+		if (ret)
+			return ret;
+
+		if (val & FLAGS_BSF)
+			status |= RTC_VL_BACKUP_SWITCH;
+
+		return put_user(status, (u32 __user *)arg);
+	}
+
+	case RTC_VL_CLR:
+		return regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_BSF, 0);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
 }
 
 static const struct rtc_class_ops rtc_ops = {
+	.ioctl  = pcf85363_rtc_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 	.read_alarm	= pcf85363_rtc_read_alarm,
-- 
2.25.1


