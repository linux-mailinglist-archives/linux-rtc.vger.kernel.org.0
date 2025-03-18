Return-Path: <linux-rtc+bounces-3547-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C98A679BE
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 17:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D29E188C7A7
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 16:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB6B20F068;
	Tue, 18 Mar 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jywLj6os"
X-Original-To: linux-rtc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E687120B80C;
	Tue, 18 Mar 2025 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315668; cv=none; b=E+7h+P8MPfgPS0dy1Za3tcvjIo01+8jzQcRHe2a1Ftz0Cf42k7cQYmZhg6xwVnY04PqBb+r3lZKaQ/6x9Jvo1sRnO1lVO6ysyRy4YL1jBUYe69puE/bwmIOjx0OsbNIHI0+5i+iSTIVId4J316qpdATEf56FGUP3hz7JkX5jHLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315668; c=relaxed/simple;
	bh=QYVpgU/JnVBibEUQleZJc4F0Gpoil+DCeiCTaWOetos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fxsuuj/H0pS4qEYPQrwLy84gYuz4pADrIm+1/isDkaCf6+NqSnugiOVjp/3wFl3YRCSjOHk52Y1Qnerin1VgUO5sbcr4d1tsIPj+gydOnaoNDe8TW303jBxlXCJzd3P4kaW5lqkLNAHOzjIuYW5oKZ3NkkV0HFXzyF+NRWO2LIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jywLj6os; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=27p3Pwq5C7hMTh+bafs8ehvNds6RVGc6R4OEIt/g3jI=;
	b=jywLj6osPxSVV918SVu8wT8MWl+hL++mvWsnW54lb4Qbe6G5Aajp6m+zoj+Ydu
	xXMHWc6fRU7jbu5tpd+99cfNbkM3MRAr/jHLN/8kL5+YaJyxZY48sbwsyTkMj01N
	q6eEa1pNWZXIG0xKecGxTy/t6L0bXVv68i5hk6S7fn2/8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3B2p4oNlnSOcYAQ--.33983S2;
	Wed, 19 Mar 2025 00:34:09 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
Subject: [PATCH] rtc: Remove unused parameters
Date: Tue, 18 Mar 2025 09:33:58 -0700
Message-Id: <20250318163358.2524-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3B2p4oNlnSOcYAQ--.33983S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17Ar4fWF4xGrW8AryUGFg_yoW8WF17pF
	4q9a4YkrW8KrWUWryDG3ZrC3y5Ww4Utw1IkF93Cw1Skr4SqFykJFykAr12yr4UK3y8GF47
	tr9Ik398Cr1UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU5DG8UUUUU=
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiEBwUq2fZm+RJbAAAsX

The second and third parameters are not used, which could
mislead the upper-leevel caller into passing these two
parameters

Signed-off-by: 李哲 <sensor1010@163.com>
---
 drivers/rtc/interface.c | 6 +-----
 include/linux/rtc.h     | 3 +--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d..fa36d3b00308 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -677,12 +677,8 @@ enum hrtimer_restart rtc_pie_update_irq(struct hrtimer *timer)
 /**
  * rtc_update_irq - Triggered when a RTC interrupt occurs.
  * @rtc: the rtc device
- * @num: how many irqs are being reported (usually one)
- * @events: mask of RTC_IRQF with one or more of RTC_PF, RTC_AF, RTC_UF
- * Context: any
  */
-void rtc_update_irq(struct rtc_device *rtc,
-		    unsigned long num, unsigned long events)
+void rtc_update_irq(struct rtc_device *rtc)
 {
 	if (IS_ERR_OR_NULL(rtc))
 		return;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 3f4d315aaec9..e7a53295fb24 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -193,8 +193,7 @@ extern int rtc_set_alarm(struct rtc_device *rtc,
 				struct rtc_wkalrm *alrm);
 extern int rtc_initialize_alarm(struct rtc_device *rtc,
 				struct rtc_wkalrm *alrm);
-extern void rtc_update_irq(struct rtc_device *rtc,
-			unsigned long num, unsigned long events);
+extern void rtc_update_irq(struct rtc_device *rtc);
 
 extern struct rtc_device *rtc_class_open(const char *name);
 extern void rtc_class_close(struct rtc_device *rtc);
-- 
2.17.1


