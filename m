Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8D12690F8
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 18:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgINP7m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgINPqg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8DDC0611C2
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:17 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so181430wrs.5
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G+PK0Uhaf2LS2ruchACkgtdnjPe7y7uer6E3uH7d0+Y=;
        b=t4cFpNz+H2NjrPfThiGTG61J9s44bQIxzMJdnJMezCdAkv1s7OOyd5tY6sepLIaNdi
         dfjJsqMhGK074fz1kgG+Mgr6PGMzO7suAL6hS7MvM53FydeEnQifXai3sOViHVTahz7f
         XWvE2YmXf/f1333uZDRE0MVwvSIuPLy/OXZlvFTlJYhLUsoVX/JYoSc3jnA1cK60FNMA
         iCEb9VUSjQBeO72Vmpwhe9muvJmBSuudgZQ+fx+UriOr9APuvUPpKHl+7y3SttgisKhH
         BRsvuHwt/iRp6+5nO7+shHKpxYajkhw+JIUlDnJ1qQHZ93WLrSxmq1Da38oXxr/RFVAS
         FCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G+PK0Uhaf2LS2ruchACkgtdnjPe7y7uer6E3uH7d0+Y=;
        b=NAgApI+DDJ0NXlprMkN/c9frO06KMVjLYzmomCufuklb6WSSYUf+L6c6k48nNVTxZS
         ELDHQd6WiC0On6N7H622S+zaJuoUMjevyN3FNy7BVaXPFmXAVu5ITACagevb6GWVGfJc
         Zx8l6/DtOrzdjljfLaP3HWAUvBWzsNnxoZGAxV8542qynYAZqwprlb5DqMrECfB/t0zl
         YXsxubw55r0cvCOiVIF8PYX0smPPPlPvFeifnH2LT0P4Ym8+/+SdjXIXzSbPex397YC4
         aGxyMtG5qM2V54U5B/0JZ0PdzSYWJOcTABqc8lRYf8fKsOlw8YqoL+A7696uJLPLP6Ib
         g9Sg==
X-Gm-Message-State: AOAM5308VXqr+b1avEM2Y/K791H2s2+VwvaSv8SFutEwd+S46jU7kb1a
        8X0pANOeT6YlcOkiaM9JFNMiQA==
X-Google-Smtp-Source: ABdhPJxuT5RmVfGhcx94jC0I6FRj4mMhN3y7neth8DrHKaxEQk826vLobniOPVdXIdTvm3jVaMqBOA==
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr16409919wrn.257.1600098376153;
        Mon, 14 Sep 2020 08:46:16 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:15 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 12/14] rtc: rx8010: switch to using the preferred i2c API
Date:   Mon, 14 Sep 2020 17:45:59 +0200
Message-Id: <20200914154601.32245-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We should generally use probe_new instead of probe when registering i2c
drivers. Convert rx8010 to using it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 6aeed3802670..3c82f7d48a65 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -414,8 +414,7 @@ static const struct rtc_class_ops rx8010_rtc_ops_alarm = {
 	.alarm_irq_enable = rx8010_alarm_irq_enable,
 };
 
-static int rx8010_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int rx8010_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
@@ -469,7 +468,7 @@ static struct i2c_driver rx8010_driver = {
 		.name = "rtc-rx8010",
 		.of_match_table = of_match_ptr(rx8010_of_match),
 	},
-	.probe		= rx8010_probe,
+	.probe_new	= rx8010_probe,
 	.id_table	= rx8010_id,
 };
 
-- 
2.26.1

