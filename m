Return-Path: <linux-rtc+bounces-2105-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936C9938A4
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 22:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0D61C23B7A
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 20:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505261D31A0;
	Mon,  7 Oct 2024 20:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eLQrtZz0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37B81727
	for <linux-rtc@vger.kernel.org>; Mon,  7 Oct 2024 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334722; cv=none; b=nF7XUgFU/9Y01eY5w9Y3s3ZL5NzvkwrBtQmtBhTcWmDesRflUlyJTqV/6SeqCAnBqaOGrh7mxkysz8Z1wA+5TKxtdHLSljmSAj7DgDLe1mgEwVDkR95vKyDauIzf6WWzjcwtfGHOuo934gE3Ef1tN38i1ZEkUDIsgvpmdAVIq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334722; c=relaxed/simple;
	bh=Vl7Yf5W4dxabzop8sCVQ7qZZThHTxcKxdLu+1gaztPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=INheEqasipix9tXrM9V/XTMY2eFDrTYKudaZJyH3cRCcs1hV7rZQOrtW/XUzDZmNqk3ODFAHKfSYKYBbZtgo8Ku+xYEvfNLLv9gd9H33uceEKUHK9zJmaA/gJKVY8q+ihVV70mjV+1MzYAKOh94s7S+ZnrWQpeWS/+GABLvM0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eLQrtZz0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so7237270a12.3
        for <linux-rtc@vger.kernel.org>; Mon, 07 Oct 2024 13:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728334716; x=1728939516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3npj9V23Pg+4+e8HcqH7ZqtKoTH9xFCg8h4YOAYeQZg=;
        b=eLQrtZz0GNu//wo6OVUqZ9Oob8PhXyla2+unvHxZ//3ua9R2lgGt/RHflqRQBxop75
         bxWGXoqkGFvOXnp/AwoLRvYw2Sn4/rmJ8bfGcoIY5mW2EQw6+YUF3PIyS5iIbD8XgRoA
         VG8eSYqC4LiTMDxpumAzZKwEZTKGtwnyoGSMO32QoCpsqhVwyT8Zv1oF9uAO7nICnyQz
         2sHPOuhvqWif1zwbnRlJpNi6bDiSZUmnxLS5Iv+ihVpHSmyS3CO6cy+7W6F+hrIpAF4V
         2et2Jn8jeKHOpRoQaqadNpWHAktQDUOqVJ1BxOqzsrnFGqUhPmrxhE2XILKL5VsKMTZL
         na4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334716; x=1728939516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3npj9V23Pg+4+e8HcqH7ZqtKoTH9xFCg8h4YOAYeQZg=;
        b=LlJmF3foVPzslof7iM5HR7gW0AByJvric4yzQuKA2svR4OP8ZT6l2BmIJm8f0qCaxh
         38XUilfi6mC/DxU2wZln03wD4t6/Bg5DpO9kiA9KuMnpj6n8128hzv0G1hBr3pDtfR+A
         XEdn/z7VMUfp76PX7qFu70ddHcIiMJhxdwHdcaez6i+3Rnm+6QOnlYbsJ3vPyTzNi5pE
         B4OjzxDGdrujAuPu8rwQOncjCk82uhXe5J+PIoUoMCaeu6nE0Am2X0XCy/pDy/+FXy1T
         4C5XJZwiRM//5FNIEwn14NkqrRfG8BNzrzMCgI8lG2WBzXhAzBXOSO+EoIwdFmJniH0T
         /NbQ==
X-Gm-Message-State: AOJu0Yy8Zncify9ZQESrWTyjXnTiZUsqWd/5Os1vlfqEhGDgk3l5L5Je
	KSaqcjn1PpKunC9truy7pGopvSFluVxFBg8mVRaK4XnE3zrKQC8XK/+3ZhKuhe4=
