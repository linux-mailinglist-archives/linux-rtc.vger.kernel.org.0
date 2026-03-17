Return-Path: <linux-rtc+bounces-6230-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOUgOEvjuWmnPAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6230-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2026 00:27:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 418612B4552
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Mar 2026 00:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB3763040A9E
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 23:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957E13C5544;
	Tue, 17 Mar 2026 23:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mpkGECk7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3F54723;
	Tue, 17 Mar 2026 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789751; cv=none; b=K1aA6WjoTRlAyg9eFf2D1mflfixa+cLgnuZXKkfbSxlYrWrFMfisNBOhvj1w8RtDIgd9yTPCHrAShLyN0d9NBYHOO1ZuEPoh5QUsKa/KSiZNtXqSPAmU9QFva/eOjJVHZf5yvT43/P25j8yqwtzH4eGF+tg+Iih8YnsZ7tIf4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789751; c=relaxed/simple;
	bh=4SczZoJEjSUHbLzM6JBY7TbA3ZANhcxEFDhdqplyZ68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUslxGs6rbQTFBr6UiFzRmOKmD9JW38rIFVFU4aoIB/T5JPWU2EXw9Cz7QBC236CuBIZFsNrMR/2f4jEnM12IzsI4vooYL/5mkrgq+1YXnJNwD+LQim0ftPj9CqDTlEdQmWSxUxn4SwXiaNwlN53ZzBGRM9CG1WlXg3op0uazS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mpkGECk7; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3bmH22YKAPdkZ8EbQVk3aqZQBnzWSdw/b2y+dHwmsY0=; b=mpkGECk7DGobyCPn5QPZ75DaYU
	RsctmF9FeTIU/8IwwswM17rDnjeVRoojJDH6cnR+YrFAKaZMHgGJw3/zrzV2d9VwHKbLlJ2P/S6BZ
	H2Fea5GSXR5FjGwnjUWm8fOaWHo6W7sRM02zEgXoEf/KwHUzgrEFMDssrvh9+ohcFNudX4QOYkNmY
	EcKFYh84meE1vXQnaSfIweKGneo0k7iaXxgtCPhj2EfqrjwTah+obcX+fg4RqnrXommFti9O5iCac
	5a8swMJt8RihEkMbOcsMaZ7Wa6Z0oWESrgN8D/+UmTLhB3kGxh7/sWWTFw4ANy2eb9yw99azYHT48
	hX5iR8kw==;
Received: from 186-249-150-8.shared.desktop.com.br ([186.249.150.8] helo=[192.168.1.66])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w2dk0-002WL8-7R; Wed, 18 Mar 2026 00:22:24 +0100
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 17 Mar 2026 20:22:16 -0300
Subject: [PATCH] rtc: add data_race() in rtc_dev_poll()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-irq_data-v1-1-a2741002be60@igalia.com>
X-B4-Tracking: v=1; b=H4sIACfiuWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3cyiwviUxJJE3VSDtOQUc8sUU2PjZCWg8oKi1LTMCrBR0bG1tQD
 t+oPGWgAAAA==
X-Change-ID: 20260317-irq_data-e0fcd79d533c
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, 
 syzbot+2d4127acca35ed7b31ad@syzkaller.appspotmail.com, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6230-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.880];
	TAGGED_RCPT(0.00)[linux-rtc,2d4127acca35ed7b31ad];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzbot.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 418612B4552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The unlocked read of rtc->irq_data in rtc_dev_poll() can race with
the write in rtc_handle_legacy_irq() and also, theoretically, with
the write in rtc_dev_read().

These races should be safe (see inline comment), thus annotate the
read with data_race() for KCSAN.

Reported-by: syzbot+2d4127acca35ed7b31ad@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=2d4127acca35ed7b31ad
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Compile-tested on next-20260317.
---
 drivers/rtc/dev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index baf1a8ca8b2b1ea806c56b06926a03975b3636a8..8ba7c25d2565ef4139594976881aaee18e16a048 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -195,7 +195,16 @@ static __poll_t rtc_dev_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &rtc->irq_queue, wait);
 
-	data = rtc->irq_data;
+	/*
+	 * This read can race with the write in rtc_handle_legacy_irq().
+	 *
+	 * - If this check misses a zero to non-zero transition the next check
+	 *   will pick it up (rtc_handle_legacy_irq() wakes up rtc->irq_queue).
+	 * - Non-zero to non-zero transition misses do not change return value.
+	 * - And a non-zero to zero transition is unlikely to be missed, since
+	 *   it occurs on rtc_dev_read(), during which polling is not expected.
+	 */
+	data = data_race(rtc->irq_data);
 
 	return (data != 0) ? (EPOLLIN | EPOLLRDNORM) : 0;
 }

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260317-irq_data-e0fcd79d533c

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


