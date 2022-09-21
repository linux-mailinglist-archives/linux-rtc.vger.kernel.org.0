Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F20B5BFD37
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIULrJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiIULqy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:46:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A1793200
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w8so8696983lft.12
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QO312a6i8/S0aAmV9/OT7vjMYqyfCVVJUdmei7UzN2U=;
        b=gKaCJJdnysMw/QnYhM4mDpp7ZBiEtYpfJD6Fm72t+uaTa/am/neW+LfJw41250lcFy
         F9DsW1UIpgYqQy0g2wicbjByKCtZV9h2/aI9r2c6eiidfxbYzujeeJkBwYIyfGq2rc//
         yjXEuiId3qfhhxJQMe0m/aLjkQ8bAZbiIIGOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QO312a6i8/S0aAmV9/OT7vjMYqyfCVVJUdmei7UzN2U=;
        b=pgIlt25j2CXCZV/90u8le9IWPoJCJCrM0NR3X3nZcsYCKNzhHu6jsTh3+BfZT6nXR3
         Po9n2z+92cBhUVQrDcJVfJUFRXlY7lzSX6l3g4zIuUlGmp1L5GZ7NCtC4mrAx1iu0+Zj
         6cLBlu9/4fLSfnF1Dce2PiQWBFoigwU8XdlWjj6tMxaVAciEgTq/l1wbQaPplvsU5O6s
         BqjBR49kWtllldg4P3nXDTYaADF/D6gyDmWJb+yrymllJ/9U4CQhXGsp/lPSabmqu9Qj
         sx683cyJo2i1dxG9mHpyKaRTyYEc10JV36mhZaAXc4uEp1TEieKGUO1y92Q9eMBqAHP+
         w1Qg==
X-Gm-Message-State: ACrzQf1sUyDVRt95IKxg2J0n3J8EHbZEg/9DeNh59yZQn7kBAdnJsfzo
        H9P4ExkgpC5WQ87jn6phmpdWXg==
X-Google-Smtp-Source: AMsMyM4ZCHEZvmafIThhaRckJxaQl9iR7FM4INrk8+otkBUCCz/oPbnh7t9S0ef70WsekBjEy4UuFw==
X-Received: by 2002:a05:6512:128d:b0:49f:4b31:90ed with SMTP id u13-20020a056512128d00b0049f4b3190edmr10352424lfs.118.1663760796100;
        Wed, 21 Sep 2022 04:46:36 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:35 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] rtc: isl12022: simplify some expressions
Date:   Wed, 21 Sep 2022 13:46:19 +0200
Message-Id: <20220921114624.3250848-5-linux@rasmusvillemoes.dk>
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

These instances of '&client->dev' might as well be spelled 'dev', since
'client' has been computed from 'dev' via 'client =
to_i2c_client(dev)'.

Later patches will get rid of that local variable 'client', so remove
these unnecessary references so those later patches become easier to
read.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 2fc9fbefc6fc..7efe23fa74df 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -112,13 +112,13 @@ static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return ret;
 
 	if (buf[ISL12022_REG_SR] & (ISL12022_SR_LBAT85 | ISL12022_SR_LBAT75)) {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "voltage dropped below %u%%, "
 			 "date and time is not reliable.\n",
 			 buf[ISL12022_REG_SR] & ISL12022_SR_LBAT85 ? 85 : 75);
 	}
 
-	dev_dbg(&client->dev,
+	dev_dbg(dev,
 		"%s: raw data is sec=%02x, min=%02x, hr=%02x, "
 		"mday=%02x, mon=%02x, year=%02x, wday=%02x, "
 		"sr=%02x, int=%02x",
@@ -141,7 +141,7 @@ static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_mon = bcd2bin(buf[ISL12022_REG_MO] & 0x1F) - 1;
 	tm->tm_year = bcd2bin(buf[ISL12022_REG_YR]) + 100;
 
-	dev_dbg(&client->dev, "%s: secs=%d, mins=%d, hours=%d, "
+	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
 		tm->tm_sec, tm->tm_min, tm->tm_hour,
@@ -158,7 +158,7 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	uint8_t buf[ISL12022_REG_DW + 1];
 
-	dev_dbg(&client->dev, "%s: secs=%d, mins=%d, hours=%d, "
+	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
 		tm->tm_sec, tm->tm_min, tm->tm_hour,
-- 
2.37.2

