Return-Path: <linux-rtc+bounces-6752-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id svBRLsxJPGrimAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6752-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:19:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B26C16C5
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=kD5+byKx;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6752-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6752-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADFEE30B72EE
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910073E5EC6;
	Wed, 24 Jun 2026 21:17:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483A53E5A3D
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:17:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335826; cv=none; b=FFV4ToPVtUEcEIN+T5yt5MfKFOfRUL4oOkgcomCXA60Gt2oDMXtxPLSMu+/6uurwCnb1Hk4emUekJG847U+iFAIqjysxl51cRKwcPoUjMW1itj7Fjz642xMZQguzxwYHqZVJ5xnHSMbPDqGiKQuNdETYEIsAEaCrJ0VqXZv9wO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335826; c=relaxed/simple;
	bh=gTgL8+lmpcwLCGQRY9Bku6JzWWsgcvLlNHfjosu22PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0+vz/a7GrJMNY3c7TRj8QzOKyoCPpIEsYenrFRoQxhB6P+C0xbdxuUH3pg3Tvh7UL/bYys68Efxzy4YRDhYTlcpVYCeXuS3XlvpAeF4F9XYwEJ8kdi/+vSsPqCBmbJKgakBQO6N4tKZpTxPVGwAiJgIA60iveLZHRSTcPyWzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kD5+byKx; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6F5D4E40832
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAD1160231;
	Wed, 24 Jun 2026 21:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB0A5106C8468;
	Wed, 24 Jun 2026 23:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335823; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6vl3xq+hXClGs1ERJsV1Z0QGdFCXYrK24EabUIuY8Ss=;
	b=kD5+byKx13lq1eJh9xcMXnU68KU2EqXOto0velsYWex0h80JPKoB8+KFa4XjATBlpeAWhQ
	o9weE5HaJA0SuJL6RrLL0JIdJM4EzrwH6OSe52rqrxmfL+2ckBpu3LtP1YBhNiKsBsNKgv
	dPi8BG3r9RLnc0KbyxDcB7IzwZb/dtSoNi2cxiyinqSFCOfayd0ut0Ak5WYpUTHorP/guh
	oAqpjbvfyfcJzxllgKhoerxd4OjsvJsxlcx1Ex3rLNyMqKroSDmAUqWglvT+VjXitxDxd8
	Nldk4J3hPgXSy2kqvqzMPYJAezTAet3iS+/8UUmwhc721M7clP2tTULv76gmyg==
Date: Wed, 24 Jun 2026 23:17:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xue Lei <Xue.Lei@windriver.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	xue.lei@windriver.com
Subject: Re: [PATCH] rtc: mv: add suspend/resume support for wakeup
Message-ID: <178233558824.1517260.7162256035683405937.b4-ty@b4>
References: <20260611023350.1370881-1-Xue.Lei@windriver.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611023350.1370881-1-Xue.Lei@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6752-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:Xue.Lei@windriver.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xue.lei@windriver.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 117B26C16C5

On Thu, 11 Jun 2026 10:33:50 +0800, Xue Lei wrote:
> Add PM suspend/resume callbacks to enable/disable IRQ wake for the
> RTC alarm interrupt. This allows the RTC alarm to wake the system
> from STR (e.g. via rtcwake -m mem -s N).
> 
> Without this, the RTC IRQ is masked during suspend by the MPIC's
> IRQCHIP_MASK_ON_SUSPEND behavior, preventing alarm-based wakeup.
> 
> [...]

Applied, thanks!

[1/1] rtc: mv: add suspend/resume support for wakeup
      https://git.kernel.org/abelloni/c/851d961ff248

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

