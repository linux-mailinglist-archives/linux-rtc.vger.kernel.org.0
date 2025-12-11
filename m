Return-Path: <linux-rtc+bounces-5531-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B71CB6A47
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Dec 2025 18:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84CDE30039CE
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Dec 2025 17:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C2631690D;
	Thu, 11 Dec 2025 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZJA7zHH7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D93316195
	for <linux-rtc@vger.kernel.org>; Thu, 11 Dec 2025 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473365; cv=none; b=p8VwzdYeLYQgfB0eSaZaAOt+VX3Pdnr4y51mXw/TVXsfWexCpCbkJQB/w28hrr3n2H8MEiVUg21heNvonrCoSmR2BjLTOR6t4MUpmDeSAPiQiEx/DTAS1+g6ldkp65g63HBaTdwxXMu8cLmtiDVz9ETHf+JHRzIqXc6Y4PPZS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473365; c=relaxed/simple;
	bh=AjXr0RnxTKaBv6olXD/4z+FRU9Mi+0TF8cBSgEg6f8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oqfs+L0j1zMUSAYUnoKa41uxLCji8GV2UskjDC2M9M8Q00BpYrJiz/B3RZRdU5JDYojqppGYSMj1j/9KL/P1i6919ebyLBzoW12Z+UXIBN06r71Cn358EPeU7+Nl6P89TmkzvwKBoChFu5mlCHdvCcZmRb+skbpvPfAtm9gdmJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZJA7zHH7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477563e28a3so2971345e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 11 Dec 2025 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473361; x=1766078161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi5/UGBTaIFNW77cWN4A+BHUVzdoSL5Par1+AonNNpI=;
        b=ZJA7zHH7SvrEoZQhLtHm46QxqJ8f0hUwHtn9mnktXnjXZNDXgZjY1V7/eT4lMUrASR
         3+f0LPaQdjLkLSTDz/UyaJxry3QCv0ekS5C2wrjPnxlblMqgXBvFU/avkcAiOxfxHnxr
         trvXEScSsBE1Y1t32HEdE3zIrtwTc43Cz6UxpWwjUg32WUWl20v6M3mgCRfYtuf4fFig
         JFvpGN28aq0MtZOCxLCPeBUhy3YVfpnwWkPX/j5EY2B8tPTDkLXsRI9eh0mmDAjjtkvh
         Z5azExzUHbhl8zYA32crWGFOB1RpL9LtCsCzQxGf6yBT2J2Ea1NlPsttLFiCIQZ7BZDH
         9XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473361; x=1766078161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hi5/UGBTaIFNW77cWN4A+BHUVzdoSL5Par1+AonNNpI=;
        b=G9zQKYHicF5OnTsCGtHHoL4AHhXOTvEB+VbJuipc8L6HGUrvbejLe9mEx56PKyBirh
         Er4gxmb9a5BFPAwnIHR2sdDzNY3/e3UFTkYTqADzwBk+TdfxluRW9xJ1niyHU2Vv25lM
         07jSEy+JnlV2IGNw/hMQMTWLW4ziB5vMI8Fexdg4HMQUgZnmkYdKh9J9iqblzSB4v5Dc
         Jr8MPt8rlmb1ns/WcybNwUtiCWUBSFdGWfb0wWdOJZECq0Q+lUAMZimc95JhqJG5uCOl
         /SaqWhcPqX8Ea2Q4HE/jk/1YGUfnLR0jgYr/Z6rZGi5QhdOm8z+g5TQRRA+IqEMdYRLT
         MxOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQoWIB87w+27NAjc6GfGExZA/H9DOeQFwrTvYqB1jmdFIwY+E0x/LV0syvkN27E12kyYGrCBIOmQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NIOckMinvViXMj817VG8+/rX6pWJU5xK8/BygXLf4auBOOrz
	hIw+NiIcWGA1Rkrr1c7s/nRq3mnU+GS94E9FeZmpp2ZQmC9rjNVzTaw1qNzB0KUf4N8=