X-Google-Smtp-Source: AGHT+IEXPF3EtwQ8TQJ5njrhDc5exK7dsHXs2oIiNoCwdDIEbxcJIovX5Ok9G+E2tSLpp1UZVWTDPA==
X-Received: by 2002:a05:6402:3604:b0:5c3:cd88:a0a with SMTP id 4fb4d7f45d1cf-5c8d2e24800mr12365463a12.18.1728334713506;
        Mon, 07 Oct 2024 13:58:33 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:492d:9548:aca1:239d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05f3b80sm3560642a12.90.2024.10.07.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 13:58:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: Switch back to struct platform_driver::remove()
Date: Mon,  7 Oct 2024 22:58:03 +0200
Message-ID: <20241007205803.444994-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=25549; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Vl7Yf5W4dxabzop8sCVQ7qZZThHTxcKxdLu+1gaztPI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnBEtbAM9Gs/jYWk1nbp4kMwzWiJ5uoOhR7S8Gb dxqXt1p4IKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwRLWwAKCRCPgPtYfRL+ TujuB/wIDFxWCbmW8yXiG8gmqN7C25IwW2rVSmYmx1yRJgm3KJii/9U4oLA12jdfjR76KZ2MYPR pUGSl+TYdXk9PUd9EVqW9peiUd51Hf4nrWTLMiSa7++yQFHFnb3r1l87UZNgEGsqGjmbTbQWJOj GVGabzvxQEuaFY9pWthlg6xaQXN7ETPipKAx6T66Qdd2rZxqWqhN69oySumUgtS+NRbOXwGBIHr vHj4CKRkUfrVH1kIuOkwnFCbP6+U+kdh0qwP60F5kmM742MK2HeKoYH+RbsFlWk9hniwHH3Egx4 2gPU/Gb/T5Yj2Jx4OuCOK1HGyVhVtKaClhmFUHuFng6chUC8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/rtc to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on Friday's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/rtc/rtc-88pm80x.c           | 2 +-
 drivers/rtc/rtc-88pm860x.c          | 2 +-
 drivers/rtc/rtc-ab8500.c            | 2 +-
 drivers/rtc/rtc-ac100.c             | 2 +-
 drivers/rtc/rtc-asm9260.c           | 2 +-
 drivers/rtc/rtc-at91rm9200.c        | 2 +-
 drivers/rtc/rtc-at91sam9.c          | 2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c | 2 +-
 drivers/rtc/rtc-cadence.c           | 2 +-
 drivers/rtc/rtc-cmos.c              | 2 +-
 drivers/rtc/rtc-cros-ec.c           | 2 +-
 drivers/rtc/rtc-ds1685.c            | 2 +-
 drivers/rtc/rtc-ftrtc010.c          | 2 +-
 drivers/rtc/rtc-hid-sensor-time.c   | 2 +-
 drivers/rtc/rtc-imxdi.c             | 2 +-
 drivers/rtc/rtc-loongson.c          | 2 +-
 drivers/rtc/rtc-lpc24xx.c           | 2 +-
 drivers/rtc/rtc-max77686.c          | 2 +-
 drivers/rtc/rtc-mc13xxx.c           | 2 +-
 drivers/rtc/rtc-mpc5121.c           | 2 +-
 drivers/rtc/rtc-mpfs.c              | 2 +-
 drivers/rtc/rtc-mt7622.c            | 2 +-
 drivers/rtc/rtc-mv.c                | 2 +-
 drivers/rtc/rtc-mxc_v2.c            | 2 +-
 drivers/rtc/rtc-omap.c              | 2 +-
 drivers/rtc/rtc-palmas.c            | 2 +-
 drivers/rtc/rtc-pcf50633.c          | 2 +-
 drivers/rtc/rtc-pic32.c             | 2 +-
 drivers/rtc/rtc-pm8xxx.c            | 2 +-
 drivers/rtc/rtc-pxa.c               | 2 +-
 drivers/rtc/rtc-rc5t583.c           | 2 +-
 drivers/rtc/rtc-rtd119x.c           | 2 +-
 drivers/rtc/rtc-rzn1.c              | 2 +-
 drivers/rtc/rtc-s3c.c               | 2 +-
 drivers/rtc/rtc-sa1100.c            | 2 +-
 drivers/rtc/rtc-sh.c                | 2 +-
 drivers/rtc/rtc-spear.c             | 2 +-
 drivers/rtc/rtc-stm32.c             | 2 +-
 drivers/rtc/rtc-stmp3xxx.c          | 2 +-
 drivers/rtc/rtc-sunplus.c           | 2 +-
 drivers/rtc/rtc-tegra.c             | 2 +-
 drivers/rtc/rtc-tps6586x.c          | 2 +-
 drivers/rtc/rtc-twl.c               | 2 +-
 drivers/rtc/rtc-vt8500.c            | 2 +-
 drivers/rtc/rtc-wm8350.c            | 2 +-
 drivers/rtc/rtc-xgene.c             | 2 +-
 drivers/rtc/rtc-zynqmp.c            | 2 +-
 47 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index f40cc06b0979..5c39cf252392 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -329,7 +329,7 @@ static struct platform_driver pm80x_rtc_driver = {
 		   .pm = &pm80x_rtc_pm_ops,
 		   },
 	.probe = pm80x_rtc_probe,
