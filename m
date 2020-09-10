Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0DE2653B9
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgIJVj5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730381AbgIJNHI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:07:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3E1C0617B9
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so6654700wrm.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IaFL4VbleH+05IhE/GIVwUyyev+mD5pCupMa3HimnAo=;
        b=YoliJ6JeT2neyUocbOYQQihpuvFv4h8l53gM/tq0UflJbtP6YafXg0NGQ7bfgUSJI3
         SdzIP9QQ3KkUryWMROvFYJ+1qTi4fKcfk2awLiC49Ee0rmvAEbKURBmsvOKEfWriVVrg
         TxyqLKiW86HzWh9/AOEbTWByvs9sLGpEzzyFnqNHFDb8Wu9MVvl/GqyJ4udi03Ivsspk
         2UeKt7RYbDNGOxtBLiOigz3NIDU9VCghlf0PGRHBgmqDFmEkuBgf864tYZF37xLC1Ay/
         1vin1mlRzHtlTgEOHrbV52a+Y4zwMHJgjO2V7B/gkUPIL7t+IwjCjMf74/O7eRGkUDTz
         F1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IaFL4VbleH+05IhE/GIVwUyyev+mD5pCupMa3HimnAo=;
        b=Ndj5xz9yaqEC8KPNpeLuHLXSzJ4XqHoakIKtCEas3V2kbx0b5ypYytUWFHHZD1kXMH
         qQAucdVtrqhYlakgFNP7jO8LS3IR6/+DgwnOktVgVa2jL8lxELWwnOpSZ4VmTn0qa1Kt
         XyP+t3/OxD/LbX44tN3V5eUypg9H3urk4hfEqGQUIIqgU/uSDrYNVizyVmHTxrRHBTDY
         +xoA70hzGbC4oMRaIt81F3bjIogX+3jtBkWTo1Q3cv0f1Zib3GdiL68vAGMrtJxNv3PO
         KeZAZouSitkxu39em9F1uZj49J9xsBX/wzNM6DaJDlJ+yRTQlDONnAXWKCSf8djFrjFc
         feGw==
X-Gm-Message-State: AOAM530hyfY7ULpdJv+/PkliCznL6sjra3OUKtQnX2swlBTst3EslkqH
        jrjocWm2xn/IuHfB6GBKB1E+RQ==
X-Google-Smtp-Source: ABdhPJxBNAf5uTgzeBjmrtbqSIw0BM3oe+/GacCg08mmFuQ5ITOtCe4FBYRkVweYGuig/JUs6vtymg==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr8678090wrr.406.1599743110489;
        Thu, 10 Sep 2020 06:05:10 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 11/11] rtc: rx8010: use range checking provided by core RTC code
Date:   Thu, 10 Sep 2020 15:04:46 +0200
Message-Id: <20200910130446.5689-12-brgl@bgdev.pl>
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

We don't need to check the time range manually in set_time(), we can
use range_min and range_max exposed by struct rtc_device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 636e0de02d9b..e78f0808bdff 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -140,9 +140,6 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	u8 date[RX8010_YEAR - RX8010_SEC + 1];
 	int err;
 
-	if ((dt->tm_year < 100) || (dt->tm_year > 199))
-		return -EINVAL;
-
 	/* set STOP bit before changing clock/calendar */
 	err = regmap_set_bits(rx8010->regs, RX8010_CTRL, RX8010_CTRL_STOP);
 	if (err)
@@ -415,6 +412,8 @@ static int rx8010_probe(struct i2c_client *client,
 
 	rx8010->rtc->ops = &rx8010_rtc_ops;
 	rx8010->rtc->max_user_freq = 1;
+	rx8010->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rx8010->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	err = rtc_register_device(rx8010->rtc);
 	if (err) {
-- 
2.26.1

