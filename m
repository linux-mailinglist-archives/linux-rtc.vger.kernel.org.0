Return-Path: <linux-rtc+bounces-6313-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLUQCfgG3GkgLQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6313-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:56:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB843E5FB4
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CBF8300DDD7
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 20:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AFA37F8A2;
	Sun, 12 Apr 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YsBwfOIq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40843292B44
	for <linux-rtc@vger.kernel.org>; Sun, 12 Apr 2026 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027244; cv=none; b=UpBzyRyjibvoS/4HFjSUeqj1bMUgQEnme+zrFvl3iZyPMuquXRtR6B/qNEf/Jbb2AHWAwyC9Xq2i9pwWhfmJPA6bQYKYPgadrOClfROtukSdVqJij3za5wLgIYlYB4YgLcENvh0O2mb+1nkkzWfd/Nr9r/ibe+40TV+KwBFWzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027244; c=relaxed/simple;
	bh=/7Kk/mw9eZDXG4SWx6GoFuI/ylscHTcRwhi89Sb1OXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgb6HRf1/880O67b1loeDdii5FMt9CHUHrvrK+b1xLUnyjrndwENWJgaWnwAzmDQmXAMJ67ybrUoT9iXe1o/TUTS1kxduq2wOkOFf2hz1OTQrVw7ZZT6tOFIpcOR3VWE4LjEHPdJRI5fdDkQ0VwujpZJli6NhcIUpEEGsJX1a5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YsBwfOIq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D77A11A3220;
	Sun, 12 Apr 2026 20:54:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EB395FFB9;
	Sun, 12 Apr 2026 20:54:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 914FF104500EE;
	Sun, 12 Apr 2026 22:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776027240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CGXoSlpwYip4XNKntmCKcFKUocj4GmjBRR75GPfSo6Q=;
	b=YsBwfOIqmsn91Mfk3/7M3MJDLosCNug7rk3CmYNquvEwPkgSoNrCDiTplIMG/LsmN3XW/e
	Y/i2VZo/MT4RNhHrgCco02TUbsn6m5LY6A70mQYcd3Nol85+nCLdBsOI80UleBrZjsr3Yo
	X79Xd7LpOq7lJlk5qfqqdHgsFOdyPuvU2A0OGQBnBDsVQXVEVCdZc5nRTWwGQWsMgWIdWt
	o+9c5D5sDZ/zA6AbPxdWUWQGlq5cJQciuY8SeOl9/UEHdR5O8i6LdAo2l7WfI4ojU5SMyG
	Z0fDe0Gr6IY2R/nlTJupNbA0j3Ym7dgNMdX4ea/QCi6yN6x0liIfYrtTb8UJhA==
Date: Sun, 12 Apr 2026 22:53:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pic32: allow driver to be compiled with COMPILE_TEST
Message-ID: <177602720910.2841645.17735942845250851894.b4-ty@b4>
References: <20260222-rtc-pic32-v1-1-3f8eb654a34d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222-rtc-pic32-v1-1-3f8eb654a34d@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6313-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8FB843E5FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Feb 2026 18:30:51 -0500, Brian Masney wrote:
> This driver currently only supports builds against a PIC32 target. Now
> that commit ed65ae9f6c6b ("rtc: pic32: update include to use pic32.h
> from platform_data") is merged, it's possible to compile this driver on
> other architectures.
> 
> To avoid future breakage of this driver in the future, let's update the
> Kconfig so that it can be built with COMPILE_TEST enabled on all
> architectures.
> 
> [...]

Applied, thanks!

[1/1] rtc: pic32: allow driver to be compiled with COMPILE_TEST
      https://git.kernel.org/abelloni/c/095a3e886dd2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