-	.remove_new = pm80x_rtc_remove,
+	.remove = pm80x_rtc_remove,
 };
 
 module_platform_driver(pm80x_rtc_driver);
diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 0f124ed5b3e5..814230d61842 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -371,7 +371,7 @@ static struct platform_driver pm860x_rtc_driver = {
 		.pm	= &pm860x_rtc_pm_ops,
 	},
 	.probe		= pm860x_rtc_probe,
-	.remove_new	= pm860x_rtc_remove,
+	.remove		= pm860x_rtc_remove,
 };
 
 module_platform_driver(pm860x_rtc_driver);
diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index 75bb2ac9005c..2dcda96f4a8e 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -403,7 +403,7 @@ static struct platform_driver ab8500_rtc_driver = {
 		.name = "ab8500-rtc",
 	},
 	.probe	= ab8500_rtc_probe,
-	.remove_new = ab8500_rtc_remove,
+	.remove = ab8500_rtc_remove,
 	.id_table = ab85xx_rtc_ids,
 };
 
diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index fa642bba3cee..33626311fa78 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -628,7 +628,7 @@ MODULE_DEVICE_TABLE(of, ac100_rtc_match);
 
 static struct platform_driver ac100_rtc_driver = {
 	.probe		= ac100_rtc_probe,
-	.remove_new	= ac100_rtc_remove,
+	.remove		= ac100_rtc_remove,
 	.driver		= {
 		.name		= "ac100-rtc",
 		.of_match_table	= of_match_ptr(ac100_rtc_match),
diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index a83b47e0d8f5..705470ae8428 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -325,7 +325,7 @@ MODULE_DEVICE_TABLE(of, asm9260_dt_ids);
 
 static struct platform_driver asm9260_rtc_driver = {
 	.probe		= asm9260_rtc_probe,
-	.remove_new	= asm9260_rtc_remove,
+	.remove		= asm9260_rtc_remove,
 	.driver		= {
 		.name	= "asm9260-rtc",
 		.of_match_table = asm9260_dt_ids,
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..9b3898b8de7c 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -640,7 +640,7 @@ static SIMPLE_DEV_PM_OPS(at91_rtc_pm_ops, at91_rtc_suspend, at91_rtc_resume);
  * triggering a section mismatch warning.
  */
 static struct platform_driver at91_rtc_driver __refdata = {
-	.remove_new	= __exit_p(at91_rtc_remove),
+	.remove		= __exit_p(at91_rtc_remove),
 	.shutdown	= at91_rtc_shutdown,
 	.driver		= {
 		.name	= "at91_rtc",
diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 993c0878fb66..15b21da2788f 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -530,7 +530,7 @@ MODULE_DEVICE_TABLE(of, at91_rtc_dt_ids);
 
 static struct platform_driver at91_rtc_driver = {
 	.probe		= at91_rtc_probe,
-	.remove_new	= at91_rtc_remove,
+	.remove		= at91_rtc_remove,
 	.shutdown	= at91_rtc_shutdown,
 	.driver		= {
 		.name	= "rtc-at91sam9",
diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 1a65a4e0dc00..b108e75042eb 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -417,7 +417,7 @@ static const __maybe_unused struct of_device_id brcmstb_waketmr_of_match[] = {
 
 static struct platform_driver brcmstb_waketmr_driver = {
 	.probe			= brcmstb_waketmr_probe,
-	.remove_new		= brcmstb_waketmr_remove,
+	.remove			= brcmstb_waketmr_remove,
 	.driver = {
 		.name		= "brcmstb-waketimer",
 		.pm		= &brcmstb_waketmr_pm_ops,
diff --git a/drivers/rtc/rtc-cadence.c b/drivers/rtc/rtc-cadence.c
index 4ca60b519836..bf2a9a1fdea7 100644
--- a/drivers/rtc/rtc-cadence.c
+++ b/drivers/rtc/rtc-cadence.c
@@ -402,7 +402,7 @@ static struct platform_driver cdns_rtc_driver = {
 		.pm = &cdns_rtc_pm_ops,
 	},
 	.probe = cdns_rtc_probe,
-	.remove_new = cdns_rtc_remove,
+	.remove = cdns_rtc_remove,
 };
 module_platform_driver(cdns_rtc_driver);
 
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 35dca2accbb8..ae01ff031d36 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1528,7 +1528,7 @@ static void cmos_platform_shutdown(struct platform_device *pdev)
 MODULE_ALIAS("platform:rtc_cmos");
 
 static struct platform_driver cmos_platform_driver = {
-	.remove_new	= cmos_platform_remove,
+	.remove		= cmos_platform_remove,
 	.shutdown	= cmos_platform_shutdown,
 	.driver = {
 		.name		= driver_name,
diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index f57462c7b2c6..60a48c3ba3ca 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -401,7 +401,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_rtc_id);
 
 static struct platform_driver cros_ec_rtc_driver = {
 	.probe = cros_ec_rtc_probe,
-	.remove_new = cros_ec_rtc_remove,
+	.remove = cros_ec_rtc_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 04dbf35cf3b7..38e25f63597a 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1354,7 +1354,7 @@ static struct platform_driver ds1685_rtc_driver = {
 		.name	= "rtc-ds1685",
 	},
 	.probe		= ds1685_rtc_probe,
-	.remove_new	= ds1685_rtc_remove,
+	.remove		= ds1685_rtc_remove,
 };
 module_platform_driver(ds1685_rtc_driver);
 /* ----------------------------------------------------------------------- */
diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index 8bfe7378f653..cb4a5d101f53 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -214,7 +214,7 @@ static struct platform_driver ftrtc010_rtc_driver = {
 		.of_match_table = ftrtc010_rtc_dt_match,
 	},
 	.probe		= ftrtc010_rtc_probe,
-	.remove_new	= ftrtc010_rtc_remove,
+	.remove		= ftrtc010_rtc_remove,
 };
 
 module_platform_driver_probe(ftrtc010_rtc_driver, ftrtc010_rtc_probe);
diff --git a/drivers/rtc/rtc-hid-sensor-time.c b/drivers/rtc/rtc-hid-sensor-time.c
index b81cea505ee9..e30f80dc9319 100644
--- a/drivers/rtc/rtc-hid-sensor-time.c
+++ b/drivers/rtc/rtc-hid-sensor-time.c
@@ -319,7 +319,7 @@ static struct platform_driver hid_time_platform_driver = {
 		.name	= KBUILD_MODNAME,
 	},
 	.probe		= hid_time_probe,
-	.remove_new	= hid_time_remove,
+	.remove		= hid_time_remove,
 };
 module_platform_driver(hid_time_platform_driver);
 
diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 284011c419db..ca4a0af95e8c 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -860,7 +860,7 @@ static struct platform_driver dryice_rtc_driver __refdata = {
 		   .name = "imxdi_rtc",
 		   .of_match_table = dryice_dt_ids,
 		   },
-	.remove_new = __exit_p(dryice_rtc_remove),
+	.remove = __exit_p(dryice_rtc_remove),
 };
 
 module_platform_driver_probe(dryice_rtc_driver, dryice_rtc_probe);
diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index e8ffc1ab90b0..8d713e563d7c 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -381,7 +381,7 @@ MODULE_DEVICE_TABLE(acpi, loongson_rtc_acpi_match);
 
 static struct platform_driver loongson_rtc_driver = {
 	.probe		= loongson_rtc_probe,
-	.remove_new	= loongson_rtc_remove,
+	.remove		= loongson_rtc_remove,
 	.driver		= {
 		.name	= "loongson-rtc",
 		.of_match_table = loongson_rtc_of_match,
diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index df17c48ff086..2dcdc77ff646 100644
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -285,7 +285,7 @@ MODULE_DEVICE_TABLE(of, lpc24xx_rtc_match);
 
 static struct platform_driver lpc24xx_rtc_driver = {
 	.probe	= lpc24xx_rtc_probe,
-	.remove_new = lpc24xx_rtc_remove,
+	.remove = lpc24xx_rtc_remove,
 	.driver	= {
 		.name = "lpc24xx-rtc",
 		.of_match_table	= lpc24xx_rtc_match,
diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 35a6021d9ba4..a8f4b645c09d 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -875,7 +875,7 @@ static struct platform_driver max77686_rtc_driver = {
 		.pm	= &max77686_rtc_pm_ops,
 	},
 	.probe		= max77686_rtc_probe,
-	.remove_new	= max77686_rtc_remove,
+	.remove		= max77686_rtc_remove,
 	.id_table	= rtc_id,
 };
 
diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
index 763a42f422eb..e7b87130e624 100644
--- a/drivers/rtc/rtc-mc13xxx.c
+++ b/drivers/rtc/rtc-mc13xxx.c
@@ -350,7 +350,7 @@ MODULE_DEVICE_TABLE(platform, mc13xxx_rtc_idtable);
 
 static struct platform_driver mc13xxx_rtc_driver = {
 	.id_table = mc13xxx_rtc_idtable,
-	.remove_new = mc13xxx_rtc_remove,
+	.remove = mc13xxx_rtc_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 	},
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 71eafe4fbc72..600328131603 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -398,7 +398,7 @@ static struct platform_driver mpc5121_rtc_driver = {
 		.of_match_table = of_match_ptr(mpc5121_rtc_match),
 	},
 	.probe = mpc5121_rtc_probe,
-	.remove_new = mpc5121_rtc_remove,
+	.remove = mpc5121_rtc_remove,
 };
 
 module_platform_driver(mpc5121_rtc_driver);
diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 5b96a6d39210..3892b0f9917f 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -288,7 +288,7 @@ MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
 
 static struct platform_driver mpfs_rtc_driver = {
 	.probe = mpfs_rtc_probe,
-	.remove_new = mpfs_rtc_remove,
+	.remove = mpfs_rtc_remove,
 	.driver	= {
 		.name = "mpfs_rtc",
 		.of_match_table = mpfs_rtc_of_match,
diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 094c649fc137..4cf0cbb31a31 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -394,7 +394,7 @@ static SIMPLE_DEV_PM_OPS(mtk_rtc_pm_ops, mtk_rtc_suspend, mtk_rtc_resume);
 
 static struct platform_driver mtk_rtc_driver = {
 	.probe	= mtk_rtc_probe,
-	.remove_new = mtk_rtc_remove,
+	.remove = mtk_rtc_remove,
 	.driver = {
 		.name = MTK_RTC_DEV,
 		.of_match_table = mtk_rtc_match,
diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index db31da56bfa7..51029c536244 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -308,7 +308,7 @@ MODULE_DEVICE_TABLE(of, rtc_mv_of_match_table);
  * triggering a section mismatch warning.
  */
 static struct platform_driver mv_rtc_driver __refdata = {
-	.remove_new	= __exit_p(mv_rtc_remove),
+	.remove		= __exit_p(mv_rtc_remove),
 	.driver		= {
 		.name	= "rtc-mv",
 		.of_match_table = of_match_ptr(rtc_mv_of_match_table),
diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 6934bce4b29f..13c041bb79f1 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -381,7 +381,7 @@ static struct platform_driver mxc_rtc_driver = {
 		.of_match_table = mxc_ids,
 	},
 	.probe = mxc_rtc_probe,
-	.remove_new = mxc_rtc_remove,
+	.remove = mxc_rtc_remove,
 };
 
 module_platform_driver(mxc_rtc_driver);
diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index e6b2a9c15b54..c123778e2d9b 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -1014,7 +1014,7 @@ static void omap_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver omap_rtc_driver = {
 	.probe		= omap_rtc_probe,
-	.remove_new	= omap_rtc_remove,
+	.remove		= omap_rtc_remove,
 	.shutdown	= omap_rtc_shutdown,
 	.driver		= {
 		.name	= "omap_rtc",
diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index 6971e47c6021..7256a88b490c 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -346,7 +346,7 @@ MODULE_DEVICE_TABLE(of, of_palmas_rtc_match);
 
 static struct platform_driver palmas_rtc_driver = {
 	.probe		= palmas_rtc_probe,
-	.remove_new	= palmas_rtc_remove,
+	.remove		= palmas_rtc_remove,
 	.driver		= {
 		.name	= "palmas-rtc",
 		.pm	= &palmas_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-pcf50633.c b/drivers/rtc/rtc-pcf50633.c
index 23edd11aa40c..c019c4d91c7d 100644
--- a/drivers/rtc/rtc-pcf50633.c
+++ b/drivers/rtc/rtc-pcf50633.c
@@ -273,7 +273,7 @@ static struct platform_driver pcf50633_rtc_driver = {
 		.name = "pcf50633-rtc",
 	},
 	.probe = pcf50633_rtc_probe,
-	.remove_new = pcf50633_rtc_remove,
+	.remove = pcf50633_rtc_remove,
 };
 
 module_platform_driver(pcf50633_rtc_driver);
diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 4f85e0c3d757..bed3c27e665f 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -371,7 +371,7 @@ MODULE_DEVICE_TABLE(of, pic32_rtc_dt_ids);
 
 static struct platform_driver pic32_rtc_driver = {
 	.probe		= pic32_rtc_probe,
-	.remove_new	= pic32_rtc_remove,
+	.remove		= pic32_rtc_remove,
 	.driver		= {
 		.name	= "pic32-rtc",
 		.of_match_table	= of_match_ptr(pic32_rtc_dt_ids),
diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index c32fba550c8e..2f32187ecc8d 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -537,7 +537,7 @@ static void pm8xxx_remove(struct platform_device *pdev)
 
 static struct platform_driver pm8xxx_rtc_driver = {
 	.probe		= pm8xxx_rtc_probe,
-	.remove_new	= pm8xxx_remove,
+	.remove		= pm8xxx_remove,
 	.driver	= {
 		.name		= "rtc-pm8xxx",
 		.of_match_table	= pm8xxx_id_table,
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index cdb39fc4cab5..34d8545c8e15 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -409,7 +409,7 @@ static SIMPLE_DEV_PM_OPS(pxa_rtc_pm_ops, pxa_rtc_suspend, pxa_rtc_resume);
  * triggering a section mismatch warning.
  */
 static struct platform_driver pxa_rtc_driver __refdata = {
-	.remove_new	= __exit_p(pxa_rtc_remove),
+	.remove		= __exit_p(pxa_rtc_remove),
 	.driver		= {
 		.name	= "pxa-rtc",
 		.of_match_table = of_match_ptr(pxa_rtc_dt_ids),
diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index 115c46f862f9..eecb49bab56a 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -298,7 +298,7 @@ static SIMPLE_DEV_PM_OPS(rc5t583_rtc_pm_ops, rc5t583_rtc_suspend,
 
 static struct platform_driver rc5t583_rtc_driver = {
 	.probe		= rc5t583_rtc_probe,
-	.remove_new	= rc5t583_rtc_remove,
+	.remove		= rc5t583_rtc_remove,
 	.driver		= {
 		.name	= "rtc-rc5t583",
 		.pm	= &rc5t583_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-rtd119x.c b/drivers/rtc/rtc-rtd119x.c
index 29662dfd56fe..85a138db81d7 100644
--- a/drivers/rtc/rtc-rtd119x.c
+++ b/drivers/rtc/rtc-rtd119x.c
@@ -228,7 +228,7 @@ static void rtd119x_rtc_remove(struct platform_device *pdev)
 
 static struct platform_driver rtd119x_rtc_driver = {
 	.probe = rtd119x_rtc_probe,
-	.remove_new = rtd119x_rtc_remove,
+	.remove = rtd119x_rtc_remove,
 	.driver = {
 		.name = "rtd1295-rtc",
 		.of_match_table	= rtd119x_rtc_dt_ids,
diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 56ebbd4d0481..a8316956f7d7 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -405,7 +405,7 @@ MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
 static struct platform_driver rzn1_rtc_driver = {
 	.probe = rzn1_rtc_probe,
-	.remove_new = rzn1_rtc_remove,
+	.remove = rzn1_rtc_remove,
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 282238818f63..c0ac3bdb2f42 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -597,7 +597,7 @@ MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
 
 static struct platform_driver s3c_rtc_driver = {
 	.probe		= s3c_rtc_probe,
-	.remove_new	= s3c_rtc_remove,
+	.remove		= s3c_rtc_remove,
 	.driver		= {
 		.name	= "s3c-rtc",
 		.pm	= &s3c_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 0b2cfa8ca05b..13799b1abca1 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -341,7 +341,7 @@ MODULE_DEVICE_TABLE(of, sa1100_rtc_dt_ids);
 
 static struct platform_driver sa1100_rtc_driver = {
 	.probe		= sa1100_rtc_probe,
-	.remove_new	= sa1100_rtc_remove,
+	.remove		= sa1100_rtc_remove,
 	.driver		= {
 		.name	= "sa1100-rtc",
 		.pm	= &sa1100_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 27a191fa3704..a5df521876ba 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -678,7 +678,7 @@ static struct platform_driver sh_rtc_platform_driver __refdata = {
 		.pm	= &sh_rtc_pm_ops,
 		.of_match_table = sh_rtc_of_match,
 	},
-	.remove_new	= __exit_p(sh_rtc_remove),
+	.remove		= __exit_p(sh_rtc_remove),
 };
 
 module_platform_driver_probe(sh_rtc_platform_driver, sh_rtc_probe);
diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 1df5c7e94198..26eed927f8b3 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -475,7 +475,7 @@ MODULE_DEVICE_TABLE(of, spear_rtc_id_table);
 
 static struct platform_driver spear_rtc_driver = {
 	.probe = spear_rtc_probe,
-	.remove_new = spear_rtc_remove,
+	.remove = spear_rtc_remove,
 	.shutdown = spear_rtc_shutdown,
 	.driver = {
 		.name = "rtc-spear",
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 3e4f2ee22b0b..9f1a019ec8af 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1287,7 +1287,7 @@ static const struct dev_pm_ops stm32_rtc_pm_ops = {
 
 static struct platform_driver stm32_rtc_driver = {
 	.probe		= stm32_rtc_probe,
-	.remove_new	= stm32_rtc_remove,
+	.remove		= stm32_rtc_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.pm	= &stm32_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7566d0a44af8..7afcd14aeee5 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -403,7 +403,7 @@ MODULE_DEVICE_TABLE(of, rtc_dt_ids);
 
 static struct platform_driver stmp3xxx_rtcdrv = {
 	.probe		= stmp3xxx_rtc_probe,
-	.remove_new	= stmp3xxx_rtc_remove,
+	.remove		= stmp3xxx_rtc_remove,
 	.driver		= {
 		.name	= "stmp3xxx-rtc",
 		.pm	= &stmp3xxx_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-sunplus.c b/drivers/rtc/rtc-sunplus.c
index 20c7e97c2fc8..9b1ce0e8ba27 100644
--- a/drivers/rtc/rtc-sunplus.c
+++ b/drivers/rtc/rtc-sunplus.c
@@ -344,7 +344,7 @@ static SIMPLE_DEV_PM_OPS(sp_rtc_pm_ops, sp_rtc_suspend, sp_rtc_resume);
 
 static struct platform_driver sp_rtc_driver = {
 	.probe   = sp_rtc_probe,
-	.remove_new = sp_rtc_remove,
+	.remove = sp_rtc_remove,
 	.driver  = {
 		.name	= "sp7021-rtc",
 		.of_match_table = sp_rtc_of_match,
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 441e0a66b215..79a3102c8354 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -399,7 +399,7 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver tegra_rtc_driver = {
 	.probe = tegra_rtc_probe,
-	.remove_new = tegra_rtc_remove,
+	.remove = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
 		.name = "tegra_rtc",
diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 20faf08c254c..e796729fc817 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -317,7 +317,7 @@ static struct platform_driver tps6586x_rtc_driver = {
 		.pm	= &tps6586x_pm_ops,
 	},
 	.probe	= tps6586x_rtc_probe,
-	.remove_new = tps6586x_rtc_remove,
+	.remove = tps6586x_rtc_remove,
 };
 module_platform_driver(tps6586x_rtc_driver);
 
diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index 4e24c12004f1..794429182b34 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -673,7 +673,7 @@ MODULE_DEVICE_TABLE(of, twl_rtc_of_match);
 
 static struct platform_driver twl4030rtc_driver = {
 	.probe		= twl_rtc_probe,
-	.remove_new	= twl_rtc_remove,
+	.remove		= twl_rtc_remove,
 	.shutdown	= twl_rtc_shutdown,
 	.driver		= {
 		.name		= "twl_rtc",
diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index ccfa76513a2c..c8b568498016 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -251,7 +251,7 @@ MODULE_DEVICE_TABLE(of, wmt_dt_ids);
 
 static struct platform_driver vt8500_rtc_driver = {
 	.probe		= vt8500_rtc_probe,
-	.remove_new	= vt8500_rtc_remove,
+	.remove		= vt8500_rtc_remove,
 	.driver		= {
 		.name	= "vt8500-rtc",
 		.of_match_table = wmt_dt_ids,
diff --git a/drivers/rtc/rtc-wm8350.c b/drivers/rtc/rtc-wm8350.c
index 3c773cff2b39..6797eb4d2e49 100644
--- a/drivers/rtc/rtc-wm8350.c
+++ b/drivers/rtc/rtc-wm8350.c
@@ -459,7 +459,7 @@ static SIMPLE_DEV_PM_OPS(wm8350_rtc_pm_ops, wm8350_rtc_suspend,
 
 static struct platform_driver wm8350_rtc_driver = {
 	.probe = wm8350_rtc_probe,
-	.remove_new = wm8350_rtc_remove,
+	.remove = wm8350_rtc_remove,
 	.driver = {
 		.name = "wm8350-rtc",
 		.pm = &wm8350_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index f78efc9760c0..0813ea1a03c2 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -263,7 +263,7 @@ MODULE_DEVICE_TABLE(of, xgene_rtc_of_match);
 
 static struct platform_driver xgene_rtc_driver = {
 	.probe		= xgene_rtc_probe,
-	.remove_new	= xgene_rtc_remove,
+	.remove		= xgene_rtc_remove,
 	.driver		= {
 		.name	= "xgene-rtc",
 		.pm = &xgene_rtc_pm_ops,
diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 08ed171bdab4..af1abb69d1e3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -382,7 +382,7 @@ MODULE_DEVICE_TABLE(of, xlnx_rtc_of_match);
 
 static struct platform_driver xlnx_rtc_driver = {
 	.probe		= xlnx_rtc_probe,
-	.remove_new	= xlnx_rtc_remove,
+	.remove		= xlnx_rtc_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.pm	= &xlnx_rtc_pm_ops,

base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
-- 
2.45.2


