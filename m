Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521378BD3B
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 17:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfHMPgS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 11:36:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38938 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfHMPgS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 11:36:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so18048757wra.6;
        Tue, 13 Aug 2019 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3NjKQ6bH7M7yJLbzjNkN2jx2rsf9cC0ZyK9exN5M9fc=;
        b=B5DYkpscXQ+An0BUridFKo+Ww8pwrfetP9wB6FvcuEnF0lWBrcVCMjapkrfcMhrQzh
         AGMpBJ+EYQqC5kkgDzhuXPNLb7nM7xmJUk1b2/S72DBKLPwj2FG8MxibuckmaVnOBNE8
         3HglQbzBAtUOFAX1qYavqkeqSDDSriHbu3BGFFeUmRaCWIJV6KhlE+lAu1uhI0FzT0gY
         lak51C1fN5Z4iF5N10UoWOQc1doApL3KmwQI3FdAZclafD8XLfPdSqbY3XQQxFsNms7E
         O/RSVjyZRbO3i0Unn8yiiCHI1Wk+YXR2lmoqcVdhXFBRdMV/OhYatwtxDMHs0LILNBvH
         xjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3NjKQ6bH7M7yJLbzjNkN2jx2rsf9cC0ZyK9exN5M9fc=;
        b=UyKt9IjGVExazbfvavoyAQnchny3jqYhR1aq/6W6IEc4tM/z1bo9ZrtYE+mwq2Dpjv
         8c+xOaexQOSsOoefxYkoYvr5ZrLqLUaiaZvEI0xTS1FwDzkgoO0VFaLXEh609U8qrvjX
         vL2QULtTgp4h82NE2g4SNec2q+QAfPDF+RwbDZoLFTGVQmQK5PfT2tUzAGecjyr0qG/P
         CnofJGljxoNfVTt+CgDezHqDuHU692CogsqzR5rAYM7RwMCLhLt8AU+NxKJ8+vMG4+DE
         S2eTK+HtmT5QSiu7FhOlwO2sXh0HzV8mR2i2TFFlhFnTZ6lj3/LeGDggTMurK0B4fE8w
         2QtQ==
X-Gm-Message-State: APjAAAXPii/aDBxJEUgjoo04M+bsicsJqQ1JHJCxhynYhyTcLj3ExewO
        TUVAfhBlZpfgigIZUS73JySSK2upE1OiAA==
X-Google-Smtp-Source: APXvYqymKR1IAdIWFCEFj6HBkPYK9BDaxjsH0Xm2qhL1hEQycFFFwqfSpxYYyYRpPndXwqNSwPGgQA==
X-Received: by 2002:a5d:604d:: with SMTP id j13mr32026234wrt.244.1565710576306;
        Tue, 13 Aug 2019 08:36:16 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id j16sm64744819wrp.62.2019.08.13.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:36:15 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, sean.nyekjaer@prevas.dk,
        bth@kamstrup.com, bruno.thomsen@gmail.com
Subject: [PATCH v2 1/5] rtc: pcf2127: convert to devm_rtc_allocate_device
Date:   Tue, 13 Aug 2019 17:35:56 +0200
Message-Id: <20190813153600.12406-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813153600.12406-1-bruno.thomsen@gmail.com>
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 8632f58fed43..58eb96506e4b 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -237,11 +237,12 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, pcf2127);
 
-	pcf2127->rtc = devm_rtc_device_register(dev, name, &pcf2127_rtc_ops,
-						THIS_MODULE);
+	pcf2127->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(pcf2127->rtc))
 		return PTR_ERR(pcf2127->rtc);
 
+	pcf2127->rtc->ops = &pcf2127_rtc_ops;
+
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -253,7 +254,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
-	return ret;
+	return rtc_register_device(pcf2127->rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.21.0

