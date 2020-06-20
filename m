Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0DF202378
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jun 2020 14:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgFTMDV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Jun 2020 08:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgFTMDU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Jun 2020 08:03:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD80C06174E
        for <linux-rtc@vger.kernel.org>; Sat, 20 Jun 2020 05:03:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a127so5752163pfa.12
        for <linux-rtc@vger.kernel.org>; Sat, 20 Jun 2020 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=MsJT1giwKfDljIh2trmC2PbJn45IBGXnR4Env34R1+U=;
        b=Qok74mrRsC5XUwKt3xodr/ZXmNCIN1dBUY5W1aYbw3QmbUB3xvcwOIg31kg3685RaC
         BbfjAqUcoDTgftk9YAXpWW51ldhNS+/y0f8eU/EzSmrLuw8x+9CyipLPlkQ0CezlzJ6G
         g1qxX40/ZCHjy6VjSBGXVaMZNjPz/ehmpHa2LC8vbXNiyH+78hBealZz/GeloSGqDLAP
         9ZUCzKH9j0DQRpog6dHoEzD+e7pmwVH9t0uNzOmWOO6Cy+SVB9+jjD4OyEzSH9RjUMDe
         /90ZC4tGHRRji8dC801bY2KI5m5NrKLYwT9iGRaoTE4+/Rzp/1AYIwQSogn6Nbk0hBgu
         agjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=MsJT1giwKfDljIh2trmC2PbJn45IBGXnR4Env34R1+U=;
        b=HGF+Logidva5n+ROvli2xxJin+1LH2k+moKklo0RfOsag8YfkOnhYnWHDIPAGmz7Jn
         rDIcueZHBsUL4u+O2pyVbtjDux833oumOk6Z7PEJTYBMvufsQwzfvkhS5T7EullkmTqO
         T/jKFgTTVju5WkccS/tdoNOHEa5ybH7rPgNQzZj9tISExGKlaTFhQps3C4MdEvXK0cJY
         i34RLAITdMXb+qP0cPIdnUCpcvnNGUXb9r30PVwC6EfxxmdwKJrkVzCb6/gbvooctu9m
         SmmYU845E6gnhmW3oC5zlRxYTnX9k4atNst4lvLYbz5p5Q5QkrCJmUt5cNnJd2StdznU
         97ZQ==
X-Gm-Message-State: AOAM532pga0EJdtzkChHbiJ4A0AoxrylRE+akD4FVloHahPx47aaDrg6
        VEBt4n7QzuEsO+3SOxiOBw4NRNxTav4tHg==
X-Google-Smtp-Source: ABdhPJzpIgtZl0rxKxahB11OicFlB/pq8JK8cdFPjTqRGZZ0HdkQsNaIgZ/FvH/yCiFJv2Hwki6LRg==
X-Received: by 2002:a63:e804:: with SMTP id s4mr6496970pgh.260.1592654599556;
        Sat, 20 Jun 2020 05:03:19 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id e12sm9099053pfj.137.2020.06.20.05.03.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Jun 2020 05:03:19 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Miodrag Dinic <miodrag.dinic@mips.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when necessary
Date:   Sat, 20 Jun 2020 20:04:43 +0800
Message-Id: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When use goldfish rtc, the "hwclock" command fails with "select() to
/dev/rtc to wait for clock tick timed out". This is because "hwclock"
need the set_alarm() hook to enable interrupt when alrm->enabled is
true. This operation is missing in goldfish rtc (but other rtc drivers,
such as cmos rtc, enable interrupt here), so add it.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/rtc/rtc-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index 1a3420e..d5083b0 100644
--- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -73,6 +73,7 @@ static int goldfish_rtc_set_alarm(struct device *dev,
 		rtc_alarm64 = rtc_tm_to_time64(&alrm->time) * NSEC_PER_SEC;
 		writel((rtc_alarm64 >> 32), base + TIMER_ALARM_HIGH);
 		writel(rtc_alarm64, base + TIMER_ALARM_LOW);
+		writel(1, base + TIMER_IRQ_ENABLED);
 	} else {
 		/*
 		 * if this function was called with enabled=0
-- 
2.7.0

