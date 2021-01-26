Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CEC303EC5
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 14:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403966AbhAZNc3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 08:32:29 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:49478 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392317AbhAZN1A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 08:27:00 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611667568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=38wr1OUdVY5qa4csrS5j+bDtc+hqgakuki0CQK0ebIE=;
        b=OMw7J3LS5c7ufuqTDutW78aIq/jluzUTnTyEadi3wJVvQ1zF4X7N935cSoFLJBrBC17W5M
        nAVdZj99JGIzIIWNMjrkDxVAsDxJFHbTyqtbfoz6Nzu7H4+Zw2vUKgTsNj3mYHUT8CEyEz
        pY6cWJ+jpB9Wtm/jo4d+iaZDKRF8fPzWR/jfh9ZIlOxHuJTD+uusUeHK3/hIsEq/EFkI4q
        eqCUVxJe7ay5QmLhtKxwxT76l6kRg4Sq7Yu4EaHDMamNJSjk4v3kGf+dkaJ5rb0GI/pJd5
        MQqweICAPjPjUVS4JyR0iXlMQKcCpQgWjzmrnqwdCzTnRM9VkV9roVmV7S34sA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611667568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=38wr1OUdVY5qa4csrS5j+bDtc+hqgakuki0CQK0ebIE=;
        b=1s14p9ZbXqlhNGgFhIRtMky00sdei5PWhNAwc7c5wJzVNQSJkRdP92RedGcWuZc2YmJwsQ
        BuAUFYKVdhAllOCA==
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 1/8] rtc: mc146818: Prevent reading garbage - bug
In-Reply-To: <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
Date:   Tue, 26 Jan 2021 14:26:07 +0100
Message-ID: <871re7hlsg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 25 2021 at 19:40, Micka=C3=ABl Sala=C3=BCn wrote:
> After some bisecting, I found that commit 05a0302c3548 ("rtc: mc146818:
> Prevent reading garbage", this patch, introduced since v5.11-rc1) makes
> my VM hang at boot. Before this commit, I got this (and didn't notice)
> at every boot:
> rtc_cmos rtc_cmos: registered as rtc0
> rtc_cmos rtc_cmos: hctosys: unable to read the hardware clock
> rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
>
> I notice that this patch creates infinite loops, which my VM falls into
> (cf. below).
>> +	time->tm_sec =3D CMOS_READ(RTC_SECONDS);
>> +
>> +	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
>> +		spin_unlock_irqrestore(&rtc_lock, flags);
>> +		mdelay(1);
>
> My VM loops here.
> time->tm_sec is always 255.

That means there is no RTC and therefore the CMOS_READ($REG) returns
0xFF which makes the loop stuck because RTC_UIP is always set.

Yet another proof that VIRT creates more problems than it solves.

Fix below.

Thanks,

        tglx
---
Subject: rtc: mc146818: Detect and handle broken RTCs
From: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 26 Jan 2021 11:38:40 +0100

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
+		memset(time, 0xff, sizeof(time));
+		return 0;
+	}
+
 	/*
 	 * Check whether there is an update in progress during which the
 	 * readout is unspecified. The maximum update time is ~2ms. Poll
