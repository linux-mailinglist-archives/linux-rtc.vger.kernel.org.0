Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C3417B419
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 02:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgCFB5O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 20:57:14 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:15417 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFB5M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 20:57:12 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A5CF240003;
        Fri,  6 Mar 2020 01:57:10 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: cpcap: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 02:57:03 +0100
Message-Id: <20200306015703.42101-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306015703.42101-1-alexandre.belloni@bootlin.com>
References: <20200306015703.42101-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cpcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 38f949730b1b..a603f1f21125 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -56,14 +56,14 @@ static void cpcap2rtc_time(struct rtc_time *rtc, struct cpcap_time *cpcap)
 	tod = (cpcap->tod1 & TOD1_MASK) | ((cpcap->tod2 & TOD2_MASK) << 8);
 	time = tod + ((cpcap->day & DAY_MASK) * SECS_PER_DAY);
 
-	rtc_time_to_tm(time, rtc);
+	rtc_time64_to_tm(time, rtc);
 }
 
 static void rtc2cpcap_time(struct cpcap_time *cpcap, struct rtc_time *rtc)
 {
 	unsigned long time;
 
-	rtc_tm_to_time(rtc, &time);
+	time = rtc_tm_to_time64(rtc);
 
 	cpcap->day = time / SECS_PER_DAY;
 	time %= SECS_PER_DAY;
-- 
2.24.1

