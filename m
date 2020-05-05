Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B00C1C61C0
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2020 22:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgEEUOA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 16:14:00 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60273 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEEUOA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 16:14:00 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 72AAE200003;
        Tue,  5 May 2020 20:13:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        =?UTF-8?q?Per=20N=C3=B8rgaard=20Christensen?= 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/5] rtc: pcf2127: remove unnecessary #ifdef
Date:   Tue,  5 May 2020 22:13:08 +0200
Message-Id: <20200505201310.255145-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
References: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There is not point in setting .ioctl to NULL when CONFIG_RTC_INTF_DEV is
not defined because it would not be called anyway.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 136709baaa88..5ac996578523 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -184,7 +184,6 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-#ifdef CONFIG_RTC_INTF_DEV
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
 {
@@ -205,9 +204,6 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 		return -ENOIOCTLCMD;
 	}
 }
-#else
-#define pcf2127_rtc_ioctl NULL
-#endif
 
 static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.ioctl		= pcf2127_rtc_ioctl,
-- 
2.26.2

