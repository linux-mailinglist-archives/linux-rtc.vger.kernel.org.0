Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31A62AC0FC
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgKIQet (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbgKIQeZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:25 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DD7C0613D4
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:24 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so4952141wrb.9
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8qti8//hWR3Yn18i3q7v+esd5iNo9AwdbjlM0P5szw=;
        b=RNHnCGB7KE0ArWMPpL4pTqZ9SPPhtYsK16NACrMXGgv9ANPd0LxpYH/29PzBCRJDSn
         6ty+RtDzf5tgsIxmGHdGMEP7QFj8OLUElnHms90FccE7FXRS9cMku6P4B2zoL7jzSJMG
         eMpcO7iOeKTR5lIHRs+3paRy+Pww3o26yheAEkCGshunXSk0/PryJs9XT7Th4daBP7Ww
         5aphK7SN2MbSvwdgn5EZowau3ye0mRfv04d2fu/UMgiKzIX+LrrSpgkS4tDpoiuGDplr
         7c633BnN7HKlCG0xUBhNTVO2xFG6k7gFiOgOwuxgON3Ez3cDT4OnRaBBPQYvFJsDRhiF
         Z8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8qti8//hWR3Yn18i3q7v+esd5iNo9AwdbjlM0P5szw=;
        b=hoOoscumxw2i5+pJBu/MIjIAus5aHiAx0WqoxDZh3Zxx+JUczeWIq9pRQCYd5L3/3l
         ZHcfLST4gKFybsultui/n6jTdAyRdfAZ7hhu6YV04dfHUEKCOh2jW9mzLal7STJNgYaF
         Z0E4V7o5HROmNgwLg5kYNxP98xGrmIvHsG/9I11IYCnxF1nRZM+XbRTRR09+uSZjEm8N
         BLuGO7va7KzN0cWOoBw2fORSNITNwIOl5QMJ8DQwfnKDiu6HAccbTWZzcgcDNtFjAyeY
         u5CUZ98tD4jQX25VcLijQHPw4vwrta7WIDdwju+8gxL5gltxtnmc3wB4Sl9eTafsL1k6
         BqWA==
X-Gm-Message-State: AOAM532InoFuE0zaxKH2X4u5dlbEoj4wwN320lpm6KDPWmDwF516KxBG
        BmfBQOctFsLp+w2ZpukE6H0/qg==
X-Google-Smtp-Source: ABdhPJzOO06NwU0FT9YN56z6V4oodpfMQdsMjI/lJXANDY+WMOeqzGyyno3s8e45okwjrXZ7Z/mMYw==
X-Received: by 2002:a5d:6a0a:: with SMTP id m10mr19289189wru.189.1604939663610;
        Mon, 09 Nov 2020 08:34:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/8] rtc: nvmem: remove nvram ABI
Date:   Mon,  9 Nov 2020 17:34:05 +0100
Message-Id: <20201109163409.24301-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The nvram sysfs attributes have been deprecated at least since v4.13, more
than 3 years ago and nobody ever complained about the deprecation warning.

