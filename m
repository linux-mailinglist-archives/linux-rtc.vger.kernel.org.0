Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF6B2653CA
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgIJVkm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbgIJNGb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:06:31 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765E8C0617A9
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so6630031wrs.5
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XwhhTmIpt9I/D9KrOo2LJ6gPM74tL0wwMib4UYGiVq4=;
        b=Hg5YB683SBcxwBOJuYWAbPVzcbtuI8GTdFc7yNFZkPuGlTOospMoDqTJVh5eyvbHRy
         Lybj7DyI8+K7Gj4Lhk3d5DZUUX1omx6RWWhTFNmdmVJF9M2kdDIy2HrjJHIRoAVuIqYI
         aAsQ4O5g5g4p5Bq9AlB5o80bKRwJX0q/PoLtGW2myp1DbkBjM3pJVR8AjFsqRs0Yzc9P
         t19ntKuWvjd7+1BVfF3FhLHF6JAW3CaxzY6hDQ+zuQWVnU/cZWgmqcubK8dtrDytUqEs
         DSZ5atmiFFgcIw+YPM+v9lSNC1j7IFgjRGLIQv+74i1lAOA3WvLUmXCWbQhFobQcl79m
         KFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XwhhTmIpt9I/D9KrOo2LJ6gPM74tL0wwMib4UYGiVq4=;
        b=FK9uPOcRg2UbL4BTtGjGu+e+QAraoyGneDefHXe5ypBCIzNmiRf18Gx/4p7NMK9H8u
         N1oWXFVIJP3D0zXJ0TY3zgtMx9BPLjLBU/JlJj1QZP2F/g17uCEj7paVUY38jOFOt0ZH
         SBCj67ih7TuSgu7GE6V6TdZwrftn7G3XcY5FyguPOxeopTZDwFyu6eFBjJrbhOoTn7Sr
         1SMZOD9++w9sjgqYvz2ifD0+RJfwH3uxliOCg3su61pwG6mw1j/zER3XkLQ5z7rSiF7L
         vbJTTmcMmy9qK3129nDi28CiUNR2N8XMpXFyr/JcFVxHso8DpbU3dS/jR27GTsyUEcuk
         u+JA==
X-Gm-Message-State: AOAM530S0U1v31us40z9NDO803pJde0EfKU+Oi/fQ32B80Y6Bh+Eyy5E
        KbZVuOF9c1TBZKpjpVLu92d8ig==
X-Google-Smtp-Source: ABdhPJzcvEpeSQuLyTVjL7Lr8uyfJn1qlbCPNliUserEbRmtMZTR1dNxSRyJtap07RsrxrZOGLBAwg==
X-Received: by 2002:adf:81a3:: with SMTP id 32mr8910094wra.368.1599743107847;
        Thu, 10 Sep 2020 06:05:07 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 09/11] rtc: rx8010: switch to using the preferred RTC API
Date:   Thu, 10 Sep 2020 15:04:44 +0200
Message-Id: <20200910130446.5689-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use devm_rtc_allocate_device() + rtc_register_device() instead of the
deprecated devm_rtc_device_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 0665878e8843..bb6578aad972 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -447,16 +447,21 @@ static int rx8010_probe(struct i2c_client *client,
 		}
 	}
 
-	rx8010->rtc = devm_rtc_device_register(dev, client->name,
-		&rx8010_rtc_ops, THIS_MODULE);
-
+	rx8010->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rx8010->rtc)) {
-		dev_err(dev, "unable to register the class device\n");
+		dev_err(dev, "unable to allocate rtc device\n");
 		return PTR_ERR(rx8010->rtc);
 	}
 
+	rx8010->rtc->ops = &rx8010_rtc_ops;
 	rx8010->rtc->max_user_freq = 1;
 
+	err = rtc_register_device(rx8010->rtc);
+	if (err) {
+		dev_err(dev, "unable to register the class device\n");
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.26.1

