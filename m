Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5366F301
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfD3JdM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:33:12 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43483 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbfD3JdL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:33:11 -0400
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id E4D74100016;
        Tue, 30 Apr 2019 09:33:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/4] rtc: pcap: use .set_time
Date:   Tue, 30 Apr 2019 11:33:01 +0200
Message-Id: <20190430093302.28648-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
References: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use .set_time instead of the deprecated .set_mmss.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
index be2678042fcc..d424339f7abb 100644
--- a/drivers/rtc/rtc-pcap.c
+++ b/drivers/rtc/rtc-pcap.c
@@ -92,9 +92,10 @@ static int pcap_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int pcap_rtc_set_mmss(struct device *dev, unsigned long secs)
+static int pcap_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
+	unsigned long secs = rtc_tm_to_time64(tm);
 	u32 tod, days;
 
 	tod = secs % SEC_PER_DAY;
@@ -125,9 +126,9 @@ static int pcap_rtc_alarm_irq_enable(struct device *dev, unsigned int en)
 
 static const struct rtc_class_ops pcap_rtc_ops = {
 	.read_time = pcap_rtc_read_time,
+	.set_time = pcap_rtc_set_time,
 	.read_alarm = pcap_rtc_read_alarm,
 	.set_alarm = pcap_rtc_set_alarm,
-	.set_mmss = pcap_rtc_set_mmss,
 	.alarm_irq_enable = pcap_rtc_alarm_irq_enable,
 };
 
-- 
2.20.1

