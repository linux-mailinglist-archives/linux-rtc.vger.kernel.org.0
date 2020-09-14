Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5850D269091
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 17:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgINPrN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgINPqf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F13C0611C0
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so211685wrv.1
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O9pQgjz751iVGj7/u/8+uN16bEVSQUsjB9tkIsCDk5g=;
        b=lIN9VuThgSWgtkT0CPrxAmZJBFPajMgZvlK6WBEJci+7VcHMinR6YTPsTjr3c+40ir
         eup5AtMn9N8INDAa4C31k7orbaGK2FvNJU/4FAEqcn49e4r5e0ZkZf6i1UBNvCVreJXw
         gv8yvvQ1keAJF1SVvOdc3Gnq0VM4wLKmwWLcl5vnvdpxKZDKKi0M0FX5nFQmop1gnHue
         pV8lC2X/r8bTaJZr83ybk1qovXQFF7kH+exbY7Nz6w3ww1y5+/SlJ8V9n5qJiu/1Z4GW
         hjhPSgfuD3vvLLVnwVqBw2EXSxOs1m3XRRM8Hm/K6u5M52owR6zC8Cr8rSFsDiGFYMr/
         OIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9pQgjz751iVGj7/u/8+uN16bEVSQUsjB9tkIsCDk5g=;
        b=N43u6mmI9vO8AtdaaD0aV6ASrdJ865MXAzcaG2eTW4WpvL8Scwzb/x5a+M4CAYaB/O
         2TX3I490z0icatWAf1PChT0fgfpj5GwrgX/oZQlsOo26IJqhDOX6yotk+7hu3ID7c9dN
         lm4mKFA3ZmMED552eCysCAldj3RiX5wVlwWqi4UucLK1gMj/MfojcXgMHS3q/PfQyXZQ
         RZWLeNt2dKXARym/+BjnRuAsK5Y9F5P29Ifsl8X9VvjbeV9XsdUx7D5vdzCIa50A2p44
         0eJmwS8dcEgjwN7tDD2ce51E0/t80lAyuha9G4ZL8YthZdtrlMWC+M6aMxhdC4jVvyv4
         I2Xg==
X-Gm-Message-State: AOAM532FkzCvjFO1JhSgMALa5eUh4NQZHHyldKDDpbc5ZBhXyeqQx63F
        F6zZvD2a2UDhcaZaXnsY7F5vIkw0uWHpZA==
X-Google-Smtp-Source: ABdhPJzZbWq+TR+12hOTNI+zSoNInOlSAYteHGVr95cVRt/2rb4O76JSAxLdv5F6O0yzn8nJQ0PIfw==
X-Received: by 2002:adf:f885:: with SMTP id u5mr16013755wrp.382.1600098375091;
        Mon, 14 Sep 2020 08:46:15 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 11/14] rtc: rx8010: switch to using the preferred RTC API
Date:   Mon, 14 Sep 2020 17:45:58 +0200
Message-Id: <20200914154601.32245-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use devm_rtc_allocate_device() + rtc_register_device() instead of the
deprecated devm_rtc_device_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index aa357f800ad4..6aeed3802670 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -418,7 +418,6 @@ static int rx8010_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	const struct rtc_class_ops *rtc_ops;
 	struct device *dev = &client->dev;
 	struct rx8010_data *rx8010;
 	int err = 0;
@@ -440,6 +439,10 @@ static int rx8010_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
+	rx8010->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rx8010->rtc))
+		return PTR_ERR(rx8010->rtc);
+
 	if (client->irq > 0) {
 		dev_info(dev, "IRQ %d supplied\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq, NULL,
@@ -451,21 +454,14 @@ static int rx8010_probe(struct i2c_client *client,
 			return err;
 		}
 
-		rtc_ops = &rx8010_rtc_ops_alarm;
+		rx8010->rtc->ops = &rx8010_rtc_ops_alarm;
 	} else {
-		rtc_ops = &rx8010_rtc_ops_default;
-	}
-
-	rx8010->rtc = devm_rtc_device_register(dev, client->name,
-					       rtc_ops, THIS_MODULE);
-	if (IS_ERR(rx8010->rtc)) {
-		dev_err(dev, "unable to register the class device\n");
-		return PTR_ERR(rx8010->rtc);
+		rx8010->rtc->ops = &rx8010_rtc_ops_default;
 	}
 
 	rx8010->rtc->max_user_freq = 1;
 
-	return 0;
+	return rtc_register_device(rx8010->rtc);
 }
 
 static struct i2c_driver rx8010_driver = {
-- 
2.26.1

