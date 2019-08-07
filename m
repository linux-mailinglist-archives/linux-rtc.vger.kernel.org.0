Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE00B8470A
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Aug 2019 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387521AbfHGIXV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Aug 2019 04:23:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35812 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387498AbfHGIXU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Aug 2019 04:23:20 -0400
Received: by mail-pl1-f193.google.com with SMTP id w24so39633540plp.2;
        Wed, 07 Aug 2019 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kyChUZTxJ04dQ6W7AFNvGVPrgZSmkOSamFppYF2sKlQ=;
        b=va83T/fR5DeQzxnDrPIhn/Wqu4brcDIpmuElsedxn4N4LkWtaYiYzESaSZ3shnNKSY
         s/MJS0E0U4qXPykgLS3AsoiukMjmHG3NKZUFuk83zofdpxZMCm7pq8ZbYhVEWsks1Y1D
         9c+hIFIN5tQ457it494fO5Il9VWhTTRNnwBs705GPzguHs8ykZi7DFCdFRrE97JUuRXM
         pAbGcTtdWfVjqE6+TNtWSpAfX9xJpf461LoiHB2kB6BO0odv61gtV+KoxfZJhITAct17
         cLq2dMqsGCHY33gr9IJHrNebMheULSxjmQUwAJKTpzCsuPVkcbmRfqmy5tvKNSY6hTgc
         Mb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kyChUZTxJ04dQ6W7AFNvGVPrgZSmkOSamFppYF2sKlQ=;
        b=fqqdsDYw4YecBaaN78RJX1Uzml369g/HSapjVvAZCPIh+FfG/yHNW9QjrGL60ll6Dn
         ZjeHo2EUash8sVjDLEXok+n3JaazYIsqmTCDPC3jCnMTAtlpFjeOI6uy+J5OgjGO1PPT
         WdXOcmjmXS0mkMLw+xLAPlp31JmbkFy3XQ/77V7chAa5pee0KGlJAKMqZzkl7wHDN46w
         FrCtCNdBRLIOu2uLdCyk9aN5DRvgyaDjzvTitpNRPRF6Xkrh93bZrCKBHpvhmIyQMaUC
         H7KVlkwJnyjw0Od/IaYPLmo7PSsJONF52V1Jrf1pRw0xwyrhzZSHyfdtQpspJXKDIspt
         x+xw==
X-Gm-Message-State: APjAAAXrTNIr0APXN9IQYSmQEapUNZ8W6Tx810gJo1e6IInU2h84HV/s
        KIZxltik5foDQhQQWXV9GB8=
X-Google-Smtp-Source: APXvYqzSzQt+hVXfa+1nixNyhlwvgsnU4jzaHhSQFnA50JFdEuPPXu6przPhEzPRXZv8fftLLo2fjA==
X-Received: by 2002:a17:902:449:: with SMTP id 67mr7251593ple.105.1565166200127;
        Wed, 07 Aug 2019 01:23:20 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id h14sm117703513pfq.22.2019.08.07.01.23.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 01:23:19 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH] rtc: mxc: use spin_lock_irqsave instead of spin_lock_irq in IRQ context
Date:   Wed,  7 Aug 2019 16:23:10 +0800
Message-Id: <20190807082310.10135-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As spin_unlock_irq will enable interrupts.
mxc_rtc_irq_enable is called from interrupt handler mxc_rtc_interrupt.
Interrupts are enabled in interrupt handler.
Use spin_lock_irqsave/spin_unlock_irqrestore instead of spin_(un)lock_irq
in IRQ context to avoid this.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/rtc/rtc-mxc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index e697e96612bb..902d57dcd0d4 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -184,8 +184,9 @@ static void mxc_rtc_irq_enable(struct device *dev, unsigned int bit,
 	struct rtc_plat_data *pdata = dev_get_drvdata(dev);
 	void __iomem *ioaddr = pdata->ioaddr;
 	u32 reg;
+	unsigned long flags;
 
-	spin_lock_irq(&pdata->rtc->irq_lock);
+	spin_lock_irqsave(&pdata->rtc->irq_lock, flags);
 	reg = readw(ioaddr + RTC_RTCIENR);
 
 	if (enabled)
@@ -194,7 +195,7 @@ static void mxc_rtc_irq_enable(struct device *dev, unsigned int bit,
 		reg &= ~bit;
 
 	writew(reg, ioaddr + RTC_RTCIENR);
-	spin_unlock_irq(&pdata->rtc->irq_lock);
+	spin_unlock_irqrestore(&pdata->rtc->irq_lock, flags);
 }
 
 /* This function is the RTC interrupt service routine. */
-- 
2.11.0

