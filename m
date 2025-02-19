Return-Path: <linux-rtc+bounces-3232-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECEA3C05C
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F27B83AC702
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7986E1EDA1A;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYMizj9a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE51EB19C;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972597; cv=none; b=ol0SAvBdiPWdunIMv032jSYGR99TfR8BbkVEsR7niNgyECLuIuWZ6ISpwgqBK8US+u5ZpXoZqqJPz4UyuY9VzJikjuw++y3bQH5JrPt0CudwNyqr5qmdDV6SLlZNKICuTm47LWLgqvJsW8cTOCQz1zWj3k9JoJR2KcS/tTTuE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972597; c=relaxed/simple;
	bh=67YcT/JtMeOJVzv0hcH+YNMQnhqLpKWigz/mRmSfnyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOkvvxTU2wyMXTbtwpDhVYQlQJWJXotU7tspwQIFIP8yxdM+qqG2UD8E+AF1bavarb+hZlGe9Z0qYj59Ui3efLE5uz3RM2tV2iBZcX/xe8L27j+pthyDEkz+BCseamuRpwqPhO9WkDPkN0FiukvqHU4iOPeIDGQfcPLBx1h11iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYMizj9a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8C3C4CEE7;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=67YcT/JtMeOJVzv0hcH+YNMQnhqLpKWigz/mRmSfnyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYMizj9aZgRai+1A3oskApPkehmYFChTyqMgZ4iBH3gXiV7Vsr/7Lbg7DSKXV+ADS
	 V7/VuPaba8gEkvz/q1P7Yr0sCQgipQSCWcuJ2rFxGEpg6bpswc30VTnDunQGJXg5B+
	 rRf65X24IlhPx4mCrKSvdGWY4+zKiQZgNxBpQVNRCnEGA0ugNLbetFI0Vk5fT0/hGo
	 Zzu7l1bjskEtNDHJysYYcd4ARbgDXLrC0P56ry/lyD+W5i1ToQqbBWSMK5x+/RwoPE
	 hJ2xKx1V3RNFD1adId4TGN5ayuCBFBDhIDGSos+YJEErKWzd7j+XPmGHfcprcWMsp5
	 LkkgMurLS/Edg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086a-0Upx;
	Wed, 19 Feb 2025 14:43:26 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>,
	Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/6] rtc: pm8xxx: add support for uefi offset
Date: Wed, 19 Feb 2025 14:41:14 +0100
Message-ID: <20250219134118.31017-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which the
driver can take into account.

Add support for storing a 32-bit offset from the GPS time epoch in a
UEFI variable so that the RTC time can be set on such platforms.

The UEFI variable is

            882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo

and holds a 12-byte structure where the first four bytes is a GPS time
offset in little-endian byte order.

Note that this format is not arbitrary as the variable is shared with
the UEFI firmware (and Windows).

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Sebastian Reichel <sre@kernel.org> # Lenovo T14s Gen6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 156 +++++++++++++++++++++++++++++++++------
 include/linux/rtc.h      |   1 +
 2 files changed, 133 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index b2518aea4218..e68b10aa5352 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */
+#include <linux/efi.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
@@ -16,9 +17,10 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-
 #include <linux/unaligned.h>
 
+#include <asm/byteorder.h>
+
 /* RTC_CTRL register bit fields */
 #define PM8xxx_RTC_ENABLE		BIT(7)
 #define PM8xxx_RTC_ALARM_CLEAR		BIT(0)
@@ -46,14 +48,21 @@ struct pm8xxx_rtc_regs {
 	unsigned int alarm_en;
 };
 
+struct qcom_uefi_rtc_info {
+	__le32	offset_gps;
+	u8	reserved[8];
+} __packed;
+
 /**
  * struct pm8xxx_rtc -  RTC driver internal structure
  * @rtc:		RTC device
  * @regmap:		regmap used to access registers
  * @allow_set_time:	whether the time can be set
+ * @use_uefi:		use UEFI variable as fallback for offset
  * @alarm_irq:		alarm irq number
  * @regs:		register description
  * @dev:		device structure
+ * @rtc_info:		qcom uefi rtc-info structure
  * @nvmem_cell:		nvmem cell for offset
  * @offset:		offset from epoch in seconds
  */
@@ -61,13 +70,101 @@ struct pm8xxx_rtc {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
 	bool allow_set_time;
+	bool use_uefi;
 	int alarm_irq;
 	const struct pm8xxx_rtc_regs *regs;
 	struct device *dev;
+	struct qcom_uefi_rtc_info rtc_info;
 	struct nvmem_cell *nvmem_cell;
 	u32 offset;
 };
 
