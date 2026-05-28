Return-Path: <linux-rtc+bounces-6581-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EMrI4flF2otUggAu9opvQ
	(envelope-from <linux-rtc+bounces-6581-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:49:43 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C15ED63F
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A8B530E3D77
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 06:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008B3446A3;
	Thu, 28 May 2026 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gzB7S+NK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406913403F7
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950914; cv=none; b=mOQCDdZuBRIxKxggj5VdsMC2VPByExlNy1aiQflPO8NLrXUwJ/Rr+ebGl2sdxzODFiVRmkBk6k/nXvgHiRIQ4NXcm5hkZ3rMcLkEJQ6U6nlYTgvHtH85SPOcXfLsQTdsOObJOHJh0Xrr6U2UIUJCUcTIvjCEFaWH5dIT2JMzlQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950914; c=relaxed/simple;
	bh=ctSZqEB1mlU+XvYe9FpEXZw3i6PMNlg9mOrPLqs/9M4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QRlbhYCDTTJ5ml7BYOz5pv3d9j8DNk0LyYU0nzCBOuIf5szFQKOmsSYeRyChih7JOSdExmb226TJU+Mf0oPQ4KDbt5NkCilSwwYR4J+Y0uxF05hp3SCR584iEG7npLw/sCzJl00fSdHmnQ779IbLLdU9YOUb5HHEcIoAeT+xRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gzB7S+NK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso42330755e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950910; x=1780555710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImRGRn+Fhpb0WqEiONhradFoxfKocbbhNboCMBAjm1U=;
        b=gzB7S+NKgoSpTirBxxoJcIQjyCJ1WSppgIXRr0lfQthFFhConTiP1usCUkpZuUUw95
         07pyJ9+egz9z1u3CHnvAeUiiCbAxkr1YTIY31jYcV18OInqIZywiflY+z7d60FfwaB8D
         SwZdJLoCM6IaX6z+Hf8d1UdRF0CWkxOpSShfTmflvmBeLhMEICDJjfRPbWy/mceNiSlH
         nKGaCShdYa7jVjRwRnJyIIkNNogK9tRxXY8d1TqRzE41IUejiP0skBLb9jIyREI5Il7M
         vRrJ2DGj7WZUqcS3eZ37yBI3cH/Bl1p88xX+rLVnPUVwjD7tRbCogl4/m1mkhVRjtGKM
         dXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950910; x=1780555710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImRGRn+Fhpb0WqEiONhradFoxfKocbbhNboCMBAjm1U=;
        b=C9308PCqwDATSmPVpf1yiDei/oa9+ptYL/eqqu5Esyt+x0i8h3owHulcLsiSUlyf8t
         qrzURP/SvO08GofrBRwuQfexCjKxQRRVlPdXUZ7c774txzHf6i6b3pKeBIxR6ZR51RQR
         6cSZrQ7NKnGW1q4ccKTk8zjk38AHqMPnxrL2sY4NjEB5Jbm0GuOFJmpu2W/D+LTc8MPB
         TFcjikeS2belPGQy/5vM9qLTz3q/sNdehWU5epgJaVaPTXG8lZHCdYJGQeNBuX59K5Yz
         hVP0hOzKT3Li/CXkuRaWm2ugI0RIFbmLEDE1gcCANzVVn/nKFjzOad5NxQB5n/3hwkPZ
         9lGg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z47un92KWc7NEaa0z170VJDcNsMCrCyKRdaGTpriKzrJ526sJxBdbsss+rSsw2B5rnbRfVdnnPW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7Caj+Z6/ahlqiVn2uUP9OfW5vJGeAqvgfTIYb+Cf65H8eJ3Y
	5SzFHKHGzR8ibIrlJlMyTPSY2eHCeHC8MmbXSLJn/WlAEapFXoyETekY2ntMTCkr19k=
X-Gm-Gg: Acq92OF8babjCgnqQWZCALq6AxXi6Mr17fdgBdCgqNB3CNCmn+Hi0P0490oVnAzAh29
	aKdKItesz1VXCMnNgIDpBroMhqHZrXu6h7VTvE589f5V7Ta/vB+qnMLEMDfl6Tq1WecPLtYuhPO
	wQiNQ6AzbVUmGeGWsHkPW9qn7f4M9DNaZDKc4INhWrB6eqyJFR4jzg0MEwsByQ4Bz1TSfj7BRIm
	nXlxHA7k655agN+4WsIevumJ4lmsVLLDOXpym3VYeSs9knQYbJ6RVsQrE3GGqNe8rlpG9knTxtR
	w28tmZd1FhZ6QcGyi2kakCp1vAuyEvWrhjLFkWCyjxCJsq6yc53SoXeV4atnMzcpWCsnNLUFNq7
	vnGQYCL4sNqeSCwE93TRvMj4f5uNCxnQ6atle19vaaU6jJcWdqig4AFcC0IiWaTZ5YvkhjploXj
	Fl82EHrX8w3aoXha1jBBla9pbzys2Zgw+mSch8HVSMQB9iwpXrCZIMyo8jc9yFW84/CZpU5acTg
	V/doHldvK1WAG8XHRGB2vOOZg==
X-Received: by 2002:a05:600c:6995:b0:490:482c:4384 with SMTP id 5b1f17b1804b1-490482c44ddmr429872215e9.24.1779950909709;
        Wed, 27 May 2026 23:48:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908d80952asm13777795e9.1.2026.05.27.23.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1 0/3] rtc: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 08:48:09 +0200
