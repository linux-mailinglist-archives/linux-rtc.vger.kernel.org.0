Return-Path: <linux-rtc+bounces-5847-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD2rA99dc2l3vAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5847-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 12:39:11 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8D752EF
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 12:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DB08306B7B4
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C193570D2;
	Fri, 23 Jan 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HFvbAMH0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TL2boRjs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEF4346AC5;
	Fri, 23 Jan 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168243; cv=none; b=Inb+ZfBxCrxBxAlus6UBm68EWp+JG1g3VVgpSBKwA8DkPw69SG1V0tIA8Ap0pf+qwPSWiyaEwwbzKqjEUN7NLoWMi9BYU1tJytWT1NAfZyFl58yaIOB3MYggV8zLU4k9g2m6bSZoD1P8KIw2M58m8MlhhTKEU5fKlRTLapjy+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168243; c=relaxed/simple;
	bh=nk24K0bEl4BitwMmxO29WLGaNQeAc4TWqPhaRsUShEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5MdBKMpt9s319fXvqRj5aveAdBqDJwOJ9nK633E9pCVV5mulUnKBpCXGwLYyHdFSbdfqobprOjvhvw20eKMw2jfx0wwWqDBFbW5eXMTtU02nmiJe64Y9DUkIfEiFjrxuQDFPB3mGnQawyipjXFDGvuJA4ycMkjxOcu+5DvJd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HFvbAMH0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TL2boRjs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5Y2mY6Cv+HBbwUcIy8mBlx4YksTAUnqjMgEz3FoeqU=;
	b=HFvbAMH0Th2J1NOletGHPbs9P3Zrb7orBaP+xT9w3SFGu2KD1xIuoRW7Gwiqp5a69DarNs
	ZhIbznmDqinL7Ao4C62KGWzUc0Wo14IZ+BflU70z0PPwc+qcGc3u/eEdw3jseDM1uFBKjN
	bN8dZNP4/zj6VZDLm0glsL869qZwUEsmXOwZgtvt/1k+Z0PI9Tx2+txthQetlmgdDMRoeb
	0xF+ogCleu2o+8A+s6GXfgT/QVVVLCDH/4qqhfF1R0OjVx72FFNmGhxOYFesjteozCuoN1
	WApkITpex4NR7vJrRDvQsg5/ChQHDmXN8Ycn0G1u0c9CL4cLgBFwvRdyIazoJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5Y2mY6Cv+HBbwUcIy8mBlx4YksTAUnqjMgEz3FoeqU=;
	b=TL2boRjs4Jahyxe13RnYF5vB6LtjNWpivAhIPpkuT2DBVez0VyqZa/8jAKGzsi1iMdMtl7
	1S2Pq5GStMwXNWDQ==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 14/21] rtc: amlogic-a4: Remove IRQF_ONESHOT
Date: Fri, 23 Jan 2026 12:37:00 +0100
Message-ID: <20260123113708.416727-15-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5847-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AA8D752EF
X-Rspamd-Action: no action

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Cc: Yiting Deng <yiting.deng@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Fixes: c89ac9182ee29 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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


