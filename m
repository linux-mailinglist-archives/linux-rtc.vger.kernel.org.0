Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC9B33C404
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 18:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbhCORVG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 13:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhCORUv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 13:20:51 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAE8C06174A
        for <linux-rtc@vger.kernel.org>; Mon, 15 Mar 2021 10:20:50 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id x9so9662768qto.8
        for <linux-rtc@vger.kernel.org>; Mon, 15 Mar 2021 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opzNvVk1fZu0iACyJglvyvM4tM0KWtqsWh2sQlAnjHs=;
        b=lmpGzK6Q5727Uy3XdKhwieDMq6HPMNoboikVwe5RI/U8zW73HuD75DLd9aibkNxWdX
         fa47f6X2PlBmlWcigmkdKb8ddXOVtQvQWrVBGwuuYIu9KmK0A1qaPgthsxa45wAzLpjU
         evwgUftdy9MVuVVV5v5nfDimKIPER6IoCg1NLHz8X/jDBQ4cIDy1iQClmdcpsrTK4jva
         Ci3FpDuglYNCV6+vcZ8rk84mnnbjSaZLF6t1ypM4se661ptrLGYIMksbdB69lcaGjLjq
         XwWIjv7prupA3aDGPsbORjIs4jSfza07brbOzvnQ4Mhzs5QeE8D6YJhmRoZo91AJI60j
         cg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opzNvVk1fZu0iACyJglvyvM4tM0KWtqsWh2sQlAnjHs=;
        b=KDiZfdDBHVvHccKxKtubNJbfhFmEmQ0u2EEH7C4mVs12jhJyPSa8SdpIfCeB8lWbr5
         v/bNLbN3qI8MvNXhwzlyqPEGdqEKBOAKT87LXgdhzbcC8aTt1t5jvUzm6iskeuCQYPrC
         n+PjF/OD0V2SzKOIop4SCNw3agB702raqivVxZYTbkjed9eF0M5eOD7oBUHzKe2c9A/J
         K5wmItebxcapZhCxW1Nwx/BbFbsWGr7DcGcBlxGyRB4+5lpUhH6anDZHngo2bcmq2+xE
         gi/t3dWNGXO7YRYWEu2Ul0IwbxKxkEA/oVN2WpzJaBpeHN3IJOwQYLRWfmwTV35UGGQl
         yTFw==
X-Gm-Message-State: AOAM5308AQBTQH78Bkr1PjGl3vAEv+FkyCu0J8fcF7qyxDm+ENqx5JzQ
        B2oNW3tCbhHEJV/VNdbtQAwVxK/vjpsLCw==
X-Google-Smtp-Source: ABdhPJwpNnqCnVEz7iTq5KREbl1yOUvC4oAtCBFk3JBeoWLfgzL063PwtCYu0P/lOYlDuM/iMOm9NQ==
X-Received: by 2002:ac8:538f:: with SMTP id x15mr23383464qtp.47.1615828850037;
        Mon, 15 Mar 2021 10:20:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id z24sm12588158qkz.65.2021.03.15.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:20:49 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] rtc: imxdi: Convert to a DT-only driver
Date:   Mon, 15 Mar 2021 14:20:29 -0300
Message-Id: <20210315172029.173250-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

i.MX has been converted to a DT-only platform, so make the driver
depend on OF, remove the CONFIG_OF ifdefery and remove of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/Kconfig     | 1 +
 drivers/rtc/rtc-imxdi.c | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e6205f7a7d59..d6a502c5c973 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1339,6 +1339,7 @@ config RTC_DRV_DIGICOLOR
 config RTC_DRV_IMXDI
 	tristate "Freescale IMX DryIce Real Time Clock"
 	depends on ARCH_MXC
+	depends on OF
 	help
 	   Support for Freescale IMX DryIce RTC
 
diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index c2692da74e09..c1806f4d68e7 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -840,19 +840,17 @@ static int __exit dryice_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id dryice_dt_ids[] = {
 	{ .compatible = "fsl,imx25-rtc" },
 	{ /* sentinel */ }
 };
 
 MODULE_DEVICE_TABLE(of, dryice_dt_ids);
-#endif
 
 static struct platform_driver dryice_rtc_driver = {
 	.driver = {
 		   .name = "imxdi_rtc",
-		   .of_match_table = of_match_ptr(dryice_dt_ids),
+		   .of_match_table = dryice_dt_ids,
 		   },
 	.remove = __exit_p(dryice_rtc_remove),
 };
-- 
2.25.1

