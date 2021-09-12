Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350A1407D59
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Sep 2021 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbhILMpA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Sep 2021 08:45:00 -0400
Received: from mx-out.tlen.pl ([193.222.135.148]:44614 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235166AbhILMo7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 12 Sep 2021 08:44:59 -0400
Received: (wp-smtpd smtp.tlen.pl 10165 invoked from network); 12 Sep 2021 14:43:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1631450622; bh=+A8FuHHP1nSvfu/Go3umMKL2PE4clz97aaQH+nyexCY=;
          h=From:To:Cc:Subject;
          b=pUfgoh2oSRbaCT7f9FcaNmqrHAjobrirLNEdzfJWgazeH+Ft7rNROXRQ2oZFoUJA4
           JNFJja3CiFyKDsps2YH4kGn5qOKSNYD2IgKFAZ2qfO4gNkQS2LeQWyoyYtPaCSZfsU
           2SxzvwWw1f7CMcN8x4W5Fmoug8MWRURRtMT4jtik=
Received: from aafh223.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.137.223])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 12 Sep 2021 14:43:41 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH 7/7] Revert "rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ"
Date:   Sun, 12 Sep 2021 14:42:14 +0200
Message-Id: <20210912124214.81853-8-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124214.81853-1-mat.jonczyk@o2.pl>
References: <20210912124214.81853-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 55792f7d98831567ca942f991b8f353b
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [0RMB]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Revert
commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
and add a comment.

As described in a previous
commit 66e4f4a9cc38 ("rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()")
from February 2020:

        cmos_interrupt() isn't always called from hardirq context, so
        we must use spin_lock_irqsave() & co.

Indeed, cmos_interrupt() is called from cmos_check_wkalrm(), which is
called from cmos_resume() - apparently not in an interrupt context.

A later
commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
did not take account of this and changed spin_lock_irqsave() to spin_lock().
This may cause a deadlock as quoted in the body of
commit 66e4f4a9cc38 ("rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()")
mentioned earlier.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/rtc/rtc-cmos.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index c24465f7bed4..508fba8746a1 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -741,10 +741,14 @@ static struct cmos_rtc	cmos_rtc;
 
 static irqreturn_t cmos_interrupt(int irq, void *p)
 {
+	unsigned long	flags;
 	u8		irqstat;
 	u8		rtc_control;
 
-	spin_lock(&rtc_lock);
+	/* cmos_interrupt() may be called from cmos_check_wkalrm() not in
+	 * interrupt context, so using spin_lock_irqsave() is required
+	 */
+	spin_lock_irqsave(&rtc_lock, flags);
 
 	/* When the HPET interrupt handler calls us, the interrupt
 	 * status is passed as arg1 instead of the irq number.  But
@@ -778,7 +782,7 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 			hpet_mask_rtc_irq_bit(RTC_AIE);
 		CMOS_READ(RTC_INTR_FLAGS);
 	}
-	spin_unlock(&rtc_lock);
+	spin_unlock_irqrestore(&rtc_lock, flags);
 
 	if (is_intr(irqstat)) {
 		rtc_update_irq(p, 1, irqstat);
-- 
2.25.1

