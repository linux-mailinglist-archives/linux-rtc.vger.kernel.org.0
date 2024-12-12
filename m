Return-Path: <linux-rtc+bounces-2711-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A09EDD3B
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 02:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB251889A68
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 01:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB73A52F71;
	Thu, 12 Dec 2024 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="wmwh54/G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D8AB640
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733968289; cv=none; b=gw8VHrGV0z/tRcDP3sSGjwFtivM7DKhnl8ED7gHbPIti2eFADcovHke7ihCEN5BeZQEzQ6eCYrA1jHCCsqpRUQUUQ0xZV1Ga1AQWX7H37flbsD9dbhXBILJtAGzc4QscDf4f8EC3mlBDyXHXCpSOFHXOheKzelUOveVgQq2G7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733968289; c=relaxed/simple;
	bh=gAd+ryXMnIDEgJnrQdtxMNe/h69Xqf1dnTSyAJ5bwxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ap40BsNiVjhGd/lVfiOtrMFTokuHu/QVlTBHiJQ5OFJyZIW/VL1P0R2WSRgNg5IIQJRo8+z+R7dWi+SKAkdwBfbpGs2/tJOFy5Q9Kvvie7+Zw4n/k8cKG9gg7yKuUHNOKoKykJDzYitdfQFkRbc4x1RKMy7/UZ8oG5r7pgkr8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=wmwh54/G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21145812538so954295ad.0
        for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 17:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733968286; x=1734573086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3qkUiNozTIqJ5yExQrCYKlQjf8C1JpfRIhYE+1Bejc=;
        b=wmwh54/Gy5SSO3z949iI9JPpuStci0yRmCOa1HA/VRzVq8fs6q3Fv2rWXFK2DgtmtV
         ePZgGqKM45/F+MHMn9R72AXyo1jKSadjMMuEcAg9OFjYYszll03aZSmm2eL2i4Zi3RBt
         ukbqG87u0kcm6bfzP/N8tUZGwHDgqLUq+S/KxUJFsEDPDy31xRYgI0RF0fj7B5RSBJd/
         wcvYG6YMz04n68g77tLeTwgl+c5+rRQUd/QJ3FoNOsQA0LOoUgRgiVsgO60clS/od4Qx
         ool0f0K+uHgWiqHRDqv3nBk3UpLQ9zkaEXFNii0f41SBECTd+866CgJ9WrggVyKDQiCj
         nNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733968286; x=1734573086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3qkUiNozTIqJ5yExQrCYKlQjf8C1JpfRIhYE+1Bejc=;
        b=qAhW9ct8MqfcMNkPJwwoZ/BcpSeBxB6MWm438X1oy7KAmb3N4/GY+CS74soorU3Uqn
         Jhuv8riz/z/sOaEbsgqgajSiqOi9yQ0NMMwT68fJjzi9li+EIyVG2O187RLOOZ8avUIX
         RqwZINcRBag0u5CywaPyWEJ+7QfUt6tvXlIKgXgA9yRohB02ixxHtBtZTqOlBYLmsc9G
         Hgzri8CeCMn2kDYmKUhU6TGld/10oSC6wTwHvMI3r4Tx4uM5i2iYMxm6WwQE4vnGPdLe
         ue5Si5zWlQfw5QljqaxCpCAz6NwaIxWMnBeEl17WFtin6TvmEZwdXY224IFWMMEJfmvo
         luOw==
X-Gm-Message-State: AOJu0YzKV3LYr7xIsMd9/x6QvI+nzvTap/gdQbo2wX6KyqzEV1fgY1XW
	KjbbfAl14nNazv0ln6WkaNtFJPAHey47m8TMqoy6dyvr5jKyW+lNh1dFgMTBJR0X/D66G2P8sl/
	DwP8mOA==
X-Gm-Gg: ASbGncuBWSw1GMG8sEUZ/1fNJ/YFhhumEjODg3NxXsVu0jZTRtRv1dnC0EdSlNn/33o
	/ViKJJdLzCwqz24VB6zZT1MCxqOo2K1I5OhXDp+vA03VtcIr8hKhoDnGcLBommc4/2g3USHFJ9B
	WmbvrI7gAVkzlUlyrjpnX3EoiuxLfiF7I1F/fxgxo+//LUBWhVtSAi18liatqJcp8wXnUORg0Ax
	CaHEcxQcs9LLL/ANJS2DlYAxToiBPP3BpaYEiRnybq54lxXwk/wubOczs+WSKbBhIb2XaH0iZHf
	dHBru6VMhNPM0QeWR6VaVWp+E40gG+1456SDV/MXjFU=
X-Google-Smtp-Source: AGHT+IFZqjJ1sOGkaf87z+u/tjf0IlDyzVIS2EHVnL8Tv0a+yUXrcDYE9kWr3kaXUlaa+4tqpGlOFw==
X-Received: by 2002:a17:902:f682:b0:216:57a6:28b5 with SMTP id d9443c01a7336-2178af05a5fmr26096455ad.56.1733968286559;
        Wed, 11 Dec 2024 17:51:26 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615dba950sm96364395ad.11.2024.12.11.17.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 17:51:25 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mazziesaccount@gmail.com,
	alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: bd70528: disable wakeup in the error path of .probe()
Date: Thu, 12 Dec 2024 10:51:21 +0900
Message-Id: <20241212015121.3410941-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe(), which results in a memory leak. Therefore, add the
device_init_wakeup(&device->dev, false) calls before returning an error.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-bd70528.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 954ac4ef53e8..50059f7ba6d0 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -312,12 +312,12 @@ static int bd70528_probe(struct platform_device *pdev)
 		}
 	}
 
-	device_set_wakeup_capable(&pdev->dev, true);
-	device_wakeup_enable(&pdev->dev);
+	device_init_wakeup(&pdev->dev, true);
 
 	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc)) {
 		dev_err(&pdev->dev, "RTC device creation failed\n");
+		device_init_wakeup(&pdev->dev, false);
 		return PTR_ERR(rtc);
 	}
 
@@ -328,10 +328,15 @@ static int bd70528_probe(struct platform_device *pdev)
 	/* Request alarm IRQ prior to registerig the RTC */
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
 					IRQF_ONESHOT, "bd70528-rtc", rtc);
-	if (ret)
+	if (ret) {
+		device_init_wakeup(&pdev->dev, false);
 		return ret;
+	}
 
-	return devm_rtc_register_device(rtc);
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		device_init_wakeup(&pdev->dev, false);
+	return ret;
 }
 
 static const struct platform_device_id bd718x7_rtc_id[] = {
-- 
2.34.1


