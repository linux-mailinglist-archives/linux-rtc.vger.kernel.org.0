Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9180C2D078F
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgLFWH1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgLFWHZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:25 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C801CC0613D2;
        Sun,  6 Dec 2020 14:06:44 -0800 (PST)
Message-Id: <20201206220541.960333166@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=JG5dX8xGxOTL3ExdOYCuqriVX+SU7EFieMrumJ4D7go=;
        b=1yt0rAw5r4jAAAYP4JglAWnUu37bvxnZ5aUsA6KyotcDIZV/kNt0+KPyKgHun7XAkDfDBE
        mmTUXRqtgKhgwcX31IWEcf0ZKGHBBw9WyLBCWw6HGXcwMGULSlrzM/SldiAgSHkGdUbFeb
        eBSe7Sa7U7MvADVMIfMJnyWoQIpNk8H2UQfiJhCS8gF6sjDkC++8lOi67hryAf7FUBsmbF
        OeRsjXKwcr9hwauBX5kWKC+A0wF9z0hH+aXofSC+Ddv09M22Nfvb92q58HncqBWHlNFiOC
        udJSJK9584QGotK7IdsOwLbe87fCv0KB+MCR/mm0MpY6LtWuifmqhApH3tcrbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=JG5dX8xGxOTL3ExdOYCuqriVX+SU7EFieMrumJ4D7go=;
        b=O8Ls+T1XzeCgds43cTiuPgtdPmCnJJ70CjCo9tGpddV+rIt/5DtEP9XK5/MWJyR0Yrexbm
        bhPK4du1wm6u8SCg==
Date:   Sun, 06 Dec 2020 22:46:17 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 4/8] rtc: core: Make the sync offset default more realistic
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The offset which is used to steer the start of an RTC synchronization
update via rtc_set_ntp_time() is huge. The math behind this is:

  tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)

twrite - tsched is the transport time for the write to hit the device.

t2 - twrite depends on the chip and is for most chips one second.

The rtc_set_ntp_time() calculation of tsched is:

    tsched = t2 - 1sec - (t2 - twrite)

The default for the sync offset is 500ms which means that twrite - tsched
is 500ms assumed that t2 - twrite is one second.

This is 0.5 seconds off for RTCs which are directly accessible by IO writes
and probably for the majority of i2C/SPI based RTC off by an order of
magnitude. Set it to 10ms which should bring it closer to reality.

The default can be adjusted by drivers (rtc_cmos does so) and could be
adjusted further by a calibration method which is an orthogonal problem.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/class.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -201,7 +201,7 @@ static struct rtc_device *rtc_allocate_d
 	device_initialize(&rtc->dev);
 
 	/* Drivers can revise this default after allocating the device. */
-	rtc->set_offset_nsec =  NSEC_PER_SEC / 2;
+	rtc->set_offset_nsec =  10 * NSEC_PER_MSEC;
 
 	rtc->irq_freq = 1;
 	rtc->max_user_freq = 64;