Remove the sysfs attributes now.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
[Bartosz: remove the declaration of rtc_nvmem_unregister()]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/class.c        |  2 -
 drivers/rtc/nvmem.c        | 82 +-------------------------------------
 drivers/rtc/rtc-cmos.c     |  1 -
 drivers/rtc/rtc-ds1305.c   |  1 -
 drivers/rtc/rtc-ds1307.c   |  1 -
 drivers/rtc/rtc-ds1343.c   |  1 -
 drivers/rtc/rtc-ds1511.c   |  2 -
 drivers/rtc/rtc-ds1553.c   |  1 -
 drivers/rtc/rtc-ds1685.c   |  1 -
 drivers/rtc/rtc-ds1742.c   |  1 -
 drivers/rtc/rtc-m48t59.c   |  1 -
 drivers/rtc/rtc-m48t86.c   |  1 -
 drivers/rtc/rtc-rp5c01.c   |  1 -
 drivers/rtc/rtc-rv8803.c   |  1 -
 drivers/rtc/rtc-stk17ta8.c |  1 -
 drivers/rtc/rtc-tx4939.c   |  1 -
 include/linux/rtc.h        |  6 ---
 17 files changed, 1 insertion(+), 104 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 7c88d190c51f..a99b7d24b77c 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -339,8 +339,6 @@ static void devm_rtc_release_device(struct device *dev, void *res)
 {
 	struct rtc_device *rtc = *(struct rtc_device **)res;
 
-	rtc_nvmem_unregister(rtc);
-
 	if (rtc->registered)
 		rtc_device_unregister(rtc);
 	else
diff --git a/drivers/rtc/nvmem.c b/drivers/rtc/nvmem.c
index 4312096c7738..5e0b178a3b65 100644
--- a/drivers/rtc/nvmem.c
+++ b/drivers/rtc/nvmem.c
@@ -9,74 +9,7 @@
 #include <linux/types.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/rtc.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 
-/*
- * Deprecated ABI compatibility, this should be removed at some point
- */
-
-static const char nvram_warning[] = "Deprecated ABI, please use nvmem";
-
-static ssize_t
-rtc_nvram_read(struct file *filp, struct kobject *kobj,
-	       struct bin_attribute *attr,
-	       char *buf, loff_t off, size_t count)
-{
-	dev_warn_once(kobj_to_dev(kobj), nvram_warning);
-
-	return nvmem_device_read(attr->private, off, count, buf);
-}
-
-static ssize_t
-rtc_nvram_write(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr,
-		char *buf, loff_t off, size_t count)
-{
-	dev_warn_once(kobj_to_dev(kobj), nvram_warning);
-
-	return nvmem_device_write(attr->private, off, count, buf);
-}
-
-static int rtc_nvram_register(struct rtc_device *rtc,
-			      struct nvmem_device *nvmem, size_t size)
-{
-	int err;
-
-	rtc->nvram = kzalloc(sizeof(*rtc->nvram), GFP_KERNEL);
-	if (!rtc->nvram)
-		return -ENOMEM;
-
-	rtc->nvram->attr.name = "nvram";
-	rtc->nvram->attr.mode = 0644;
-	rtc->nvram->private = nvmem;
-
-	sysfs_bin_attr_init(rtc->nvram);
-
-	rtc->nvram->read = rtc_nvram_read;
-	rtc->nvram->write = rtc_nvram_write;
-	rtc->nvram->size = size;
-
-	err = sysfs_create_bin_file(&rtc->dev.parent->kobj,
-				    rtc->nvram);
-	if (err) {
-		kfree(rtc->nvram);
-		rtc->nvram = NULL;
-	}
-
-	return err;
-}
-
-static void rtc_nvram_unregister(struct rtc_device *rtc)
-{
-	sysfs_remove_bin_file(&rtc->dev.parent->kobj, rtc->nvram);
-	kfree(rtc->nvram);
-	rtc->nvram = NULL;
-}
-
-/*
- * New ABI, uses nvmem
- */
 int rtc_nvmem_register(struct rtc_device *rtc,
 		       struct nvmem_config *nvmem_config)
 {
@@ -88,20 +21,7 @@ int rtc_nvmem_register(struct rtc_device *rtc,
 	nvmem_config->dev = rtc->dev.parent;
 	nvmem_config->owner = rtc->owner;
 	nvmem = devm_nvmem_register(rtc->dev.parent, nvmem_config);
-	if (IS_ERR(nvmem))
-		return PTR_ERR(nvmem);
-
-	/* Register the old ABI */
-	if (rtc->nvram_old_abi)
-		rtc_nvram_register(rtc, nvmem, nvmem_config->size);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(nvmem);
 }
 EXPORT_SYMBOL_GPL(rtc_nvmem_register);
-
-void rtc_nvmem_unregister(struct rtc_device *rtc)
-{
-	/* unregister the old ABI */
-	if (rtc->nvram)
-		rtc_nvram_unregister(rtc);
-}
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index c633319cdb91..adca0de76e53 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -863,7 +863,6 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 		cmos_rtc.rtc->ops = &cmos_rtc_ops_no_alarm;
 	}
 
-	cmos_rtc.rtc->nvram_old_abi = true;
 	retval = rtc_register_device(cmos_rtc.rtc);
 	if (retval)
 		goto cleanup2;
diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index a3d790889eea..a1ed539d41b4 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -694,7 +694,6 @@ static int ds1305_probe(struct spi_device *spi)
 	ds1305->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ds1305_nvmem_cfg.priv = ds1305;
-	ds1305->rtc->nvram_old_abi = true;
 	status = rtc_register_device(ds1305->rtc);
 	if (status)
 		return status;
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 9f5f54ca039d..2e6063807bd4 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -2047,7 +2047,6 @@ static int ds1307_probe(struct i2c_client *client,
 			.priv = ds1307,
 		};
 
-		ds1307->rtc->nvram_old_abi = true;
 		rtc_nvmem_register(ds1307->rtc, &nvmem_cfg);
 	}
 
diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ba143423875b..e7604e844cbd 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -399,7 +399,6 @@ static int ds1343_probe(struct spi_device *spi)
 	if (IS_ERR(priv->rtc))
 		return PTR_ERR(priv->rtc);
 
-	priv->rtc->nvram_old_abi = true;
 	priv->rtc->ops = &ds1343_rtc_ops;
 	priv->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc->range_max = RTC_TIMESTAMP_END_2099;
diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index a63872c4c76d..33c483d759c8 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -466,8 +466,6 @@ static int ds1511_rtc_probe(struct platform_device *pdev)
 
 	pdata->rtc->ops = &ds1511_rtc_ops;
 
-	pdata->rtc->nvram_old_abi = true;
-
 	ret = rtc_register_device(pdata->rtc);
 	if (ret)
 		return ret;
