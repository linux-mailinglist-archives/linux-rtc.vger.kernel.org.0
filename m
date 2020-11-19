Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3242B9194
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbgKSLpH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgKSLmr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:47 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C538C061A4D
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:45 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id u12so6157702wrt.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=boGrSDTP+qs6IwPy1vm2qkRgc0gqIzbdX7uCiQReZbU=;
        b=TV+6YNoQI6ciB07VbnBnvB8xS5GPO5XlvkiJ3WZdeUOOAzcwK0aCIUcZWGpjaN3+U5
         +Z/pXupYt07ak+tBiGe+y99N+I+Lp9Rd28ZXT/JWkAVdFJkUHMxgMADPTH0bgsDdsCp0
         ILjcG8ruTSNfw79C8kCRKLHuz8TE4yJNHZmjOTsdD7AdXkRjWt5LI5sXPP+FZHj4/Qv+
         49eaBZOXlDPg/Sw2cfoIGI56aVm3VWv6u4PndWfhMzFJG327SA4rhjSm5x1cm/Xquexc
         Re9xuAhmw0glWs5q8e3oCyxXTmostqktWchrCS7x67h6M113bgN5EGN/pq1zqJskWlPH
         G6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boGrSDTP+qs6IwPy1vm2qkRgc0gqIzbdX7uCiQReZbU=;
        b=jF9fKqqJ5BwtbeDqbyYg2VK5e6lEq7kH803yxzGN7vzg8ECSzu8rXdlG1nYpblGz8c
         DN1V1+I9etCdINSV9O6btUF1UVw872u67k0btAYcdXUez6WHGKsJb488c88H8FoY2VMn
         LfYdcXVwJU3vxbb1KQX7aCX5WjW4VR6Exo6KPusQ+U4LKHryGDBh+j/nZQW2+cpHLxeU
         NjMG2loGrFI+XISWnad3Ezv6IszoZfZuEsB4tQ0i0kd2hXSZO3+fTjPXV/2g8u917k/f
         ypzi5o9p+lFVdZPpHJF1ENALJSIo7M1VpsFme6F7tKVELwoA3ZvDEo8nClGPvwhM2X7b
         q2pA==
X-Gm-Message-State: AOAM533WN0sW7npYQsyBHS93vsNY99V3uNMztk1lpRQVo5YkDYqOo4kp
        5dP4fJr3uKdbsp7pJfrLBhfKCQ==
X-Google-Smtp-Source: ABdhPJx/s16TbETzxT4gJK0lD6onTysiF7KaVHs80mvdukfYzQPBnQBaQaQ9R/14p19o6t5ElMRIxA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr10195354wrt.372.1605786164313;
        Thu, 19 Nov 2020 03:42:44 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 38/59] rtc: rc5t583: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:28 +0100
Message-Id: <20201119114149.4117-39-brgl@bgdev.pl>
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
 drivers/rtc/rtc-rc5t583.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rc5t583.c b/drivers/rtc/rtc-rc5t583.c
index 18684a7026c4..20f150ab6bdb 100644
--- a/drivers/rtc/rtc-rc5t583.c
+++ b/drivers/rtc/rtc-rc5t583.c
@@ -247,15 +247,13 @@ static int rc5t583_rtc_probe(struct platform_device *pdev)
 	}
 	device_init_wakeup(&pdev->dev, 1);
 
-	ricoh_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-		&rc5t583_rtc_ops, THIS_MODULE);
-	if (IS_ERR(ricoh_rtc->rtc)) {
-		ret = PTR_ERR(ricoh_rtc->rtc);
-		dev_err(&pdev->dev, "RTC device register: err %d\n", ret);
-		return ret;
-	}
+	ricoh_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(ricoh_rtc->rtc))
+		return PTR_ERR(ricoh_rtc->rtc);
 
-	return 0;
+	ricoh_rtc->rtc->ops = &rc5t583_rtc_ops;
+
+	return devm_rtc_register_device(ricoh_rtc->rtc);
 }
 
 /*
-- 
2.29.1

