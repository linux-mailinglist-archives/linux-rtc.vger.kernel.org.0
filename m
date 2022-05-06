Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D3B51E21E
	for <lists+linux-rtc@lfdr.de>; Sat,  7 May 2022 01:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389955AbiEFXdD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 May 2022 19:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349196AbiEFXdB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 May 2022 19:33:01 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A685A712D4
        for <linux-rtc@vger.kernel.org>; Fri,  6 May 2022 16:29:16 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id p12so7476726pfn.0
        for <linux-rtc@vger.kernel.org>; Fri, 06 May 2022 16:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZryJIATSG1rhke0rJfXTfUFsBQ86+ZTOTmR7kVabtXI=;
        b=N8dL8GLe87MYs6OgH7bRT1eZgTqQyzOBKIjqgJ//OQYPu/gPDbsr6lhxB4RSRjjuOE
         sneUljFGtZHU1OSXJF80lMprGDCqMmp1suZ1v6xEU3ry/RbWrxDeBZCI/D64v7Yjn94M
         y7mVGqwunG/Czz+9/0m0HElq5op5dJpzi3ShdWh55jfqHkqbtXtX8EsPxP6YtkS2kYg6
         8LZXeT0ihJ7ekaUgOyFExvPQ7ZcbbysyDw9EtMMfcxYdOI5f2W2mFEO9AJ3MNgGZvCSm
         ZEBHydh1grVmTOmU5ZCClEbpsVFRTrS3KqWloySM09EWCZkcK2VSHfb4pY/33QylqviM
         pABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZryJIATSG1rhke0rJfXTfUFsBQ86+ZTOTmR7kVabtXI=;
        b=F4oX8DJ53TWXdahGlScurKPRWpbUVBrdtNK6GwbqVFfXN8hmhQqogqJbJT/6xQaCZP
         /yZToNlpW3nA1IjtN1qSMcHZMwz5VRCtB4KARm6OFgXQCnEkgI3H93h15VZOZVvaOd/m
         v9VnPwoAywZcWa6JbVjZS7WVAInd0SuDsGsZ83AKmfie0b83fXjQXKyc1qgJios5Tvnp
         TpCSuGBCmTcuHlws3s07WdpuQIifZ+XiZfFfhO7ODQ8olik81g+/uoL/sG5oknNPyfn6
         x5Z9Lt4R1lczXgD3bPqm1ef52ndHOXhkgga/xhjlIlPB0avf22+0WrmwSsuFjiImc6tr
         8nmg==
X-Gm-Message-State: AOAM532dMoPyPmYaaSvwL6R7uYPDzDBKlgVWJ2ADSKE7PXJ1iGMzGkz5
        kIEgm0MwV522yn68WjShaLxj
X-Google-Smtp-Source: ABdhPJwDqQtSYBlWcHAu64fZxver1LDggAI7mPO/6wt4Kp2hobdi2w57JzQzPqGrjGjah4egCMW73w==
X-Received: by 2002:a63:1d26:0:b0:3c1:eb3f:9daf with SMTP id d38-20020a631d26000000b003c1eb3f9dafmr4590923pgd.284.1651879756163;
        Fri, 06 May 2022 16:29:16 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902a5c900b0015e8d4eb1e3sm2333441plq.45.2022.05.06.16.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 16:29:15 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: rtc-meson: Fix email address in MODULE_AUTHOR
Date:   Sat,  7 May 2022 08:28:50 +0900
Message-Id: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Ben Dooks's email address is <ben.dooks@codethink.co.uk>.
Fix Ben Dooks's email address in MODULE_AUTHOR.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 44bdc8b4a90d6..db1d626edca5f 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -399,7 +399,7 @@ static struct platform_driver meson_rtc_driver = {
 module_platform_driver(meson_rtc_driver);
 
 MODULE_DESCRIPTION("Amlogic Meson RTC Driver");
-MODULE_AUTHOR("Ben Dooks <ben.doosk@codethink.co.uk>");
+MODULE_AUTHOR("Ben Dooks <ben.dooks@codethink.co.uk>");
 MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:meson-rtc");
-- 
2.36.0

