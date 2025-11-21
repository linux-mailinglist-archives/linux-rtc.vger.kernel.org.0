Return-Path: <linux-rtc+bounces-5453-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2011C78F4E
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Nov 2025 13:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id DD3C02DA38
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Nov 2025 12:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAB834D4CF;
	Fri, 21 Nov 2025 12:11:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197934CFC4;
	Fri, 21 Nov 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727115; cv=none; b=ApwnQfMvMnjBvYL33yUW6jGR+DjyakNaa8wK5UbUncKv+tdB1e+ZucvJOodB731A2BW8VyzedYSMaF5eM6EJouxuA3iIFd90d+AAFp9n0LF/fDlW/qhpGCz9i61VPVcm3R6yZSZZvvFt9lETCnzj4z55EUEKmBIZgmbI7Y5QEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727115; c=relaxed/simple;
	bh=Nl7jBWTi1jIZibZWCIEWxIOAcf2GASDGQPxfgjE5Ihs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qP3GnFQo3NhWibv1F/o+Apgj/M4BLD31WCJvr18hyJ2cHJoocw4NcJGN3+ba9W3neeW2tdGWGXrUJ+AQ9WEmC109hfDuJZfRXMePCdcvyLkHbdZzHK7KougctssyJeD48Pj+gY+eFsj58W5AbQCnrPDeOJ//y5z5WhyBdno41TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0910A203435;
	Fri, 21 Nov 2025 13:11:45 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D1BFF203419;
	Fri, 21 Nov 2025 13:11:44 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 987AC1800087;
	Fri, 21 Nov 2025 20:11:43 +0800 (+08)
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
Subject: [PATCH v4 4/5] rtc: pcf85363: add oscillator offset calibration support
Date: Fri, 21 Nov 2025 17:41:36 +0530
Message-Id: <20251121121137.3043764-4-lakshay.piplani@nxp.com>
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

Expose the oscillator offset register of PCF85263/PCF85363 through the
rtc_class_ops read_offset and set_offset callbacks, allowing userspace
to apply frequency correction for drift compensation.

The correction mode defaults to normal mode (OFFM = 0), where each step
introduces an offset of approximately 2.170 ppm and corrections occur
every 4 hours.

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

 drivers/rtc/rtc-pcf85363.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index e10e58f69012..665bbbb169b0 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -123,6 +123,11 @@
 #define TSR2_SHIFT      2
 #define TSR3_SHIFT      6
 
+#define OFFSET_SIGN_BIT 7
+#define OFFSET_MINIMUM  -128
+#define OFFSET_MAXIMUM  127
+#define OFFSET_MASK     0xFF
+
 struct pcf85363 {
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
@@ -359,6 +364,45 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
+/*
+ * Read the current RTC offset from the CTRL_OFFSET
+ * register. This value is an 8-bit signed 2's complement
+ * value that corrects osciallator drift.
+ */
+static int pcf85363_read_offset(struct device *dev, long *offset)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(pcf85363->regmap, CTRL_OFFSET, &val);
+
+	if (ret)
+		return ret;
+
+	*offset = sign_extend32(val & OFFSET_MASK, OFFSET_SIGN_BIT);
+
+	return 0;
+}
+
+/*
+ * Write an oscillator offset correction value to
+ * the CTRL_OFFSET register. The valid range is
+ * -128 to 127 (8-bit signed), typically used to fine
+ * tune accuracy.
+ */
+static int pcf85363_set_offset(struct device *dev, long offset)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+
+	if (offset < OFFSET_MINIMUM || offset > OFFSET_MAXIMUM) {
+		dev_warn(dev, "Offset out of range: %ld\n", offset);
+		return -ERANGE;
+	}
+
+	return regmap_write(pcf85363->regmap, CTRL_OFFSET, offset & OFFSET_MASK);
+}
+
 static int pcf85363_rtc_ioctl(struct device *dev,
 			      unsigned int cmd, unsigned long arg)
 {
@@ -396,6 +440,8 @@ static const struct rtc_class_ops rtc_ops = {
 	.read_alarm	= pcf85363_rtc_read_alarm,
 	.set_alarm	= pcf85363_rtc_set_alarm,
 	.alarm_irq_enable = pcf85363_rtc_alarm_irq_enable,
+	.read_offset = pcf85363_read_offset,
+	.set_offset = pcf85363_set_offset,
 };
 
 static int pcf85363_nvram_read(void *priv, unsigned int offset, void *val,
-- 
2.25.1


