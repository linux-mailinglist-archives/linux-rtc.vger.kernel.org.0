Return-Path: <linux-rtc+bounces-2955-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07047A16E97
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A08D164091
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502901E3DFD;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBUFr2tP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC111E3DD3;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=eyfUrriL/WYfSyOkt103BJEMPv1r++ZTubB915yL4pnSTmRe9Nq5PPZagbyjl5QOZ52czlG3ik5j9y5vzun99BSTPkJZP6V3msO4ATTH5+7k96Ccubtb00E7G4Kuk7BEC8C/ZB6PP+GK9vYTQLkzeOSssQ+2vzUNyO4PccJh9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=j7bpGCPILW2v7fURMsfzd1GOrBdY+KXNxn4zV2jA7B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBZrpIu2fZ2BUBwGq6v8g3zeVuc2bmj3ZU5x7zAXE4Q0AGwGgaFy6/DIhNEIdJBDquKYFB9Sl+B3dZzHEe8Od56APwH68CBU1Ir18OicJdnk4o54h0XuT0vdBY1MURB9qIOWcIYtco0uUFDvj7wiBtMHnQ84oI65TZco6SW5PzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBUFr2tP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF67C4CEEB;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=j7bpGCPILW2v7fURMsfzd1GOrBdY+KXNxn4zV2jA7B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBUFr2tPGoR0lJG4rVUzov5i0KhzyUAjxU/2VQ8oiaKbu4juqlSJybdPazHq45aq/
	 phdr6Cb/n2yImgxaCFNVoQuargPe76isTCw9FrB9fOm7ZHjgE/7bWe2M5VYQiey0lF
	 6GYqiPb/nVBQ4RGxM3H9ibm1IZelS3mzrBOSmbTdk+MFaEwIp38h69TcfS0dxLAgGO
	 cyeE5V0P/uiwO2DB+fSpB1M+ocn9Q6QUVIb81CJlyemhLbuvua4J0RbXlUc2xYLyNB
	 0rH3JYj6KBG/2Pi7OpiRqgIWjcWMnJuLJcyP8F0AzMJzP+1jy0dxJ0bvpvL2cMh4w4
	 vt+sHo9pxBUYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-00000000388-2hAb;
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
Subject: [PATCH 5/7] rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
Date: Mon, 20 Jan 2025 15:41:50 +0100
Message-ID: <20250120144152.11949-6-johan+linaro@kernel.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://lore.kernel.org/r/20241015004945.3676-2-jonathan@marek.ca
[ johan: drop no_alarm flag and restructure probe() ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 43 ++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 049daa39c417..f9755fb9eaa5 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -590,9 +590,11 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (!rtc_dd->regmap)
 		return -ENXIO;
 
-	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
-	if (rtc_dd->alarm_irq < 0)
-		return -ENXIO;
+	if (!of_property_read_bool(pdev->dev.of_node, "qcom,no-alarm")) {
+		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
+		if (rtc_dd->alarm_irq < 0)
+			return -ENXIO;
+	}
 
 	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
 						      "allow-set-time");
@@ -631,8 +633,6 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, 1);
-
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
 		return PTR_ERR(rtc_dd->rtc);
@@ -640,27 +640,32 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
 	rtc_dd->rtc->range_max = U32_MAX;
 
-	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
-					  pm8xxx_alarm_trigger,
-					  IRQF_TRIGGER_RISING,
-					  "pm8xxx_rtc_alarm", rtc_dd);
-	if (rc < 0)
-		return rc;
+	if (rtc_dd->alarm_irq) {
+		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
+						  pm8xxx_alarm_trigger,
+						  IRQF_TRIGGER_RISING,
+						  "pm8xxx_rtc_alarm", rtc_dd);
+		if (rc < 0)
+			return rc;
 
-	rc = devm_rtc_register_device(rtc_dd->rtc);
-	if (rc)
-		return rc;
+		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
+		if (rc)
+			return rc;
 
-	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
-	if (rc)
-		return rc;
+		device_init_wakeup(&pdev->dev, 1);
+	} else {
+		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
+	}
 
-	return 0;
+	return devm_rtc_register_device(rtc_dd->rtc);
 }
 
 static void pm8xxx_remove(struct platform_device *pdev)
 {
-	dev_pm_clear_wake_irq(&pdev->dev);
+	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
+
+	if (rtc_dd->alarm_irq)
+		dev_pm_clear_wake_irq(&pdev->dev);
 }
 
 static void pm8xxx_shutdown(struct platform_device *pdev)
-- 
2.45.2


