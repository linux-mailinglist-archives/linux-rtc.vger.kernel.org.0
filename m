Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC945A6035
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Aug 2022 12:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiH3KFP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Aug 2022 06:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiH3KEM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Aug 2022 06:04:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC38CE97C5
        for <linux-rtc@vger.kernel.org>; Tue, 30 Aug 2022 03:02:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j14so4459907lfu.4
        for <linux-rtc@vger.kernel.org>; Tue, 30 Aug 2022 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6fhUpiDdMZcWZUaWUbXbRb4sHeETmJADlLAQy+exeAY=;
        b=TtbwcO7ZGfsVk6bMaFJMErijlaX5Idim/xWNOHASzEAorJOT/8k+MskAxlbOrnJhAa
         1P/2sV6H89Ui31DqMnwuFzoPCakmj+lzT2p/86ZzVQp6OKEvIaDmC1t91MpN5bRZ48K3
         jHbDHUHes+9r6D3cP/+kRv+B040E895eeynIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6fhUpiDdMZcWZUaWUbXbRb4sHeETmJADlLAQy+exeAY=;
        b=wt/CBvGCTufnWOWfRMdivBg0QcnxhWpCZD88qTX99Q1y335dm94sF/XFm9TL9uXKPs
         TA9aumsDeiCPtbqDI/6xfxKZLAeGFLtIxh0RYL70XXuwKduCKtEIfrSnQifEu8cp+yiw
         sjhZ+kuEtAyME26qDocrlGmB4qCrHsv5CT8vT7L38hlJ9W03k3L5piE3qDGrW3VsboU5
         0XxwmgppVneRrZF5Qvfx2/f/HqvJqZkyuuxo4QA8g/nR1L0pGueUSdLKRtKr+0p9vo64
         e5ZsMpdRsxOQKZPHmyDfMDaM5teXqQ0SDeRtyz++EFXmwUVrI2yigApjEymw2sSJmrLh
         +cvQ==
X-Gm-Message-State: ACgBeo1xJ2hodGbhYKn+A9d2IxizoX72s0FLxTc3zEGrUuQH7l3dRB2G
        nQ4ox/vYmgs4bhW5Gl0UQKdocg==
X-Google-Smtp-Source: AA6agR76RHNe5vTDCC1ieI1IXnYKr9Y1BkvAhNx/kACuW8wWHNnKiExMD/KhSTrE6H30oFaTBnHmZQ==
X-Received: by 2002:a05:6512:3dac:b0:492:f042:a208 with SMTP id k44-20020a0565123dac00b00492f042a208mr7050360lfv.285.1661853726125;
        Tue, 30 Aug 2022 03:02:06 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b0048af6242892sm1573435lfg.14.2022.08.30.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:02:05 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] rtc: isl12022: drop redundant write to HR register
Date:   Tue, 30 Aug 2022 12:01:50 +0200
Message-Id: <20220830100152.698506-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There's nothing in the data sheet that says writing to one of the time
keeping registers is necessary to start the RTC. It does so at the
stop condition of the i2c transfer setting the WRTC bit:

  Upon initialization or power-up, the WRTC must be set to "1" to
  enable the RTC. Upon the completion of a valid write (STOP), the RTC
  starts counting.

Moreover, even if such a write to one of the timekeeping registers was
necessary, that's exactly what we do anyway just below when we
actually write the given struct rtc_time to the device.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 234201ea2f7d..659f8e7f33f0 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -173,7 +173,7 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Check if WRTC (write rtc enable) is set factory default is
 		 * 0 (not set) */
 		if (!(buf[0] & ISL12022_INT_WRTC)) {
-			dev_info(dev, "init write enable and 24 hour format\n");
+			dev_info(dev, "init write enable\n");
 
 			/* Set the write enable bit. */
 			ret = isl12022_write_reg(client,
@@ -181,20 +181,6 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 						 buf[0] | ISL12022_INT_WRTC);
 			if (ret)
 				return ret;
-
-			/* Write to any RTC register to start RTC, we use the
-			 * HR register, setting the MIL bit to use the 24 hour
-			 * format. */
-			ret = isl12022_read_regs(client, ISL12022_REG_HR,
-						 buf, 1);
-			if (ret)
-				return ret;
-
-			ret = isl12022_write_reg(client,
-						 ISL12022_REG_HR,
-						 buf[0] | ISL12022_HR_MIL);
-			if (ret)
-				return ret;
 		}
 
 		isl12022->write_enabled = true;
-- 
2.37.2

