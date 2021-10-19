Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08634336C7
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 15:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbhJSNTt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 09:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJSNTs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 09:19:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB97EC06161C
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so12703406edc.13
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60hPcdV0UWbpyl0GNuy8OVoEeD5Onu1pwXHnAZlxS8M=;
        b=XAupBd+cIZzEi1k87JGl3WRoxC9ij6GdlswhnL3eSxkOpZZ6260HB7c7Tm9d6FslzY
         S0MKo3SFHywQ8TNWjkiiup2u31aOBSi2G5dj1cC5UwuqWrear+WSHHXsT8RnoVdwnJSF
         VLJJ5LZe+bKz8ITWRZNEAdAsoAOh6/PdfkWdPfHBGQMVJUKzdIgfdIbCW5Jpccqxn800
         +Z1nK1Gn3bdV1PlHJXqZnhai1gyE/oTnoVIXflwZR1aiXo9T8HRT+43t+Q8Hkqgw4MVj
         asnVUhMbq/TjGk8QcupRK9OHT2xrzq+4zx6BFQJNO8h0CbOayX0ECgZ1lxar2uQex5Gc
         2rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60hPcdV0UWbpyl0GNuy8OVoEeD5Onu1pwXHnAZlxS8M=;
        b=ZzQf5QeZZ6aQTlharzqcjke+Fs89fdXhuEjo1DF7FjwUxqOkrb7QC3lhGTxPieCzVx
         r9AzqIF8WLyX7XWTaSuHXPL8WHzNkFn4LRGswyvfv/miHUArlp2n5A7kFt7ITdvsLb74
         ViDzcVCK3dK4Am9OE9JYH+6CDM2uyIJpG7yIU8B6hE1ruHEpDbLsyOtV9vxV5GkQjIHy
         7w/1uxsNgIk8mGkZbBAjSm1VpEkVJnjFv8yIMo5+OABhzbhPBKO4SsK89FGZw0UBt7E2
         K5Co2Avsv09mEnDIwsAeN3SH1Ne2qGiqF6OKL2XQ0CgbnkWAgT5/zgJYE7NLrSs8rWnL
         8eTw==
X-Gm-Message-State: AOAM53322UIqSYFR6zy6CZe7frxtNAYEIgZL1IPqV/Yv7rSbJQA3XtrT
        V5VbZ5qL1w8mOAxQNyOZskN/lw==
X-Google-Smtp-Source: ABdhPJzjxzXjeAtY13jdbx0KsAZF/NotrJZ337C3d45J5MK1Yqceqvq9sAlvWPOnXnJHYNxrXzpvLA==
X-Received: by 2002:a50:e188:: with SMTP id k8mr55865180edl.119.1634649448087;
        Tue, 19 Oct 2021 06:17:28 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id se12sm10337657ejb.88.2021.10.19.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:17:27 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] rtc: s3c: Remove usage of devm_rtc_device_register()
Date:   Tue, 19 Oct 2021 16:17:21 +0300
Message-Id: <20211019131724.3109-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019131724.3109-1-semen.protsenko@linaro.org>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() API instead. This change doesn't change
the behavior, but allows for further improvements.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/rtc/rtc-s3c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e57d3ca70a78..10e591794276 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -447,15 +447,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	/* register RTC and exit */
-	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
-					     THIS_MODULE);
+	info->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc)) {
-		dev_err(&pdev->dev, "cannot attach rtc\n");
 		ret = PTR_ERR(info->rtc);
 		goto err_nortc;
 	}
 
+	info->rtc->ops = &s3c_rtcops;
+
+	ret = devm_rtc_register_device(info->rtc);
+	if (ret)
+		goto err_nortc;
+
 	ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
 			       0, "s3c2410-rtc alarm", info);
 	if (ret) {
-- 
2.30.2

