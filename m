Return-Path: <linux-rtc+bounces-2727-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D69EE65E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 13:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0340F281519
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 12:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E360B212B09;
	Thu, 12 Dec 2024 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="lYHjlWtN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE61211719
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005475; cv=none; b=TCGG5f0wnmj+/O3i/C3NfukbAlJWLqcrAQx9LKCdVw2GJBHXZILWQU52jHR4Om/l/QWnA7uyIe4nVWmkN/KrarTrGYEnlgK9V/uTZmpEQGuQY8/lN2IXLKG5F0lHOuMMscb/P6fhCDIu5swOB02FFBHvJHQiWyyoJMWHzkuYC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005475; c=relaxed/simple;
	bh=zcbELSpkNbPADO4bWdCMabNQ/G3qr8N+Zs56TfZUQmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8ttiKLlvL7NwtKYYnuycEukVUzSV7OTu45+6HuOjAB+0NLqfCnEtDTdtzQzcpWUtnP3TA4iu4ZUBpRqGM16LzO08SzaKrH3yM8DdaJ7Gu477BczPJQxBZGhFMFLB9HibeuhwJS1OP68a+ThBJx68fy9vyMNCyobBgSP6jG5w4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=lYHjlWtN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-724d23df764so397788b3a.1
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734005473; x=1734610273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kt1dBd9tzbwEFbZQF/J5QZap/tCRkDClNmmFyMj4h0=;
        b=lYHjlWtNiifunHnbrK2IE6EMH4HMprx4oJGsXDpjAXnYys+nViyCrnw0Dpg/TxvgWM
         Zrfy5+L2TwQm5Ir45+Muz18r7IH70yZlaL4APP2djjdPVtkqoTliF1+yimZJIvFcUgEY
         2GCPN4OFTfRwpj7yKFBZLgGDMmvdxngfEDqSgp2aX2jwiksxnfA2+6i12KQKURvuuSDM
         1qYrL3l8TtQQrB2qhgl+qPvIUVipM998MqJthwZzG9w5aclHxvO+ukpidN0M2qCFQ9Eh
         OmUVn/xDAIxmvev7N6UWZ6H+VLHDzXUburFH/x19NoIO4sBSaq+90tYqYLCIqcQrDSnZ
         66vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005473; x=1734610273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kt1dBd9tzbwEFbZQF/J5QZap/tCRkDClNmmFyMj4h0=;
        b=ANt+Uts0EqaN/dH1dc7v8yf772exJvdHBaR72Yoy41KJUILK6L9kFBF1Nl3M9QOp71
         o2efOsBuQj/wzxQwfSEqDv+0R7MmEK5Qpd/9wua1u3owNOdOUrSkKLCLyDjVdoc9otn3
         16shS4ColIVd9LxhfgcYeAcbU4/G0hI5jW55LQRnVRzamZGQubnI267aOhThhPK2GfBf
         mtGmyN+BymdTDzLbAEQD/kdQPejxvZrJp/ZWDRXFc/Va5tzImxkLzBh1FntvIFa90WL9
         QVJzcG5TaTfG4q7wqtfWEmIzAdqdIN1gT6sVeGyzlD+x4yATyA1GxWDVnMgJI8FnO98H
         VrHg==
X-Gm-Message-State: AOJu0Yww4kzHlwPQFEJuYMcBkA8IRrUYgwYIH5NTwZdBMMnP2kcOzhYv
	KbFLyVe8rqVDngW65lMd0MYXEAEu4aEG6KNxg9FlpchUx6UDkATI8SBNeULpejk=
X-Gm-Gg: ASbGnctARJt03fMV+zCi3Sf2xWiASyPHLkhCezwoPXne5Etzk3APVhEkusKEgF3sd8q
	odhPXq6yq6eg7sj0L6mDsCWH/CGpys9I9bf0HoQvShPC17jEh1JMePWQMqnC0E+zGaEXJ3bSiGJ
	jL/0+sBbkKFbn5ZQOnRzWvWp0J6YQ+vVsoNcYC5nSYR2+Mrn5mnWiVz8WkuY2ezYWXG2y30WAYk
	9HY/rkZx9DBV0niLJVGXebE8EkbQaXneRpcFB6AztLVyNPFI9sJVrmqMbY5fZq9T4gcuFJbI3U9
	vAS2
X-Google-Smtp-Source: AGHT+IEg57HPSz6PBiagBeC1thIpaBi1Aia/aWRV3PYT0qflShVp1kto0KyeDc+hWIyxmzbANM4RSA==
X-Received: by 2002:a05:6a00:430c:b0:728:ac38:4bee with SMTP id d2e1a72fcca58-729069568c0mr104595b3a.2.1734005473133;
        Thu, 12 Dec 2024 04:11:13 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-728e1f67ad1sm4574683b3a.76.2024.12.12.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:11:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com,
	bleung@chromium.org,
	groeck@chromium.org
Cc: linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: cros-ec: disable wakeup in the error path of .probe()
Date: Thu, 12 Dec 2024 21:11:07 +0900
Message-Id: <20241212121107.3903967-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe(), which results in a memory leak. Fix it by calling
devm_add_action_or_reset() with a callback which calls
device_init_wakeup(dev, false).

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 6f2a71a31afd ("rtc: cros-ec: add cros-ec-rtc driver.")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-cros-ec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 60a48c3ba3ca..4cd6eab0fd8c 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -314,6 +314,13 @@ static int cros_ec_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_ec_rtc_pm_ops, cros_ec_rtc_suspend,
 			 cros_ec_rtc_resume);
 
+static void cros_ec_disable_wakeup(void *data)
+{
+	struct device *dev = data;
+
+	device_init_wakeup(dev, false);
+}
+
 static int cros_ec_rtc_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
@@ -343,6 +350,11 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, cros_ec_disable_wakeup,
+				       &pdev->dev);
+	if (ret)
+		return ret;
+
 	cros_ec_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(cros_ec_rtc->rtc))
 		return PTR_ERR(cros_ec_rtc->rtc);
-- 
2.34.1


