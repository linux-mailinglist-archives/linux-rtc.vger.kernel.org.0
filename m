Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05458264043
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 10:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgIJImm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 04:42:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:50062 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730270AbgIJIlb (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 10 Sep 2020 04:41:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D9032B3D9;
        Thu, 10 Sep 2020 08:41:44 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ds1685: Fix bank switching to avoid endless loop
Date:   Thu, 10 Sep 2020 10:41:24 +0200
Message-Id: <20200910084124.138560-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

ds1685_rtc_begin_data_access() tried to access an extended register before
enabling access to it by switching to bank 1. Depending on content in NVRAM
this could lead to an endless loop. While at it fix also switch back to
bank 0 in ds1685_rtc_end_data_access().

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/rtc/rtc-ds1685.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 56c670af2e50..dfbd7b88b2b9 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -193,12 +193,12 @@ ds1685_rtc_begin_data_access(struct ds1685_priv *rtc)
 	rtc->write(rtc, RTC_CTRL_B,
 		   (rtc->read(rtc, RTC_CTRL_B) | RTC_CTRL_B_SET));
 
+	/* Switch to Bank 1 */
+	ds1685_rtc_switch_to_bank1(rtc);
+
 	/* Read Ext Ctrl 4A and check the INCR bit to avoid a lockout. */
 	while (rtc->read(rtc, RTC_EXT_CTRL_4A) & RTC_CTRL_4A_INCR)
 		cpu_relax();
-
-	/* Switch to Bank 1 */
-	ds1685_rtc_switch_to_bank1(rtc);
 }
 
 /**
@@ -213,7 +213,7 @@ static inline void
 ds1685_rtc_end_data_access(struct ds1685_priv *rtc)
 {
 	/* Switch back to Bank 0 */
-	ds1685_rtc_switch_to_bank1(rtc);
+	ds1685_rtc_switch_to_bank0(rtc);
 
 	/* Clear the SET bit in Ctrl B */
 	rtc->write(rtc, RTC_CTRL_B,
-- 
2.16.4

