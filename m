Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A472B91D6
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgKSLsH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbgKSLmL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:11 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BC2C061A4B
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:10 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so6058875wrb.9
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pn7SdVHUMPmppMXB3BTCGf30PM6HBIJ5rW++xm0ywuI=;
        b=DWAN9vlwqCNbN8LsiH6OAQXlepKRv1Z2LiClItkZalohozwQ2BELJcLbVnXZoJUbuX
         2iJ8ywpd7yKO9xIXPg1BwGbn+Wd5RLHvTObYMrWv3JXmHe07ekkT5BicNXDUNdPjOwwx
         ydpktevWWeVpgmE5Zie4WpV8PkZwbd3w/OYNQ1jPKE7oMk8NQWlvNfzpYxlDNUsiIxwq
         Yt82UUrcJim7pL8B+X89tXqHx0RWG2ZXZ7bTRdKRAKjIEHvsW5m9WyyJMThSpiPdkmBz
         c/0TFgvV5WbkTN53kpTEXuaqwEKYLqTCx+eTCChdhY6E6/+FAuAWxYNKIlEZr6nAxA8T
         TuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pn7SdVHUMPmppMXB3BTCGf30PM6HBIJ5rW++xm0ywuI=;
        b=WDnv31Z0ESll5gg6TYvsEj4E/fUH02x3anDyIAXbl7B4Nr9WBNnud2MZ4yUOepxKIU
         Tr6iUm1ftqcS7PfF0/g9NmVoz/9Co78Zd4l4dWWV+OV8anSpvhOPQZWtRpWBsLomWPzY
         oBFAkOm4BxUYhvcnsqiAsjmnLv0GyQrfqNP4YaSKkrnCBPgBPXCUQC6Akax5ahnkldNk
         0EyE0y64TQbzxCgfIK4Kpn7nP2tBqVl/XzRslR4isVNflMiATDgavrhSo/hdZppdc270
         9KucX8aMkkHcC53EIOJePiifwfEaCab0BI5387Rg6886UOcCo8V+LoeiOT2duvcBnI3X
         23DA==
X-Gm-Message-State: AOAM533xhySqhVafQUTLHcqxRN4Q6T1XCUay9+JMpCH9ZMTAfdC9WM5c
        HlNR8dd4etXUWyC/xPonH0KkBg==
X-Google-Smtp-Source: ABdhPJxUi9NM3YQ7WTQLtXjkY/MdlPDnFvh3YfqmGcobbpSjJj8eNLBP+RAbuP0v8DRWWuCfrjKXng==
X-Received: by 2002:adf:f246:: with SMTP id b6mr9308686wrp.238.1605786129614;
        Thu, 19 Nov 2020 03:42:09 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:09 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 05/59] rtc: rx6110: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:55 +0100
Message-Id: <20201119114149.4117-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx6110.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index a7b671a21022..cdb05b67912e 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -315,20 +315,18 @@ static int rx6110_probe(struct rx6110_data *rx6110, struct device *dev)
 {
 	int err;
 
-	rx6110->rtc = devm_rtc_device_register(dev,
-					       RX6110_DRIVER_NAME,
-					       &rx6110_rtc_ops, THIS_MODULE);
-
+	rx6110->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rx6110->rtc))
 		return PTR_ERR(rx6110->rtc);
 
+	rx6110->rtc->ops = &rx6110_rtc_ops;
+	rx6110->rtc->max_user_freq = 1;
+
 	err = rx6110_init(rx6110);
 	if (err)
 		return err;
 
-	rx6110->rtc->max_user_freq = 1;
-
-	return 0;
+	return devm_rtc_register_device(rx6110->rtc);
 }
 
 #ifdef CONFIG_SPI_MASTER
-- 
2.29.1

