Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271AA36046B
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Apr 2021 10:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhDOIhe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Apr 2021 04:37:34 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:53719 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231710AbhDOIhe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Apr 2021 04:37:34 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UVdGCoR_1618475824;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UVdGCoR_1618475824)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 15 Apr 2021 16:37:09 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] rtc: remove unused function
Date:   Thu, 15 Apr 2021 16:37:01 +0800
Message-Id: <1618475821-102974-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the following clang warning:

drivers/rtc/rtc-ds1511.c:108:1: warning: unused function
'rtc_write_alarm' [-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/rtc/rtc-ds1511.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index bda8843..1109cad 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -104,12 +104,6 @@ struct rtc_plat_data {
 	writeb(val, ds1511_base + (reg * reg_spacing));
 }
 
-static inline void
-rtc_write_alarm(uint8_t val, enum ds1511reg reg)
-{
-	rtc_write((val | 0x80), reg);
-}
-
 static noinline uint8_t
 rtc_read(enum ds1511reg reg)
 {
-- 
1.8.3.1

