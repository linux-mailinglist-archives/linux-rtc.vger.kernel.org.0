Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384CBF306
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfD3JdW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:33:22 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33773 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfD3JdJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:33:09 -0400
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7AF48200025;
        Tue, 30 Apr 2019 09:33:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/4] rtc: pcap: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Tue, 30 Apr 2019 11:33:00 +0200
Message-Id: <20190430093302.28648-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
References: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion now that the range is
enforced by the core.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcap.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
index 976240853260..be2678042fcc 100644
--- a/drivers/rtc/rtc-pcap.c
+++ b/drivers/rtc/rtc-pcap.c
@@ -55,7 +55,7 @@ static int pcap_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_DAYA, &days);
 	secs += (days & PCAP_RTC_DAY_MASK) * SEC_PER_DAY;
 
-	rtc_time_to_tm(secs, tm);
+	rtc_time64_to_tm(secs, tm);
 
 	return 0;
 }
@@ -63,12 +63,9 @@ static int pcap_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static int pcap_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-	struct rtc_time *tm = &alrm->time;
-	unsigned long secs;
+	unsigned long secs = rtc_tm_to_time64(&alrm->time);
 	u32 tod, days;
 
-	rtc_tm_to_time(tm, &secs);
-
 	tod = secs % SEC_PER_DAY;
 	ezx_pcap_write(pcap_rtc->pcap, PCAP_REG_RTC_TODA, tod);
 
@@ -90,7 +87,7 @@ static int pcap_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_DAY, &days);
 	secs += (days & PCAP_RTC_DAY_MASK) * SEC_PER_DAY;
 
-	rtc_time_to_tm(secs, tm);
+	rtc_time64_to_tm(secs, tm);
 
 	return 0;
 }
-- 
2.20.1

