Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4065C2653CB
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgIJVkn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbgIJNF4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:56 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA21C0617A1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:06 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so6624303wrx.7
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d3M68c+gKjavrjhZL6Hw37sOLz3mMgIonseWIHUXsKg=;
        b=B1Gh0qWRTUMtQUUGTtPv22uFz/eA/bqQLzh7LJleZjKTNq7LSV/tLZUasG2+gBqg/X
         f7ReYjeo5IopmKPvgH7P0NuoQ7s+r4AW6xq87jWKtCxVxmzqIvkjzky+ltf6WOOKwqLQ
         3TQ5+LnsuXX7ACDf2aoENVbKp2tkhk4OYvYfdejQjTBdiK3fDcE23MXQY1SpSvZm0EOY
         YmPtC84URmLsIAusLyF/uXbJdKQ0LVuU+uts0pzbiq3LE2GUEQV2UPMK5DHmiP8dXQjR
         SGUsQfII08SAJ6wSiagebKBfywG/jpmv0AbY4LZZ8XMchmIe2G9Qh4jPIDWfhh7UFaM1
         H/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d3M68c+gKjavrjhZL6Hw37sOLz3mMgIonseWIHUXsKg=;
        b=QiO+r9Cb7dSeGr48CMi9lFus9Y27hrOcxpIlJk3V9C5M0dpxNOgrxcMzxU8lYFPx0f
         FhZ1KJwiD3cBYDnHOi0ts3wFmL+u4IimQ26SSC26FFos8RPSJVZUMC9NGcG5DriZJ1d6
         pKaqnXRBvZrEFPb2LUR3BqTvlfBeTcJEoUCx557rFvxnZ8VhxkkFt++oqFrvokhiQURq
         6FYIOl6NAXhijI4/hVTjW0BcxilB+vu4HHoGrsYLwuUskuItXyqs75701QBTNrBtlC0o
         qRT70clVwvVqjREQBNlT0of9KWBs6Mf7zLrSFvn4v0RH2L8b5fGIMK5BiuPszhOvYLQf
         ccjg==
X-Gm-Message-State: AOAM533k5BqW+lWtI/pz0fmZ8pRKGufZivxKfCOH2CqVn/4M3OHkO6uY
        fag9HlEXSt4BsXZGhfPVvRo6Sg==
X-Google-Smtp-Source: ABdhPJwr4zmWD1pKPf0ftvs/o1r1NeSvWsNX0YIaHg57u4rr9cjb5L/OY+yhtGwYgEo+nYQGcCWlGw==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr9186629wrv.139.1599743105450;
        Thu, 10 Sep 2020 06:05:05 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 07/11] rtc: rx8010: use a helper variable for client->dev in probe()
Date:   Thu, 10 Sep 2020 15:04:42 +0200
Message-Id: <20200910130446.5689-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Simple 'dev' looks better then repeated &client->dev and has the added
benefit of avoiding unnecessary line breaks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 3b8a95330a0a..e401d8ed0e19 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -409,6 +409,7 @@ static int rx8010_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
+	struct device *dev = &client->dev;
 	struct rx8010_data *rx8010;
 	int err = 0;
 
@@ -418,8 +419,7 @@ static int rx8010_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	rx8010 = devm_kzalloc(&client->dev, sizeof(struct rx8010_data),
-			      GFP_KERNEL);
+	rx8010 = devm_kzalloc(dev, sizeof(struct rx8010_data), GFP_KERNEL);
 	if (!rx8010)
 		return -ENOMEM;
 
@@ -431,14 +431,14 @@ static int rx8010_probe(struct i2c_client *client,
 		return err;
 
 	if (client->irq > 0) {
-		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
-		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+		dev_info(dev, "IRQ %d supplied\n", client->irq);
+		err = devm_request_threaded_irq(dev, client->irq, NULL,
 						rx8010_irq_1_handler,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"rx8010", client);
 
 		if (err) {
-			dev_err(&client->dev, "unable to request IRQ\n");
+			dev_err(dev, "unable to request IRQ\n");
 			client->irq = 0;
 		} else {
 			rx8010_rtc_ops.read_alarm = rx8010_read_alarm;
@@ -447,11 +447,11 @@ static int rx8010_probe(struct i2c_client *client,
 		}
 	}
 
-	rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
+	rx8010->rtc = devm_rtc_device_register(dev, client->name,
 		&rx8010_rtc_ops, THIS_MODULE);
 
 	if (IS_ERR(rx8010->rtc)) {
-		dev_err(&client->dev, "unable to register the class device\n");
+		dev_err(dev, "unable to register the class device\n");
 		return PTR_ERR(rx8010->rtc);
 	}
 
-- 
2.26.1

