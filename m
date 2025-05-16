Return-Path: <linux-rtc+bounces-4101-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4124AB967A
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A18241B6197A
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8019A226D07;
	Fri, 16 May 2025 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="DKluuhBD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966987D3F4;
	Fri, 16 May 2025 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380247; cv=none; b=gbfArXubKfIHsA/wcDlOx7XHUEkNth03Si1Ebp3qlV0hewuFETPia4c/cc+pZTfDieh1+r+iwc+lBKhkL9batt3y2rH073fjmq4SrYeJGijlYa7Grq4nIqN+BQq2j5HMqKjjLosIZs9gy8O24cFpky/TqYm1Un7BbeDwqr5EWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380247; c=relaxed/simple;
	bh=vqa0dTp9C1MThd8T8OLDOwiyoMFJjfgxJl+5EjhLtc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqPEKDL/VjCAVD5BvyqCyyYyJWDVmEEQf88kKcJ/8+9qZJOU94BpU/g25Ps2iHTtIMC0uqPI7tmCgIWu5shnxrkmPm0Mljzp5wjHU2MFti1MeDn8ZQV65a5bvC9Xu/HEG4M/Mm5/ZwDAjiCK7wF5xyBe8Vv5blZXWH9+0NsNSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=DKluuhBD; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380232; x=1747639432;
	bh=/9Z/ul7hXCo/YIyQHv36+JlKXEGkyyfKI7Noi5V9Zw8=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DKluuhBDUVDhATMSINsGvy9ny1stdMxHBTd7Hjax9eClAsaljoozfynvP2b6tMujM
	 idvaB9gTt4jU1KFrNl1SHzwCCIiNVgzyZyQC+qf/8kJImwFy1isSvaxtI/08vGMW3s
	 Fnf085yZPvQTpwzWVZCJrnWdTg9fZfOH7o+F+9bmdyk+qCM01FlUPk9KB9k+k5CsKg
	 /Xms564OOgx0DoPLvT+xcy3Bo4vzcJn3YF6yUFP2TBduNwArilr8j8kh67nuv3TQnL
	 VC8lDH6hOJwOiDH6Z9tPVVgB8dadWwgAEUDldjFaRLwKIBpgkdJM7GIW4oHS/6v8G8
	 6iSII+BdWsRbQ==
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:35 +0200
Subject: [PATCH v2 1/5] rtc: interface: Fix long-standing race when setting
 alarm
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-1-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=2485;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=vqa0dTp9C1MThd8T8OLDOwiyoMFJjfgxJl+5EjhLtc0=;
 b=rETIVHamGkIBOoWlv8KoibC8KOoj5ZsQOY7/o/R7tT9GXokO16Ovg696kdaK+Uk4Z3iH2MGey
 hR07gIETKZiCR3/T8NoYDRzLqz+qoNGM2Uqiy3bgu90ANZ//6Q+5bI3
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

As described in the old comment dating back to
commit 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
from 2010, we have been living with a race window when setting alarm
with an expiry in the near future (i.e. next second).
With 1 second resolution, it can happen that the second ticks after the
check for the timer having expired, but before the alarm is actually set.
When this happen, no alarm IRQ is generated, at least not with some RTC
chips (isl12022 is an example of this).

With UIE RTC timer being implemented on top of alarm irq, being re-armed
every second, UIE will occasionally fail to work, as an alarm irq lost
due to this race will stop the re-arming loop.

For now, I have limited the additional expiry check to only be done for
alarms set to next seconds. I expect it should be good enough, although I
don't know if we can now for sure that systems with loads could end up
causing the same problems for alarms set 2 seconds or even longer in the
future.

I haven't been able to reproduce the problem with this check in place.

Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/interface.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d7d2cfd5479fc1fc892fcb5efbb6b..e365e8fd166db31f8b44fac9fb923d36881b1394 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -443,6 +443,29 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else
 		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
 
+	/*
+	 * Check for potential race described above. If the waiting for next
+	 * second, and the second just ticked since the check above, either
+	 *
+	 * 1) It ticked after the alarm was set, and an alarm irq should be
+	 *    generated.
+	 *
+	 * 2) It ticked before the alarm was set, and alarm irq most likely will
+	 * not be generated.
+	 *
+	 * While we cannot easily check for which of these two scenarios we
+	 * are in, we can return -ETIME to signal that the timer has already
+	 * expired, which is true in both cases.
+	 */
+	if ((scheduled - now) <= 1) {
+		err = __rtc_read_time(rtc, &tm);
+		if (err)
+			return err;
+		now = rtc_tm_to_time64(&tm);
+		if (scheduled <= now)
+			return -ETIME;
+	}
+
 	trace_rtc_set_alarm(rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }

-- 
2.49.0


