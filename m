Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248752AC0F5
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbgKIQeY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730283AbgKIQeY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:24 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805BAC0613D4
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:22 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v5so8549104wmh.1
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sCBx5P4x9rsdjCTStj4VjxS9NnyX/fUaX55XeqTCsr4=;
        b=f18F3y4ZFd7a+kbC/pvw/iBUO+dmjgbMu/qKbKXUMKIebhsTGRS/ueSZlhhyzceKze
         j6qU+r12PzDSaShQty0j52ufhh0srRNyjnVKG01K6iyOIX9MyZyaMv+DuPYdNtPomJT9
         7xnw/lwPLG3X9ktt1D8vul00D/nZRfJ2xgXjZGmgPlB7AF7/GAKAbVE/BEhVgKSYZuKA
         t67t2bx0cXevHHyWL/NdMGVjXhIeRJqtTx7U1QmlS0eEEe+xtw4F+dRLPdMg3wFmd+rv
         OGjElzArFX6bL/w2qTOjMoALgm2lU0OsCkctm80wpsHJ96WdHdcK8M722n3nEZPxY9w1
         gS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sCBx5P4x9rsdjCTStj4VjxS9NnyX/fUaX55XeqTCsr4=;
        b=L0MtM+UOQFR7r9LSDGX2HJBYDXJ1bl0jMX9Dkevj+YQXR2tn+KHQO655CRzQWNlaIZ
         F17AP7MKkXkN7CHpHfdd8oivfe+X70LiCPNsbex2DCEgGn5S6OTTiS2Es2y2IueDZgqq
         HbUnDg1S21mlUXE+GFV0WQd3h41vqWnCYrARHvu3ftP0IezkTRd+jksajdkgyfZoYf5D
         CGlhNTsEh6wT56oro6aPPTN31OxYOs0q3Xk2WtQ6mips+ntN3qQ4g1kOMc+whFzNUvju
         hlVFqIv07qPEcPw4XHpZMkrLgfY9xLSyKr8BNBYL8b668nv86BwXFoLs9cd60LbrkRrB
         mEKg==
X-Gm-Message-State: AOAM530rPaI2rJezibwWFxQooUI/0uIzpdAZAubnaJ3CTEn4Ew7o6rkA
        +2dFWDpAz9s9LPCP6uZ9tZbJMQ==
X-Google-Smtp-Source: ABdhPJw/x1QKb7u9D6gvYCwuy76XWLtlh/IAaghGLlqtPSbueAbbPw4ze7FRUXBH+iDRqYmsoZnpIA==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr9064wme.66.1604939661316;
        Mon, 09 Nov 2020 08:34:21 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/8] Revert "rtc: sc27xx: Always read normal alarm when registering RTC device"
Date:   Mon,  9 Nov 2020 17:34:03 +0100
Message-Id: <20201109163409.24301-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This reverts commit 3822d1bb0df18aa28930f19bc46e0704aea1be0f.

The registered field in struct rtc_device is not supposed to be used by
drivers and is going to be removed soon. In this function it will be
always 0 so the check is useless anyway.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-sc27xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 36810dd40cd3..8e3d6be990c5 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -415,14 +415,10 @@ static int sprd_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	u32 val;
 
 	/*
-	 * Before RTC device is registered, it will check to see if there is an
-	 * alarm already set in RTC hardware, and we always read the normal
-	 * alarm at this time.
-	 *
-	 * Or if aie_timer is enabled, we should get the normal alarm time.
+	 * If aie_timer is enabled, we should get the normal alarm time.
 	 * Otherwise we should get auxiliary alarm time.
 	 */
-	if (rtc->rtc && rtc->rtc->registered && rtc->rtc->aie_timer.enabled == 0)
+	if (rtc->rtc && rtc->rtc->aie_timer.enabled == 0)
 		return sprd_rtc_read_aux_alarm(dev, alrm);
 
 	ret = sprd_rtc_get_secs(rtc, SPRD_RTC_ALARM, &secs);
-- 
2.29.1

