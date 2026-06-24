Return-Path: <linux-rtc+bounces-6740-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIyGMwdJPGqxmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6740-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:15:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71C6C1646
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:15:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="rbB9U/5C";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6740-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6740-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 651643048AF2
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C923E5A3B;
	Wed, 24 Jun 2026 21:15:18 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186C3E5A34
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335718; cv=none; b=iVVGbJEu6nJiBsQDFfcPjQ09Sh2m8SFmRn7xrbGGBsCgTttoL8jQjhxxmao1pEAk1N1RWqUMTb4DWu/Yk+5iQb+hZeatqJrk4727Y+OKSNAn6JHbEEa9sTzQOGGm+mxnPcrzZDQh/BX3BEE8jnUExshblDgwn47mWxFjtRA/Goc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335718; c=relaxed/simple;
	bh=0zMmiMYxmO59eZ6qVjic2K3wExDjUdUS48C4K7QI6YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7R5j/7kubB0WnY4zWdTxOUOsBnO1zEXRLzMav9hfzCkWPcKjxp3OkwhIT63sD12FqNY46ySWeRZn06BUe+OVt108aoqM//4UNIi9xZR3OxHSUfOcXOIbc46/bIKfQf4bmEFWWfsxEX3jxxVUG01ns54d32lRPirRN71cOKDkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rbB9U/5C; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 104871A094C;
	Wed, 24 Jun 2026 21:15:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D814F601C5;
	Wed, 24 Jun 2026 21:15:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3555A106C8468;
	Wed, 24 Jun 2026 23:15:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QHUKe+8hibFtqZIizuIRJ/nMgnVCIFJQfTduGfy+O+U=;
	b=rbB9U/5CIB9JHfTSD21Vrbl1Y9hUo1b+kLH0Jmg1EZ/UDm3WAMNhs2hI3R5DiihaLQ0gez
	lGv6EbKvYWw15t1T95U+9dsIkjD/fgqDQEY+C+SUeRKLmCDgaC6T5WsHuBSbLmOse1s5Vx
	jV/VguwM4JIQNROLOQY5IFgib0QvoG6DmOd7wMGTHcBeCbv3ZHaa5DKIfrgQ3KyfsSyvhP
	jvJcDCI7zranMMVuleWIL6S6snMYyGrsCjNjJcsaKUFB2pyTNAFz9PriYxrxBjsxO7poHb
	XdsnAZXkrq+nhpRt+6xPh3z4NaCBtWqlL9B3IWtRHpBpZDt8lsrjxG2njY+WyA==
Date: Wed, 24 Jun 2026 23:15:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v3 0/6] rtc: m41t93: add new features alarm, clock out,
 watchdog
Message-ID: <178233558829.1517260.8402947960501968336.b4-ty@b4>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6740-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:akhilesh@ee.iitb.ac.in,m:skhan@linuxfoundation.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhileshpatilvnit@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F71C6C1646

On Sat, 20 Sep 2025 20:30:48 +0530, Akhilesh Patil wrote:
> This patch series adds following to m41t93 rtc driver.
> 
> Functionalities:
> - Alarm support (support to configure alarm 1)
> - Square wave output support
> - Watchdog support
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: rtc: Add ST m41t93
      https://git.kernel.org/abelloni/c/b70598b3769e
[2/6] rtc: m41t93: add device tree support
      https://git.kernel.org/abelloni/c/081e3de28c76
[3/6] rtc: m41t93: migrate to regmap api for register access
      https://git.kernel.org/abelloni/c/d86e8682593c
[4/6] rtc: m41t93: Add alarm support
      https://git.kernel.org/abelloni/c/5b55ff7cace4
[5/6] rtc: m41t93: Add square wave clock provider support
      https://git.kernel.org/abelloni/c/5cb6816cd81b
[6/6] rtc: m41t93: Add watchdog support
      https://git.kernel.org/abelloni/c/15ec2ce19962

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

