Return-Path: <linux-rtc+bounces-2172-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494999B6BD
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Oct 2024 21:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0162282B7F
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Oct 2024 19:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB12F80BFF;
	Sat, 12 Oct 2024 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="ZiMSOSWk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257445023;
	Sat, 12 Oct 2024 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728761681; cv=none; b=j1v1YlMhgGccus58D2VqNDDLTgWxFd7uu/BoSXU7w7sZHEGIvoqcxDT7IpdCxJoyu6Oh3F4U1I8N3H5/qU7cFH8JtovXc2MGnzsvxOTPdcLKxz6jvcAmSCbcIusxvrqWqROw+Yl12Cwm0FDD2PomuZbdZnGviNyezSZQh+3F0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728761681; c=relaxed/simple;
	bh=fFRWrIXziMrFVOWh6qiJYxyLAPnajK4P2bjqV68yeAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKwCk5K6iHB+gl+ZTMOgm5gu6aGMMKGoYNROJj55H1d0Xk9KqXYIf1LwX70HXFJzLIfnzzOQIo11tYy0rxPUPXSUzaUEj/p2Q2L2tyPUvbsoYymxtk+9tqOOLScM67xvY4zK3e//G5YaElJcgVLOtFSfZJEKliWvAZS5il/BaOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=ZiMSOSWk; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1728761650; x=1730061650;
	bh=oP1lK+/w0dg1Plg76PJP+UXC7FnSzdgo8G263II4Rzs=; h=From;
	b=ZiMSOSWk9skIUEhF9xaS4Nt541trj7+rNEyLVCwv+ljiLJMOo7tVZNnZJZFSdCHKx
	 icBm32PSvzWbR29f4/4qF5gqdFqKOX5l48frAX/zeLCNDseUENwmvOeiBLmQHCo1ej
	 dAINwH5c1kUUoUs8iH4DQJNh2aeBt96VBjOBIKnWQAjaLraVgQxHkv3Vq+qvcDIe8G
	 uHZMMbuSMDSu23llIvuwieU3L7csxrLXHluQ69Vd5Yf9VYtau95l5DpZuEBTRXmk2L
	 KGjh5YeOVnPlGlV44Zf0q2V4Z4aWdu2DQKv84zXY9MTIOudZwEe1caF0sMXv+p7gq/
	 ihnwY1DNj12FA==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 49CJY9om082925
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 21:34:10 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: duje.mihanovic@skole.hr, balejk@matfyz.cz, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RFC PATCH v2 2/2] rtc: add driver for Marvell 88PM886 PMIC RTC
Date: Sat, 12 Oct 2024 21:31:39 +0200
Message-ID: <20241012193345.18594-2-balejk@matfyz.cz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241012193345.18594-1-balejk@matfyz.cz>
References: <20241012193345.18594-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTC lives on the chip's base register page. Add the relevant register
definitions and implement a basic set/read time functionality. Tested
with the samsung,coreprimevelte smartphone which contains this PMIC and
whose vendor kernel tree has also served as the sole reference for this.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    RFC v2:
    - Move in the register definitions from the preceding patch and reword
      the commit message accordingly.
    - Rebase to v6.12-rc2.

 MAINTAINERS                 |  1 +
 drivers/rtc/Kconfig         | 10 ++++
 drivers/rtc/Makefile        |  1 +
 drivers/rtc/rtc-88pm886.c   | 97 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/88pm886.h |  9 ++++
 5 files changed, 118 insertions(+)
 create mode 100644 drivers/rtc/rtc-88pm886.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a097afd76ded..3a15b8711041 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13710,6 +13710,7 @@ F:	Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
 F:	drivers/input/misc/88pm886-onkey.c
 F:	drivers/mfd/88pm886.c
 F:	drivers/regulator/88pm886-regulator.c
+F:	drivers/rtc/rtc-88pm886.c
 F:	include/linux/mfd/88pm886.h
 
 MARVELL ARMADA 3700 PHY DRIVERS
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 66eb1122248b..2718ea194dd4 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -182,6 +182,16 @@ config RTC_DRV_88PM80X
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-88pm80x.
 
