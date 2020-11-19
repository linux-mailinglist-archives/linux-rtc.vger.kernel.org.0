Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0178B2B918C
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgKSLoi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgKSLms (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:48 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEEDC061A52
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:47 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id s13so6451765wmh.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wzKNqJHF/k+BxyxnqhMmFe/hNlc7WNmTxpYu93YpGLI=;
        b=CZhYx6N768QPB9ef5sqVZFQu+0t/M29cnuTLJuHbRzFb8MBP/VaINu1lZGHy7RHkDM
         9y8hu+zAh+Q7pQGaBf2yiUl/o3qsbSGyXRO4EnqDZIeCAHAvxu4OI1m8v1sfdfzqaOl6
         ceehsAPbxFu0YKpu5YfUDl1RkPAhm1X/2KyXJzlkjpqK6EDrbhEsSm8cZvdrlfX1oXbZ
         rE5LaIa4YwDpO3MqiGe75bFUevD9LdMbc0NEYCgRVyPZDt5Jfoebx+Q/dCjnOoMgyBfM
         oMJdTN6QYwUh5KRuagn7RWOHQh/DDbtijqPx0qa0ES5O5jyjUY23dheL6/OudHWQBwp1
         JIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzKNqJHF/k+BxyxnqhMmFe/hNlc7WNmTxpYu93YpGLI=;
        b=lW12wkgdMHK/nZKkDas6coh3yhnZoMEm+tj9AFb3HbsRhjFx5bhHyTJOqdXBXjikYW
         kFLe8Hn6FxNUxzZGuGFVjcT/ShGbr/hDL+Gx/J3C+nueLG//xndNb5EtshiOv28m6UFj
         8Gr3vX2drq47/un1sekEDHs6sEzCFkm1WTfKazf2t5p7k2hlffbSPOPw3TKatFiq1JuS
         KHByuVO/gw+OytljQWJxkFy1FDL1AdJxQBVlv9hzBOzlBCg7f13nEGmfj1PwrgYwMu8T
         cJCZBMQOevg4D9+kOMdZWdOihMDUiunMApJcROStT28ltbGKOlyqxwPMdA0m6pwHSNJ7
         e/xw==
X-Gm-Message-State: AOAM533CTWN6JWLL2TEO6JqQbACj6id7T/7m82eQBszar0KzL80mZ4bi
        ISfgL4ugWmSRGMEqIhxszUR86g==
X-Google-Smtp-Source: ABdhPJwX1mLV1BSAwWv73kg8fb4Ma3+Ri656b0A6+ueMFnTfwgzcFGCJKEepfUjmvUnpzPt9LK/4fQ==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr3831585wmb.29.1605786166507;
        Thu, 19 Nov 2020 03:42:46 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 40/59] rtc: r7301: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:30 +0100
Message-Id: <20201119114149.4117-41-brgl@bgdev.pl>
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
 drivers/rtc/rtc-r7301.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index aaf1b95e3990..a879313dbb05 100644
--- a/drivers/rtc/rtc-r7301.c
+++ b/drivers/rtc/rtc-r7301.c
@@ -381,11 +381,12 @@ static int __init rtc7301_rtc_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, priv);
 
-	rtc = devm_rtc_device_register(&dev->dev, DRV_NAME, &rtc7301_rtc_ops,
-				       THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&dev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &rtc7301_rtc_ops;
+
 	if (priv->irq > 0) {
 		ret = devm_request_irq(&dev->dev, priv->irq,
 				       rtc7301_irq_handler, IRQF_SHARED,
@@ -398,7 +399,7 @@ static int __init rtc7301_rtc_probe(struct platform_device *dev)
 		}
 	}
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.29.1

