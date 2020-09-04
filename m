Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2A325DD0F
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbgIDPVo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730781AbgIDPVa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAA4C061246
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e17so6434555wme.0
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UTzOsHSC+gZF9PSWWpuSmxUozEdf7QQLb/WCmyturHc=;
        b=MfZkEE7Gfj0EtpOJBT7E7Tf2l0qG42PZBryzfeuryiCZ74FGcKYrek3oeHE6kk7niZ
         d95jS1ajKAMD3cSEE3LnGLsKhc/+uB2M3h/3qc8fJx82Vc9qJf7rtt5ICZ/EpHdIyJ/p
         gobCsWFnQc2hRa7E+c90WvWV62/pGlk09hWK1IIPvZus1bT4XkoLrx7mL/9hHlA/qzhj
         qTkQxQQ4mIsiqIOH3waewQkRPI+GEs/8kcwYCMSdi/5Az7ISYmcKvymWygDvTvrgoGYW
         cuG+NX1fx9ZTnVdkkZkw20h0bv4odID5CMSRzGhs1+niyMAZ0/TjBWzjxOFYIT0S1rTb
         r0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTzOsHSC+gZF9PSWWpuSmxUozEdf7QQLb/WCmyturHc=;
        b=egRMXMTwMWuyo2CQHEZ46DasaCuJ1nTJlWurrwghQBVYVjtAk4Wt4zVLWmP+R9wWS4
         fC2LJzgj75Zq722YQfA839I7MKzD91XvdaqWtOpMT/uoKN0MgjcTFLNI9quoVHf/5RQ+
         oJ9FuWVC08Ep63v9PhqohMlsbF3JZQwGbKfMeYl9fWelbwmUqIhyoBZmDCpeZ2kegIXY
         FJ6GwQttM1YAhC/PoKWSyYd7kFtgvQv1+6AVrdMKRL5kpBJDhqG807cg2BuZKGa8MNo7
         MmJhi2Hx8t0sPGrkNXW+tfiuFluR2xzfLK5yo+SQgWTGEvNbxVB9wWxTupA2Q9Eds3Pi
         q3Tg==
X-Gm-Message-State: AOAM530pCi6fbQQV9boDHmpNJFGSn2swdCeN/SGjVinfBrCW+eD77xr0
        73urE3w64cwfawgvuXt3uiU+yw==
X-Google-Smtp-Source: ABdhPJz85fPQMFzckhhoTot2QaK8gl2HFrn/KMmGkiQzh+8CaGPlQpEFpsbRrgx1VteJY1b1GXeTvA==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr5770367wmg.179.1599232888476;
        Fri, 04 Sep 2020 08:21:28 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/8] rtc: rx8010: drop unnecessary initialization
Date:   Fri,  4 Sep 2020 17:21:14 +0200
Message-Id: <20200904152116.2157-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904152116.2157-1-brgl@bgdev.pl>
References: <20200904152116.2157-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The 'err' local variable in rx8010_init_client() doesn't need to be
initialized.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index f3bed7be2533..181fc21cefa8 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -196,7 +196,7 @@ static int rx8010_init_client(struct i2c_client *client)
 {
 	struct rx8010_data *rx8010 = i2c_get_clientdata(client);
 	u8 ctrl[2];
-	int need_clear = 0, err = 0;
+	int need_clear = 0, err;
 
 	/* Initialize reserved registers as specified in datasheet */
 	err = i2c_smbus_write_byte_data(client, RX8010_RESV17, 0xD8);
-- 
2.26.1

