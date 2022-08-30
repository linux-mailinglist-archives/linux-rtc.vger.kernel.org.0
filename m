Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887A35A602E
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Aug 2022 12:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiH3KEx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Aug 2022 06:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiH3KD7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Aug 2022 06:03:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC5AE831E
        for <linux-rtc@vger.kernel.org>; Tue, 30 Aug 2022 03:02:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id p18so7459240ljc.9
        for <linux-rtc@vger.kernel.org>; Tue, 30 Aug 2022 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lP4IkEyc6NQgR5/fjvStSKdnasa2RR9aagLo80bh+wQ=;
        b=CW+bEvyoLzoq6o+mPIWY7BjrK0DY+310MkI+jv9+DuF6VtUG/vFHOkk+cKXKpQap7Q
         AoB+n7bA6sGm/fquvT6qYXRpc0VW8m69/9z47oZBeJsk/tT0oE/qHCP9psx/Nr6ABH0x
         9mMOj2aOcU/93vHlyNn2Q0fC3YkIwXSU7vgfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lP4IkEyc6NQgR5/fjvStSKdnasa2RR9aagLo80bh+wQ=;
        b=FMGewri9vX9XCD2+UNjypwyS+qFk8IqblgSIYnRVlfN0+cZX1o7W1eB94sCQVdDZ7o
         kKeGOsIhesUUO4cV2ckXVDPgH9aTE0KH/x7ILRetiJUOyp86UFG9fXg/v75/qjFiMoku
         fRWDt1pl0ZjbyMI59F+V5ykZuYT09li0dQinKz3jNgqH2bhq8RrAA1hMtGK476BVtqQY
         hiLd/meQF0HB687/CAeNQ4ORwTXtfbIv4/cTMr7QmAJEe0PJcVUvgrZfZM3s0yrNeSjO
         wl/V9rcz+Hueti9Z/Js29KFcAefFgc9ELWgSenBil+hDJbHxoWSrNebjJAuQUuowaZUQ
         FhfQ==
X-Gm-Message-State: ACgBeo1j8xCbJJYlU3TDrNKHxf3LmFppUV9nOLJMyiU++/5nXfRCGbKu
        TplJRu+1IJUsueSbqQBeeQIKsQ==
X-Google-Smtp-Source: AA6agR7Uq0IuVRygBPS5fM06kc9QlnmuqPQ4jRm3XF7QGplOC1cDxfa2A6zkb4wNbwnup33VPjgPAA==
X-Received: by 2002:a2e:a5c6:0:b0:25e:223f:a417 with SMTP id n6-20020a2ea5c6000000b0025e223fa417mr7513666ljp.236.1661853720468;
        Tue, 30 Aug 2022 03:02:00 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b0048af6242892sm1573435lfg.14.2022.08.30.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:01:59 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] rtc: isl12022: stop using deprecated devm_rtc_device_register()
Date:   Tue, 30 Aug 2022 12:01:47 +0200
Message-Id: <20220830100152.698506-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The comments say that devm_rtc_device_register() is deprecated and
that one should instead use devm_rtc_allocate_device() and
[devm_]rtc_register_device. So do that.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 79461ded1a48..2dc19061cf5f 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -246,10 +246,13 @@ static int isl12022_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, isl12022);
 
-	isl12022->rtc = devm_rtc_device_register(&client->dev,
-					isl12022_driver.driver.name,
-					&isl12022_rtc_ops, THIS_MODULE);
-	return PTR_ERR_OR_ZERO(isl12022->rtc);
+	isl12022->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(isl12022->rtc))
+		return PTR_ERR(isl12022->rtc);
+
+	isl12022->rtc->ops = &isl12022_rtc_ops;
+
+	return devm_rtc_register_device(isl12022->rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.37.2

