Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3A040E3A7
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Sep 2021 19:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhIPQv0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Sep 2021 12:51:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58344
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243815AbhIPQrb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Sep 2021 12:47:31 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F118A40269
        for <linux-rtc@vger.kernel.org>; Thu, 16 Sep 2021 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631810770;
        bh=TkTHOhbG7+Cs8KGkPzHFU+IfRiM3V1/WUAdUOTTHlrE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=R3fOw3uQ3MxPPSIJu7d5fXyJRqH2PIvrvz9wPwFd5IW8H0S5rd7FJYYC0ZLUtHpMq
         PUqPfc7FC5bJVn70lySGYfTPnzTdYTNNRUrkJZFnZg6UZH9o/HYSpNWGoW8q127m/S
         RwP16LT5JH3s2ILB2HgOj5CdwwUFclrbese805QqUbSZxWPnpP5UMJ6Oe6t/eUBxdf
         Flve0MRLquL5nqo9+f3iALf3oII2nfWTvVnO67jzKZ+ZPCJO0hPcG9f6QLTuSApC0A
         izbSpR538kt94Xi5xnxOaGx5xLryPFye2DRFMQtVSNblCZyGE3hVq3KEqFvsCcH7u/
         ELJG1NfVdQoTA==
Received: by mail-wr1-f70.google.com with SMTP id r7-20020a5d6947000000b0015e0f68a63bso2676451wrw.22
        for <linux-rtc@vger.kernel.org>; Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkTHOhbG7+Cs8KGkPzHFU+IfRiM3V1/WUAdUOTTHlrE=;
        b=rcGoSWc6Wtgx5gbj2py7irx6rJVhw4Nnzbiwdh9lUAHA7UVj8VNwkDuWXYHgFOn+e1
         twVkw9ZNV6Y6GMb6WlNvKFggnOPzuugZmiPhIA9Bqlj3r3Lak/pqKTH+8dZaKUKDmj8t
         ggUAI9TN1+A4Hwz6/X2f5kfBJ9KunoKcvMtqaEcaLmU/a7j+mvGFgjqCrukTgu+TIqAp
         jKNnaoFfWGqjEG31GrmKxEJUx/Y3q/dOyInXTZwF0nxQRX7aL29Cvc3fvxsnr80T17nt
         i/Z2mrPSiGYkk1FmlAmVmEBixnflTM8aCIIWdaISW3I0QMX0PxcfL8n+tfNCDljQ8bO+
         q39Q==
X-Gm-Message-State: AOAM532qnGIH/dDvF04sEeIVufdQlZy0NMMXKy2VnkNanlYBbDPtovzm
        pVWOc6QewLzDEE7TTU+CaWSvPfVNt1W0cONcnHP7LnRLWqTkDS1bcf2jPC/9SqRacD4nVEczsMb
        zvYPxJVZV5f9BA9BCQIZTOxif+as4toZ3p02V8A==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr10746886wmq.0.1631810769631;
        Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyW+OkIKkP01ToiSTSOU4G0hJjjzBqvO2StScpKKfwwlhY9dJZUVxfnRqcLlXIIqO+lwZLbw==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr10746871wmq.0.1631810769456;
        Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l21sm3718194wmh.31.2021.09.16.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:46:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] rtc: s5m: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 18:46:04 +0200
Message-Id: <20210916164604.134924-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
References: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-s5m.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb9c6b709e13..4243fe6d3842 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -861,4 +861,3 @@ module_platform_driver(s5m_rtc_driver);
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Samsung S5M/S2MPS14 RTC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:s5m-rtc");
-- 
2.30.2

