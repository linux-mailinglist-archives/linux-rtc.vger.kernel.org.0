Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1288F3ADC31
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 02:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhFTAox (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Jun 2021 20:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhFTAow (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Jun 2021 20:44:52 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AB5C061574
        for <linux-rtc@vger.kernel.org>; Sat, 19 Jun 2021 17:42:41 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1624149759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=xK+DmaXnoyosriDPMF/7746cVAw94Vag+mYBs6UPJGo=;
        b=4FR15Q4/JQeepp9r2nY+XdAnjiQnjTT+B2pPEn/fXAkwgmbwVglJeTiIWSa4p3p3xMYAwE
        FPnsipcJVxHeKubHxxaCc9OzKlOQ9ZYTxs0vSWd/1HRzNQvyISfPdoqj1ciYRtr635DNRM
        rXVH4i85Yok6vQlHDhVqb3khnlreFrqMyrW8t6NNK2zvReCJ9Mn8XRXOLPU/DEP9qO/iyv
        rJTxbfg8pxFxIRaxDymcw9j0TL9RQDv2Hzh9sEGKjF+1HHeEUybMhoAJI5IO4fcpeBKlJ4
        nq9hFYQpuY4RoZGdaokRwIUsYu3b8unGFUyGoWGEzHUSjZo5Vmu8XpobzW/zDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1624149759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=xK+DmaXnoyosriDPMF/7746cVAw94Vag+mYBs6UPJGo=;
        b=j+xeBocKCsRLfHfdR93MsIyYMQ3bverm5Qyzs2HJajTMFCjnI4dD3Spvo33VGRSTwv1Roc
        W2No9q7fStWhPbDQ==
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: rtc: pcf8523: Rename REG_OFFSET
Date:   Sun, 20 Jun 2021 02:42:39 +0200
Message-ID: <8735tdgydc.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Moving ARM to the generic irqstat infrastructure caused
arch/arm/mach-ixp4xx/include/mach/platform.h to be included indirectly in
interrupt related headers, which results in a build failure:

>> drivers/rtc/rtc-pcf8523.c:35: warning: "REG_OFFSET" redefined                                                                                                                                                                                                                
      35 | #define REG_OFFSET   0x0e                                                                                                                                                                                                                                           

Rename it to PCF_REG_OFFSET and for consistency the mode define to
PCF_REG_OFFSET_MODE.

Fixes: 7fd70c65faac ("ARM: irqstat: Get rid of duplicated declaration")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-pcf8523.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -41,8 +41,8 @@
 #define REG_WEEKDAY_ALARM	0x0d
 #define ALARM_DIS BIT(7)
 
-#define REG_OFFSET   0x0e
-#define REG_OFFSET_MODE BIT(7)
+#define PCF_REG_OFFSET		0x0e
+#define PCF_REG_OFFSET_MODE	BIT(7)
 
 #define REG_TMR_CLKOUT_CTRL 0x0f
 
@@ -442,13 +442,13 @@ static int pcf8523_rtc_read_offset(struc
 	u8 value;
 	s8 val;
 
-	err = pcf8523_read(client, REG_OFFSET, &value);
+	err = pcf8523_read(client, PCF_REG_OFFSET, &value);
 	if (err < 0)
 		return err;
 
 	/* sign extend the 7-bit offset value */
 	val = value << 1;
-	*offset = (value & REG_OFFSET_MODE ? 4069 : 4340) * (val >> 1);
+	*offset = (value & PCF_REG_OFFSET_MODE ? 4069 : 4340) * (val >> 1);
 
 	return 0;
 }
@@ -465,9 +465,9 @@ static int pcf8523_rtc_set_offset(struct
 	if (abs(reg_m0 * 4340 - offset) < abs(reg_m1 * 4069 - offset))
 		value = reg_m0 & 0x7f;
 	else
-		value = (reg_m1 & 0x7f) | REG_OFFSET_MODE;
+		value = (reg_m1 & 0x7f) | PCF_REG_OFFSET_MODE;
 
-	return pcf8523_write(client, REG_OFFSET, value);
+	return pcf8523_write(client, PCF_REG_OFFSET, value);
 }
 
 static const struct rtc_class_ops pcf8523_rtc_ops = {
