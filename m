Return-Path: <linux-rtc+bounces-319-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6F7EFEAD
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Nov 2023 10:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912111F22DA3
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Nov 2023 09:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878DB53AF;
	Sat, 18 Nov 2023 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcaQXqoZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6469D72
	for <linux-rtc@vger.kernel.org>; Sat, 18 Nov 2023 01:22:33 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c2066accc5so825629a12.3
        for <linux-rtc@vger.kernel.org>; Sat, 18 Nov 2023 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700299348; x=1700904148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Od+FKbvYOGIsOS132qZhYPHACVtH2G4hHkoWNUhgTrU=;
        b=XcaQXqoZIxqj4G61GWlwztcNyb0Anzi2c6/GXgDyS8XS5NQf6i+0AP6dtSiGMjMecL
         /4nJdpb7dTcrEj7FPhU2glFYn67GSWuR9lypgEMv7saJ5e/JT8udbtUY/sphnGRDPX8z
         0z5AFA0QIsvSBQnvT0yTgvUf7X7AP/SFPH6pUw5sdSRcIHlzo3evE3bGj03Z3UKNQFRj
         RkykGSF5XI78y3JPij/PNVrX+8WAYeKKyofjmF5mVIO7vVHqzNQv6V7t5G4hEgMAkHji
         lo4sGXObpaqI6EsaojxfV8e9tTlGWH5mLKdm6oqWJja8BoFmNJydahIO2er4cI0VRp6K
         5HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700299348; x=1700904148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od+FKbvYOGIsOS132qZhYPHACVtH2G4hHkoWNUhgTrU=;
        b=J9Ih0ia5URgmz7TkUglcL2qTGwh7pj8K5ZbtlAwTI47sFVfzVBAeYsCsuf5xAy8M5/
         rkfX6L96m3d8/CPlLIZqUGTVgvW7EaNvzl3Nr9wzFU1P9sZVYvOv18SWwSbwDQ0EXJ2d
         BBk3Ca4l4L+yX2CmL6/IeFkkAdlWe8nlSYZ4l7QGsN8QO/m3pYY8oPTSRow51ZI7T7Ia
         1p8npm+Y9aMUhcHsEzwlaGcEBUAfEbbmEfsfPKX5YySFj+uc77R84diEG1rOljh4cdA0
         v0GOkln//jbjhdDlA0cWvcKIaVnh75Jgn/ucL5WUFCf3Q3lkekalnlHNYIoLQF4uy0nm
         jquQ==
X-Gm-Message-State: AOJu0YypMJfWUaHLfcUqESAreRRJfAHKAP03sWis0ujUnTXP65vrXGc+
	craMnxTiyHGaNEF1Z9AFhCR8iFs6V7M=
X-Google-Smtp-Source: AGHT+IH4vZJGovCcV1Fqet2/QcaKnhywWZiK05Ee//WWtBJYMplAkJH3k8VoAFOfNsvbxpMG9X5UVg==
X-Received: by 2002:a05:6a21:6d9b:b0:187:5302:4b20 with SMTP id wl27-20020a056a216d9b00b0018753024b20mr1609275pzb.41.1700299347880;
        Sat, 18 Nov 2023 01:22:27 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:65f5:5dbb:9d18:499c])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a199b00b0028028560c4bsm4847880pji.57.2023.11.18.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 01:22:26 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: akinobu.mita@gmail.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] rtc: ds3232: avoid unused-const-variable warning
Date: Sat, 18 Nov 2023 18:22:00 +0900
Message-Id: <20231118092200.829808-1-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning when CONFIG_I2C is not set but CONFIG_SPI_MASTER
is set.

warning: 'ds3232_pm_ops' defined but not used [-Wunused-const-variable=]

'ds3232_pm_ops' is only used by rtc-ds3232 i2c driver, so move the device
PM callbacks inside #if IS_ENABLED(CONFIG_I2C).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311172325.33tTniaJ-lkp@intel.com/
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/rtc/rtc-ds3232.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 89d7b085f721..1485a6ae51e6 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -536,6 +536,8 @@ static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_I2C)
+
 #ifdef CONFIG_PM_SLEEP
 static int ds3232_suspend(struct device *dev)
 {
@@ -564,8 +566,6 @@ static const struct dev_pm_ops ds3232_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ds3232_suspend, ds3232_resume)
 };
 
-#if IS_ENABLED(CONFIG_I2C)
-
 static int ds3232_i2c_probe(struct i2c_client *client)
 {
 	struct regmap *regmap;
-- 
2.34.1


