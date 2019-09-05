Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B8CA9B0B
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 09:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731161AbfIEHEc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 03:04:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44251 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730939AbfIEHEb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Sep 2019 03:04:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so1089340pfn.11
        for <linux-rtc@vger.kernel.org>; Thu, 05 Sep 2019 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Jk8OtQyC7ASzQuT3gwno2aJBZd/Wr2XR1pUFK3wHd3w=;
        b=EwzpcT2kLlxQ63gQwptMLqydZC7lBG4Rs8vCHXv0O4fSZU/tqtwApoCrOkVT21++jA
         Y0hBE6HG6snXmASCYmt24V3txbhIFoqPlY3Acnq3VVGLKHaG12an/T9lA1knMXVehnGV
         wKVUzEbL0hy9iG5uOAVVjibuH7tPg/L6ZuodlzDtj8RrrP1umaPZlHmUQhDKuYuvR/3a
         j6dn28jVUUJlAbc/6X1xLzC41kuAAEn4KrKJRacx0USPZvVnoXhBy2QHniidYNBv3F+x
         gNcb5IIyawkcOMXeHbCLoICDtOfOBC67G4ClWViR9RIVYsTq3HV3QubJw0u4tb80twi6
         7SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jk8OtQyC7ASzQuT3gwno2aJBZd/Wr2XR1pUFK3wHd3w=;
        b=k65ENBPFFuguN5jvwjjc1DbTpI+GlEWxmGI+rJc7hAhPwbUgZDa+I0KMXhkYHMAWIm
         Oy4YKTifqgF3SyHZD/G15Wj7+tpxtzMU23fA2dFHfL370IPzSLdyYxwLwvRRZMdnrWST
         in57wDMk9Cz9iExbfbzXoiGR0WvRlFzSR3T0nOcowKTMIot7Q3U+cvwIqQYTJvEQjxvm
         zBnzDHqOuu3ADCRh9SIakniNqfXS3HbsVjOIwH3yKdMa/cOMXJDa57BV7IideQOQSHM5
         q8H+N4knZK+r1Yxb1dFf0tQ/jpEFORgnuZ2ZFe+O2lRLLoFjzP5aDCP7YjwvkrpbjQ/7
         vhXQ==
X-Gm-Message-State: APjAAAUVsH9zl3cVrywDoENqlwcj0kh3KGK5QXWJpejiseWxtDjlrEdz
        qORLB4eryW795sr6Ewv8aBy6B9u0FU+OVw==
X-Google-Smtp-Source: APXvYqyyioWj/opXO19pgiufG8XN2Gni+a7Tmlkk88KRfLt5o1cTywDMzRT7jjvAkDCwZzV2w3Elng==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr1713158pgi.377.1567667070935;
        Thu, 05 Sep 2019 00:04:30 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id e129sm1014471pfa.92.2019.09.05.00.04.28
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Sep 2019 00:04:30 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        baolin.wang@linaro.org
Subject: [PATCH] rtc: sc27xx: Remove clearing SPRD_RTC_POWEROFF_ALM_FLAG flag
Date:   Thu,  5 Sep 2019 15:03:30 +0800
Message-Id: <1f75310242de75b14d8973538bf96efffb395daf.1567666894.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The SPRD_RTC_POWEROFF_ALM_FLAG flag is used to indicate if a poweroff alarm
is set, which can power on the system when system in power-off status.

And the bootloader will validate this flag to check if the booting mode is
alarm booting mode, thus we should not clear this flag in kernel, instead
bootloader will clear this flag after checking the booting mode.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/rtc/rtc-sc27xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index b4eb3b3..46646aa 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -138,7 +138,7 @@ static int sprd_rtc_lock_alarm(struct sprd_rtc *rtc, bool lock)
 	if (ret)
 		return ret;
 
-	val &= ~(SPRD_RTC_ALMLOCK_MASK | SPRD_RTC_POWEROFF_ALM_FLAG);
+	val &= ~SPRD_RTC_ALMLOCK_MASK;
 	if (lock)
 		val |= SPRD_RTC_ALM_LOCK;
 	else
-- 
1.7.9.5

