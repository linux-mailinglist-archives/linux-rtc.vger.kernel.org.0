Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D3625DD17
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbgIDPWA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730810AbgIDPVl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B651FC061260
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so7090311wrl.12
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eEZDuStJjJk1FIrMzwflNMl97fxslfVlQl/5yuaVYNI=;
        b=yGxJWlsyeosFf351pC1itNstGCRhwWhmdMXb4VQRFTAu/Qyrsb0OIp5seNKsnrOelE
         zqxYV7mkcv8JyXa/zPwFYsZBbngqzyjOH0OoO0ktkwcBwMbJ27fFg7CSEclPLeEzciJ5
         3aJTlA99yXS4EviRJd4r8inMZVlJOjPUwTiZrP0gQwpgO5EEFbdQNUW6LGUZf1J5n47S
         GUyCiKqxf/u++rcyDtNJnNMc9X46SGlUe/S5YJrDA2x8L3mRyI7isBAIcXYQBYJJZ+my
         gXjX5FS9uP75Uad8hyGEf0cZyeVrOAKIE/jAz3iT6ac0AkBL53NwAaQt27f6F4qUckeM
         QCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eEZDuStJjJk1FIrMzwflNMl97fxslfVlQl/5yuaVYNI=;
        b=lEw2bUddD5DDGMG0LZh61cmajb+NwhbSs7N/su6QmHuZLv6J+43Jit0VHh/R9VCCv4
         4/m+Kf3nVQE+gup945upy8fTgvxGPLz3/i+FWPjymJIQOdyorMSmuFLhMjp0iQjOxZnp
         QfO/dS40vao0xNvAhFpiv2M2NsCxZT9dRzBns7Picbjm7EcY1mUsaTRj1kSdqaQDwsfQ
         1XDXoQSbYxJ+jscnYwLAnmJaujM79aKi3VVOlcTA6eq/kFBwlJdGcHpmEiSajcc/SXec
         jN5cmu1em/+3FWlyxdUdBG74SmVm5ddJFGSI5Jc1m4Ltxi+oGu4d9t6oBgnZVWiInBWp
         SBRw==
X-Gm-Message-State: AOAM533G2lmyFQRYLyw+Kxs6haFWxfUBwvPbgj3r03ykPW1UTEpU99E+
        PipmiSnA0D7uEJms4ZYLt1vtFg==
X-Google-Smtp-Source: ABdhPJwl4h3PqASTyFA1+ncRsFs+j+n3e5ZfX4N1EuqV6KZX9K8bXEhi628kvRJBKe6oBcnZRI/lDw==
X-Received: by 2002:adf:f8d0:: with SMTP id f16mr8793626wrq.66.1599232889418;
        Fri, 04 Sep 2020 08:21:29 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 7/8] rtc: rx8010: fix indentation in probe()
Date:   Fri,  4 Sep 2020 17:21:15 +0200
Message-Id: <20200904152116.2157-8-brgl@bgdev.pl>
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

Align the arguments passed to devm_rtc_device_register() with the upper
line.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 181fc21cefa8..ed8ba38b4991 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -450,7 +450,7 @@ static int rx8010_probe(struct i2c_client *client,
 	}
 
 	rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
-		&rx8010_rtc_ops, THIS_MODULE);
+					       &rx8010_rtc_ops, THIS_MODULE);
 
 	if (IS_ERR(rx8010->rtc)) {
 		dev_err(&client->dev, "unable to register the class device\n");
-- 
2.26.1

