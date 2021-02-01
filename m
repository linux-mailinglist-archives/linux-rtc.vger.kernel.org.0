Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4C30B016
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 20:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhBATKW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 14:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhBATKV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 14:10:21 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFE1C061573;
        Mon,  1 Feb 2021 11:09:41 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1612206579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qIi7Y2wtgcFcE5QpHplMFS5nIPaJWE0ofpSOrxqX7vE=;
        b=XVmXH/B6KgSVLx6xfI3eJjezpOfEi1eu4mz6Qt71Tm9DLLlI/N5KqKtG0YGJgYNEwFjKkM
        OK3UjG52+49DUid7jyyf526RvToGf2WR4+Zw1F/mkMwEZAiDdshBq9jFbPeKOEZmG3b6oS
        4NWgSnfMTqeiWLzcfEy70S6YaA3SE8+7MsywHIbohp3qOI1VxvZiqJ5J23+i8VFWic1FHP
        5WJSecs1s3G3juRN0lWOUFo4lbBxuWhtQlzwKNPwVJDGx1jEkQs/HrjL/HY7j5GubHICWo
        k/l/Rq8RBCyzKMGTtX431hXvB7+Ak3cdSak6JEAu3WoyPZ6pFN3cWY5uYZBFZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1612206579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qIi7Y2wtgcFcE5QpHplMFS5nIPaJWE0ofpSOrxqX7vE=;
        b=nr5ldRcMu1IXndLxDOTd4OagNk0bW6PEKeYtTng93ri2yrP0by8qsM4kA0qgbeGLMzxpLG
        S3ac5sUH3lmKJlDw==
To:     Serge Belyshev <belyshev@depni.sinp.msu.ru>
Cc:     Dirk Gouders <dirk@gouders.net>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] rtc: mc146818: Dont test for bit 0-5 in Register D
In-Reply-To: <877dnrc2sv.fsf@depni.sinp.msu.ru>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de> <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net> <877dnrc2sv.fsf@depni.sinp.msu.ru>
Date:   Mon, 01 Feb 2021 20:09:39 +0100
Message-ID: <8735yfd2q4.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The recent change to validate the RTC turned out to be overly tight.

While it cures the problem on the reporters machine it breaks machines
with Intel chipsets which use bit 0-5 of the D register. So check only
for bit 6 being 0 which is the case on these Intel machines as well.

Fixes: 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
Reported-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Reported-by: Dirk Gouders <dirk@gouders.net>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/rtc-cmos.c         |    8 ++++++++
 drivers/rtc/rtc-mc146818-lib.c |    7 +++++++
 2 files changed, 15 insertions(+)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -805,6 +805,14 @@ cmos_do_probe(struct device *dev, struct
 
 	spin_lock_irq(&rtc_lock);
 
+	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
+	if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
+		spin_unlock_irq(&rtc_lock);
+		dev_warn(dev, "not accessible\n");
+		retval = -ENXIO;
+		goto cleanup1;
+	}
+
 	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
 		/* force periodic irq to CMOS reset default of 1024Hz;
 		 *
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -21,6 +21,13 @@ unsigned int mc146818_get_time(struct rt
 
 again:
 	spin_lock_irqsave(&rtc_lock, flags);
+	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
+	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
+		spin_unlock_irqrestore(&rtc_lock, flags);
+		memset(time, 0xff, sizeof(*time));
+		return 0;
+	}
+
 	/*
 	 * Check whether there is an update in progress during which the
 	 * readout is unspecified. The maximum update time is ~2ms. Poll
