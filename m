Return-Path: <linux-rtc+bounces-5905-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMECNZ3deWnI0QEAu9opvQ
	(envelope-from <linux-rtc+bounces-5905-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 10:57:49 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5F9F18D
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 10:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 911003058A95
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E30034DB67;
	Wed, 28 Jan 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j4+T0TQ8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="viqeemaI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995434EEE6;
	Wed, 28 Jan 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594165; cv=none; b=noEogXPSF5jivcTEryjNmQdjIocI4NaffkiRjY/eLaDixfE6tTwTHRUNnIkom2sht0oYHzzlKfymsR3kaHgzWvNRJre15wZugy+fu3uM4wT9vemKBrhtEaER4epUOyC/It186jikmiaD0NrjJJZMoeKNrZz+JQBfgJAFYQjSQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594165; c=relaxed/simple;
	bh=MV4zJVUPG0TIFSORt9w0lvMQpDktiQKvvR2tzf2EVf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHYfq2fUlNnKWZl8v1WMYRKFUGbksFjlnzS/VFgkumoKgOH3QqalL3hKaGZa8e9TU4rOGmrw4NkfCPvpSv7f9Hq5mj05DkQePJj4mE2ET6DXr8kSlmEgXMsUyipjg6igC25tZ2dgn97Fv8V4VOUeiysOWxxySLrT8C/mqvHaOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j4+T0TQ8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=viqeemaI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoKuQzz4G4oLOsx25HsiRvaTcp8ursPrum/xBovvjB0=;
	b=j4+T0TQ8lW523WIn7s+fI9XJqr/CcU5uvc8oB7c9QV9aqJQXp6va3K3zVDFks9mO8q1nrD
	IPneTxbqU3gGdZBGh4eA91PQTRILNFoPuUIE4hnfVn3IUcmyuuWejlMBKHLVsvn9KgKJTY
	YatitFONlGl82CrOOLK7sM2N9WlzwPJ6wBSRBLj7kt5ISwspaX7YH3/zvI/fqEmgZoExpo
	xsIYBxM+aV17p1OYBLOVryKrdaDvay4F+XOYBemcZoliLVUXnoFkfCkCnGVVEB9dk//pRc
	meC90TO67we4DAuIq4OCz/XBDJT/34tKuwFUCgUJVaUt+TtrU/kxQG6Ia3hCKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoKuQzz4G4oLOsx25HsiRvaTcp8ursPrum/xBovvjB0=;
	b=viqeemaInEUhQsuSncms6muvPmMDkjbulMK6W+g97Kd+7UqvoRvS/cvq+wzZ7ZUITxFPeO
	taBAp1KyQMorzTDQ==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 12/20] rtc: amlogic-a4: Remove IRQF_ONESHOT
Date: Wed, 28 Jan 2026 10:55:32 +0100
Message-ID: <20260128095540.863589-13-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5905-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,bootlin.com:email,amlogic.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 60B5F9F18D
X-Rspamd-Action: no action

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Fixes: c89ac9182ee29 ("rtc: support for the Amlogic on-chip RTC")
Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Yiting Deng <yiting.deng@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 123fb372fc9fe..50938c35af36a 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -369,7 +369,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->rtc_dev);
=20
 	ret =3D devm_request_irq(dev, rtc->irq, aml_rtc_handler,
-			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
+			       0, "aml-rtc alarm", rtc);
 	if (ret) {
 		dev_err_probe(dev, ret, "IRQ%d request failed, ret =3D %d\n",
 			      rtc->irq, ret);
--=20
2.51.0


