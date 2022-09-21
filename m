Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31E845BFD35
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiIULq4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiIULqo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:46:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531BA93213
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:35 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a14so6650776ljj.8
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mD9phxocXdXyOqXWSnmMDQ/BNPyFycCPprwFbHh4Wp4=;
        b=KwuINMx+JpKTHKMPBgstiZdj3zgwHsg3WUjCFrqyrMvHRBB/ecHcVilqlgy7wen8VR
         mUI2ZYRFrFxj/NSdmcljTzt/DEYtuR23a8V3wvjFlkyI5UFkyx+TRbecubLQxaWFg1bn
         mBZNESVeVaJLBBRnF+LccgjuRtBAmXbPxmY/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mD9phxocXdXyOqXWSnmMDQ/BNPyFycCPprwFbHh4Wp4=;
        b=n9JoT4nY7f5n1TvbKuJqe5BSRDLUol1Uk/Iew/B5Z1HKKDKDLRIO5IqBh2IDl0lyfZ
         JcTIkZIVJWRYFbkf1815HNlj83ZvSkEbqlnF+NkXJ6FwagdKRrOLKNmw5Ap0jM5Mke+N
         whKFrTR6XcIItqNsU3LZ3h6dN456dR4D9xPIhGWJcYv79T5qnz4boMm1sMK3FbodSOdc
         LbnaHyrkGGIekucXl9XoeuMOUG5S/QeZKlYZkhqUQ2QyGYRAwDFIH9dNTXf0NmmmVc1b
         DiLN1sbWHCBQHLxGn4fYBxqSYzYCSuWtSbpiU2sox2BDpk3rogHQoWBuB1oixOI8zNQh
         SwiQ==
X-Gm-Message-State: ACrzQf2l15Enguf4Y9UlnQQS4dZABajUBC7ItVfDo3iFKucs3mwlNGRX
        iCmCJl6BcxRlYFrHwfCI7O6Kfg==
X-Google-Smtp-Source: AMsMyM78B2H20doAj1jTsRpSbKiXOoKQ+iq2H6mux7sSC15WXXOoAKpz3lUE8Kh4w8Zu0IZUjI0Obg==
X-Received: by 2002:a2e:bd0e:0:b0:268:c03b:cf56 with SMTP id n14-20020a2ebd0e000000b00268c03bcf56mr9196763ljq.393.1663760793627;
        Wed, 21 Sep 2022 04:46:33 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:33 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] rtc: isl12022: specify range_min and range_max
Date:   Wed, 21 Sep 2022 13:46:17 +0200
Message-Id: <20220921114624.3250848-3-linux@rasmusvillemoes.dk>
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

The isl12022 can (only) keep track of times in the range
2000-2099. The data sheet says

  The calendar registers track date, month, year, and day of the week
  and are accurate through 2099, with automatic leap year correction.

The lower bound of 2000 is obtained by simply observing that its YR
register only counts from 00 through 99.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 2dc19061cf5f..3bc197f5548f 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -251,6 +251,8 @@ static int isl12022_probe(struct i2c_client *client)
 		return PTR_ERR(isl12022->rtc);
 
 	isl12022->rtc->ops = &isl12022_rtc_ops;
+	isl12022->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	isl12022->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	return devm_rtc_register_device(isl12022->rtc);
 }
-- 
2.37.2

