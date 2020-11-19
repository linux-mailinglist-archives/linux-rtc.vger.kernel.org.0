Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D080A2B917C
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgKSLoH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgKSLm7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:59 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C12CC061A4C
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:57 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so6158002wrw.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C783/1a96wndnq99uHBrGGfMWbIfDC+UxReU2o1w0eM=;
        b=U/7F6qMiwKIfR3kAx2lDIrOXlIT+DEpxMPQqMyN2iPoz3lriaYcJIVo+rylP+X4eew
         Zy3DVezJFxKXb4V553umReRrm+GVVzU0NnO5Caf8D5plJE88YStDHnHGYCAeckhD+ZDE
         PpCng6y5OfWL0N6ldr2RUnDVarPbECHxlKL+JrxSTMTx5KqbRbg2HcY51y1kD+lK8yil
         +GgT17wXtsFG6ahqiRiOJfDjQMFTkq1T6QdsY+YDu8sDRM0QLns/OEJZ6cVvQVJ2PWa5
         6CzZNOcwITz1TXQYvRQDTSwtKeiZbccM8iv8/VCumhNTYdyYlx2SPEwJejpwsnQYPDbm
         TYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C783/1a96wndnq99uHBrGGfMWbIfDC+UxReU2o1w0eM=;
        b=CcHQ3zu5rbIHVTFLHxKoappRp22CbOQI+Ao6KAHaj4vo1R95SjpzJkstzH97vSZTA0
         RInXGxh4IqAglF3Y5j4jInQbQlaaE2R0/KV4oDrCMyaBHBg+iA5HOA1t9vTL7jVooSLR
         2B/emJV3xM2j0iuiItxRKBivUUgcfrvsrvSAkHRK7uhCRGFcwWHUSSaCjfPjleAx5WI+
         qGDLNe6plCse72Rh09YcZx6ASiMZZmBqTMgyy01Dx95UjuUSge0KAUxGc3kFBIgDEmcq
         u8HTqRQDYeMm+sY/pfwhdUT4veFc4//zCtY8cqgrjiUumUoBNQHVmov60fK+K6m5Ujmq
         8DxQ==
X-Gm-Message-State: AOAM533fuzTrccxxifKMts7hszvjcQ8g1GGt7oAb10CLVYzjEFeYxXXa
        tgBE/nJimm5Q7E6BdQcYZlte8Q==
X-Google-Smtp-Source: ABdhPJxPd7gqSz7BbIpV+55T34jL/792TzWYK9k8NSE+jaTQSNYWcMdtIKTzEVBuMBhT9laSVwN4ag==
X-Received: by 2002:adf:8169:: with SMTP id 96mr9537752wrm.418.1605786176199;
        Thu, 19 Nov 2020 03:42:56 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 48/59] rtc: rs5c313: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:38 +0100
Message-Id: <20201119114149.4117-49-brgl@bgdev.pl>
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
 drivers/rtc/rtc-rs5c313.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c313.c b/drivers/rtc/rtc-rs5c313.c
index e98f85f34206..3813751d7c86 100644
--- a/drivers/rtc/rtc-rs5c313.c
+++ b/drivers/rtc/rtc-rs5c313.c
@@ -371,10 +371,13 @@ static int rs5c313_rtc_probe(struct platform_device *pdev)
 	rs5c313_init_port();
 	rs5c313_check_xstp_bit();
 
-	rtc = devm_rtc_device_register(&pdev->dev, "rs5c313", &rs5c313_rtc_ops,
-				       THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	return PTR_ERR_OR_ZERO(rtc);
+	rtc->ops = &rs5c313_rtc_ops;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static struct platform_driver rs5c313_rtc_platform_driver = {
-- 
2.29.1