X-Gm-Gg: AY/fxX4VJCOpvCz0VK2XjhfX0oFl3L7AUXNJyGQuYW7/0e49oy7jL6gC1EKR8736XFy
	7Lqr7o2LiAznMS979n3hU6MiAZ+aQHTT0uk9AsP9IC5aQcjb4xwdIf+bGEGfdfio7wGtHy71wZq
	33a4yjsYw2gnsDe/I3Vpjql+z9bEQHNRkke1WW9Ecp+CxJGaK3Ol/xGzZ3BPMOFr/UlX2K/KeN1
	d0hvQGXXOe1cqIHRUGn/DKPRzai6rsTm8Si4/utSCDEk2vcCqouo+Mz0w0WrZd+u8qoHV8IuTTd
	wRBMbntKyBsRGULWdHPl6KLmg0smwDFS8MUfKOnrYr/49C4+EpRE9NekysrtuSMRrx4HMJv/xl9
	hFG1R9Y97y1GhqkyhRj7U1341gLJH8uX45Zrh6LDnjIRzfpwXNtiQbXq5K+dDWht7EWdFxbkRFM
	Nv1ajBFOgkpQk422Qe66JQRzFAUs36piNViBEjcgoBZlRu6vWaRblqfQW0XBZ2bzPe80zxkAtrP
	89k4mR/I91lBg==
X-Google-Smtp-Source: AGHT+IHY5a2mEHV1AlyouwF5+8ViaviivoNCaFkw1PgSwNyXbPnlUyEvOyVbTypMN1j/t55IMaGQ6g==
X-Received: by 2002:a05:600c:190c:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47a8d746f10mr9774955e9.17.1765473361369;
        Thu, 11 Dec 2025 09:16:01 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89f35ae6sm43759865e9.6.2025.12.11.09.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/17] rtc: optee: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:01 +0100
Message-ID:  <a9c8da1b7b2832044129ec9e2616c40e0023ad57.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AjXr0RnxTKaBv6olXD/4z+FRU9Mi+0TF8cBSgEg6f8g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwlpOdez8ZhYb5hNC93qHUDTTVphLfbIo0cN E8LOH90v7iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8JQAKCRCPgPtYfRL+ Tu6KB/9R/MR/L8dDMQAk3ITRzGaW3NxF1PUGNuhcn+AAeP0p6NBUMyehIjROdQz0/PnL7Zc/QL6 OfGHkdyaP6OArGGH0K0EwPhQPj5RBoJN3L9BZhzwt0V6g536z4sFqL9hcGAuIJTglvMsr6kN3Hg 7qnK+8ufdVV/Ammwt5Uw9Q4BdSiR8b7BitYQoO6kEu3ekvy1Xk/+d9GQ33yjsPk2SAZ/oL76R+o 7nZBEX7iA/9w1OESEQhrM632QEQIv2P+KMl4NBbLVnJ8a+TlnVf7T/Sh+QtGTanBUxVaa7+0He3 3U3AWT0ecAbzOq/jKxvH9fx1I8raUujwbhvQnB+o5VEZPKeB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove. Make use of
these. This fixes a runtime warning about the driver needing to be
converted to the bus methods.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-optee.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index f924a729ead0..eefde789d194 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -547,9 +547,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 		return 0;
 }
 
-static int optee_rtc_probe(struct device *dev)
+static int optee_rtc_probe(struct tee_client_device *rtc_device)
 {
-	struct tee_client_device *rtc_device = to_tee_client_device(dev);
+	struct device *dev = &rtc_device->dev;
 	struct tee_ioctl_open_session_arg sess2_arg = {0};
 	struct tee_ioctl_open_session_arg sess_arg = {0};
 	struct optee_rtc *priv;
@@ -682,8 +682,9 @@ static int optee_rtc_probe(struct device *dev)
 	return err;
 }
 
-static int optee_rtc_remove(struct device *dev)
+static void optee_rtc_remove(struct tee_client_device *rtc_device)
 {
+	struct device *dev = &rtc_device->dev;
 	struct optee_rtc *priv = dev_get_drvdata(dev);
 
 	if (priv->features & TA_RTC_FEATURE_ALARM) {
@@ -696,8 +697,6 @@ static int optee_rtc_remove(struct device *dev)
 	tee_shm_free(priv->shm);
 	tee_client_close_session(priv->ctx, priv->session_id);
 	tee_client_close_context(priv->ctx);
-
-	return 0;
 }
 
 static int optee_rtc_suspend(struct device *dev)
@@ -724,10 +723,10 @@ MODULE_DEVICE_TABLE(tee, optee_rtc_id_table);
 
 static struct tee_client_driver optee_rtc_driver = {
 	.id_table	= optee_rtc_id_table,
+	.probe		= optee_rtc_probe,
+	.remove		= optee_rtc_remove,
 	.driver		= {
 		.name		= "optee_rtc",
-		.probe		= optee_rtc_probe,
-		.remove		= optee_rtc_remove,
 		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
 	},
 };
-- 
2.47.3


