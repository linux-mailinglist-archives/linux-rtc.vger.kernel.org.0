Return-Path: <linux-rtc+bounces-3229-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01019A3C05B
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E6E3AB4DE
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476F61EB1B3;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBhKkPCn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141551EB187;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972597; cv=none; b=Bn958lxgAXEtySNv3wkqDKhsZYvMBI4qWEuHboZRL4D1q6tVFiW+n3ECJ5lhOl8DPPmC1lCahlpfa1csgr3jJRcfr2pcoeUzHotYcqbg5rNEN2rCuMiWR9ue7gxZg0aIepmbo08WWJgaL/toE6xHw3vMQaIuwJfgxSlel/W3kw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972597; c=relaxed/simple;
	bh=+jVESXZjW+dQ6ogYvit07tGCXuExIHzEYBT/vq3CdkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4c8Q5Q1CInvqm/lYX15j06aR+RF5WIy3DziglWqf/IkcvLVLJg5FohxTCPRTEWCV4YWxwKdBJCafd4HLZpKZ9Dv3PLDldITdtiLn9zAFLRmB20h9kMkf3H1cX+sB68dc/MaHwhf0n2xKppKUdZDryYgiAEi/S0dPVfmi/+L1dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBhKkPCn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20D4C4CEEB;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=+jVESXZjW+dQ6ogYvit07tGCXuExIHzEYBT/vq3CdkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBhKkPCng5u4EaonnatZ6e97dhItGbW1ssKnoNHvbZX6b/JIGgPeGhXQE/mbGS6Ob
	 LsEZGumgnTrlqnSYtfEG8wRFeYklLZRdjMAjECuO2tR16RcSmWsjgLEd0cnhWvdJnc
	 cVzOeFcHe+Jr548urDs4+vY8ixTBVFhGGG9ULjFlpWEsAduI+TtbQStAwFDz4EU8vu
	 GCz8G15tybg1CJTdkcmzjO5UrfgLTri/IpaPhbLDNPkzM4FyBh9pIwydyvxga4rtgP
	 WZMBNMITvwcstlAkGmDBZpMC4YFIGlu/NzR0Ku8NK7TUdvrrrFWVs4bmopDoABwAor
	 HSj8GYlLFR7yg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086e-1F5Y;
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
Subject: [PATCH v2 4/6] rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
Date: Wed, 19 Feb 2025 14:41:16 +0100
Message-ID: <20250219134118.31017-5-johan+linaro@kernel.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://lore.kernel.org/r/20241015004945.3676-2-jonathan@marek.ca
[ johan: drop no_alarm flag and restructure probe() ]
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Sebastian Reichel <sre@kernel.org> # Lenovo T14s Gen6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 43 ++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 68140ac39365..14707e21f343 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -606,9 +606,11 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
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
@@ -624,8 +626,6 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, true);
-
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
 		return PTR_ERR(rtc_dd->rtc);
@@ -633,27 +633,32 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
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
+		device_init_wakeup(&pdev->dev, true);
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
2.45.3


