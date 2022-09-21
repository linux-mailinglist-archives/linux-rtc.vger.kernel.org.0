Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06845BFD3A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiIULrP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiIULrA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:47:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49D0956A4
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s6so8739727lfo.7
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Z9Ue5DS5Cga8o/w2e+6VqkFN/cO/eMoPZweW6fx+Axk=;
        b=evlmInS7BghmrM8Z0zAIKp53bvbv2IpVwbmqJkDXMdyLGUoMR/TI3ZH3McmfIjqUaz
         50+7sDhtQFGJhoRxO2h2HH7jkaWu3+nf6lXPQhHrTPCh9aaRSG6Pbl61EoUmBanMPnx4
         6J5fZqeYmXz8I7eVoOaS62kfUstAuBDIFmzbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z9Ue5DS5Cga8o/w2e+6VqkFN/cO/eMoPZweW6fx+Axk=;
        b=N0un3NujgCrUqv5MGbOT9qh+gnlzV//OpRY7oR/RE1kZxP3phijfWhl5JG2o2HGA8u
         XbDbOYSTiwZ0TU+Aqmt03sDhdePdHzXn1pZne/YS2w1vdGABUlNaQmvMMYmr0vYRQQc2
         1MZ3yTHEWdIs4Ux1Pdvj2aeaxcHZ8T25bmXcGTd8VyyOgkBNQf8pIKt5x9zCJxNhP8bX
         ddIxv4srcpLuWZaoMzzjyeoLOuSY1m849IuYza5T66gfbCCdPDZi8pc/rAIRHJONqP+3
         gjl50X777GdC6oce18nWz/11/Cu4logg8aGOdkF3V/9B+kd70RdshGYyJJy/eDQhCzua
         MxsQ==
X-Gm-Message-State: ACrzQf3OvaCUOWowHf5tRcTeZuQ2rgvJUepdUSFqUsmskMXfmYM/7wVz
        tPp1111tQUeQZmRbdSsVdNRX2g==
X-Google-Smtp-Source: AMsMyM5WhXsNX6XVZJGeBmRacLDjdOlwrLy/r5SegrTbMy4w/i5inYO8mQreICTZZ/Lr6BpLgc0xww==
X-Received: by 2002:ac2:454a:0:b0:49c:6212:c44d with SMTP id j10-20020ac2454a000000b0049c6212c44dmr10742580lfm.430.1663760798387;
        Wed, 21 Sep 2022 04:46:38 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:38 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] rtc: isl12022: use dev_set_drvdata() instead of i2c_set_clientdata()
Date:   Wed, 21 Sep 2022 13:46:21 +0200
Message-Id: <20220921114624.3250848-7-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
 <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As another preparation for removing direct references to the
i2c_client in the helper functions, stash a pointer to the private
data via dev_set_drvdata() instead of i2c_set_clientdata().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index d396d6076db5..df6d91f4e8f3 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -149,7 +149,7 @@ static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct isl12022 *isl12022 = i2c_get_clientdata(client);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
 	size_t i;
 	int ret;
 	uint8_t buf[ISL12022_REG_DW + 1];
@@ -232,8 +232,7 @@ static int isl12022_probe(struct i2c_client *client)
 				GFP_KERNEL);
 	if (!isl12022)
 		return -ENOMEM;
-
-	i2c_set_clientdata(client, isl12022);
+	dev_set_drvdata(&client->dev, isl12022);
 
 	isl12022->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(isl12022->rtc))
-- 
2.37.2

