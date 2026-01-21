Return-Path: <linux-rtc+bounces-5822-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDtYHz33cGmgbAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5822-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 16:56:45 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA7598A7
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 16:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2840AEEA81
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 15:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE5C346E6C;
	Wed, 21 Jan 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG5G/DOG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE2532F757
	for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010144; cv=none; b=XL6iTHYx49eQ0VrQfTqJY4/y+yyxyvdo9oGHynZHmkMH4gN51pR67HPFTsTDSdL50HpvxMPq2KL6isE8hjsiyozq9vEPFgOZ1g2CmUCu5J93wyBEnBx+KMtam9Tda0nO/eBHNWz/1zhsoQfFD9rHvFXjcE4koSwkkDDiksvH3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010144; c=relaxed/simple;
	bh=9fq04mqFyJjP0rlXTp40B+PvftHyOlsEqisPFkk+6M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0FRKPJLU17Ld6CmhJ93ls9EfEUpXrAVYw7gk43+7PDphsdxRWa/pSER2g74PNNWcyUezFivsij++0B7flyK/4V/wRKfQybP8hZlTWkDyW5zCvw8n8FTCAPOGJLVNj433kOXFE40H8oZSp/4n1VIO6/XIrXNN+jgOv82yOQMtFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG5G/DOG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c868b197eso5203a91.2
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769010141; x=1769614941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpAoccOlkN17xYVX07NPVkedqwZzmU1L7J4tt5wzb7E=;
        b=ZG5G/DOGm1KwVmPoYuLpL6/g37UM2RJv8Ib2Ht9KYR3DEDnUdNTT8SWWLRoXf4nCad
         avPvDDZ8Qu81mzHgTUZUJVn1KI3oqKYcwU7DzPF1EP9DOoEuN0inwqdCBD0z+M3HLH+j
         dOs1u3wHLinAVFchdX9g3dVLJXDBPc0oeN3yo4IBQQaRXooOr51avtm3YZFAl5N3mxQV
         Q86DwbsaoGocOoPEwy265e/hup5MHvYZsqUBZ4nmOxVqeqh5Pj+AK7uOsNDV4Si8xI9l
         1ybMLaCVL63Ei/1mfcYHaG04UTtBtLdtqfrcVul/sz75OdYh7KnpCav9VDP484g1xDOs
         Jotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769010141; x=1769614941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpAoccOlkN17xYVX07NPVkedqwZzmU1L7J4tt5wzb7E=;
        b=r1dEZUeUPGiMwSV6W+TNMAIhpy4H+b2bwOjC0H4MhYvcV8HOKvTXgIlX8mHvH1WXeN
         qlZeY+zLSXrAhwjddcdwTLdvHdZ5XOazrsh6pKAouyLNumWGGFILPFWan/2qC+/nDZk9
         9kOhkch2Zw9Zaq29hKb2pB2iLWOqPKf45G0rZ/TVfX2T2ZSXbWeAQbUlvVF16XBbEAiB
         drgUZvLRsY3TjiLnHyrxKQENUtOd5QZdxB0e2eJ78sETK2p+mEf3zCj6vzobFyPj3DHX
         HYktqbBHnY962S8r9IKqFjNNprcostaz0O/rDKeKzvplfxlR1TflPp5RKx+DHxHXKekR
         mw0Q==
X-Gm-Message-State: AOJu0YzwdT9VwfUGUBpmn9Vqmh0VYxRcL/FdHFw75nL3IbowSPqsWAM4
	4Hh/4HKKFdc/J3Axpa31fKghOSf7fhWlnOq8xYEUVAcXCX9r5NkoVGck
X-Gm-Gg: AZuq6aLPefmVTFr9WgRkvl7E8ANydCOEreUtzXH0nAuBdxcjsJTJnDav6+JAPPjbQ3Q
	K0KoUml1tlbHtgWcbzn2i+rWR1LVFNViv/ANWHmDJSrssIk+qhgKSbcvYBsAOoGyCJDhwueAlNk
	pyLpmu7ESLzTSBIcpnuGwg63LXzQFs3ZkebYGZ6uzEAY8IGSnsqbnXBAK8YpXd9rLegV3KpNbaA
	6da0CC3ebnTly1GfGekSgvDacxPjOoQ1xAL7oJkKn1akhUhQVeS3GuReo6ZmcJM1iHyRd3g+K4H
	MOdwXSghS/Sg9aJGUqqazrbf2FbaPXumAU5klYLNCuJoeoKSvpE4UqgebVbjpGQqGQ1C1CHoqHq
	8IAL2Rv46VcXYFlq4ZAnoWn9pgGPR2cnISo5dRqjVudP7DWDQpfOuOuQ2r3lEZiA6tj3Lc9qbRr
	KlMcnotYRht9o/lQ6Mu04PeZxyJft2ZF1KFNI4v87lrOzFuln/ztyIOx9x4IC++PKM58rwL/TNL
	t/QnlU=
X-Received: by 2002:a17:90b:5485:b0:349:9d63:8511 with SMTP id 98e67ed59e1d1-35272faec68mr14059968a91.25.1769010141271;
        Wed, 21 Jan 2026 07:42:21 -0800 (PST)
Received: from nickhuang.. (2001-b400-e258-8c0e-583a-0011-99ba-f03e.emome-ip6.hinet.net. [2001:b400:e258:8c0e:583a:11:99ba:f03e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353191d8f5bsm1705712a91.13.2026.01.21.07.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:42:20 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kusogame68@gmail.com,
	n1136402@ntub.edu.tw,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] rtc: fix spelling typos in comments
Date: Wed, 21 Jan 2026 15:42:15 +0000
Message-ID: <20260121154215.2360-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-5822-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ntub.edu.tw];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FROM_NEQ_ENVFROM(0.00)[sef1548@gmail.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 96CA7598A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling typos in rtc-fm3130.c and rtc-rs5c372.c.
- Change 'chek' to 'check' in rtc-fm3130.c.
- Change 'whic' to 'which' in rtc-rs5c372.c.

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 drivers/rtc/rtc-fm3130.c  | 2 +-
 drivers/rtc/rtc-rs5c372.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
index f82728eba..53271f638 100644
--- a/drivers/rtc/rtc-fm3130.c
+++ b/drivers/rtc/rtc-fm3130.c
@@ -465,7 +465,7 @@ static int fm3130_probe(struct i2c_client *client)
 
 bad_alarm:
 
-	/* clock registers sanity chek */
+	/* clock registers sanity check */
 	tmp = bcd2bin(fm3130->regs[FM3130_RTC_SECONDS] & 0x7f);
 	if (tmp > 59)
 		goto bad_clock;
diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index f8fab0205..92bea6e98 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -639,7 +639,7 @@ static int rs5c372_set_offset(struct device *dev, long offset)
 	if (!steps || !(val & 0x3E)) {
 		/*
 		 * if offset is too small, set oscillation adjustment register
-		 * or time trimming register with its default value whic means
+		 * or time trimming register with its default value which means
 		 * no increment or decrement. But for rs5c372[a|b], the XSL bit
 		 * should be kept unchanged.
 		 */
-- 
2.43.0


