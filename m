Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1763E3B3C
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Aug 2021 18:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhHHQBg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Aug 2021 12:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhHHQBg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Aug 2021 12:01:36 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBB0C061760;
        Sun,  8 Aug 2021 09:01:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a7so19868416ljq.11;
        Sun, 08 Aug 2021 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89d9PFSl6f0XdrabkTEFUnWMev9/DYMfhxE7Q7oaJJk=;
        b=MniDHjSS9B5A9nu73tOEWjAgw/CPBPDM90KA23b1+Ar51O7svKroSrQmrDwERmHpQQ
         tvE9Ac/q87TQoMWGWyEe57iuME0Z3zVnLY3uMC0TrUorPRkGZOF9DOKIyQVGIKy+8t4o
         HXjNf/Xg4t2ZMDt6kDV/TZx3qXiCaYVGbVZggYOxc81XfupVkMXmz6sjjruWEykJacbp
         i7Gj1qazp1iFm9wo6/vdun0Ux304bPgLMbPSUwxeZxOWkzcruLukO+0kj8vf7AAgGb3M
         lYg2yxui49sr2l0fxOLwmXFSEs4NQ278T6RAG3vXJxvem0ExFLGXqLXOZwYMr7zbqBel
         0RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89d9PFSl6f0XdrabkTEFUnWMev9/DYMfhxE7Q7oaJJk=;
        b=FXzHD9ZZhBbLLkPr+TxJms55ep1dRcO2uHEJONQDDTu4yhssBVzoPl0XzbEp+rzCqK
         Er4uaBDjfm7IKaoLasIZfjM8eQxUGzRv1sjnZC2eHFjuWkhlAOU4nMry0QwsaNuOR4pQ
         l2CAT0UAAp7Fcyj48g5G+s3dNr1qaJpq8ZBmSJgZHy4KOxyaevLC/YcWyqMmtt4kGvar
         EukYnYeKADRBnnLYPj/HN4y5O3AB2aCKsMU0HVx90soROQ/Yu8Mzl4615oy8ejFow0tW
         mY7z45ixundP7CRTAm/M8STukcRMbW/JfYkdFhdttGRXYw2aKTlCvWgx1AyRCrJxXgEr
         q6Ug==
X-Gm-Message-State: AOAM5338XZSKlbaGFKll0RzRPUacrNdMK0tlmlwJCqg3Obcg4wSeGYwx
        6BVquBpEURtWc+xc3btr9JM=
X-Google-Smtp-Source: ABdhPJw58mlPpK1UuFuNfJjAbFpIieik88LlavD9zcXG2sAS1tM95cpjks5gi3c8HsTz6o8cwoqX9g==
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr12554184ljh.61.1628438474302;
        Sun, 08 Aug 2021 09:01:14 -0700 (PDT)
Received: from localhost.localdomain (46-138-117-53.dynamic.spd-mgts.ru. [46.138.117.53])
        by smtp.gmail.com with ESMTPSA id a6sm1589014lfs.160.2021.08.08.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 09:01:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] rtc: tps65910: Correct driver module alias
Date:   Sun,  8 Aug 2021 19:00:30 +0300
Message-Id: <20210808160030.8556-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The TPS65910 RTC driver module doesn't auto-load because of the wrong
module alias that doesn't match the device name, fix it.

Cc: stable@vger.kernel.org
Reported-by: Anton Bambura <jenneron@protonmail.com>
Tested-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tps65910.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index bc89c62ccb9b..75e4c2d777b9 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -467,6 +467,6 @@ static struct platform_driver tps65910_rtc_driver = {
 };
 
 module_platform_driver(tps65910_rtc_driver);
-MODULE_ALIAS("platform:rtc-tps65910");
+MODULE_ALIAS("platform:tps65910-rtc");
 MODULE_AUTHOR("Venu Byravarasu <vbyravarasu@nvidia.com>");
 MODULE_LICENSE("GPL");
-- 
2.32.0

