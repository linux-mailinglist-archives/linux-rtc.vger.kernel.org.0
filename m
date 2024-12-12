Return-Path: <linux-rtc+bounces-2724-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F394B9EE407
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00021881BB5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C42210193;
	Thu, 12 Dec 2024 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Op4mLJfc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5D18B467
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999052; cv=none; b=jfJcIqnxk4LeCuCNafPIF2sNIS4mJfzF+Stvqe28mH1qNJ7Nlj5GoeVexKa+0FQ0PXzWqMjkKL7ivqdPcum+Y0IsuJTOcqJusrlpw24WqIix17cfLXp+Nk/etzzOR5hhsURA1cAQufn2IJp3SWdms9CYlwV24Kj02e3JS1HvTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999052; c=relaxed/simple;
	bh=gokDycrM6Fg/4y00vU8t2x4xd2RQ0REEoRUwzvOpyVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcFnXdCXdub1p7YI+4SahgZ1aza/trxkJFRZ+2YcWwT8Y5nRpQPyoccyhiyCcgQP0Tgb9/nS9/oebnd8scI35/Uqb5NdHSg4xV5W5Sc8N8xt6k+EqatcxOlrFIDAiaZfiNJszfiP9Hwhxy3p5N2N1d9nJljfbG8wMZ/+qM+MNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Op4mLJfc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so365811b3a.3
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733999049; x=1734603849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3dTz1PjeUs3tCJFdZ0+H32UT+vh5E3nbemN5nASUMM=;
        b=Op4mLJfci8z/1h80sVrGx6bEGVsvPoirjZZnfkaz7Z3Vfzqne/2RLhdssXTEr205a4
         3lh9FTZgXK07iDbiGKs44uekrHGm/w7fTGZ0KZtV7XW3RmmvNYyOPXlcifY1pKMN5nk5
         9iwxsM5N4XHFt+Ewe7ey0KZb7e0ilOp36J6Kmm91zGb7JnAPm9W127BoUgbQVJCp4zHa
         W8tDZ+ZDPhfcEGbPzWX2B1SKp0e0HmPnbRch76fp+lh/o7AZtLPY5uDQQs3NdTo1pfH7
         C0UYZrw7wJfhdlk0evHh+/zwx5x/EmhRbKu5DCiK0qLAMWlclNPpBgZN3+sLSgb1z60O
         kPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999049; x=1734603849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3dTz1PjeUs3tCJFdZ0+H32UT+vh5E3nbemN5nASUMM=;
        b=DkG5czJKxCDhwoP+riiavQM4j2ro7YVAvqwWFUXrY0CuGYbvCmSdZegsUzeVlIGuNE
         xOVFeDHbfMDHx3raNHqtEiwQeQ3YSrFV5+/5n4Mw+oqMtBPFOwgSTGF35Fu1Bow5YQ77
         XJCGCJo4z9pMGIhhkZMCeYUxS1+0Svxcn3R8QtpYebdyW5iDOVPFbg1mK80AXVl8W+sJ
         +T7oPSEyifa80/dJ86A44Yc+tERGtt5U6Iwy4B6nX0Y8nUEaRHtd+aAqmSa+n5ko+kwN
         E3dySmMDgKm2sX8FRTVsX1WEDABdZbJjQ7rz2UFDh6lYuEJ/s1285C/WdDYEvGMzU9Fd
         28kA==
X-Gm-Message-State: AOJu0YwZGt9Smiie0f8yExGQVBJMo3kqTDQT65T34wYHsLK0CRkqTqVe
	VBJMcM2P8zZEj4iOIsh22wv2zJPAoaHWmMd6MEElvIpmBI9L7TYPG2SmmP2csSc=
X-Gm-Gg: ASbGncuX0YNnAOwVzZuNYVW0ytgcTKMqNptAlHqAc7HSRVl8JZ/xZgIgG1Xua8hA9Yt
	q2JRvCwWKmlZ9fSqw8xsYHSfpeCVkqLunPNDRMykW72arsprEIp2APP/UQLyxp2i20WH3IFiEDr
	awdX0oRWnqZLynb5VbkvRns4PSGPgZ7HtV3WedF6WEgZQEos3HrCjChAIirEVtchnpjQ1qu3w+z
	TRj5iQ236BCuyMBrwGAHvbTpuBYTXlUxG7w8svETrVqXLtnTG0tQxBDMqqt6qtrpIQYBdcjhjuT
	c0SP3nGdT5pWkf++dtMoRY2BIWqidYaOVS/mVCIHepM=
X-Google-Smtp-Source: AGHT+IGeT5k6cbyI0EC306z6dmwG45zcJtx+j2KUIoYUy5pn1r+O3m7LUAVAd6A62Omk2eeMHjZs6Q==
X-Received: by 2002:a05:6a00:92a6:b0:725:f18a:da42 with SMTP id d2e1a72fcca58-728fa9bf4abmr4236878b3a.2.1733999049206;
        Thu, 12 Dec 2024 02:24:09 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29c5beasm12538928b3a.36.2024.12.12.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:24:08 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: cpcap: enable the device's wakeup in the last step of .probe()
Date: Thu, 12 Dec 2024 19:24:03 +0900
Message-Id: <20241212102403.3821014-1-joe@pf.is.s.u-tokyo.ac.jp>
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

Fixes: fdcfd854333b ("rtc: rework rtc_register_device() resource management")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-cpcap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index afc8fcba8f88..f174dcd0b34f 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -295,13 +295,16 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 	}
 	disable_irq(rtc->update_irq);
 
+	err = devm_rtc_register_device(rtc->rtc_dev);
+	if (err)
+		return err;
+
 	err = device_init_wakeup(dev, 1);
 	if (err) {
 		dev_err(dev, "wakeup initialization failed (%d)\n", err);
 		/* ignore error and continue without wakeup support */
 	}
-
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return 0;
 }
 
 static const struct of_device_id cpcap_rtc_of_match[] = {
-- 
2.34.1


