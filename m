Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CA7264689
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 15:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbgIJNFj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 09:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgIJNFE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:04 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DD9C0613ED
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e17so5572234wme.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QD4+/zp80KYG7+QlHWRWXdVVYXAehdvYKldSIelaUaw=;
        b=CQYbnIbSD26YR0Rot7mifqg+cBHViUddg7JwHyo/tXjL7FDc3L3E0Px8Qk34E1WtDc
         yFRPBve7pSGnToCwxzEjeXneObv1XyPPrQ71bANgQOaKCKmqyTpisaEEnUyb0fiuyhfB
         eviCALOu0ZoiGWodg5c71WVWdzfQMwht5gzh/mwbPSF9LAlH5ntsb2YkjQ+W95f8iFfp
         vLwcmf66YI9xGG5Pkid9W1C6E2E9vqF2kzdknAteqfsNNto5XgMykoe6nJIi8XAqRcfn
         W1Mta4aVPJEHft+D0xTr9CcclB0msG9bmnaSvc603HSUAR06RyMYldIUvJPLzASHEDnb
         jvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QD4+/zp80KYG7+QlHWRWXdVVYXAehdvYKldSIelaUaw=;
        b=EH4+VBERy09A1RzXEuhxkrhWXUc4cszp+hz4Nfyd9gt49ySJSgM/PbOUqY2HO8gLtO
         zt2UJ1GzvxI8Pu5EPY+F/Dxn4CdgqZ5rv1KdAe8SnHbnqCWPuWGnOTai6fpfhR11A0ha
         TUZYMRrI9vkjwYa78LvydzQBO1OmIO7NVWoylvLz6sqxyfo0UlqeKDGVXOX8Px5PcdaQ
         QJlFmcrMafVK4Ot8yOAd+/F1UuTQPV5qfn1BsKAvI7+pwU3zwcnTdRH9QNyV3N7vskvB
         ahwhmPLey57vEF2oWzOuKhwbmNSAutnBtJVk8qouwk/Me8C+KJMCNT2qqWkJjJ9wOcT1
         MLJw==
X-Gm-Message-State: AOAM5325Jimw0FL/B3cW1QJ2sd7OlpUH9ReaAcDetH5otqgRL4LmlqNs
        v3f3/3eTel1SjzAu7DI5Q3My3A==
X-Google-Smtp-Source: ABdhPJyQsgitJHjVQRLFHvNm0QyVkVrkhwOMOMP7nDl1jGSAcTayJaNDjKqgeto4lHEEdqJHg9IJ2Q==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr8763036wmc.85.1599743098541;
        Thu, 10 Sep 2020 06:04:58 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:04:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 01/11] rtc: rx8010: remove unnecessary brackets
Date:   Thu, 10 Sep 2020 15:04:36 +0200
Message-Id: <20200910130446.5689-2-brgl@bgdev.pl>
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

Remove brackets wherever they guard a single line.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index fe010151ec8f..2faf5357a3a5 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -181,9 +181,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 		return ret;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (flagreg & RX8010_FLAG_VLF)
 		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
@@ -284,17 +283,15 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	int err;
 
 	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
 		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
 		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
 						rx8010->ctrlreg);
-		if (err < 0) {
+		if (err < 0)
 			return err;
-		}
 	}
 
 	flagreg &= ~RX8010_FLAG_AF;
-- 
2.26.1

