Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50E94827D6
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Jan 2022 16:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiAAPmm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Jan 2022 10:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiAAPmm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 Jan 2022 10:42:42 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56C2C061574
        for <linux-rtc@vger.kernel.org>; Sat,  1 Jan 2022 07:42:41 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso16076684wmk.4
        for <linux-rtc@vger.kernel.org>; Sat, 01 Jan 2022 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mimaa3xxwrXFPKQWSeurtx3y4r/WnkNlgXPr8Q0N/24=;
        b=m2rSVbpCp6Ljua4eb8BsntnKEWL/2SeM4vQQMjGQs262fxamz1Z4xSPaO9XGixL3df
         hBy08EAD8kw5dOzLRuPee2rzU+Azrh3VjjOj4Uje8imTRhCN1MhqP9UyPa9/WXbYXYXa
         U718JkfKi6xtCIzUR/DlDeOkZn2faBzQDZ2iZod8mOhCmQpcmy1659ESEEn/tvObe/Gm
         /bLBMRD+r5oJNkf9wtrQ9xhRePfbIiZq6oCaRs16ZpyjfIPUIrS1LSCNSH3YWsVFq686
         mHbseTJZfvO3Y4Z7js4xhIf+WyGqZ8XFgcdK8NLZ+jaPqDVH5XdHT6llNu25YE/8DZh/
         g24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mimaa3xxwrXFPKQWSeurtx3y4r/WnkNlgXPr8Q0N/24=;
        b=NP/WaN1drANceSZM+AJxVFzy7biQPHMp9GVfxeHbFOQp7HFIsTUurWVWcKWWsebYwV
         RvlEoWOhPxZpvUaEz6fMn4h1400QVbU44NkHBn3qR4Ij8oNjK4LzYO1kEuOgTZbx/FDE
         RtWjuVJC/iCqbwn4oxUeh7mfjn458WjvRgxDiHFQEvtbZ08SoTr43L2hKZPHlgxK7fpA
         U3zfT9t5uKo9XyCbSOJfRGX8cMZMSSoYdeX1+wOtktOS/EMxW3PofTf29riXG2zZnKJ+
         GTOcg0EvHBqIztQaV0YB/R3KrKOdUGPicnKI42Y/ygXvO6gG1tUhLBFDHt3GtSL5WTvO
         Fgng==
X-Gm-Message-State: AOAM5302EilBmRjpC9eBUha/z6NqUWUug9iJZ0PB223aLOE4zKYhQjNI
        eymFoFx0gG07nCV/M36kALliMDZTazY=
X-Google-Smtp-Source: ABdhPJyZEC6dHiBHp/VxLQE3k8sPLyiRV0A9bnarvU3aYGTXwXnGH+tuETuY2x3TQXsyIOPz0H2OXA==
X-Received: by 2002:a05:600c:4f91:: with SMTP id n17mr30077927wmq.195.1641051759842;
        Sat, 01 Jan 2022 07:42:39 -0800 (PST)
Received: from voidz-builder.home ([2a00:23c8:1808:7100:bf83:f058:18b2:3b92])
        by smtp.gmail.com with ESMTPSA id z11sm36361107wmf.9.2022.01.01.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 07:42:39 -0800 (PST)
From:   Laurence de Bruxelles <lfdebrux@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>, linux-rtc@vger.kernel.org,
        Laurence de Bruxelles <lfdebrux@gmail.com>
Subject: [PATCH] rtc: pxa: fix null pointer dereference
Date:   Sat,  1 Jan 2022 15:41:49 +0000
Message-Id: <20220101154149.12026-1-lfdebrux@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

With the latest stable kernel versions the rtc on the PXA based
Zaurus does not work, when booting I see the following kernel messages:

pxa-rtc pxa-rtc: failed to find rtc clock source
pxa-rtc pxa-rtc: Unable to init SA1100 RTC sub-device
pxa-rtc: probe of pxa-rtc failed with error -2
hctosys: unable to open rtc device (rtc0)

I think this is because commit f2997775b111 ("rtc: sa1100: fix possible
race condition") moved the allocation of the rtc_device struct out of
sa1100_rtc_init and into sa1100_rtc_probe. This means that pxa_rtc_probe
also needs to do allocation for the rtc_device struct, otherwise
sa1100_rtc_init will try to dereference a null pointer. This patch adds
that allocation by copying how sa1100_rtc_probe in
drivers/rtc/rtc-sa1100.c does it; after the IRQs are set up a managed
rtc_device is allocated.

I've tested this patch with `qemu-system-arm -machine akita` and with a
real Zaurus SL-C1000 applied to 4.19, 5.4, and 5.10.

Signed-off-by: Laurence de Bruxelles <lfdebrux@gmail.com>
Fixes: f2997775b111 ("rtc: sa1100: fix possible race condition")
---
 drivers/rtc/rtc-pxa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index d2f1d8f754bf..cf8119b6d320 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -330,6 +330,10 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	if (sa1100_rtc->irq_alarm < 0)
 		return -ENXIO;
 
+	sa1100_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(sa1100_rtc->rtc))
+		return PTR_ERR(sa1100_rtc->rtc);
+
 	pxa_rtc->base = devm_ioremap(dev, pxa_rtc->ress->start,
 				resource_size(pxa_rtc->ress));
 	if (!pxa_rtc->base) {
-- 
2.34.1

