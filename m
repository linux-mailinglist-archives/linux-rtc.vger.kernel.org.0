Return-Path: <linux-rtc+bounces-2712-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA19EDDC0
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 03:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FB01886C9D
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 02:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A607BAEC;
	Thu, 12 Dec 2024 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="m5QiI0ON"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8330F9E4
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733971815; cv=none; b=PIAHogCRhDrkFIzmRXAt7nCGFY7FCwUdE/3XvhzKTYWHPjRwzJjMrMjPH2zAw6v2dlGQZqyujda4qPdIEFYrUh2ZLJUAeaQ3EjrbzLB6k3gI3RC+jkgwZh0duH0+xFy9qlAuwgsDc6BsK927IPDr+VWMZuBVpRq8/p7hiF3dASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733971815; c=relaxed/simple;
	bh=Z1sqO5X4Wb3JEMjq+zOK8eCmOJkY1iR3JBvj7GLLtvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dyebX6IRnmte5tgIDn5q7fvwLVxW2/DvIgIT864pMnHKMSdXOBR1I7P/m8qwVfAZr2KyxvtyhfrGbMTgJhc8C3eXoyCZrKN/bN6jBpxbDaSc8RlEiLQ0bREmqwXA3Cx+Mphpk4bIAszg3JWLHua987k3BMmaXAQwMN+C7H/2foI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=m5QiI0ON; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725dbdf380aso112966b3a.3
        for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 18:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733971813; x=1734576613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8APxKXLKctaXm70KhSAaA/pi2FaHoREWAPfJpAhNLU=;
        b=m5QiI0ONYpr5Y4lDumB9ZZp4c0zHrn6GHckPcbNzDjgl2XyXvP2GJix/NP58Rrhlp6
         DuoHfaGj5dcN0CIQt4CVtzCezI6SLT70H362Kmbz2vADpsMBk/D1QMc6N7Uk2K3RtF7U
         RHGbK3zXkZ0ZbLhS4Fh2DrFoJXNoeN+hZ6RoJWC67SlQDRvQfbylRAX42h2OqKvCYwvR
         3qb1ZcylGN7xZRQNAfriukLIvBhmyLi/L8dD4cAxSVn6DsJIxZUMSHcx8v+uToOkvnAE
         xPJDBTxZRiZM7oKEXAK9rP8bvqcpqzGy5fQzHzjhRVSjbPxDktY8kTyvEWB2wU8Yrerc
         tWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733971813; x=1734576613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8APxKXLKctaXm70KhSAaA/pi2FaHoREWAPfJpAhNLU=;
        b=lN6RMfKz+zcyLi8q5WIvcK+BsvpCQVnMa3amnLPJRRsksckz1V+5bT2IevUxuOSGcQ
         OUAzBwsgVjc++ZjeLZMK7/VofV/YTAaqAfVe9Ga+1dyBDkkvkwPtzcK1K5gKYkAOCZ7M
         sxqA3GPg6mKcqy6Lh8mLIiAUwAeS8Rng8INdTxxK7XCBSr1JtIvEu+RWIT1ra/CBaqXt
         ZKkr12hQnSu+J+L84ybs4Otun4rXVTO6t4pf9eu5s+vzH6gsDN5RGPb0zZb2b3XzHCyi
         DyKSRwVOlqiTz6n0u7+/fZ57/14HICAOJQkHRpg6fz5BYghGX2W4qONRi6L8AjnoGW1C
         xVWw==
X-Gm-Message-State: AOJu0YzmOQBIRCXkrvM5jmSAmnKrBVVvVWmpABr7SXGaFX2JKWdkKcbc
	lh2X+SLEpE+BV/wmCiV0AZ8gortQy49XsT7WPAgzxzZbjFAb/f+QYAvtLDHBEoI=
X-Gm-Gg: ASbGncu2D+PQXbVlwo37EvEQxABZF/McGSP5mm8aVJDAoqgVRRw9n0UVMbQtthdys1e
	C/AkvijeFO0G26cjxNbEjduJxwU4bf3EicGS1t8aoDwawZfsGR3iZoWaITRw0R97P+AYdBrVugx
	yUhiRWznONqfaYk4Ek5TlRH32OxgBDjuzmxw408aQhVeHuSm4x9YVwGbjwRVVwrv3n86/rkG3G+
	s1QJAIc0rLYgc5t7RKurQ5jf0eojdIzPJao+JIe6+qz7qTpQ6em7+QvbKeP/fAQK8XY/YP0VuQH
	TDqh7PWV5UyIFFcOYXfh6wTiCj3DCa7nFS386VRfnTg=
X-Google-Smtp-Source: AGHT+IEPj3g+IHGBib9C89hYCp6AHvONJJgYfJfr260wOIPyA14sIyiwA/7PojOd6E+ncMN4N7jngw==
X-Received: by 2002:a05:6a20:2d12:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1e1cebc5847mr2465830637.30.1733971813024;
        Wed, 11 Dec 2024 18:50:13 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd5592e21fsm4901574a12.83.2024.12.11.18.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:50:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: brcmstb-waketimer: disable wakeup in .remove() and in the error path of .probe()
Date: Thu, 12 Dec 2024 11:50:07 +0900
Message-Id: <20241212025007.3472182-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in .remove() and in the
error path of .probe(), which results in a memory leak. Therefore, add
the device_init_wakeup(dev, false) call.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 2cd98b22c144 ("rtc: brcmstb-waketimer: non-functional code changes")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-brcmstb-waketimer.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index fb47c32ab5ff..1bdfec94c693 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -298,15 +298,17 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
 	device_init_wakeup(dev, true);
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return -ENODEV;
+	if (ret < 0) {
+		ret = -ENODEV;
+		goto err_disable_wakeup;
+	}
 	timer->wake_irq = (unsigned int)ret;
 
 	timer->clk = devm_clk_get(dev, NULL);
 	if (!IS_ERR(timer->clk)) {
 		ret = clk_prepare_enable(timer->clk);
 		if (ret)
-			return ret;
+			goto err_disable_wakeup;
 		timer->rate = clk_get_rate(timer->clk);
 		if (!timer->rate)
 			timer->rate = BRCMSTB_WKTMR_DEFAULT_FREQ;
@@ -351,6 +353,8 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
 err_clk:
 	clk_disable_unprepare(timer->clk);
 
+err_disable_wakeup:
+	device_init_wakeup(dev, false);
 	return ret;
 }
 
@@ -360,6 +364,7 @@ static void brcmstb_waketmr_remove(struct platform_device *pdev)
 
 	unregister_reboot_notifier(&timer->reboot_notifier);
 	clk_disable_unprepare(timer->clk);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1


