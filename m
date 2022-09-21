Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82BF5BFD34
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiIULqz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiIULqi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:46:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DE290823
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:36 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s10so6664703ljp.5
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EAInJKBXs0Zsg9lyW67Me/bO0k2ovFhxbq0RK9ZHPG4=;
        b=U7k4PDrgtnD9mkByXaU59dw5vZ+z0ZwXtpyveeaxMMTSRSxNMggNXjcm+8Fo1D46Rr
         fhL8taymIW+fMj/jSCEK3zZL9JHZgVjt5951E8x5y/7bBUddH4DqpA+KDctfv8WI541i
         CuIR69fv0bHqjnhvbCU4wvRGM+EILuMLjQM6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EAInJKBXs0Zsg9lyW67Me/bO0k2ovFhxbq0RK9ZHPG4=;
        b=LZY+pwx+3NLDz2HyW5U6gMCEU/TnC9Szr7xYCyZYJq+qMnHVfMndb2+rwNa24kTWCN
         sO/3okak2e8N9OFWB5QtIpyiYkapRekevdAHwtFN3cPolfY0FeWyYANP0XmuOS+z8PER
         wPY2Pxt9PL/XgKphodPPcEoE1kG1f4f7zNUuo31DCqA0r+YNROs8FbzOW6x7DS2amBsm
         RmkVkiRWki9CWMYpBYfQ5y8HWyl4EekCjQ1sbDHKfJquGksNKobHpiwT84KX1sOfGsK8
         iFG6SdZFr4OTLZfJHPDzbbA2vkbPXvYAh8S4JjUzMHqu8AsG8QGwfox7Doagt32ElXKL
         k3YA==
X-Gm-Message-State: ACrzQf1diUWydIMeOohSX1rOwmPEXb+dlHmPE3VrFpc2uGfaer3sxsL5
        P0Pl/z7z0omnWdY3LpJj7J0CBw==
X-Google-Smtp-Source: AMsMyM6Gy2DAbTMhuH8lK+D5wVaE/ThDFhiOEHUDKjfxL28TzzZNc0tXIXUK+Qqi7q1y5LWnSEqPSQ==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id o10-20020a2e944a000000b0024f10bdb7e8mr9295233ljh.238.1663760794828;
        Wed, 21 Sep 2022 04:46:34 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:34 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] rtc: isl12022: drop a dev_info()
Date:   Wed, 21 Sep 2022 13:46:18 +0200
Message-Id: <20220921114624.3250848-4-linux@rasmusvillemoes.dk>
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

This dev_info() seems to be a debug leftover, and it would only get
printed once (or, once per battery change).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 3bc197f5548f..2fc9fbefc6fc 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -173,9 +173,6 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Check if WRTC (write rtc enable) is set factory default is
 		 * 0 (not set) */
 		if (!(buf[0] & ISL12022_INT_WRTC)) {
-			dev_info(&client->dev,
-				 "init write enable and 24 hour format\n");
-
 			/* Set the write enable bit. */
 			ret = isl12022_write_reg(client,
 						 ISL12022_REG_INT,
-- 
2.37.2