Message-ID: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ctSZqEB1mlU+XvYe9FpEXZw3i6PMNlg9mOrPLqs/9M4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+Up8pYbtZoUCw3r8+fOJGekG5PZPwptdY0eL tFdqigjF+OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflKQAKCRCPgPtYfRL+ TjgYCAChrHD2kpobkQDS/kOb03ZK4sw2ENh4cFJRBLYOasAIuMF3//D2JUL2ZbhP6+lWhluNIn0 ezNtZga4/I3VHz4htYqJ88jImRuMyg8IiWCGrVoEESkPCftK4VlmnStBfSm5b5mBjSdOz9YTcqm ucxuQ548hWFvNdEw9T2W/1NND6t3KJbrRntNSQMDvkOM6Z2kpas4+wLMBWN0xK6IX1mkWUV1zNP wucjVeqV3zSbA1ROQEw1dSTomgIW6qg6vXbkKx66Yl9O+Ew6aBOPnYbET8HgyuX7pRy6s57sbjC WUAPAlIvVPAhOrsmeSO8svYa2NisfNk0lzzlqth0+Tm4g7Iz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6581-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,matfyz.cz,gmail.com,samsung.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 191C15ED63F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
	index 375565a3bddf..31b641bd8962 100644
	--- a/drivers/rtc/rtc-max77686.c
	+++ b/drivers/rtc/rtc-max77686.c
	@@ -760,8 +760,7 @@ static int max77686_rtc_probe(struct platform_device *pdev)
	 
		mutex_init(&info->lock);
		info->dev = &pdev->dev;
	-	info->drv_data = (const struct max77686_rtc_driver_data *)
	-		id->driver_data;
	+	info->drv_data = id->driver_data_ptr;
	 
		ret = max77686_init_rtc_regmap(info);
		if (ret < 0)
	@@ -866,10 +865,10 @@ static SIMPLE_DEV_PM_OPS(max77686_rtc_pm_ops,
				 max77686_rtc_suspend, max77686_rtc_resume);
	 
	 static const struct platform_device_id rtc_id[] = {
	-	{ .name = "max77686-rtc", .driver_data = (kernel_ulong_t)&max77686_drv_data },
	-	{ .name = "max77802-rtc", .driver_data = (kernel_ulong_t)&max77802_drv_data },
	-	{ .name = "max77620-rtc", .driver_data = (kernel_ulong_t)&max77620_drv_data },
	-	{ .name = "max77714-rtc", .driver_data = (kernel_ulong_t)&max77714_drv_data },
	+	{ .name = "max77686-rtc", .driver_data_ptr = &max77686_drv_data },
	+	{ .name = "max77802-rtc", .driver_data_ptr = &max77802_drv_data },
	+	{ .name = "max77620-rtc", .driver_data_ptr = &max77620_drv_data },
	+	{ .name = "max77714-rtc", .driver_data_ptr = &max77714_drv_data },
		{ }
	 };
	 MODULE_DEVICE_TABLE(platform, rtc_id);

increasing readability due to less casting which also improves type safety.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  rtc: Drop unused assignment of platform_device_id driver data
  rtc: ab8500: Simplify driver_data handling
  rtc: Use named initializers for platform_device_id arrays

 drivers/rtc/rtc-88pm886.c  |  2 +-
 drivers/rtc/rtc-ab8500.c   |  5 ++---
 drivers/rtc/rtc-bd70528.c  |  8 ++++----
 drivers/rtc/rtc-cros-ec.c  |  4 ++--
 drivers/rtc/rtc-max77686.c | 10 +++++-----
 drivers/rtc/rtc-max8997.c  |  4 ++--
 drivers/rtc/rtc-max8998.c  |  4 ++--
 drivers/rtc/rtc-s5m.c      | 12 ++++++------
 drivers/rtc/rtc-tps6594.c  |  4 ++--
 9 files changed, 26 insertions(+), 27 deletions(-)


base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


