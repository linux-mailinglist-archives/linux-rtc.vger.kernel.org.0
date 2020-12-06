Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2078B2D078C
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgLFWH1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:27 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60528 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgLFWHX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:23 -0500
Message-Id: <20201206220541.709243630@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=bD9bw0D11XgqihIRDRw0qluLG8BFd4qWpkHD2wCIgH4=;
        b=oYUGknIxhHdMx8S22dMpQixuQaX3jleXl1mMJizW/dayJDPQmx75IREzue1yA/Zm1BY6I+
        vc164fTNhbTOg9biStkRvh0mu+6xTdyw6tj04MGXtTdPJQrSwbL3MIScOA1xY1yNdktjVr
        x8ToLdYMWF1p91gmhjEJwfWP70oylymWFNLw4kobOAVfE8hDvFBwyavHmDItb4TjRQNf0r
        YLY2OBMcaai3Zpf38mrnq1uSSJE4lisjxtrw/9v2v8xExACx6xuUtSZlilfwOjbaFAg5rQ
        wP5s8Rp8iSOUm8TrKRcIbzYo1S155I/Vb2EJIc3ApPNPirf372wWsU6XXUyxWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=bD9bw0D11XgqihIRDRw0qluLG8BFd4qWpkHD2wCIgH4=;
        b=1shbh9jEbHxUule6IcsXVqCvtVXTzlf08fBsx0pKZ0wFpH5/8xFzqHplu/v0pbCa5z58CZ
        y+eRACd8Jf0o7pBw==
Date:   Sun, 06 Dec 2020 22:46:15 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 2/8] rtc: mc146818: Reduce spinlock section in mc146818_set_time()
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

No need to hold the lock and disable interrupts for doing math.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/rtc-mc146818-lib.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -135,7 +135,6 @@ int mc146818_set_time(struct rtc_time *t
 	if (yrs > 255)	/* They are unsigned */
 		return -EINVAL;
 
-	spin_lock_irqsave(&rtc_lock, flags);
 #ifdef CONFIG_MACH_DECSTATION
 	real_yrs = yrs;
 	leap_yr = ((!((yrs + 1900) % 4) && ((yrs + 1900) % 100)) ||
@@ -164,10 +163,8 @@ int mc146818_set_time(struct rtc_time *t
 	/* These limits and adjustments are independent of
 	 * whether the chip is in binary mode or not.
 	 */
-	if (yrs > 169) {
-		spin_unlock_irqrestore(&rtc_lock, flags);
+	if (yrs > 169)
 		return -EINVAL;
-	}
 
 	if (yrs >= 100)
 		yrs -= 100;
@@ -183,6 +180,7 @@ int mc146818_set_time(struct rtc_time *t
 		century = bin2bcd(century);
 	}
 
+	spin_lock_irqsave(&rtc_lock, flags);
 	save_control = CMOS_READ(RTC_CONTROL);
 	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);

