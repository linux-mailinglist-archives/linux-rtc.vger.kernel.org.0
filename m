Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A274577E1
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 21:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhKSUqh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 15:46:37 -0500
Received: from mx-out.tlen.pl ([193.222.135.142]:57909 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235757AbhKSUq1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:46:27 -0500
Received: (wp-smtpd smtp.tlen.pl 4257 invoked from network); 19 Nov 2021 21:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637354594; bh=J41aB8wnVzUyYkl9TdJp6S6albwmZIUBVcTKiMmV20c=;
          h=From:To:Cc:Subject;
          b=yhYXFNZOBNqgOhOkbB1eId3cp3uXo27jV6WROGm4qCGQH6dC5ec1gaY1O1PmV/gab
           yXasbjIPU5CxX6gA7JAdAba4Jik/I3B8rg9hZgR9KqD6k0g1W5IhGveZnzoGLh8VcW
           iaE0vdIuug9bf08G2KBzn0qETpP/KXwLpfUASeWo=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 19 Nov 2021 21:43:13 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RESEND v3 3/7] rtc-mc146818-lib: extract mc146818_do_avoiding_UIP
Date:   Fri, 19 Nov 2021 21:42:17 +0100
Message-Id: <20211119204221.66918-4-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119204221.66918-1-mat.jonczyk@o2.pl>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: a4efd70643cf3599700bc744bbbb3bc7
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [USPE]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Function mc146818_get_time() contains an elaborate mechanism of reading
the RTC time while no RTC update is in progress. It turns out that
reading the RTC alarm clock also requires avoiding the RTC update (see
following patches). Therefore, the mechanism in mc146818_get_time()
should be reused - so extract it into a separate function.

The logic in mc146818_do_avoiding_UIP() is same as in
mc146818_get_time() except that after every

        if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {

there is now "mdelay(1)".

To avoid producing an unreadable diff, mc146818_get_time() will be
refactored to use mc146818_do_avoiding_UIP() in the next patch.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

---
 drivers/rtc/rtc-mc146818-lib.c | 69 ++++++++++++++++++++++++++++++++++
 include/linux/mc146818rtc.h    |  3 ++
 2 files changed, 72 insertions(+)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index b50612ce1a6d..946ad43a512c 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -8,6 +8,75 @@
 #include <linux/acpi.h>
 #endif
 
+/*
+ * Execute a function while the UIP (Update-in-progress) bit of the RTC is
+ * unset.
+ *
+ * Warning: callback may be executed more then once.
+ */
+bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param)
+{
+	int i;
+	unsigned long flags;
+	unsigned char seconds;
+
+	for (i = 0; i < 10; i++) {
+		spin_lock_irqsave(&rtc_lock, flags);
+
+		/*
+		 * Check whether there is an update in progress during which the
+		 * readout is unspecified. The maximum update time is ~2ms. Poll
+		 * every msec for completion.
+		 *
+		 * Store the second value before checking UIP so a long lasting
+		 * NMI which happens to hit after the UIP check cannot make
+		 * an update cycle invisible.
+		 */
+		seconds = CMOS_READ(RTC_SECONDS);
+
+		if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
+			spin_unlock_irqrestore(&rtc_lock, flags);
+			mdelay(1);
+			continue;
+		}
+
+		/* Revalidate the above readout */
+		if (seconds != CMOS_READ(RTC_SECONDS)) {
+			spin_unlock_irqrestore(&rtc_lock, flags);
+			continue;
+		}
+
+		if (callback)
+			callback(seconds, param);
+
+		/*
+		 * Check for the UIP bit again. If it is set now then
+		 * the above values may contain garbage.
+		 */
+		if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
+			spin_unlock_irqrestore(&rtc_lock, flags);
+			mdelay(1);
+			continue;
+		}
+
+		/*
+		 * A NMI might have interrupted the above sequence so check
+		 * whether the seconds value has changed which indicates that
+		 * the NMI took longer than the UIP bit was set. Unlikely, but
+		 * possible and there is also virt...
+		 */
+		if (seconds != CMOS_READ(RTC_SECONDS)) {
+			spin_unlock_irqrestore(&rtc_lock, flags);
+			continue;
+		}
+		spin_unlock_irqrestore(&rtc_lock, flags);
+
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(mc146818_do_avoiding_UIP);
+
 /*
  * If the UIP (Update-in-progress) bit of the RTC is set for more then
  * 10ms, the RTC is apparently broken or not present.
diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
index 69c80c4325bf..c0cea97461a0 100644
--- a/include/linux/mc146818rtc.h
+++ b/include/linux/mc146818rtc.h
@@ -127,4 +127,7 @@ bool mc146818_does_rtc_work(void);
 unsigned int mc146818_get_time(struct rtc_time *time);
 int mc146818_set_time(struct rtc_time *time);
 
+typedef void (*mc146818_callback_t)(unsigned char seconds, void *param);
+bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param);
+
 #endif /* _MC146818RTC_H */
-- 
2.25.1