+#ifdef CONFIG_EFI
+
+MODULE_IMPORT_NS("EFIVAR");
+
+#define QCOM_UEFI_NAME	L"RTCInfo"
+#define QCOM_UEFI_GUID	EFI_GUID(0x882f8c2b, 0x9646, 0x435f, \
+				 0x8d, 0xe5, 0xf2, 0x08, 0xff, 0x80, 0xc1, 0xbd)
+#define QCOM_UEFI_ATTRS	(EFI_VARIABLE_NON_VOLATILE | \
+			 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
+			 EFI_VARIABLE_RUNTIME_ACCESS)
+
+static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
+{
+	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
+	unsigned long size = sizeof(*rtc_info);
+	struct device *dev = rtc_dd->dev;
+	efi_status_t status;
+	u32 offset_gps;
+	int rc;
+
+	rc = efivar_lock();
+	if (rc)
+		return rc;
+
+	status = efivar_get_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID, NULL,
+				     &size, rtc_info);
+	efivar_unlock();
+
+	if (status != EFI_SUCCESS) {
+		dev_dbg(dev, "failed to read UEFI offset: %lu\n", status);
+		return efi_status_to_err(status);
+	}
+
+	if (size != sizeof(*rtc_info)) {
+		dev_dbg(dev, "unexpected UEFI structure size %lu\n", size);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "uefi_rtc_info = %*ph\n", (int)size, rtc_info);
+
+	/* Convert from GPS to Unix time offset */
+	offset_gps = le32_to_cpu(rtc_info->offset_gps);
+	rtc_dd->offset = offset_gps + (u32)RTC_TIMESTAMP_EPOCH_GPS;
+
+	return 0;
+}
+
+static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
+{
+	struct qcom_uefi_rtc_info *rtc_info = &rtc_dd->rtc_info;
+	unsigned long size = sizeof(*rtc_info);
+	struct device *dev = rtc_dd->dev;
+	efi_status_t status;
+	u32 offset_gps;
+
+	/* Convert from Unix to GPS time offset */
+	offset_gps = offset - (u32)RTC_TIMESTAMP_EPOCH_GPS;
+
+	rtc_info->offset_gps = cpu_to_le32(offset_gps);
+
+	dev_dbg(dev, "efi_rtc_info = %*ph\n", (int)size, rtc_info);
+
+	status = efivar_set_variable(QCOM_UEFI_NAME, &QCOM_UEFI_GUID,
+				     QCOM_UEFI_ATTRS, size, rtc_info);
+	if (status != EFI_SUCCESS) {
+		dev_dbg(dev, "failed to write UEFI offset: %lx\n", status);
+		return efi_status_to_err(status);
+	}
+
+	return 0;
+}
+
+#else	/* CONFIG_EFI */
+
+static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
+{
+	return -ENODEV;
+}
+
+static int pm8xxx_rtc_write_uefi_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
+{
+	return -ENODEV;
+}
+
+#endif	/* CONFIG_EFI */
+
 static int pm8xxx_rtc_read_nvmem_offset(struct pm8xxx_rtc *rtc_dd)
 {
 	size_t len;
@@ -110,14 +207,6 @@ static int pm8xxx_rtc_write_nvmem_offset(struct pm8xxx_rtc *rtc_dd, u32 offset)
 	return 0;
 }
 
-static int pm8xxx_rtc_read_offset(struct pm8xxx_rtc *rtc_dd)
-{
-	if (!rtc_dd->nvmem_cell)
-		return 0;
-
-	return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
-}
-
 static int pm8xxx_rtc_read_raw(struct pm8xxx_rtc *rtc_dd, u32 *secs)
 {
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
@@ -155,7 +244,7 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
 	u32 offset;
 	int rc;
 
-	if (!rtc_dd->nvmem_cell)
+	if (!rtc_dd->nvmem_cell && !rtc_dd->use_uefi)
 		return -ENODEV;
 
 	rc = pm8xxx_rtc_read_raw(rtc_dd, &raw_secs);
@@ -167,7 +256,11 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
 	if (offset == rtc_dd->offset)
 		return 0;
 
-	rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
+	if (rtc_dd->nvmem_cell)
+		rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
+	else
+		rc = pm8xxx_rtc_write_uefi_offset(rtc_dd, offset);
+
 	if (rc)
 		return rc;
 
@@ -455,6 +548,30 @@ static const struct of_device_id pm8xxx_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_id_table);
 
+static int pm8xxx_rtc_probe_offset(struct pm8xxx_rtc *rtc_dd)
+{
+	int rc;
+
+	rtc_dd->nvmem_cell = devm_nvmem_cell_get(rtc_dd->dev, "offset");
+	if (IS_ERR(rtc_dd->nvmem_cell)) {
+		rc = PTR_ERR(rtc_dd->nvmem_cell);
+		if (rc != -ENOENT)
+			return rc;
+		rtc_dd->nvmem_cell = NULL;
+	} else {
+		return pm8xxx_rtc_read_nvmem_offset(rtc_dd);
+	}
+
+	/* Use UEFI storage as fallback if available */
+	if (efivar_is_available()) {
+		rc = pm8xxx_rtc_read_uefi_offset(rtc_dd);
+		if (rc == 0)
+			rtc_dd->use_uefi = true;
+	}
+
+	return 0;
+}
+
 static int pm8xxx_rtc_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -469,6 +586,9 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (rtc_dd == NULL)
 		return -ENOMEM;
 
+	rtc_dd->regs = match->data;
+	rtc_dd->dev = &pdev->dev;
+
 	rtc_dd->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!rtc_dd->regmap)
 		return -ENXIO;
@@ -479,20 +599,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
 						      "allow-set-time");
-
-	rtc_dd->nvmem_cell = devm_nvmem_cell_get(&pdev->dev, "offset");
-	if (IS_ERR(rtc_dd->nvmem_cell)) {
-		rc = PTR_ERR(rtc_dd->nvmem_cell);
-		if (rc != -ENOENT)
-			return rc;
-		rtc_dd->nvmem_cell = NULL;
-	}
-
-	rtc_dd->regs = match->data;
-	rtc_dd->dev = &pdev->dev;
-
 	if (!rtc_dd->allow_set_time) {
-		rc = pm8xxx_rtc_read_offset(rtc_dd);
+		rc = pm8xxx_rtc_probe_offset(rtc_dd);
 		if (rc)
 			return rc;
 	}
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 3f4d315aaec9..95da051fb155 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -170,6 +170,7 @@ struct rtc_device {
 /* useful timestamps */
 #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
+#define RTC_TIMESTAMP_EPOCH_GPS		315964800LL /* 1980-01-06 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
-- 
2.45.3


