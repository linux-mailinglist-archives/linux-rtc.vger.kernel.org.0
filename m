Return-Path: <linux-rtc+bounces-2956-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E321A16E99
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 761F51644BA
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C011E411D;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoSaS0LZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6B1E3DD8;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=fUHkh0YXH8ajqX2cbx8ssuOEIRnCZpJxA7xtPI8TP6nYlwHIrz6IFGNSMxU2RV9grRMzItJj+iNzSvh4r0bAh0a6zRRoYbsxq4DrWvh8AoqUp+Y1yD3bDARDvNywEsJvecmRuLnnIR4d5QB8M49WYX1oz6D17CkrQ2kIKo++8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=NNzYiy5Em2YV65MV6jlNuBC0jkhkjSG/VfToW3QsblU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYM2m97NEYRTAsqF3mHD9CNVIIV7fEQaWK4frQ7W97Bvu5QUpbFL3R2VrhOIB5dv3oPIzlLcd7OoT5IPo3qZ0ytHmnHKr8LxzfkGZOXuXw7Lsg00fTYWQgZ/4n5T1TPhzzYXYJbUkNK+XT1hGizAalrDbjOLDQWfa3mPU0ENhLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoSaS0LZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871EEC4CEE9;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=NNzYiy5Em2YV65MV6jlNuBC0jkhkjSG/VfToW3QsblU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoSaS0LZllTIL05t3VJUFBMXRX8P20TpYmVkV0GxMCePT6K5YIbUEB7qR/WwU+n55
	 twmYG4r0z33QVCQLkBkNsEsk+qyKLPkVBknshSamt2wLGAXfXFr1+32pcQk4RGDym8
	 T0xT/4ViIA/QACI6kzE4fgSw6Yy8eaC6dZ4GW5AmmwQShtWb/gA81fkvYl/DvlZqp0
	 tQ8p1FacFFwWCqo0v+HhTseFPfOR6lI80yi51znhGJzUW5vhaAvjaeR/sml5JogYje
	 z5Ll0e2Px4Rh8DrydP/OXZ6+7bRBPUzQOpn2IYNfi+FULUhBLhFVk9BP0giODi4E04
	 WorlwR68MEXxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-00000000384-2HHk;
	Mon, 20 Jan 2025 15:42:51 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/7] rtc: pm8xxx: mitigate flash wear
Date: Mon, 20 Jan 2025 15:41:49 +0100
Message-ID: <20250120144152.11949-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
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

On machines like the Lenovo ThinkPad X14s the PMIC RTC drifts about one
second every 3.5 hours, something which leads to repeated updates of the
offset when NTP synchronisation is enabled.

Reduce wear of the underlying flash storage (used for UEFI variables) by
deferring writes until shutdown in case they appear to be due to clock
drift.

As an example, allowing the on-flash offset to differ up to 30 s reduces
the number of writes on the X13s during a ten day session with the
machine not suspending for more than four days in a row from up to 68
writes (every 3.5 h) to at most two (boot and shutdown).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index be1983bf35cd..049daa39c417 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -65,6 +65,7 @@ struct qcom_uefi_rtc_info {
  * @rtc_info:		qcom uefi rtc-info structure
  * @nvmem_cell:		nvmem cell for offset
  * @offset:		offset from epoch in seconds
+ * @offset_dirty:	offset needs to be stored on shutdown
  */
 struct pm8xxx_rtc {
 	struct rtc_device *rtc;
@@ -77,6 +78,7 @@ struct pm8xxx_rtc {
 	struct qcom_uefi_rtc_info rtc_info;
 	struct nvmem_cell *nvmem_cell;
 	u32 offset;
+	bool offset_dirty;
 };
 
 #ifdef CONFIG_EFI
@@ -267,6 +269,15 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
 	if (offset == rtc_dd->offset)
 		return 0;
 
+	/*
+	 * Reduce flash wear by deferring updates due to clock drift until
+	 * shutdown.
+	 */
+	if (abs_diff(offset, rtc_dd->offset) < 30) {
+		rtc_dd->offset_dirty = true;
+		goto out;
+	}
+
 	if (rtc_dd->nvmem_cell)
 		rc = pm8xxx_rtc_write_nvmem_offset(rtc_dd, offset);
 	else
@@ -275,6 +286,8 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
 	if (rc)
 		return rc;
 
+	rtc_dd->offset_dirty = false;
+out:
 	rtc_dd->offset = offset;
 
 	return 0;
@@ -650,9 +663,22 @@ static void pm8xxx_remove(struct platform_device *pdev)
 	dev_pm_clear_wake_irq(&pdev->dev);
 }
 
+static void pm8xxx_shutdown(struct platform_device *pdev)
+{
+	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
+
+	if (rtc_dd->offset_dirty) {
+		if (rtc_dd->nvmem_cell)
+			pm8xxx_rtc_write_nvmem_offset(rtc_dd, rtc_dd->offset);
+		else
+			pm8xxx_rtc_write_uefi_offset(rtc_dd, rtc_dd->offset);
+	}
+}
+
 static struct platform_driver pm8xxx_rtc_driver = {
 	.probe		= pm8xxx_rtc_probe,
 	.remove		= pm8xxx_remove,
+	.shutdown	= pm8xxx_shutdown,
 	.driver	= {
 		.name		= "rtc-pm8xxx",
 		.of_match_table	= pm8xxx_id_table,
-- 
2.45.2


