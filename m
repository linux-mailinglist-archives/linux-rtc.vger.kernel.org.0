Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B33217B357
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCFBAM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:00:12 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:34877 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgCFBAM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:00:12 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 29E60240004;
        Fri,  6 Mar 2020 01:00:10 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rtc: au1xxx: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 01:59:58 +0100
Message-Id: <20200306005958.39203-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005958.39203-1-alexandre.belloni@bootlin.com>
References: <20200306005958.39203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-au1xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-au1xxx.c b/drivers/rtc/rtc-au1xxx.c
index e186fb5cfffd..791bebcb6f47 100644
--- a/drivers/rtc/rtc-au1xxx.c
+++ b/drivers/rtc/rtc-au1xxx.c
@@ -34,7 +34,7 @@ static int au1xtoy_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	t = alchemy_rdsys(AU1000_SYS_TOYREAD);
 
-	rtc_time_to_tm(t, tm);
+	rtc_time64_to_tm(t, tm);
 
 	return 0;
 }
@@ -43,7 +43,7 @@ static int au1xtoy_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned long t;
 
-	rtc_tm_to_time(tm, &t);
+	t = rtc_tm_to_time64(tm);
 
 	alchemy_wrsys(t, AU1000_SYS_TOYWRITE);
 
-- 
2.24.1

