Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5FE2F5EAB
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbhANKXw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbhANKXv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Jan 2021 05:23:51 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B5AC061794
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:27 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 190so4048023wmz.0
        for <linux-rtc@vger.kernel.org>; Thu, 14 Jan 2021 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuQJlHeIpWuiXs634c2G5t39x/XMLzJOuHHOGIxib1k=;
        b=ZuNFTFgmeZ3uVGqeCtbEb1qyYgwTDek5nE0ZqD8PeZAiJoMcRjR4MslFEsfrFwC3og
         zE1KlRytS992d+G+PBShFOjgJB8eRWzxII/SYlQ0RhDVoYLtKYp/vaJJsgAi5xOBTFc9
         yR7VLXozp7BhFRrfsCaPqmJ8Lcwaj2Zh1Zvn9MV3yukP74kx2XYPlLjMbU/lqwZcgxDL
         1HauxgSEcAHHOpgcBX5pa7LQv1FV6eWxRxCNwhf1K2ib4RPd7OgPci+fQTLFTwobATFc
         lXGT4A14TY6dq115Ib/sEMvBD0D4JIaTJUETLUo51QW7s483hKQjCFqTfw/WP733gkcY
         6O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuQJlHeIpWuiXs634c2G5t39x/XMLzJOuHHOGIxib1k=;
        b=IIxgQmSc4WPFC6Kt6Ul8W22lhyWkc+77ynN/aN86Rx//qagltl3ZbUEaW5dihkKbqp
         35BFJsOtM1r1h/C5/s4fnQ3qDWZzkQIJyiMwW1MVDnMqf0CoiQnb1CJJlpw7oZlCRXN8
         6ghQy7P0CTbjA5tMApNPm8TcPbRdXHD4fQwomiQazk3C3R/wOk3F3uIk2Qg+VK1gR1JS
         QqrwUQ/ad5Xb8xGaCT96FvRzrEJOqL2hxPQDVrFdOCjP21hWIxFYOEdNhbYAQFzNmQN9
         VQDPmBmtzixEVR27uF/u+F/jYnXP0dZAdHwx17ITtqI9rtEL7gnjoTFG9SGn9AFQP7KS
         Im0Q==
X-Gm-Message-State: AOAM531A1xvhUt38INpqltcFDSD6Cqsk9n80C0YPxJS3t3w3X1kIeKmf
        czEU6KWvShhAsYeeFki/vh2QIg==
X-Google-Smtp-Source: ABdhPJw0VY3l74mN0Ah9IUZk7JMLhszhCcIpAR2nnaH38umPC9B1cjSGBeU4YhhUoS4bpVkOVDh3rA==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr3127800wmq.15.1610619745952;
        Thu, 14 Jan 2021 02:22:25 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l7sm2468467wmg.41.2021.01.14.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:22:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 3/3] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
Date:   Thu, 14 Jan 2021 11:22:19 +0100
Message-Id: <20210114102219.23682-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210114102219.23682-1-brgl@bgdev.pl>
References: <20210114102219.23682-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can fail if regmap operations fail so check its return
value in probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 858d5f0e860f..80b66f16db89 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	ret = s5m8767_rtc_init_reg(info);
+	if (ret)
+		return ret;
 
 	device_init_wakeup(&pdev->dev, 1);
 
-- 
2.29.1

