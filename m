Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97CB0183AE
	for <lists+linux-rtc@lfdr.de>; Thu,  9 May 2019 04:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfEICUD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 May 2019 22:20:03 -0400
Received: from www.osadl.org ([62.245.132.105]:60498 "EHLO www.osadl.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfEICUD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 8 May 2019 22:20:03 -0400
Received: from debian01.hofrr.at (178.115.242.59.static.drei.at [178.115.242.59])
        by www.osadl.org (8.13.8/8.13.8/OSADL-2007092901) with ESMTP id x492JcKg005420;
        Thu, 9 May 2019 04:19:38 +0200
From:   Nicholas Mc Guire <hofrat@osadl.org>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] rtc: ds2404: use hw endiannes variable
Date:   Thu,  9 May 2019 04:13:55 +0200
Message-Id: <1557368035-6787-1-git-send-email-hofrat@osadl.org>
X-Mailer: git-send-email 2.1.4
X-Spam-Status: No, score=-4.2 required=6.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
        autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.osadl.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Converting from hardware to host endiannes was done using reassignment
to the same variable which makes sparse unhappy as it can not verify
the endiannes handling properly. To allow sparse to verify endiannes
handling an explicit __le32 is introduced. Note that this patch does
not change the generated binary (x86_64 and ppc64 binary diff).

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Problem located by an experimental coccinelle script to locate
patters that make sparse unhappy (false positives):

on little-endian x86_64 sparse complains about:
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
on big-endian ppc64 sparse complains about
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32
drivers/rtc/rtc-ds2404.c:187:16: warning: cast to restricted __le32

Patch was compiletested with:
 x86_64_defconfig + RTC_DRV_DS2404=m
 ppc64_defconfig + RTC_DRV_DS2404=m

in both cases applying the patch has no impact on the generated binary.

Patch is against 5.1 (localversion-next is next-20190508)

 drivers/rtc/rtc-ds2404.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 1e9f429..9df0c44 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -182,9 +182,10 @@ static void ds2404_enable_osc(struct device *dev)
 static int ds2404_read_time(struct device *dev, struct rtc_time *dt)
 {
 	unsigned long time = 0;
+	__le32 hw_time = 0;
 
-	ds2404_read_memory(dev, 0x203, 4, (u8 *)&time);
-	time = le32_to_cpu(time);
+	ds2404_read_memory(dev, 0x203, 4, (u8 *)&hw_time);
+	time = le32_to_cpu(hw_time);
 
 	rtc_time64_to_tm(time, dt);
 	return 0;
-- 
2.1.4

