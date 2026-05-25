Return-Path: <linux-rtc+bounces-6573-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB+uFg1KFGoqMQcAu9opvQ
	(envelope-from <linux-rtc+bounces-6573-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 15:09:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CE5CAE98
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 15:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1CB93007AD6
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 13:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328E7383996;
	Mon, 25 May 2026 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hcM7a7x6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241019F12D;
	Mon, 25 May 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714538; cv=none; b=flfx38W6zCh8oFWv4FfBogen6DSH2f/boQyX/IHqDPpsv3VuxvHo2Upxi7Ql/ixJf7X3fSk2ZLMNIdWnLNOdi7PhiK/TfwlfR26Vk6tFNjBKLXiuHkXRmNZiJJoc/J7lwKnp6qG9R9eH61zHp9bTgXUikYK6fRL2QuAaRqhkpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714538; c=relaxed/simple;
	bh=AJnfyEu0MJoCHaW2I0rVs9/A/GEGbBG4fseJWQwg2TQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K4u077/MyysRucoa2zn5kSWIhvgjTrb6rJfSBBPmbxOpPqXHlPFdEpEaO9uLXGJ5crSUy3fyKTp8igdXYw6Zv0Me+JFGYqWUOKLAKrnoLjrBJ0ep47g3EwHAvr6tNtZq0BNaCCzD06Of+Ta3x33wOWglJALLFu2yAAkEPDmzNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hcM7a7x6; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BDZAkoMDZmk4/1OiDYc7l7h4pQDfCOhfv04SS9wg3Qg=;
	b=hcM7a7x6IokjQvg0XI0RP/SUxHTeA3OMvWqQ514oZVdxon0/YuwFJtOKkrjj0oEKRz7UWZbwS
	KaG60NfRgT6+wE9b0LwF9VFeusMSO5bS1W11ck2OYCbikKB+4OnTyNi29UhtszAuhyREq/BgSXj
	6XYHsgEbIw11n8eyKsltNoc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gPGGD2BGfz1T4Gw;
	Mon, 25 May 2026 21:00:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D6A6A40537;
	Mon, 25 May 2026 21:08:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 May
 2026 21:08:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] rtc: interface: Add rtc time jump debug in rtc_timer_do_work()
Date: Mon, 25 May 2026 21:08:25 +0800
Message-ID: <20260525130825.954214-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6573-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:mid,huawei.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B39CE5CAE98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In virtualization environments like QEMU [1], or during hardware
clocksource anomalies, an extreme time-warp event can occur. When
the system time abruptly jumps forward, the rtc_timer_do_work() handler
falls into a prolonged processing loop to clear accumulated historical
timers via timerqueue_getnext(). Running this loop indefinitely under
the rtc->ops_lock mutex triggers a kernel softlockup, stalling
the system.

Introduce an adaptive telemetry and loop guard mechanism to enhance debug
visibility and prevent softlockups:

1. Record `start_jiffies` upon entry and leverage `time_after()` to
   check if the loop has monopolized the CPU for more than 1s (HZ). If so,
   the handler prints a telemetry warning, triggers a WARN stack dump, and
   breaks the loop to safely yield the CPU.

2. Track the execution via a `loop_count` metric. Printing this counter
   in the warning log provides vital diagnostics to distinguish
   an aggressive time-warp storm (high count) from a bogged-down callback
   bug (low count).

3. Utilize the kernel format specifier `%ptR` to convert the raw ktime
   into a human-readable timestamp (YYYY-MM-DD HH:MM:SS), allowing
   developers to instantly pinpoint the exact boundary of the time
   jump in dmesg.

This non-destructive telemetry guard provides precise hardware/emulator
diagnostic visibility while ensuring core kernel availability.

[1]: https://lore.kernel.org/all/20260114013257.3500578-1-ruanjinjie@huawei.com/
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/rtc/interface.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1906f4884a83..f6c5fd16cc4e 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -927,10 +927,12 @@ static void rtc_timer_remove(struct rtc_device *rtc, struct rtc_timer *timer)
  */
 void rtc_timer_do_work(struct work_struct *work)
 {
-	struct rtc_timer *timer;
+	unsigned long start_jiffies = jiffies;
 	struct timerqueue_node *next;
-	ktime_t now;
+	struct rtc_timer *timer;
 	struct rtc_time tm;
+	int loop_count = 0;
+	ktime_t now;
 	int err;
 
 	struct rtc_device *rtc =
@@ -945,6 +947,15 @@ void rtc_timer_do_work(struct work_struct *work)
 	}
 	now = rtc_tm_to_ktime(tm);
 	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
+		loop_count++;
+
+		if (unlikely(time_after(jiffies, start_jiffies + HZ))) {
+			dev_warn(&rtc->dev, "RTC time jump (loop: %d) to %ptR.\n",
+				 loop_count, &tm);
+			WARN_ON_ONCE(1);
+			break;
+		}
+
 		if (next->expires > now)
 			break;
 
-- 
2.34.1


