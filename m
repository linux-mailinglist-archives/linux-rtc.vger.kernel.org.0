Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73934336D4
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 15:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhJSNUG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 09:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbhJSNUF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 09:20:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B1FC06161C
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y30so11625544edi.0
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVwmCQe1Imk01zVn1XGf4Bgbl7TXtX3AHgpVKUdqV64=;
        b=ST3pve/0QlrMuEbgKABJjXfLo42Qd+a53fnDzzVj9AE/zpYv88IEh4W3G8YvTWuPt/
         3XSHXX/cJ+JxhCNsWHRxUF5BIUhjNJ+TH+LC1Bvx/ibreBorIJfps+YwXCmkCRnicSjv
         yC5q1h6iihDGhhV6lFELl1TMNcu4UpUqhcrIqx7hytZ2Rk7rq8uI5tT1PXGqBNj6xYPk
         iNhLImzJ5XKfhW0qEgy4aFXSQLL8DEtrVxRqMfpi4BLzj1KprDkhBmFHCI3sRvVkSbb+
         lNHCHP5ZKcpe1MI5kpwFWO/6fVybZl9G4g3lRDswu0iikoM2M7yPVtouvHwXnS0KHchG
         1oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVwmCQe1Imk01zVn1XGf4Bgbl7TXtX3AHgpVKUdqV64=;
        b=B4RTkmL7/lKanMYDDQQ+/rgMJJHBFZuekb3E4MJTTgKb8i6826wroUTNle9Cw1r/VT
         T8U6vglgOT8jOBHUYBnh9rrmCIm4y336Xz2CjQkjLIyhgjR359pYGT3/kIrWLa6RZd6d
         OY8AR/KsPqAA0axyU+mFyf1xNVEj88yABNg8RxkQYt2oEU9MQ9sCVpVWukPvLpYrzODt
         nFcKgNc91zQ/BT4t8wkeqPMm8HURKz+N6EzmY2C04bU7imtMZ9NoAVqMO6SjUZf7EM+8
         qxzdYHw4eZq33jsaqwOpWB9ab+ANkPEB5rI84VYVox4rJpuA2CzpJHgaNznR/gEXDAWp
         L7zw==
X-Gm-Message-State: AOAM531nMOYavYV2C7BnpYcsBhBaA+wVhRmfgVybmAtp5V1MOEi7lH/G
        gzyKA0fNsdEWBOBLe0DoUN9zPJoJHLgCU4PX
X-Google-Smtp-Source: ABdhPJxHpjVbKzi+3gjGSMjnf9tMaqp16jK7/fWlsQgqmLcR5Yz8Wq3iH0ERFpFpw5GAOvuk5ox58Q==
X-Received: by 2002:a17:907:d1e:: with SMTP id gn30mr37726126ejc.272.1634649450063;
        Tue, 19 Oct 2021 06:17:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e22sm12192568edu.35.2021.10.19.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:17:29 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rtc: s3c: Add time range
Date:   Tue, 19 Oct 2021 16:17:22 +0300
Message-Id: <20211019131724.3109-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019131724.3109-1-semen.protsenko@linaro.org>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This RTC driver only accepts dates from 2000 to 2099 year. It starts
counting from 2000 to avoid Y2K problem, and S3C RTC only supports 100
years range. Provide this info to RTC framework.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/rtc/rtc-s3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 10e591794276..d9994efd70ef 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -454,6 +454,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	}
 
 	info->rtc->ops = &s3c_rtcops;
+	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ret = devm_rtc_register_device(info->rtc);
 	if (ret)
-- 
2.30.2

