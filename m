Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF22330B04E
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 20:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBATZB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 14:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhBATY7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 14:24:59 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55D7C061573;
        Mon,  1 Feb 2021 11:24:18 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1612207457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZUN9gERhGqqCHXEVd2qlbvNh1ujLghKXin767TBA7Jw=;
        b=l97p/e5IEi/wDdDzDVmNT1Wd8BuMUOMognmmg9Wue2y6c0aOFdIIdRV/go9B5WRCXybdcL
        X70Cr9p/8OXm7xtFN092KCrmBp5NVv3+vocHtzddWdnUlEPMDOdXpI7jgbNGhLD8lfMTOh
        SH0lztKFx4d7oSHeq4uZ5qzV+Bs1CQniRU+OtOZ5+K82F4vQ1kx+i0NUGdW3ZDKw9qmVoO
        BLAHSbyhlcV16UvrNvskG6INu1DxfdUDVvYAdRldeOhbW4wwvTIQ7oN5OzSvZ5EFsUJpEC
        e0jJ5BRSNQcEGgmSduvBTX1l9f4ZLVi3IoX9n4Metv1ssXsgmoKuN34lrsEdQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1612207457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZUN9gERhGqqCHXEVd2qlbvNh1ujLghKXin767TBA7Jw=;
        b=AQ2rVUW1wK77LjVyUd2S/ZJ3CdCrHfl/dm+dUWCiQVPrBsQMS+oWB7g7LlEobZBq021obD
        ppZy8iM+EBeKvvAA==
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
Subject: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
In-Reply-To: <8735yfd2q4.fsf@nanos.tec.linutronix.de>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de> <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net> <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de>
Date:   Mon, 01 Feb 2021 20:24:17 +0100
Message-ID: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
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
V2: Provide the actual delta patch. Should have stayed away from
    computers today....
---
 drivers/rtc/rtc-cmos.c         |    4 ++--
 drivers/rtc/rtc-mc146818-lib.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -805,8 +805,8 @@ cmos_do_probe(struct device *dev, struct
 
 	spin_lock_irq(&rtc_lock);
 
-	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
-	if ((CMOS_READ(RTC_VALID) & 0x7f) != 0) {
+	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
+	if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
 		spin_unlock_irq(&rtc_lock);
 		dev_warn(dev, "not accessible\n");
 		retval = -ENXIO;
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -21,8 +21,8 @@ unsigned int mc146818_get_time(struct rt
 
 again:
 	spin_lock_irqsave(&rtc_lock, flags);
-	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
-	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) != 0)) {
+	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
+	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
 		spin_unlock_irqrestore(&rtc_lock, flags);
 		memset(time, 0xff, sizeof(*time));
 		return 0;
