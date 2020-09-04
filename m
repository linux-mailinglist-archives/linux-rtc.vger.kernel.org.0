Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6653925DD13
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbgIDPVn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730237AbgIDPVY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05D6C061246
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so7137753wrs.5
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stUHoXBLhmGzCwZtEJAUKXLxs5aOWuJj0Ee8wOeFjkw=;
        b=R5Dqco5Vp40iB/h46/HNZAv1XlB31sJ1uLGZz0PIHiNSuFyPEIvqOG0s3JiYF+lh3u
         DurSlxoDn/IFY+Fbf5xSfktwwY5BC84nKcYoiG8OR5b1/efxzcT2XWjZAPsadyfJskzF
         oHaVA+C2KEV7MKjlE0XUBbHp3MXCuih647KUKkedt85whqODx3C2FEopKhUim+AOuB0U
         E5GPclZWVElCYYr+ofk7B9yjyHzhgWjKrwfgx63n+Eq18kgjNg95pQarqWmU6Xl2gCSX
         +HnJE8kCQ4VctMsImFS8lFPAD00bcCs2JXlkAM3c5Zeqld1EIAshT8hcndkPjtrZz3TM
         lzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stUHoXBLhmGzCwZtEJAUKXLxs5aOWuJj0Ee8wOeFjkw=;
        b=h1Y4k2rXaVu7QfLKkLopeoN46IIeHtVaCqBrJvA5YYs2WrThfCQB2qtW0DDaUiODrw
         OVxHBKZz3jdIWkoQPmPXGVk849cwpHcS9blv+srcg0x2VRzG15aUaAA+0wEFRDtOIg8e
         OxaaThyvnQd8BdITma0u2xBjbKLQ8TFNkiAJfD/IPDc2Jo+NBKrycJOB+EONgvIFJr8R
         6a7TLsHEfriUHP6R2P1/KoaORKZ9kSmmvHO1XCgwg3xpwZBqyVJmiknkyqWGm/EC944r
         MT5DW2pn+bIWXY4HDg79CTX+D/23uxjGqwp58Q+A6LtdqqcStAh1brjly1Z8eDDxnCjJ
         0Mug==
X-Gm-Message-State: AOAM533peq7hW0OTLcMl5/uHJnxoaeGjKUqpslhXBW61z+mlIKMYLQyt
        +ZN21h+OuR3xHAeMkYQxEAJ/LA==
X-Google-Smtp-Source: ABdhPJwl7Nn/2R7VILQzKg8oX0n4CU6PnnWJQYviy0/NYR2eE/0FgjwSs2ONiVU4fkwPEDEObs/jPA==
X-Received: by 2002:adf:94c1:: with SMTP id 59mr8817819wrr.29.1599232882017;
        Fri, 04 Sep 2020 08:21:22 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/8] rtc: rx8010: remove unnecessary parentheses
Date:   Fri,  4 Sep 2020 17:21:09 +0200
Message-Id: <20200904152116.2157-2-brgl@bgdev.pl>
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

Remove parentheses whenever they guard a single line.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index fe010151ec8f..2faf5357a3a5 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -181,9 +181,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 		return ret;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (flagreg & RX8010_FLAG_VLF)
 		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
@@ -284,17 +283,15 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	int err;
 
 	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
 		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
 		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
 						rx8010->ctrlreg);
-		if (err < 0) {
+		if (err < 0)
 			return err;
-		}
 	}
 
 	flagreg &= ~RX8010_FLAG_AF;
-- 
2.26.1