diff --git a/drivers/rtc/rtc-ds1553.c b/drivers/rtc/rtc-ds1553.c
index cdf5e05b9489..c6a5563504e5 100644
--- a/drivers/rtc/rtc-ds1553.c
+++ b/drivers/rtc/rtc-ds1553.c
@@ -294,7 +294,6 @@ static int ds1553_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->rtc);
 
 	pdata->rtc->ops = &ds1553_rtc_ops;
-	pdata->rtc->nvram_old_abi = true;
 
 	ret = rtc_register_device(pdata->rtc);
 	if (ret)
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index dfbd7b88b2b9..9043c96e8845 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1316,7 +1316,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rtc_dev->nvram_old_abi = true;
 	nvmem_cfg.priv = rtc;
 	ret = rtc_nvmem_register(rtc_dev, &nvmem_cfg);
 	if (ret)
diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index 2b949f0dbaa9..291bbed90ef8 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -190,7 +190,6 @@ static int ds1742_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 
 	rtc->ops = &ds1742_rtc_ops;
-	rtc->nvram_old_abi = true;
 
 	ret = rtc_register_device(rtc);
 	if (ret)
diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index 67e218758a8b..ee1d8f0146fd 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -463,7 +463,6 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(m48t59->rtc))
 		return PTR_ERR(m48t59->rtc);
 
-	m48t59->rtc->nvram_old_abi = true;
 	m48t59->rtc->ops = ops;
 
 	nvmem_cfg.size = pdata->offset;
diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index 75a0e73071d8..2b1135590dd5 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -254,7 +254,6 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(info->rtc);
 
 	info->rtc->ops = &m48t86_rtc_ops;
-	info->rtc->nvram_old_abi = true;
 
 	err = rtc_register_device(info->rtc);
 	if (err)
diff --git a/drivers/rtc/rtc-rp5c01.c b/drivers/rtc/rtc-rp5c01.c
index 8776eadbdd3a..a69e8adcc4a1 100644
--- a/drivers/rtc/rtc-rp5c01.c
+++ b/drivers/rtc/rtc-rp5c01.c
@@ -251,7 +251,6 @@ static int __init rp5c01_rtc_probe(struct platform_device *dev)
 		return PTR_ERR(rtc);
 
 	rtc->ops = &rp5c01_rtc_ops;
-	rtc->nvram_old_abi = true;
 
 	priv->rtc = rtc;
 
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index c6d8e3425688..1d888da48c7c 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -585,7 +585,6 @@ static int rv8803_probe(struct i2c_client *client,
 	}
 
 	rv8803->rtc->ops = &rv8803_rtc_ops;
-	rv8803->rtc->nvram_old_abi = true;
 	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	err = rtc_register_device(rv8803->rtc);
diff --git a/drivers/rtc/rtc-stk17ta8.c b/drivers/rtc/rtc-stk17ta8.c
index 01a45044f468..1ccf0d5d05b4 100644
--- a/drivers/rtc/rtc-stk17ta8.c
+++ b/drivers/rtc/rtc-stk17ta8.c
@@ -311,7 +311,6 @@ static int stk17ta8_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->rtc);
 
 	pdata->rtc->ops = &stk17ta8_rtc_ops;
-	pdata->rtc->nvram_old_abi = true;
 
 	nvmem_cfg.priv = pdata;
 	ret = rtc_nvmem_register(pdata->rtc, &nvmem_cfg);
diff --git a/drivers/rtc/rtc-tx4939.c b/drivers/rtc/rtc-tx4939.c
index 715b82981279..abbb62b14d7a 100644
--- a/drivers/rtc/rtc-tx4939.c
+++ b/drivers/rtc/rtc-tx4939.c
@@ -266,7 +266,6 @@ static int __init tx4939_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 
 	rtc->ops = &tx4939_rtc_ops;
-	rtc->nvram_old_abi = true;
 	rtc->range_max = U32_MAX;
 
 	pdata->rtc = rtc;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 22d1575e4991..0983ab9faffb 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -120,10 +120,6 @@ struct rtc_device {
 
 	bool registered;
 
-	/* Old ABI support */
-	bool nvram_old_abi;
-	struct bin_attribute *nvram;
-
 	time64_t range_min;
 	timeu64_t range_max;
 	time64_t start_secs;
@@ -250,14 +246,12 @@ extern int rtc_hctosys_ret;
 #ifdef CONFIG_RTC_NVMEM
 int rtc_nvmem_register(struct rtc_device *rtc,
 		       struct nvmem_config *nvmem_config);
-void rtc_nvmem_unregister(struct rtc_device *rtc);
 #else
 static inline int rtc_nvmem_register(struct rtc_device *rtc,
 				     struct nvmem_config *nvmem_config)
 {
 	return 0;
 }
-static inline void rtc_nvmem_unregister(struct rtc_device *rtc) {}
 #endif
 
 #ifdef CONFIG_RTC_INTF_SYSFS
-- 
2.29.1

