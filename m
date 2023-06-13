Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F3472E3A7
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 15:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242481AbjFMNBQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 09:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242339AbjFMNBN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 09:01:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42E81984
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so6390895e87.2
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686661270; x=1689253270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3seTEyzOFrrpdej6mUJHYVSg+iFFYvDZ8cnJx/G6/U=;
        b=Zxtr6S2z8XnVFD+tHbZOvxufbCCSddA+s67PIqPl4nvDcX65ZbN5o6gRuKwlESRGgg
         wC5+5hV4vam4CRDExDKeXyS06KbNHrxKZT+ymr3JeIdrNN9YIm8f1yHMLgoziQw4G5GA
         NOUSzJUMQ8QxagoMUV9PGBdMc4/tAtjTtB95o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661270; x=1689253270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3seTEyzOFrrpdej6mUJHYVSg+iFFYvDZ8cnJx/G6/U=;
        b=hQoDqGt/CKy3komWDxIdt6d6Rm1OGSM8yCOCSNsQAaG9Nj/EnnFlLUPWWigw1+q3BK
         yAbRp8EUvOvAwG0A+JnRlcHVutNCJF8dp/tjQd4I9qpfkL+ZmWw3FIwNR+hzXFq/bcEs
         QhA5WGdjTWXIEvOyyc9aI00O67h/XzGbMMs3/5M0nxt2E/+Th/9iBcOqlUjMH1EvvmVx
         EaGJy3+KbRI5HnVL6Ae8LPtk+IZ9KJjFYig2+v/AcPIGhMpigAA1QvKbxeaDXjLbhyJ4
         lJ+A4WJ7IOsfz1zxE6W4spfbR2y+xkDeUuXIUljNdUoUKHWK3Qf74WMqEC029iASgjyy
         wKOA==
X-Gm-Message-State: AC+VfDzYt9TQnc/EEEqKuZvEhVzxlNJ1fedY35f8n2muB+GCyOPuhOr8
        t1s4vkGcx/YNg3M9I6rMuLW9Pg==
X-Google-Smtp-Source: ACHHUZ5twKtKIVlNkJT9JxfuIWO/YxGEOrKBuQ/ntfmmb0TcwAmLnL3WJAyevIDiQyRuw9x5R01wRw==
X-Received: by 2002:a05:6512:32ad:b0:4f4:b3a6:4140 with SMTP id q13-20020a05651232ad00b004f4b3a64140mr4935980lfe.42.1686661269606;
        Tue, 13 Jun 2023 06:01:09 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id u24-20020ac243d8000000b004f14ae5ded8sm1793786lfl.28.2023.06.13.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 06:01:09 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] rtc: isl12022: trigger battery level detection during probe
Date:   Tue, 13 Jun 2023 15:00:08 +0200
Message-Id: <20230613130011.305589-7-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230613130011.305589-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since the meaning of the SR_LBAT85 and SR_LBAT75 bits are different in
battery backup mode, they may very well be set after power on, and
stay set for up to a minute (i.e. until the battery detection in VDD
mode happens when the seconds counter hits 59). This would mean that
userspace doing a ioctl(RTC_VL_READ) early on could get a false
positive.

The battery level detection can also be triggered by explicitly
writing a 1 to the TSE bit in the BETA register. Do that once during
boot. Empirically, this does not immediately update the bits in
the status register (i.e., an immediate read of SR after this write
can still show stale values), but the update is done after a few
milliseconds, so certainly before the RTC device gets registered and
userspace has a chance of doing the ioctl() on this device.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index bf0d65643897..44603169e575 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -268,6 +268,16 @@ static void isl12022_set_trip_levels(struct device *dev)
 	ret = regmap_update_bits(regmap, ISL12022_REG_PWR_VBAT, mask, val);
 	if (ret)
 		dev_warn(dev, "unable to set battery alarm levels: %d\n", ret);
+
+	/*
+	 * Force a write of the TSE bit in the BETA register, in order
+	 * to trigger an update of the LBAT75 and LBAT85 bits in the
+	 * status register. In battery backup mode, those bits have
+	 * another meaning, so without this, they may contain stale
+	 * values for up to a minute after power-on.
+	 */
+	regmap_write_bits(regmap, ISL12022_REG_BETA,
+			  ISL12022_BETA_TSE, ISL12022_BETA_TSE);
 }
 
 static int isl12022_probe(struct i2c_client *client)
-- 
2.37.2

