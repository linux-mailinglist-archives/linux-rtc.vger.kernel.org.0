Return-Path: <linux-rtc+bounces-2720-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE369EE397
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0C81889DA1
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5CD20E705;
	Thu, 12 Dec 2024 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="VZYLfkah"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636420ADFF
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997686; cv=none; b=Ero98H0/uSj9xS3z4PVApUkSjsAa7YHYRGvI7k5eKsjW9SpssSUT5Uj1fokZnplakRRZA/M0XjOr/tuPkRROEynNLBEFNRMfrGem41Xg83SyApKPRLLIfZ/9q1oGMqriHkAT1YGURO1gHufkLXKaWLwgTgldZfpNQ1VyYQermqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997686; c=relaxed/simple;
	bh=PoWPktQjZtAuzusWcD9OFkBz3C0ZJZmjw0ppKP7wdk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NrqN4LfHOUskANXiE88egxJ0VSl0dyTSaJXm9hn/WG27NhMSCgADmKLN8nC3dbB3TTbg401gFVMOO8Kzo9x0CkErfV+aqMEkwyzI0ZPiqHVXu0+mDM/xeG4VBBDjHNR8WagFx8V35+76Ox4BTS++OqR3Fo/ucChVGxe6p6Ti0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=VZYLfkah; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21619108a6bso3049305ad.3
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733997684; x=1734602484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XWbCVEeVavh0UQraWtiaYlKzHEcEzshqd5Dh28i8S8=;
        b=VZYLfkahIQsowKenWUp9jKQuVMo/HvLkAnRbXgz7T/cY+4utyqwlmyE0XznjKLTpaC
         8kHTHPKo456eK9EUmok3NoTmnvlzjtzoTMIUwrOEXCtfoH8p7Ndspk6kOC6Us3GuWmln
         iNTX2KS53ZAMkKAeh8onefy4YuDS5nmCy3fD0/eE3ZUCcQ4mzF1GfJMfGOUU6YnTV4lh
         uPnROOaEHkHloav+9VtHQrKu/O+XBzB2fOMua4Y1sqpvEVoZjQtnBgXaEEI/PMR3TdqI
         GgqZg8Lbx7m+zp4+KbXzDf54ND6UCr+pCOe7HjESjiXgclDKrTT74rf6YBUCM3xB7gZY
         AR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997684; x=1734602484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XWbCVEeVavh0UQraWtiaYlKzHEcEzshqd5Dh28i8S8=;
        b=YWwmTkRSnWEjzg16OLM8Ln9uRGKNEWImOPvu2I9phm+R3uZpjwRdw/4t1OeXVHHRB6
         nAGjGlqwAdUzGz6yOnKliS1/h+x5QVh5zjqwwLBH+c7SA6QvRIq/kq6bvAxLwc53I8n1
         ii5RpKCszDZ1iVlximkW/MuCyVZ0Ir5YkAUqlTs3vDPkwxLqw3FT4dDebG/4bsPAUe9w
         AW/0wbZF6XMGuVgIaX7hf7lV+RaSqmkzK0fxDtTDyJJuQhptrxgYAb740h/3JFx9s3Ow
         gkBLCgLs+PholNev0dFeGR3EVgoz0TrTJDgm2FvmIcLDf6EIPKo2fxLgXWj6zmKDr+rE
         angg==
X-Gm-Message-State: AOJu0YzByzmbDXTWs/bqFKeqehl60fh4yOIWhzwQfUkIRVXfKFiM13kX
	pazC61BZeiuQwa2NESqkO2Qmx8QP9x4U8uZs5Y00jafncxcSNiZbwYc9mg3GwbQ=
X-Gm-Gg: ASbGncu5Ry97BIGklu35STpqiWsc1ymudBwS6yqJn0P/vLP2sH2HadKuKQHgm2/W0iI
	v0h/YbnjEL9JLE6sU5Ll3+RvI9TwKmSl7gb48wttfwCumNk2olECQVtfpmnWmtK+JEplZtZBnFG
	NP10aIcmAjgOK8cLmh7rnhj+3z882iDnxjQ0tAhxt1817fplzTVm8X2rPkoAxDZuF5fCgExxFX+
	yocIEME50qaV+AIkR1HqhjZIFRIRDe8StxMHtMPel9XmsoNbWpTH9UKMYP/ZNzgxLvR0G1Cu0vN
	0Ecz
X-Google-Smtp-Source: AGHT+IHR52dKRmr76SZe3P17dHDgeA8x2nyR9meV/zxorwbbo7dYfSkaFLu2Wpt9IrpH+f2l4Xt+zg==
X-Received: by 2002:a17:903:41c5:b0:215:7446:2151 with SMTP id d9443c01a7336-21778397725mr93742615ad.4.1733997682556;
        Thu, 12 Dec 2024 02:01:22 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm87393525ad.81.2024.12.12.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:01:21 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mazziesaccount@gmail.com,
	alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] rtc: bd70528: disable wakeup in the error path of .probe()
Date: Thu, 12 Dec 2024 19:01:16 +0900
Message-Id: <20241212100116.3797439-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe(), which results in a memory leak. Call device_init_wakeup() as
the last step in the .probe() to avoid this leak.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V2:
- Call device_init_wakeup() as the last step of the .probe() for
  simplicity.
---
 drivers/rtc/rtc-bd70528.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 954ac4ef53e8..d5cc4993f918 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
 		}
 	}
 
-	device_set_wakeup_capable(&pdev->dev, true);
-	device_wakeup_enable(&pdev->dev);
-
 	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc)) {
 		dev_err(&pdev->dev, "RTC device creation failed\n");
@@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_rtc_register_device(rtc);
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+	return 0;
 }
 
 static const struct platform_device_id bd718x7_rtc_id[] = {
-- 
2.34.1


