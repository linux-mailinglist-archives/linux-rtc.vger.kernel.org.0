Return-Path: <linux-rtc+bounces-3230-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36B4A3C064
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9A317BD6B
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8301EB5FD;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0Lrzukf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE351EB199;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972597; cv=none; b=MVXAgKfdjJ81cVjtMg7wioGLSt4MreYw1rECRG/HH0bBpB/TV1EEYzqFQ2CvR5cfpQk6Y9kK1HUo81f65ymtAJkTeBLTfQqmL8tHTfEEhAGvkD7UPDaeuvbKOHuzwA3HlBcD9Enod7CkjLGg5sajQkQSkC40eiyS5Zs9b9cprCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972597; c=relaxed/simple;
	bh=+hqwnea+N3U31REJn0l5qVy0S4iocm8Dcsv7Phxfmtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNeu8HBFJAlv4ro3G9yazXL0mHXU5Jb1RhNuCOdxS8QBvtTljeyHA69p+UBYwS7op9JLBrCHeNIEC4rX27xgGGS4QRpU1EpBgfglyo2ORA3oq3/aq1ICaiVv2FV4XL1ImmlDRw7Fmaqc+Fyt19oHNJ0v3pSxH0C+Vb3oo6/lT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0Lrzukf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A396DC4CEDD;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=+hqwnea+N3U31REJn0l5qVy0S4iocm8Dcsv7Phxfmtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0LrzukfkV43bKqHt1Z58YQCiwlg5Vssu5Gufc2/3y5+mwx9y7BpZjAiyLCX+glP9
	 w+Ba28L4JQPkQh3ynNMiKxTjYl72hWzzQw6EphTaMhcWj92EcsabMc249jTseMkAE8
	 Lrwz2T9gfhVg2baSMgHCZQNFLVTdQZtbKOZawKzDhSr2pRTvFI1Xcl51rxulFGZ6Z5
	 /ms1Q7LG3U1zj7gZQuxun8sHuhUeCNChUCJIlEcQvgGVGbWqADzwBztUw5GR6VfWky
	 cMkmPlf1irlToscnA3b1wIL1lXS9cUyWax+/ZFmnPXzuBhXP7viQwha5aHQEtBTHLL
	 CFUAjpeTiHskQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086c-0ojs;
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
Subject: [PATCH v2 3/6] rtc: pm8xxx: mitigate flash wear
Date: Wed, 19 Feb 2025 14:41:15 +0100
Message-ID: <20250219134118.31017-4-johan+linaro@kernel.org>
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

On machines like the Lenovo ThinkPad X13s the PMIC RTC drifts about one
second every 3.5 hours, something which leads to repeated updates of the
offset when NTP synchronisation is enabled.

Reduce wear of the underlying flash storage (used for UEFI variables) by
deferring writes until shutdown in case they appear to be due to clock
drift.

As an example, deferring writes when the new offset differs up to 30 s
from the previous one reduces the number of writes on the X13s during a
ten day session with the machine not suspending for more than four days
in a row from up to 68 writes (every 3.5 h) to at most two (boot and
shutdown).

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Sebastian Reichel <sre@kernel.org> # Lenovo T14s Gen6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index e68b10aa5352..68140ac39365 100644
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
@@ -256,6 +258,15 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
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
@@ -264,6 +275,8 @@ static int pm8xxx_rtc_update_offset(struct pm8xxx_rtc *rtc_dd, u32 secs)
 	if (rc)
 		return rc;
 
+	rtc_dd->offset_dirty = false;
+out:
 	rtc_dd->offset = offset;
 
 	return 0;
@@ -643,9 +656,22 @@ static void pm8xxx_remove(struct platform_device *pdev)
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
2.45.3


