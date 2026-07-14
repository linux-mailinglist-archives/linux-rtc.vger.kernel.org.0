Return-Path: <linux-rtc+bounces-6972-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TN28CW2BVWpPpQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6972-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 02:23:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8874FD66
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 02:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bJUjcQhq;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6972-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6972-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4ECFA3008441
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 00:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6324D1D5ABA;
	Tue, 14 Jul 2026 00:23:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C8175A62
	for <linux-rtc@vger.kernel.org>; Tue, 14 Jul 2026 00:23:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988584; cv=none; b=Rr8P3ZLCl+Oyu0eJxkhWO1IdiuFcMJsb1YjgxDiaVumHxIUF50vCwazukXf6TRSzJU9Mxp2OhwdFrwsT5esNNciGixhwc/KBwQ90CX0FLoZS6ku6Y86i3cR3t3C1iFKWYCCrMcL6WSlL8dHjvGp0jI25usIqyu+FkD9t1ORqI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988584; c=relaxed/simple;
	bh=vVL7D6bBR374jSiyyxvCqD0AEU8LzCU+hQHuZ3TWJSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQAOlMqvxjoInSZrWd9dgLlacrJav5xrKM4q/l7cJVBuIl0ppcpIuKUpPAc5lQpfFSJFIF0yQaflm48YoBq1s6r/n4TyLpXWcDaxY5w87xUXr8qoZ1sCUD1PLWj5fSfwsskTKHqCaVSRkZYadCMP38gtQi7yfFuguGKjVrRPAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJUjcQhq; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b4066so3415829b3a.1
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988582; x=1784593382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=bJUjcQhqv34X8AZQ6Dfebhtt5Wq07sIXmdZZ8m70JQVyd3/5LCYuG3hKzVf4YsmhhJ
         1fo0YEiQSHvk9CfO5v1Fz8iCdwNUif2vAMHAWEdHuWDf/zdjhVfIvAHNqwnb/NH8P3CO
         eLruhiKYQsSK0mAk6+qdkEj4iXc8k66T+pavAMsM+QWv9TsbbdHZRAIQVHfXjtz1OA9I
         eny1L0rQaGwXyfdUWnzuO9vL3w6B4j+rs4V22sy0nTdAekHV9nmApvEa413pVtJRdmeK
         cH0iZNH+Dg4DrVAfduSTgn8ciGHhTuNa18jnPfcSKY7s8fU2SFNQhssmfR+Kk4oqEmQp
         i/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988582; x=1784593382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=pJtwVjQfUZffeXAy+11yo17TA/6Pbq9dlBZfMCZYqW5OWAo0TcQ68D356R9mwWnjAC
         xhQzLSJgyaXZ1+Pdk3/c/LEie9rWPlKKbMU8iIQcF/5Sn2PB4l4lQqDnV1Wpiu+HPwvB
         /1ffttaeZXY9MxFfBLRDye61aIlFhATp6WRPH4fls6iSGmCk6yP7HOR8/+S+rmL8ETCl
         FRdUMAt4nN9zvzTIwMKzFtazhNCcElkBjnkwBdm9CoKOzNboHd/6g80T9oVRN1uPpRI2
         5ejrAj8AGgn2wLMBC4baOwsyJMc/uy5XjIYY6ywBz4b2+Tv6jls46E7tHTsibbE8Kx4t
         ZPbw==
X-Gm-Message-State: AOJu0YyFqseqoXRV0aJxylmVNDn/J+CnCofjhbnTXJQ/5RjiSzxpON6l
	V3elB3Als+8ZHpRXrizIBHB7fqL6hoowIpN7SKIqBRdIkSx8MxE7RUBp/r99dA==
X-Gm-Gg: AfdE7clH6sOFICAeK3xwEyr+zyMa93kk0zOGAg//5JnTiFf4+agYh2veE2P3Q4g77iD
	MhmfYEohFIhb3slVWk7QWS1661mwDmbp3ZcG6CgWYnDdo4H5naXm20u3u8J4XLkVaWbtIO93E4i
	8SgRcBPsuCsuVMQv0P+eIzLpJyqb8fkQU0h8ojOSiVhqiuIufn86mnex5nhzhiarKSiIRaBFkQE
	pCNzJmNIEv4U8DaO5ET+H4iKiGnOjTJPRlqu+sQz9g0SiF/cVx2SB+85RQmHvqAmIG2Qa1ZUsPA
	oE87adXocRsOz/fWhaKEaPrnKufTkIXFBNmPpJh148ktFlH6o65005keBq0XL3kZlSbqtD5DJny
	ePDB3nYIYt4nsNOYoagzRkOlhB1UFjbr/SWMfQ7RDaIvpLgOR80cRJ2aim0OcGViq5I39W/aDKv
	FRe9AyHUU7R7qgNChImiHNiro6T82B9dZDb6d3h9gHF/s1CJVDUFfZ1DVkL901iQ/BUYD97YG83
	NPPw52nVWUNHy4M5wogR2rINkq3YEhF94FtSrlHYsGDc9qrI2qh+nmaeBgs7Bli0Q==
X-Received: by 2002:a05:6a00:3395:b0:842:83d1:ee6d with SMTP id d2e1a72fcca58-848896dd7fbmr10534315b3a.45.1783988582236;
        Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm473962b3a.23.2026.07.13.17.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:23:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: st-lpc: get IRQ via platform_get_irq()
Date: Mon, 13 Jul 2026 17:22:59 -0700
Message-ID: <20260714002259.1392655-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6972-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-rtc@vger.kernel.org,m:patrice.chotard@foss.st.com,m:alexandre.belloni@bootlin.com,m:nathan@kernel.org,m:ndesaulniers@google.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E8874FD66

Replace irq_of_parse_and_map() with platform_get_irq(), which resolves
the interrupt from pdev->dev.of_node directly and returns a positive IRQ
or a negative errno (it never returns 0). Propagate the error on failure
instead of the previous open-coded "IRQ missing or invalid" / -EINVAL
message, so -EPROBE_DEFER is handled correctly. The rtc->irq field is a
signed short, so the negative error code is preserved.

np is still used by of_property_read_u32() for "st,lpc-mode", so it is
not removed.

Built for ARM (multi_v7_defconfig + CONFIG_RTC_DRV_ST_LPC) with LLVM=1;
drivers/rtc/rtc-st-lpc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-st-lpc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index c6d4522411b3..ae79ddf24f37 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -18,7 +18,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
@@ -212,11 +211,9 @@ static int st_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->ioaddr))
 		return PTR_ERR(rtc->ioaddr);
 
-	rtc->irq = irq_of_parse_and_map(np, 0);
-	if (!rtc->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
 
 	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
 			       IRQF_NO_AUTOEN, pdev->name, rtc);
-- 
2.55.0


