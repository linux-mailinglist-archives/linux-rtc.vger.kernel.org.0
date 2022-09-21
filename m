Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D515BFD33
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiIULqt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiIULqg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:46:36 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C5392F42
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:34 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b6so6629540ljr.10
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lP4IkEyc6NQgR5/fjvStSKdnasa2RR9aagLo80bh+wQ=;
        b=MPI/QeQUdshERgTnwLtRSk5quf7LAJzsftQ1mPmIdNedAIcthsmN9PRc5w2X28K42j
         XGKsYtELeqKNGAZrCb4qsLxkG/i44/u9ZyfllmSj5uW7CFV/MRRrvIbeU9wVJaQi/pYI
         eKVubX7NU0Vy0rVYbsWOiFEwz2t6GHKvLyJ0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lP4IkEyc6NQgR5/fjvStSKdnasa2RR9aagLo80bh+wQ=;
        b=aRCheYsuB4TMT9kf+y0GjT0CMDH0CyH/XJDj5+JaXv1QJG5h9FhjGY1CceOoix0vg5
         gvvxGVFETY2iRQsx2898M2ej1b7eM7TRuNvA/LjwdFML2zIQTztmdDVQF8H4ta2fuRWl
         JHHxIGEz+K1GB0QUYY3ry5z94CJ8R3nO7hkEnO+BmJNJoY95o1hx11HnmKnS+sVy7i/G
         Kn/4PrGHPBmcF8vicn+mYZjc+rSacAhQ8Y3vAHyjCc3kVNV2lF2QYi1cygdwmwivaZJ/
         mWWqK1J21kYDxxzjL3dW2IqllSP48gSqFx8F1fPEQJDIEm6PlYKfxlX+BLxsmnBTBSJX
         Iapg==
X-Gm-Message-State: ACrzQf39Vhxi2Pv+wLdJyToKeSYyK7ifQsENaS0V678Ds9ibuLx/r1eo
        9NWwB/PBca2x4UdTKqauIHLI4g==
X-Google-Smtp-Source: AMsMyM732ZUNotQGUDNxF21frMfuDbk4ozqj74BrluY9t9deQILNLqwUs1Z8aYhVn5H+pf9gPFRwtg==
X-Received: by 2002:a2e:a4d3:0:b0:26a:cc7d:d50b with SMTP id p19-20020a2ea4d3000000b0026acc7dd50bmr9336996ljm.77.1663760792217;
        Wed, 21 Sep 2022 04:46:32 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:31 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] rtc: isl12022: stop using deprecated devm_rtc_device_register()
Date:   Wed, 21 Sep 2022 13:46:16 +0200
Message-Id: <20220921114624.3250848-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
 <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

