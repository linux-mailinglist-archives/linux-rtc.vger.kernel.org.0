Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5DB2D078E
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgLFWH1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgLFWHX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:23 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D8FC0613D1;
        Sun,  6 Dec 2020 14:06:43 -0800 (PST)
Message-Id: <20201206220541.830517160@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=BKqxCc7kzHbPvjkWc7nKoPIYT1FCRMaFMNj8o1hyTrA=;
        b=3Xb+WywDt7YEYMMjBsUTjLB5ac1avsoPiRBYjeBBKcR/p0wuAfo+ZiuDzN6Dp5AjpyuNCI
        MhLbVmbe1paE8tYiOp2cdicrVyS1FEPaizNSmrLieMDotqI7q+yR/Kf7/fURkEZ1X/DZld
        nlPeU+HKZ86E43HYk1Iz5nS06JA0bWFsgJjmqn6uv5rccSg/51obmJd9CcHh+7b8dGXmPZ
        WYngej5hzSOd+eh9b5kGKHe6VIGRL9VJ3OdZQynfqV+WNDzcdsJpBCfCUqRZIX0abi0/uI
        IXYBr3snXcmXP5PIww+Mc6H5NJA/x6SnMtNjUP5cRpSIYDKO4uRzcVOr8JxXjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=BKqxCc7kzHbPvjkWc7nKoPIYT1FCRMaFMNj8o1hyTrA=;
        b=fW6B4lJv5AFcURSIMK7AvvtENbCR5W5XIWwUHeHepu+dsZcvJQgGDYHXjPoI0CTZdl40Q4
        mFItOkt0wl2ziqCA==
Date:   Sun, 06 Dec 2020 22:46:16 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 3/8] rtc: cmos: Make rtc_cmos sync offset correct
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The offset for rtc_cmos must be -500ms to work correctly with the current
implementation of rtc_set_ntp_time() due to the following:

  tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)

twrite - tsched is the transport time for the write to hit the device,
which is negligible for this chip because it's accessed directly.

t2 - twrite = 500ms according to the datasheet.

But rtc_set_ntp_time() calculation of tsched is:

    tsched = t2 - 1sec - (t2 - twrite)

The default for the sync offset is 500ms which means that the write happens
at t2 - 1.5 seconds which is obviously off by a second for this device.

Make the offset -500ms so it works correct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/rtc-cmos.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -868,6 +868,9 @@ cmos_do_probe(struct device *dev, struct
 	if (retval)
 		goto cleanup2;
 
+	/* Set the sync offset for the periodic 11min update correct */
+	cmos_rtc.rtc->set_offset_nsec = -(NSEC_PER_SEC / 2);
+
 	/* export at least the first block of NVRAM */
 	nvmem_cfg.size = address_space - NVRAM_OFFSET;
 	if (rtc_nvmem_register(cmos_rtc.rtc, &nvmem_cfg))