+config RTC_DRV_88PM886
+	tristate "Marvell 88PM886 RTC driver"
+	depends on MFD_88PM886_PMIC
+	help
+	  If you say yes here you will get support for the RTC function in the
+	  Marvell 88PM886 chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-88pm886.
+
 config RTC_DRV_ABB5ZES3
 	select REGMAP_I2C
 	tristate "Abracon AB-RTCMC-32.768kHz-B5ZE-S3"
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index f62340ecc534..70bbce968a43 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_RTC_LIB_KUNIT_TEST)	+= lib_test.o
 
 obj-$(CONFIG_RTC_DRV_88PM80X)	+= rtc-88pm80x.o
 obj-$(CONFIG_RTC_DRV_88PM860X)	+= rtc-88pm860x.o
+obj-$(CONFIG_RTC_DRV_88PM886)	+= rtc-88pm886.o
 obj-$(CONFIG_RTC_DRV_AB8500)	+= rtc-ab8500.o
 obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
 obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
diff --git a/drivers/rtc/rtc-88pm886.c b/drivers/rtc/rtc-88pm886.c
new file mode 100644
index 000000000000..57e9b0a66eed
--- /dev/null
+++ b/drivers/rtc/rtc-88pm886.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#include <linux/mfd/88pm886.h>
+
+/*
+ * Time is calculated as the sum of a 32-bit read-only advancing counter and a
+ * writeable constant offset stored in the chip's spare registers.
+ */
+
+static int pm886_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u32 time;
+	u32 buf;
+	int ret;
+
+	ret = regmap_bulk_read(regmap, PM886_REG_RTC_SPARE1, &buf, 4);
+	if (ret)
+		return ret;
+	time = buf;
+
+	ret = regmap_bulk_read(regmap, PM886_REG_RTC_CNT1, &buf, 4);
+	if (ret)
+		return ret;
+	time += buf;
+
+	rtc_time64_to_tm(time, tm);
+
+	return 0;
+}
+
+static int pm886_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u32 buf;
+	int ret;
+
+	ret = regmap_bulk_read(regmap, PM886_REG_RTC_CNT1, &buf, 4);
+	if (ret)
+		return ret;
+
+	buf = rtc_tm_to_time64(tm) - buf;
+
+	return regmap_bulk_write(regmap, PM886_REG_RTC_SPARE1, &buf, 4);
+}
+
+static const struct rtc_class_ops pm886_rtc_ops = {
+	.read_time = pm886_rtc_read_time,
+	.set_time = pm886_rtc_set_time,
+};
+
+static int pm886_rtc_probe(struct platform_device *pdev)
+{
+	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	int ret;
+
+	platform_set_drvdata(pdev, chip->regmap);
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return dev_err_probe(dev, PTR_ERR(rtc),
+				"Failed to allocate RTC device\n");
+
+	rtc->ops = &pm886_rtc_ops;
+	rtc->range_max = U32_MAX;
+
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register RTC device\n");
+
+	return 0;
+}
+
+static const struct platform_device_id pm886_rtc_id_table[] = {
+	{ "88pm886-rtc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pm886_rtc_id_table);
+
+static struct platform_driver pm886_rtc_driver = {
+	.driver = {
+		.name = "88pm886-rtc",
+	},
+	.probe = pm886_rtc_probe,
+	.id_table = pm886_rtc_id_table,
+};
+module_platform_driver(pm886_rtc_driver);
+
+MODULE_DESCRIPTION("Marvell 88PM886 RTC driver");
+MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 133aa302e492..85eca44f39ab 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -31,6 +31,15 @@
 #define PM886_INT_WC			BIT(1)
 #define PM886_INT_MASK_MODE		BIT(2)
 
+#define PM886_REG_RTC_CNT1		0xd1
+#define PM886_REG_RTC_CNT2		0xd2
+#define PM886_REG_RTC_CNT3		0xd3
+#define PM886_REG_RTC_CNT4		0xd4
+#define PM886_REG_RTC_SPARE1		0xea
+#define PM886_REG_RTC_SPARE2		0xeb
+#define PM886_REG_RTC_SPARE3		0xec
+#define PM886_REG_RTC_SPARE4		0xed
+#define PM886_REG_RTC_SPARE5		0xee
 #define PM886_REG_RTC_SPARE6		0xef
 
 #define PM886_REG_BUCK_EN		0x08
-- 
2.47.0


