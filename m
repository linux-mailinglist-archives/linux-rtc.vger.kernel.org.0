Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECEC26DAA7
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 13:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgIQLrW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 07:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgIQLrA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 07:47:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14041C061756
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 04:47:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so1732338wrt.3
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tA2MnF+xX5A+y1nwTZ/SIj7zddP7OKV0u4z97awhN10=;
        b=hnPvr4eChbEyyJP8bfkcbCT6MsgCUk/u15m7HEpvrWG/gW8SsknnNy6fpGlP+eT6OB
         lj6th/bEfjIxfDK05iLXLeqaTSPmgD2eZ2epav60PHuMs6yAEQ9XP8BCxUoEIRLZY46D
         /rHj4KSsgvs51/tL8wqJRxJv+FsxJIVMfAFUCtDeYHsQOw/r5Kc9DCx2T7Us4cJueSOz
         B49NbetA7ejxLAEtL/ZszfcjC5dZwzxlcp87ms0+gB5iodUj/YrbP+EM5SRj2I+RKxee
         cjWIBfVDxcxGBHIHhJ5phQ/wXK0V6wTCv1Xu3FQhtyH+WP2cGYcSos2PuyqiCvhj+QEX
         fsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tA2MnF+xX5A+y1nwTZ/SIj7zddP7OKV0u4z97awhN10=;
        b=rDCkXUh2au+8u6pyO4+hl5R5F/toEA7xhsnkic61nTiLKvN4q7CYcD3bNKrgbX0drT
         Do8L00CZrsL3Ldcpx/OMu0GceId/cnnZa/g1q7fZ00qHnFcX8oM27xk48mkGv7NApW3c
         lMxlVKWI2MbG5bHOej85xdcfFC6wBVqslmHKk0itq0Mi09CN0oW7ahcwHlYalrijpF9K
         uOe8ZdxVhq/s2VgmkwgLyKvBfRnyaxUttl/+qV97E0Aj3xL9OTOjZAp4YamJ53PWTaGW
         2T44O5nF7vN8ugdT4vjTlCxHAuE1zTqJ1nwBNROygyIBXMvSwoY7DuQRgtNTS21WaDrm
         9Unw==
X-Gm-Message-State: AOAM530l7IeYaHM6XRH5aqquLgxgighOQq/QM4ifTK5OaibOIgMvvG/6
        C1rT1f/2Z6WCJhvapqhzb/firIb7hIrUbg==
X-Google-Smtp-Source: ABdhPJyctzOy9Pflh2x0wS3K31Ol8OKgxXVffSt33p+5bZqVfIjotAcDZbXH6ue/9X0hmhgkzfVdcQ==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr33536235wro.178.1600343218615;
        Thu, 17 Sep 2020 04:46:58 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a15sm40747720wrn.3.2020.09.17.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:46:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] rtc: rx8010: rename rx8010_init_client() to rx8010_init()
Date:   Thu, 17 Sep 2020 13:46:56 +0200
Message-Id: <20200917114656.9036-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Since the switch to using regmap this function no longer takes the
I2C client struct as argument nor do we even interact with the client
anywhere other than when creating the regmap.

Rename it to a less misleading name: "rx8010_init()".

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 01e9017d4025..dca41a2a39b2 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -169,7 +169,7 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	return 0;
 }
 
-static int rx8010_init_client(struct device *dev)
+static int rx8010_init(struct device *dev)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 ctrl[2];
@@ -391,7 +391,7 @@ static int rx8010_probe(struct i2c_client *client)
 	if (IS_ERR(rx8010->regs))
 		return PTR_ERR(rx8010->regs);
 
-	err = rx8010_init_client(dev);
+	err = rx8010_init(dev);
 	if (err)
 		return err;
 
-- 
2.26.1

