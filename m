Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB6076990D
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Jul 2023 16:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjGaOJq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 31 Jul 2023 10:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjGaOJh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 31 Jul 2023 10:09:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322FF18C
        for <linux-rtc@vger.kernel.org>; Mon, 31 Jul 2023 07:09:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso7071601e87.0
        for <linux-rtc@vger.kernel.org>; Mon, 31 Jul 2023 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690812574; x=1691417374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRxEvq0yXDjCPyfneUhDjMZkYmuZy/K1An4O5oZc+4s=;
        b=M3dz4O6rHI3T0WtrrlpWUamBGzTOTTmfS8RepaL1ojtWqNbBUCvyy/dAuHRq6Oak5Q
         5Vx5oqXZjOIolWee0M5TFOw3FMpTMaHHyv5DK1gtrMTrP3/3UZxMwmtfBuDHOwF7+ua7
         FxxFjLy7t6Q69WSpJB7YiwO9K6LD3f9gfjkOxfQsY+FAYcd6l5WnQ6jdGKx9cBpz+4b+
         Pag47PvBoGXp/2TnL1vlbzcyqR8/JmFU9rTkiJIffzUr7VD+heVjieUCHRb2dWzBeQYU
         ziB32TOtFka1FMpuu+byqnLmycxcAYU1rL6kcXyTs1HbBQssz0J7JZZ5cUMr27H3JFeR
         GOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812574; x=1691417374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRxEvq0yXDjCPyfneUhDjMZkYmuZy/K1An4O5oZc+4s=;
        b=dSXNtLMw7aGJaghCyDlaJHSLNWb+8M8d6ugBk/E5OmbV57l1nj1CFChNZQrg1jMwP1
         GHqZ2OcqttecDaSXgQTaIW4wbxDUuPfm3pKAIDSAVIqEB+kXH6xSP6DvnJh2JOi+UVyM
         q5mLF7y46SqFtfjyz/M1w4jrOM3elN0c3je7YcrCYN156FxKHX1j4OdR3bMIQPU5/sT8
         jhGdKItCNLO9R+fG1KZqJMWCy2uhabOWlNdIDeaWAOQr2wg3bi4rebK4GJPmfaaj+E8C
         ji63RSamx6SPcADW4BttdeYwga1s0WxBT4ZXz1DSRREqJEOKxLO+oSYLt83UrAKbgjga
         U++A==
X-Gm-Message-State: ABy/qLZ+xIZnXlmkIGFWT0t9RqJ17I2J35TxojrRzIo88ndSZZnSeQWr
        r5V6GWNLUblFNkvCoA9edzpSqNs33+Rjdlaz74c=
X-Google-Smtp-Source: APBJJlENrI8Jg/l/w/NoYkge7kSY52qwYcGKp76+yALKtjfqTAt4ZrIMAV5yt0e3m9I5r0jSLvA1lg==
X-Received: by 2002:a05:6512:3d06:b0:4f8:4177:e087 with SMTP id d6-20020a0565123d0600b004f84177e087mr6461340lfv.47.1690812574441;
        Mon, 31 Jul 2023 07:09:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b23-20020aa7df97000000b00522d742bc4bsm386445edy.62.2023.07.31.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:09:34 -0700 (PDT)
Date:   Mon, 31 Jul 2023 17:09:30 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: fix error code in pcf2127_enable_ts()
Message-ID: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This error path accidentally returns success.  Return -EINVAL instead.

Fixes: 420cc9e850db ("rtc: pcf2127: add support for multiple TS functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/rtc/rtc-pcf2127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 78141bb06ab0..988cad171174 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1060,7 +1060,7 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
 	if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
 		dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
 			__func__);
-		return ret;
+		return -EINVAL;
 	}
 
 	/*
-- 
2.39.2

