Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584671AE333
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2020 19:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgDQRIe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Apr 2020 13:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgDQRId (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Apr 2020 13:08:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA557C061A0C;
        Fri, 17 Apr 2020 10:08:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v8so5398653wma.0;
        Fri, 17 Apr 2020 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8q8NmYubJY4+KdZO7S+jhcJYKm2n8n4KmwaTPGy68WA=;
        b=Lu3Lo0Gl/upDatKbC2xfDfz+fVfny7MnW72qQI2FOHqajpRtPyjqS17VnaPXinm6zh
         vVONvr+kC6TIWlMd5E0AydaI5EQyouCFnrCU5k3lG7U066TL9TUBgjh5xArbLJn6uAT9
         BoFeVqI3quCnIlfKUSa7Q/0NIoaSM37raXrfonbz85Q3bSKtqq05OxYfypZOo0vw/7as
         WK49OWm7GnrQ708BLzqPmpbs4+93+Wi59pJcW9jiK2C+KeHGo6hQ/Ofvd68okcUoHQpi
         PdBcqU6eBd33EWDXPJKikE+VpgWYZxpz8exTBW1ivrfYpTuxf/tyvNIZLRfI2EGa+y2r
         enuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8q8NmYubJY4+KdZO7S+jhcJYKm2n8n4KmwaTPGy68WA=;
        b=hfNSQ/0MDklGkXrYaTh5P6OQlEe1x5ZKf2NViINEJZ2J9Q6xfRPvAro+LK/aiR7C27
         fwuOqesxFAIZe1upoALLKm9BNRd/0DRFOlRBXRitUJAUwlYRpdLxY5spoWg7J1C/rast
         gxGyfZcF4HJ7SC65/8jhmZB5z6UH4eLpswpK+flgqCUBZxq+d8lsOwJUam/mz0gVvEDz
         MeUNHjJXGDLhAMSZ/W4uY/FB8I4eKEw4wBquR3f477QErEqKrkqVyzUaWpcN4GfFCVx9
         d+LstJXKorRxoX5imEbkJNzMojcdFYy2PLEHUPmrqr/PyFreOfZhhzvt+fdTom5sUc7X
         3wUA==
X-Gm-Message-State: AGi0PubCn+9uSMvi3U0tm6EFeOu205kdUmuaYrsccFd6C2VcnYqEM+W/
        Oe5SEDMWlw6/Gw1A0z7bKLI=
X-Google-Smtp-Source: APiQypKBaevAWvJ6zvlqCNBU+d1ivgTvNeLsUakVcAeM+o089fkuaYBUEwKdgn4/059S5SsTGdtDXg==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr4369017wma.138.1587143311482;
        Fri, 17 Apr 2020 10:08:31 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id a1sm23476779wrn.80.2020.04.17.10.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:08:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: max77686: Make wakeup support configurable
Date:   Fri, 17 Apr 2020 19:08:24 +0200
Message-Id: <20200417170825.2551367-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200417170825.2551367-1-thierry.reding@gmail.com>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the standard "wakeup-source" device tree property to determine if
the RTC can act as a wakeup source for the system. Note that the driver
by default always assumes that the RTC can act as a wakeup source, but
whether it can really do so or not always depends on how it is hooked
up.

In order to preserve backwards compatibility with older device trees,
only parse the "wakeup-source" property when a device tree node was
associated with the RTC device. This doesn't typically happen because
the top-level MFD driver doesn't list any compatible strings that can
be used to map child nodes to child devices. As a fallback, check if a
child node named "rtc" exists and use that instead.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that we could obviously add support to the MFD driver to match
subdevices to their device tree nodes by compatible string, but there
are side-effects, such as the driver core complaining about the lack
of a DMA mask for these devices. That in turn could also be fixed but
it ends up all being rather hacky, so just looking up a child node by
name seems like a good compromise, especially since there are already
such subnodes for some of the other subdevices of this PMIC.
---
 drivers/rtc/rtc-max77686.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index d5a0e27dd0a0..35fd74b83626 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -722,6 +722,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 {
 	struct max77686_rtc_info *info;
 	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct device_node *np = of_node_get(pdev->dev.of_node);
+	bool wakeup = true;
 	int ret;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(struct max77686_rtc_info),
@@ -746,7 +748,21 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 		goto err_rtc;
 	}
 
-	device_init_wakeup(&pdev->dev, 1);
+	/*
+	 * Only check for the wakeup-source property if there's an actual
+	 * device tree node for the RTC. If no device tree node had been
+	 * attached during device instantiation, try looking up the "rtc"
+	 * child node of the parent's device tree node.
+	 */
+	if (!np && pdev->dev.parent->of_node)
+		np = of_get_child_by_name(pdev->dev.parent->of_node, "rtc");
+
+	if (np) {
+		wakeup = of_property_read_bool(np, "wakeup-source");
+		of_node_put(np);
+	}
+
+	device_init_wakeup(&pdev->dev, wakeup);
 
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, id->name,
 					&max77686_rtc_ops, THIS_MODULE);
-- 
2.24.1

