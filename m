Return-Path: <linux-rtc+bounces-2175-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1B99B854
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Oct 2024 07:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1531C20CF1
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Oct 2024 05:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B924139580;
	Sun, 13 Oct 2024 05:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="cvx74f9L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153374EB45
	for <linux-rtc@vger.kernel.org>; Sun, 13 Oct 2024 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728796962; cv=none; b=gupB5ja1mRUmUJaEic/CCE23D81uQZg3w0NWQFq3/eTRCOwKa2BzNfYtyp1AEFViAOcqjlazZ6q9yynK3XksWqXtDHVim1EXItYYP6ncwNTqdncRpMsWTfZ6todDa1Kbq+L8e1LgrwbKbKTejwPM75HVnPZI9JwpFF5h8bkw0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728796962; c=relaxed/simple;
	bh=4MZOvQKHClittUmpnQnoq/i+2Op7x5TOc+aMOdSKGRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8lBpOlWt7MyAl1ahoXkBJ2pBeEo7Xevl9GRm2ZBSmyhuqBMWPaOgEJ2ZuFhI9HZpCUgCe0FO9YUQmJZ7UF88rNJD7pAYZMsn2n+aHXSZdj9a/E95GK9ZULl2sXh4Sc9sOgT9+5kjKna9/BqtltgkdtgkoEAZ8KTxGE7PCo7SnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=cvx74f9L; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso22444266d6.1
        for <linux-rtc@vger.kernel.org>; Sat, 12 Oct 2024 22:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728796959; x=1729401759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6xxZ43bcNrMRSyYePE5aWtWwfMTqg7K7KAOvUgotws=;
        b=cvx74f9LirfQIpvi8uN+yNHViK0Vu5/j8Nqhu8mJsOjnvlJnZjFHvLWxq9p5J56oS3
         ESmsViBMhZ3sZH9LDwsD0zVlm2Y+XChD2MBvTNfBem/Nx8ToFBOofCXy4vuSKOHmW7ya
         OVp/94rTQ6sGxK7OMI3HsyFTqenU57uuO5HOWQlxfbMDfeqkgxkq33ko5S+2w0oW+JIT
         R7giN2IZfnR1rlVFfOX3uqwpWX00GmrKU7x7RSZR19LBKIOlZyk+4p1RLgU2WOkvMeG9
         dmQhnSiFJAD9OftS4iO3wwSlsm0yKGRxs+RTJ4VKBkLmrT4ktctz0jZTdNh0gcYJgmiX
         QY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728796959; x=1729401759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6xxZ43bcNrMRSyYePE5aWtWwfMTqg7K7KAOvUgotws=;
        b=YeOuZlHffLgSnBdtpbWEj3cRD9LZ4Xp+Nm1CSJWfVOXwQP2AZRy9AcIZymuqjgtP9d
         sfLn1bYcwNSZJVtCUk8llJXrkoR4NJMhB3zmieBKgr1vZT08+qPtYmZypVe0zsA9oMqR
         PZiGpT1Fj77tBXYnoMY96EPKCMqFMD/79BRSycsR7JU8ke6c6/Oq937RtnSjWfvVHgmH
         ERGV+UpRRvu+Gp0E+UkeIwBZWlVoIPgdiHTNKLtR5zw1RKBZDScNinYftIGc+frUDP7L
         Rx5Ey+RecSkveIEehwy1mhY6bf+8PNiW6T3B3iGpaGmVZJko2PK3IuYBUixUxMJR5baK
         oHtg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ybLkB5Wc1v6tm9kOjI814I0cisGim9jRGS2jn1VkAXw0VpZUGJP5b44xHRUPG5kSyijtazK7GxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO40f6vG++v9QqloYGoBeEQgzb6A9CWPvZuCDD/hWjTd/2UM8y
	nnhizfu417+R3d3r2SEJw69Su7IJvt1u44GY7w1OuBzVw2G4aHb69GWAMMQLxwg=
X-Google-Smtp-Source: AGHT+IHsbqqTS9ovb3ovjSqTfhAbFTCjDmWZz0KsigO/gs/tDfosJX8dkKPETxwqd4+611XM0iYC4A==
X-Received: by 2002:a05:6214:5d0c:b0:6cb:f991:ec51 with SMTP id 6a1803df08f44-6cbf991ec9bmr71722876d6.45.1728796958920;
        Sat, 12 Oct 2024 22:22:38 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608e2csm31821496d6.102.2024.10.12.22.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 22:22:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] rtc: pm8xxx: implement no-alarm flag for non-HLOS owned alarm
Date: Sun, 13 Oct 2024 01:15:26 -0400
Message-ID: <20241013051859.22800-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241013051859.22800-1-jonathan@marek.ca>
References: <20241013051859.22800-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/rtc/rtc-pm8xxx.c | 43 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index c32fba550c8e0..0de55779b04f7 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -61,6 +61,7 @@ struct pm8xxx_rtc {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
 	bool allow_set_time;
+	bool no_alarm;
 	int alarm_irq;
 	const struct pm8xxx_rtc_regs *regs;
 	struct device *dev;
@@ -473,9 +474,13 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (!rtc_dd->regmap)
 		return -ENXIO;
 
-	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
-	if (rtc_dd->alarm_irq < 0)
-		return -ENXIO;
+	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node, "no-alarm");
+
+	if (!rtc_dd->no_alarm) {
+		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
+		if (rtc_dd->alarm_irq < 0)
+			return -ENXIO;
+	}
 
 	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
 						      "allow-set-time");
@@ -503,7 +508,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_dd);
 
-	device_init_wakeup(&pdev->dev, 1);
+	if (!rtc_dd->no_alarm)
+		device_init_wakeup(&pdev->dev, 1);
 
 	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc_dd->rtc))
@@ -512,27 +518,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
 	rtc_dd->rtc->range_max = U32_MAX;
 
-	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
-					  pm8xxx_alarm_trigger,
-					  IRQF_TRIGGER_RISING,
-					  "pm8xxx_rtc_alarm", rtc_dd);
-	if (rc < 0)
-		return rc;
+	if (!rtc_dd->no_alarm) {
+		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
+						  pm8xxx_alarm_trigger,
+						  IRQF_TRIGGER_RISING,
+						  "pm8xxx_rtc_alarm", rtc_dd);
+		if (rc < 0)
+			return rc;
+	}
 
 	rc = devm_rtc_register_device(rtc_dd->rtc);
 	if (rc)
 		return rc;
 
-	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
-	if (rc)
-		return rc;
+	if (!rtc_dd->no_alarm) {
+		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
+		if (rc)
+			return rc;
+	} else {
+		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
+	}
 
 	return 0;
 }
 
 static void pm8xxx_remove(struct platform_device *pdev)
 {
-	dev_pm_clear_wake_irq(&pdev->dev);
+	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
+
+	if (!rtc_dd->no_alarm)
+		dev_pm_clear_wake_irq(&pdev->dev);
 }
 
 static struct platform_driver pm8xxx_rtc_driver = {
-- 
2.45.1


