Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABC34B9C1C
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Feb 2022 10:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238731AbiBQJgi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Feb 2022 04:36:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiBQJgh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Feb 2022 04:36:37 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48922A9729
        for <linux-rtc@vger.kernel.org>; Thu, 17 Feb 2022 01:36:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso5685341wme.5
        for <linux-rtc@vger.kernel.org>; Thu, 17 Feb 2022 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=AmuoagR8d72fxzTFDWq1k3Dy6ippQzMWPGy4rTXvpGc=;
        b=N8dgRZZD1vxUi7HrfazwxNGHReINa2A2oeLcN6YFAISOYCj+uaToztS9I7dl9dtenF
         cQ5CkVyUhxx8ZCx/+7sTOXBQJSu6A3+4nikZ3FTxFETPE+B2mP+P3wean5sKFJGSRiiV
         kTNixzgjgGmnWhCDzN5NkfF/yaeGXwLqF0MAKTOaMFRYLj4CWMDIbM8p9Nz5zoWuUNpJ
         YCQfqukUPVqi/z3nTyaNCTwY5GDzI6zpuEb4KN2j3A4ut3kKAX4ZWWNHoAOtNvuVe1mK
         WOIqziEY1NC8AGHygqQY7ffkOUwWkdUXYuIIxlYM/NlGPkem/fNjSYpsmu0hR8lH1s+U
         iW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AmuoagR8d72fxzTFDWq1k3Dy6ippQzMWPGy4rTXvpGc=;
        b=TAuRcr6fYKR5m3LB7H4ZquXfxHR2AkkF3uAI54VqdyuJnqE5G58xw2Z7fCVufdi1fy
         VjuMr4VOp9YLhYyW6TuWTJevoBnSCT4taetTb+IgJ+aCVbt6XvzxZz9/cAC9wnvmSeWf
         51Ts7bq3bxikVdZx4IFQ2Laf6ZeXeadZagGiKcSxlHZQoTylQSFAnUKkRgBddfuFgoIX
         6oVEowYAqk44YnKi4+uhl6DrJVXlCh3+2Wku7sCw5Xv7OTnEDWEfLTx5dhy5xh718GRz
         DvMVuGd0YcJ3WM4wii/3sv8FrmJiFn5L/RDkutwnaOZVtRhsfFlLK5h8tMkOobtMgOT2
         osAA==
X-Gm-Message-State: AOAM533FKHG/vcMnsPniJi1GUDESfC9N3/B1+EoH8bxgMcFQ/szR4YFQ
        Shq9O4UU6Hg1R+LK2lrjyhGz0A==
X-Google-Smtp-Source: ABdhPJzq1xgKQUvQdkFXIK63tlTrdFYsRxSDewqkb8ZODggb6GHx3eaS91ODPPb84STP3j72jnjdZg==
X-Received: by 2002:a05:600c:2d02:b0:37b:c7a1:909c with SMTP id x2-20020a05600c2d0200b0037bc7a1909cmr1905445wmf.47.1645090580771;
        Thu, 17 Feb 2022 01:36:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id az13sm18162995wrb.39.2022.02.17.01.36.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Feb 2022 01:36:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] rtc: pm8xxx: Return -ENODEV if set_time disallowed
Date:   Thu, 17 Feb 2022 10:36:18 +0100
Message-Id: <1645090578-20734-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Having !allow_set_time is equivalent to non-implemented set_time
function, which is normally represented with -ENODEV error in RTC
subsystem.

Today we are returning -EACCES error code, which is not considered
by RTC clients as a 'non implemented' feature, and which causes NTP
to retry hw clk sync (update_rtc) indefinitely.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/rtc/rtc-pm8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 75954dd..dc6d147 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -84,7 +84,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 
 	if (!rtc_dd->allow_set_time)
-		return -EACCES;
+		return -ENODEV;
 
 	secs = rtc_tm_to_time64(tm);
 
-- 
2.7.4

