Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB742AC0F8
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730480AbgKIQem (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730502AbgKIQe3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:29 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B3EC0613D6
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:29 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so8546806wmg.3
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VBKmNaU6GzDEF2v8GsYhoQiOn0zT7fReWvIysKZmWgI=;
        b=N0W8LFoNVa0dpGQmQ48le1Ab9L5UxXqxtwU/lI1MyEUXNapCeCNSLhmx/lljZ2lzY9
         t9Zn4gqpIaNiEmz3pJl1Gm1JgqBqlkCrFQYzE7QwFjXAeWrs9sGGnkR2kSfCJcr5ZkOY
         xO0PZ2TGnYtIG/Kor9NEhLfJZavYKGhwKEXjS4pE03DOVNsDgwuyY/WIcylnJ3WifmBx
         RCSSZNuuGDYrtQpDTmqVDOoZXf2uxh8I8PnxRYfeO4HO/Xd+41Zbiy1tQZx2CEhsRoIQ
         8mJn9DlCY955T6RRm27tcVJeen+5s+P7wHSsQ+vf3qoaWc5ZpV2mCNLg8oMdLF9RNMtH
         CnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VBKmNaU6GzDEF2v8GsYhoQiOn0zT7fReWvIysKZmWgI=;
        b=ap52s/EyBBat50mwO8scPnY6my7r6p8d1P/mpyYxjxsCAAE4cqTOfYgXQsroPnbEU+
         JlALrIiK0C90ZvMWtZ3azlE+HEG5PvyCWXuHJ6/CXx7RZxBLBYbXaiQN/b7q+u3r7isN
         u+P2SMPAYtvxXz3jUkyUcjGLjiPUhEnV2Vez1yQDBEx2iDYlIfGloR5lOdm9jrcGK3PH
         UN7rp6p228D8ktlrTslqWgpIGWT1RYuyqjBQl2I7RJTA031VH+WiTcmlzSH09lYotpzl
         h3oppt9xDj0wgGO9hK2iVNmdcHSK3yAaxZnMPTAY/bCYDw72w9K7me1kJwzLslJXyTVY
         3rPw==
X-Gm-Message-State: AOAM5339mMch3LfILkTgI1YRtMc/k0BN9JHGrANqRI87Koz6HqI5OHgS
        6TyH5rAl3bst4x3LOJk4T8Vs/w==
X-Google-Smtp-Source: ABdhPJwcyJzgDmPBmOFmreWEJzPWVt2t1FRZO6tgAevOrfZzo3hvImiL7px5w9jYTtd2fyhXInIe8A==
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr11578wme.46.1604939668010;
        Mon, 09 Nov 2020 08:34:28 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 8/8] rtc: shrink devm_rtc_allocate_device()
Date:   Mon,  9 Nov 2020 17:34:09 +0100
Message-Id: <20201109163409.24301-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need to use devres_alloc() & devres_add() manually if all we
want to manage is a single pointer. We can shrink the code by using
devm_add_action_or_reset() instead. The number of allocations stays
the same.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/class.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index b8a34ee039ad..a1b3711aaf01 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -337,48 +337,37 @@ static void devm_rtc_unregister_device(void *data)
 	put_device(&rtc->dev);
 }
 
-static void devm_rtc_release_device(struct device *dev, void *res)
+static void devm_rtc_release_device(void *res)
 {
-	struct rtc_device *rtc = *(struct rtc_device **)res;
+	struct rtc_device *rtc = res;
 
 	put_device(&rtc->dev);
 }
 
 struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 {
-	struct rtc_device **ptr, *rtc;
+	struct rtc_device *rtc;
 	int id, err;
 
 	id = rtc_device_get_id(dev);
 	if (id < 0)
 		return ERR_PTR(id);
 
-	ptr = devres_alloc(devm_rtc_release_device, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr) {
-		err = -ENOMEM;
-		goto exit_ida;
-	}
-
 	rtc = rtc_allocate_device();
 	if (!rtc) {
-		err = -ENOMEM;
-		goto exit_devres;
+		ida_simple_remove(&rtc_ida, id);
+		return ERR_PTR(-ENOMEM);
 	}
 
-	*ptr = rtc;
-	devres_add(dev, ptr);
-
 	rtc->id = id;
 	rtc->dev.parent = dev;
 	dev_set_name(&rtc->dev, "rtc%d", id);
 
-	return rtc;
+	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
+	if (err)
+		return ERR_PTR(err);
 
-exit_devres:
-	devres_free(ptr);
-exit_ida:
-	ida_simple_remove(&rtc_ida, id);
-	return ERR_PTR(err);
+	return rtc;
 }
 EXPORT_SYMBOL_GPL(devm_rtc_allocate_device);
 
-- 
2.29.1

