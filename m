Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFFB3FB0C8
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Aug 2021 07:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhH3F0d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Aug 2021 01:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhH3F0c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Aug 2021 01:26:32 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03428C061575;
        Sun, 29 Aug 2021 22:25:39 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id q21so7865160plq.3;
        Sun, 29 Aug 2021 22:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5veyo9Ry0StfUWfoIo1uO4FnVWpRSgAmiP0O2/2xtyE=;
        b=ja9nZVv5BY7tVqCB6oK4eLJbbjmEEvDjg/gmWnE8Ywgtan0f8J8fFZ6b8FeJOg+woT
         JBN5Xb6LnKT7CZIakKApM99GgrgEDYZFxWDpd3XnhQ+L/blTnMMkNrT+vd+UcWwHPMgY
         guu39XC6hFByRcxlPgKx9kMCNnWz56fW8sWLst0pe6Frv5q5PSI9IwtTNCpNEAB13177
         nIHH4tt6ClO1D6EWClxsGQN5JGNBLieOVhf9gVka21m3EuuXWP+HzMR16pwmE0ULN+LD
         d36r8+dt71E4o4fc4Pi1sECZ6JJxFDLhPPgiv3QC7QiYG7ykh6Xxm9O5RMg6HEQtEFm3
         isTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5veyo9Ry0StfUWfoIo1uO4FnVWpRSgAmiP0O2/2xtyE=;
        b=eQWUI5df2y5XKBpjMLlh86qy6x437G/KAHg1NYYVSAzq8hcOs32f8p05+8Ec5c8cHB
         vMP88gg0D+UQEeoXa736OaRXq2dadtnDoHtxvj5rBywyQJd9VODJSMR7yHTGpNhxc+tg
         MzFGotQuoUtYB/WNIYpHPENxL8bnFvWcorZGBqSkYeEp1yl0byuIHQK84Nn1pYYFrXM5
         Dt2o9fs1sfS8ZQPcp6MbFIaxCPFqnx41hAYAcerdGhOdvYo+MkY6ZyN7p0BqayQcKce3
         RcQFhZIr1wftJThXBVce9lIk5vRW+HO3y3asFm4ObIBdhhdQnpa7J0jQW5yvMGI67Mea
         5YaQ==
X-Gm-Message-State: AOAM530AfP8vdHmdu/iXbP5WqJn5BTmkxHViYxYRfaunkPxdbvO7yuJ5
        syjsy3CRGgr8V13aOITIepSh+wKxD08=
X-Google-Smtp-Source: ABdhPJy89kWy4Xf8qb/yfJ43BLanYchu9drlpTuSqq3PNXFGHxjV3Hhswkx/STNCnxdhL9JEssV3vQ==
X-Received: by 2002:a17:90a:ae12:: with SMTP id t18mr17685626pjq.45.1630301139425;
        Sun, 29 Aug 2021 22:25:39 -0700 (PDT)
Received: from ruantu-linux-2.. ([211.72.215.15])
        by smtp.gmail.com with ESMTPSA id k190sm4220804pgc.11.2021.08.29.22.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 22:25:38 -0700 (PDT)
From:   Yu-Tung Chang <mtwget@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Yu-Tung Chang <mtwget@gmail.com>
Subject: [PATCH] rtc: rx8010: select REGMAP_I2C
Date:   Mon, 30 Aug 2021 13:25:32 +0800
Message-Id: <20210830052532.40356-1-mtwget@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc-rx8010 uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Signed-off-by: Yu-Tung Chang <mtwget@gmail.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 12153d5801ce..f7bf87097a9f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -624,6 +624,7 @@ config RTC_DRV_FM3130
 
 config RTC_DRV_RX8010
 	tristate "Epson RX8010SJ"
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Epson RX8010SJ RTC
 	  chip.
-- 
2.33.0

