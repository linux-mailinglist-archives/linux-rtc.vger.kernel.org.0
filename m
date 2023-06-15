Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B767315F0
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jun 2023 12:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343840AbjFOK7J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Jun 2023 06:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241507AbjFOK6z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Jun 2023 06:58:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40774295B
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so2501109e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686826728; x=1689418728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6N4ojvwXgyqqnUo/wtTdbg/VBkKSYsLenHRuGk8XAM=;
        b=Rw5sSbfvjOx+S2rKxZwJjwADqE3HdGV7U3SRGxcQi45apK6bFKUzEgtmB5NwCcftep
         k4Xa4HGviEy7FndmC/dYBURZCl8nuKOxJnHh1e3Gr9kvwB0If82SSXyBHV98aMS/YcGv
         1XWU6Fz0nQHtjZK5jqrw4y4XnrvtXW7meYQcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686826728; x=1689418728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6N4ojvwXgyqqnUo/wtTdbg/VBkKSYsLenHRuGk8XAM=;
        b=HDCKzdgM1RJXo5zgVKjiMpp+vWcYJRLtVYRLUUlLS38H5dKxr5YqkOyuVmo6TrwDBO
         f97jmvWWoiom8hbQTFwC+CefT/OhWjPm9l06wRuQK8UGv+mb+pmr0XrB5n8JiQKcqK3w
         L2I8Vf3EUzBG4VaiysED8b7gK3IBx6UoNgsITKGiRd0ykcIGRZmrrT3h4p6b0q7HWqKG
         zYTwm7GxVC17VHeNmRRGdcUi8LfVjGn26uaepayPCfUGcSTdjNG8NtfX18hHrJ9nTLiW
         mJuIrM2BGtxTe+WFI9GlcFQ5vBCyrySCyz9TZO9XbZDmQEFlO5jyXB/e8SwB9HQwbYTP
         orog==
X-Gm-Message-State: AC+VfDyoHsOQ+2VrSGHuvERByYIgRLjPJEuVonX/aUIFZOWJ7Sa0Nmn+
        Z/y/jLXgzDFh5/R72eIHtUubJg==
X-Google-Smtp-Source: ACHHUZ7BeNID2yzxlZkWzwvz+EhuQh45YUNB0n+mUzuq6O1PUeD+FGtrkV2yRiz7A7m5tscCJmu/qA==
X-Received: by 2002:a05:6512:619:b0:4f8:48f3:f06 with SMTP id b25-20020a056512061900b004f848f30f06mr15465lfe.48.1686826728635;
        Thu, 15 Jun 2023 03:58:48 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm165364lfp.186.2023.06.15.03.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:58:43 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] rtc: isl12022: trigger battery level detection during probe
Date:   Thu, 15 Jun 2023 12:58:24 +0200
Message-Id: <20230615105826.411953-7-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230615105826.411953-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-1-linux@rasmusvillemoes.dk>
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
index a48456abdcb9..916879b0388c 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -272,6 +272,16 @@ static void isl12022_set_trip_levels(struct device *dev)
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

