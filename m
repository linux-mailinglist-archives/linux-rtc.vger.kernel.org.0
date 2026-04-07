Return-Path: <linux-rtc+bounces-6297-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGI+B/T41GlszQcAu9opvQ
	(envelope-from <linux-rtc+bounces-6297-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Apr 2026 14:30:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F823AE66F
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Apr 2026 14:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2339D3003BC1
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Apr 2026 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059D53B38BE;
	Tue,  7 Apr 2026 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG76MDqu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E5212550;
	Tue,  7 Apr 2026 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564857; cv=none; b=bONay60A8KLBHR1mzV+vhiHLfQKvlwqkLxozmW/m3uOWcFBPiW6VXKRsrgAeQ9udk12KxAmhNABM1tZ1YTZPQubL87K+va/T3d3ZX7nJC4Fi7QXXU8pQD4pdzOZ3QAS9GUHa13SotngpbLj2JBeVleZ8KZA3oV/HOAipNwIgckI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564857; c=relaxed/simple;
	bh=iR7CuEfVsqUz1O+m5IqArEL6lRG6Qz9YqeQ99dSNi4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZdiIC02sDHJaYxpL2oxDUj9S8POOggm1EVWHWs+IdsgrMyTLjjvc6Px9Po6qCIUHSqWonT1a9H5swP96CLez2wCNNV9ZuDuv4NqxLkXfRNJIPn/npOcLUtSORi30YP48M09o7ymOjccwVOdALvQhk7pEkv9DOJ4q8NtervobrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG76MDqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77368C116C6;
	Tue,  7 Apr 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775564857;
	bh=iR7CuEfVsqUz1O+m5IqArEL6lRG6Qz9YqeQ99dSNi4k=;
	h=From:To:Cc:Subject:Date:From;
	b=gG76MDquaB935HAdrGK5Du0cdHFqi+vhYVdWPpvvSVyvDz4eH7ODt1bgXVaoC4U4w
	 9Td+ErMw0aV/W44vrnIhTNUfN4Y/vE9Tnoea/rtOgNGViLKHF9FqqSHO1a7vbg1Dw4
	 2l055fBEIEnw8FvHxwwaNOM1TJlnJlZ6StOp739dwd398GP95pmKiuchOZlK15dS12
	 jAFQj6mIlFHL1ApVAJthvIo9qs5fsRcc1JiJs0Z++2CtVAcQmMWgkGrxQYvUBLPeSB
	 2oxevXi0cAUFbJXL253P4zE8RvnxRQAbf4N4PwnzHokcGkTiVUoqujAOcx1nF9kBSJ
	 f1N3BDEn2TtDg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA5Wp-0000000BEMN-0ruC;
	Tue, 07 Apr 2026 14:27:35 +0200
From: Johan Hovold <johan@kernel.org>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: ntxec: fix OF node reference imbalance
Date: Tue,  7 Apr 2026 14:27:17 +0200
Message-ID: <20260407122717.2676774-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6297-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.net,bootlin.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: E8F823AE66F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver reuses the OF node of the parent multi-function device but
fails to take another reference to balance the one dropped by the
platform bus code when unbinding the MFD and deregistering the child
devices.

Fix this by using the intended helper for reusing OF nodes.

Fixes: 435af89786c6 ("rtc: New driver for RTC in Netronix embedded controller")
Cc: stable@vger.kernel.org	# 5.13
Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/rtc/rtc-ntxec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ntxec.c b/drivers/rtc/rtc-ntxec.c
index 850ca49186fd..d28ddb34e19e 100644
--- a/drivers/rtc/rtc-ntxec.c
+++ b/drivers/rtc/rtc-ntxec.c
@@ -110,7 +110,7 @@ static int ntxec_rtc_probe(struct platform_device *pdev)
 	struct rtc_device *dev;
 	struct ntxec_rtc *rtc;
 
-	pdev->dev.of_node = pdev->dev.parent->of_node;
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
-- 
2.52.0


