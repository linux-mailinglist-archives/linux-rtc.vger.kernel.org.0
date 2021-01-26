Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03182305CEC
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 14:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313256AbhAZWjK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 17:39:10 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:50596 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729311AbhAZRC6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 12:02:58 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611680531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HrMDZ4yyjVd0WEX5TShN5hNg9g3vf27cMToBCTxUBfA=;
        b=Xvv8yMUp0L+Ni2uJDRs1EOwTOFmGwFvW1GAYHuGK9l0NAUM7BS+PWnQDllxhB7A37j8sOf
        cVYrXy2JZwp6mMtIqOMA9p8Y1rZ/7MpmylCPL6jXYNJwF8qEukbx5rG0YmMKZFYw/esBGs
        6Ait0iIUv8oGt2Y8YIv6j14lv6/XgyDB8pM7injs/YWZONNKUNkCxv46y4EHvnmmGvEYbC
        Ktn+td6fJUiB2a8oWoRt7fjIobYPvgFZHzKH/v277HbCek9FMIpJYfPA8YoPy/G34m9Cuz
        yiNRzYQs+mJMYalybSzgeBoR3fnA7ThcHoAHLCO74u+sp8PqESzirJBbkce+eA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611680531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HrMDZ4yyjVd0WEX5TShN5hNg9g3vf27cMToBCTxUBfA=;
        b=ZBFLUZmQbDVKmkgAybOjKtWIDN4MtZBPVL3cJfnwEt7UP5gRQfuKs0S0nsmRojG9fHzN67
        M8BryvH1KzMG2/Cw==
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH V2] rtc: mc146818: Detect and handle broken RTCs
In-Reply-To: <87y2gfg18p.fsf@nanos.tec.linutronix.de>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de>
Date:   Tue, 26 Jan 2021 18:02:11 +0100
Message-ID: <87tur3fx7w.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The recent fix for handling the UIP bit unearthed another issue in the RTC
code. If the RTC is advertised but the readout is straight 0xFF because
it's not available, the old code just proceeded with crappy values, but the
new code hangs because it waits for the UIP bit to become low.

Add a sanity check in the RTC CMOS probe function which reads the RTC_VALID
register (Register D) which should have bit 0-6 cleared. If that's not the
case then fail to register the CMOS.

Add the same check to mc146818_get_time(), warn once when the condition
is true and invalidate the rtc_time data.

Reported-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
---
V2: Fixed the sizeof() as spotted by Micka=C3=ABl
---
 drivers/rtc/rtc-cmos.c         |    8 ++++++++
 drivers/rtc/rtc-mc146818-lib.c |    7 +++++++
 2 files changed, 15 insertions(+)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -805,6 +805,14 @@ cmos_do_probe(struct device *dev, struct
=20
 	spin_lock_irq(&rtc_lock);
=20
+	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
+	if ((CMOS_READ(RTC_VALID) & 0x7f) !=3D 0) {
+		spin_unlock_irq(&rtc_lock);
+		dev_warn(dev, "not accessible\n");
+		retval =3D -ENXIO;
+		goto cleanup1;
+	}
+
 	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
 		/* force periodic irq to CMOS reset default of 1024Hz;
 		 *
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -21,6 +21,13 @@ unsigned int mc146818_get_time(struct rt
=20
 again:
 	spin_lock_irqsave(&rtc_lock, flags);
+	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
+	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) !=3D 0)) {
+		spin_unlock_irqrestore(&rtc_lock, flags);
+		memset(time, 0xff, sizeof(*time));
+		return 0;
+	}
+
 	/*
 	 * Check whether there is an update in progress during which the
 	 * readout is unspecified. The maximum update time is ~2ms. Poll
