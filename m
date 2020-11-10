Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735B92AD2AE
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Nov 2020 10:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgKJJmM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Nov 2020 04:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgKJJmK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Nov 2020 04:42:10 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20DDC0613D1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Nov 2020 01:42:08 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b6so581094wrt.4
        for <linux-rtc@vger.kernel.org>; Tue, 10 Nov 2020 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4SZz8Jjd/2gfUFLzKFrvyEzAHX2qjjB45wJ6JZCEuM=;
        b=u87o0P5q+g9l9YvZ8TeELxX93vwA0/C6p1/p/0vmZk1QQe2Q7ovB3ySOGlIIBAya+L
         FiFD1r603raA6Ll3qj5pZq3pg6hBTYQBS0vo+YlrOBKcWHpmc4r9d4GoMMQdBKopEBtU
         VjHJSBhA2AbxdldTIdKWFIo4848Aaoo6UWXN+1T258gvIAZ6df8d+6xthcJESq9uPUg9
         Dj2mDnYSRmywDXuEzF4sBNaTMQCxaaLSyj/XpHPFGsIflNOEaKpovAYi7+D7paKDt4nV
         NkJ+wQLbxamAj7jB5zV9AoAfL0HN3RsZut7uIkJhDVrI727gdwgIfRHED6FwpskhR5a2
         8Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4SZz8Jjd/2gfUFLzKFrvyEzAHX2qjjB45wJ6JZCEuM=;
        b=I9Cl6d+6VAy8Qzll5WBCidu4KoNliEkI2enavrkh9N7hbVKb394DteRRy/Cdg0Oswy
         m+7rpgXUZHxbLGSzI7oAB7J26NvyoBvVcyghGkiXae99HWOESbIrRo2/OQCPJEBk3zq6
         MaH1l81wNHqEysE39Q8J7bTCCSfKhhkmh2ExkhxelDIWvEwdLs/z45pH9Aa2VJkMoZMS
         Fucis1aZi95tyXRoWhluHFL1JpRNvxymThlLVfvDzX09GyIx+ExhuuXlb49pUWDadid4
         1moULSydsFr4dfahKmBigyAqB9d6m4Il2bMjvkOjscGLNqrWAITXLAMb4x3ekkjTmv4h
         gggA==
X-Gm-Message-State: AOAM533AC3AXtUMKwuo3nUtMgIH78ORIulaWuTYfkTMfrZUGANH6ooFM
        aCgeHlWq+QWZwTeDaWu2CQwxPTYZzXlEuA==
X-Google-Smtp-Source: ABdhPJzV3V1jeIz+Yh977FGJq6KKvR+WcNw9QK8a3JX5fre0CVF7qvnfwCPyQyxf0S6p4oD3B4ZxNw==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr7781477wrr.250.1605001327497;
        Tue, 10 Nov 2020 01:42:07 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id b17sm16445377wru.12.2020.11.10.01.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 01:42:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] rtc: destroy mutex when releasing the device
Date:   Tue, 10 Nov 2020 10:42:05 +0100
Message-Id: <20201110094205.8972-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Not destroying mutexes doesn't lead to resource leak but it's the correct
thing to do for mutex debugging accounting.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 7c88d190c51f..e09b3f34ffdc 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -28,6 +28,7 @@ static void rtc_device_release(struct device *dev)
 	struct rtc_device *rtc = to_rtc_device(dev);
 
 	ida_simple_remove(&rtc_ida, rtc->id);
+	mutex_destroy(&rtc->ops_lock);
 	kfree(rtc);
 }
 
-- 
2.29.1

