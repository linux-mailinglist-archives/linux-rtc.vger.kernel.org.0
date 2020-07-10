Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E621B0EA
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2020 10:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgGJICU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Jul 2020 04:02:20 -0400
Received: from mgwym02.jp.fujitsu.com ([211.128.242.41]:48396 "EHLO
        mgwym02.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgGJICS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Jul 2020 04:02:18 -0400
X-Greylist: delayed 664 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Jul 2020 04:02:17 EDT
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by mgwym02.jp.fujitsu.com with smtp
         id 4dfd_202c_1c091d55_08f5_4430_bbd1_ffadd6e07043;
        Fri, 10 Jul 2020 16:51:08 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
        by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 936F4AC0143
        for <linux-rtc@vger.kernel.org>; Fri, 10 Jul 2020 16:51:04 +0900 (JST)
Received: from g01jpexchkw34.g01.fujitsu.local (unknown [10.0.193.4])
        by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id AB5496926C9;
        Fri, 10 Jul 2020 16:51:03 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchkw34.g01.fujitsu.local (10.0.193.49) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Jul 2020 16:51:03 +0900
From:   Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To:     <linux-rtc@vger.kernel.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH] rtc: cleanup obsolete comment about struct rtc_class_ops
Date:   Fri, 10 Jul 2020 17:00:03 +0900
Message-ID: <20200710080003.7986-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Commit ea369ea6d828 ("rtc: remove .open() and .release()") removes
open/release callback from struct rtc_class_ops.

Also commit 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state")
and commit 696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()")
removes irq callbacks.

So, just remove related comments so that readers will not be confused.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 include/linux/rtc.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index bba3db3f7efa..22d1575e4991 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -55,10 +55,6 @@ extern struct class *rtc_class;
  *
  * The (current) exceptions are mostly filesystem hooks:
  *   - the proc() hook for procfs
- *   - non-ioctl() chardev hooks:  open(), release()
- *
- * REVISIT those periodic irq calls *do* have ops_lock when they're
- * issued through ioctl() ...
  */
 struct rtc_class_ops {
 	int (*ioctl)(struct device *, unsigned int, unsigned long);
-- 
2.21.3

