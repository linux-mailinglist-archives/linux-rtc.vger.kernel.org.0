Return-Path: <linux-rtc+bounces-6494-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKf5H3SVA2rY7gEAu9opvQ
	(envelope-from <linux-rtc+bounces-6494-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 12 May 2026 23:02:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E11529CE8
	for <lists+linux-rtc@lfdr.de>; Tue, 12 May 2026 23:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896123026317
	for <lists+linux-rtc@lfdr.de>; Tue, 12 May 2026 21:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA063B9D8D;
	Tue, 12 May 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELpwMpxn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC83859E0
	for <linux-rtc@vger.kernel.org>; Tue, 12 May 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619761; cv=none; b=Wm7lUqJzDDu5X3N1H0NjssWjkxw7vjx2/s1j3DhGqs/qCOEf3JhbidJAzb1DBJCuDpsho6PSUaTE2RAYJQ0FQblPMCDMfuSa/avhCOFK83eMhPR/9uL/7Adc/+mv3ZKzJGZen9WUCGO5Ze391CKAqthbIq9R2c8NjGoREXED+B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619761; c=relaxed/simple;
	bh=Cj4Jd0ZCiqh6e8yFUopkofGnEstrcAQzKowPfmXw4QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvlO9XMis44ZR/CyPcHdHE4EiqqXiPd3N8oNhVmdZyGEqklFGD4Nhux8pLGLnTw3HN2H+vy9iqxyVAHuAq49Cu8TqcTK6SJ071Yclk6mwR+hwJspCLR09Nr2Pc5z739HpMRJNj8COUUU2IUbFkKMiQJoKOQ/jRchn/z5lX9g2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELpwMpxn; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so37732705e9.3
        for <linux-rtc@vger.kernel.org>; Tue, 12 May 2026 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778619759; x=1779224559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m03oRQ3XCCJ6ykhnNGCxBSIFoOQirR7Xo/tfavkFavA=;
        b=ELpwMpxn7UOPeN5coFLf/quTl7jbfDc89zMeprXPeG+XdQXnGC5vElaa8RFLIpFP5M
         gYEieNSKgD0wmTv1jgB4e1vQFUOqnIUIs6LGZAwtw/SSmgjvWSA8ssS/l9MV2VsLmruY
         Uk/ON0H8picUfgGz8hhBRqrFvZ1ZDNnbB9xCmn09mK4n+qz6zaYl9CZG9LU/H/vbwlSx
         kyWh2NxQG1iFAhlljffPXgTn7kkO7Fo4cE51pBF74vvGpn/6vbsCOEq4b5cJx12fMYOc
         iBAMciSVrC46MRLDsrtldsvargxpJJ9KgN5Pzi81vAfEv9t3aowcyN6jrdljawAWNL5X
         n8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619759; x=1779224559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m03oRQ3XCCJ6ykhnNGCxBSIFoOQirR7Xo/tfavkFavA=;
        b=bIcE3T5/2Hd9TIT4RHKcDwTb4urvI7L2On8qsOh6HVVRx3y/KFKGK3WUFmvFVl5Y/p
         w7KRsKOEMIlGn79LatySrHp4TS4Yxw7VUsQGitKechsY/Lu1VpIPMzLGxO4ACdiO0oKB
         OSFzUwk9Zciyde2UvzADdVDA55v/he/6o9Kq/iszUOzqBddM16Pj0HAuKrlO7PBvqOfY
         AAXxhiU+GZ6pWe1iDkCGIuindTwwP460EuDrjYaB0b460oMn5X5WgxEM2SfavWHoyeMD
         sqC7rH6tFnLKkjw89THc31MLtqfnNeYIqNzAr+BRG3IZ0RW2CQLv0TtSvhdCUGf2FS1g
         Tsmw==
X-Gm-Message-State: AOJu0YwNaTcRhRW23l3rSeAqg1MYm0Y3IYP7lPDBKzn5wG/7pxEIgwN+
	LG0VhLlTsb262DGyl2+5WWWoq5Csgdslf4N6L7gdonOo1AZnH6EZG35N
X-Gm-Gg: Acq92OH7fUa+ZC1jtGgzr0dde4PedmZ+dghowcRoYaf3nKdTJngT3UjdabwPyLG+VfW
	+D4y0ybus4w2Exfrfj01THlZwguE2A1UkTy2IJRclJ2EDHF0aVNBO+BYS481C8KhM/OUR3qNcZ5
	HSr9pwHk6K4iVe057LECpthabU0z80hgPYqZvE/4exHDVqpHysDDriKFmPY1dl2L6VPXhahKZ1L
	1KNCqXkvvnFJRw5qwMPWexwE4gkWtzEuOQQOkrZuHPwAQmXKO7GI0gRZ8+nF37Va1Ie25j96tOa
	vbqa4yrCAuZsEcZpmNnXYj/znUsNW6SJSCVnO30pr0vofNm315S+qCYnbpMkeRNjqNswr0YXYgj
	5SGhT0vBwobQ5ADcHcpRCf1R5SsEeXqNX3guTH6GHUdQJuVVo91nxrWAxYtrYHgktFghiNAMqMa
	ELpQOlnZZ10pelgR+aQIoxaTmr3Hqcd77WNU85LxXasWskE/Ls7AYzHtsLuT4CxpYKpY0qxpd8+
	v4hLQQp02f6otBD
X-Received: by 2002:a05:600c:4f14:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48fc9a32cd8mr6990235e9.15.1778619758948;
        Tue, 12 May 2026 14:02:38 -0700 (PDT)
Received: from y7-400-G2.tailb95756.ts.net ([37.39.195.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d21c72sm19666255e9.7.2026.05.12.14.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:02:38 -0700 (PDT)
From: Yahya Saqban <yahyasaqban@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yahya Saqban <yahyasaqban@gmail.com>
Subject: [PATCH] rtc: interface: fix typos in rtc_handle_legacy_irq() documentation
Date: Wed, 13 May 2026 00:02:35 +0300
Message-ID: <20260512210235.343070-1-yahyasaqban@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9E11529CE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6494-lists,linux-rtc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yahyasaqban@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fix spelling of 'occurence' to 'occurrence' and 'of' to 'or' in the
kernel-doc comment for rtc_handle_legacy_irq().

Signed-off-by: Yahya Saqban <yahyasaqban@gmail.com>
---
 drivers/rtc/interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1906f4884..d7106cb29 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -635,8 +635,8 @@ EXPORT_SYMBOL_GPL(rtc_update_irq_enable);
 /**
  * rtc_handle_legacy_irq - AIE, UIE and PIE event hook
  * @rtc: pointer to the rtc device
- * @num: number of occurence of the event
- * @mode: type of the event, RTC_AF, RTC_UF of RTC_PF
+ * @num: number of occurrence of the event
+ * @mode: type of the event, RTC_AF, RTC_UF or RTC_PF
  *
  * This function is called when an AIE, UIE or PIE mode interrupt
  * has occurred (or been emulated).
-- 
2.51.0


