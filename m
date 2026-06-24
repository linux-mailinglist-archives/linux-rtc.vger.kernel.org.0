Return-Path: <linux-rtc+bounces-6742-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PHKsHwZJPGqwmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6742-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:15:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B16C163A
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:15:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ULvvy7iY;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6742-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6742-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657ED3010F28
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE38D3E5A3D;
	Wed, 24 Jun 2026 21:15:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E383E5A30;
	Wed, 24 Jun 2026 21:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335732; cv=none; b=N3bQTvKAQXsm0sYd5LanQqD4OEtusjmtYx75UqpqreYyGcFEb/aU8IqQapvqxhCtqXPhu4DnoGknf0t5SEcnLGKcD6BODkAuvCwv5sBPEgYtpn2qFVfE9tOYfZmUA00J6l8e2CT+y6j1PK476UNyxr/IBhT7ch1wblIHdZCsSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335732; c=relaxed/simple;
	bh=LIFtC0OLyX8fvpOBE2a+0lfHQ9yvK7gGxQi9+fQt2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq9rk4W9S1V0zlb/WkkL0dgbQ1EezCgwOTZnsdHDkq/Pxe3SNsc+/FTfKZOCa1DR+t9TH0Qzzo82HYaMIn0E41udD0GZKGSDPq1QWgbX/B4sA98A5e8Y8XJFFntLFQlG4wpJA+0OQSw6W5nB9ucSNXqqO4Uo0vaN0c/Q5OHx5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ULvvy7iY; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E39EAC6B3B8;
	Wed, 24 Jun 2026 21:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6B9A601C5;
	Wed, 24 Jun 2026 21:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EBF6106C8468;
	Wed, 24 Jun 2026 23:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OMVICeng2t9hCxf6AHkb44rBxjVwfeRsf4Llf5SZUrQ=;
	b=ULvvy7iYuEeC7wJwjrR1QLufvNoGFsvvAvyNDvYqCM99uvGN4nuxAyT+WfBOXjz2mSf6lk
	dQZallonkq56FaPY96L/p3kmtiaLKpc91eEIzItgEI/hbNZSbk4j6kBnGVqVgvpOoLQT+A
	ZakcsbWVbTwVrFZPIWoSM/vvrUM2hpvosWaGwzlNxNfpSwCmsbr+8lj40T0H1aSujLbQfI
	XVVWcyzJDw1rCZtOajKAzuJ7DPWjACHhxLfhepQNpFW0dmA1mK7VdMVRKHTRU8ymflgv0d
	3QvpDFFu450Wbrz4mTMN2XVTT4it9ShJ2u0wl9fjZgrGqfs4u9ewNhgoPcpKPQ==
Date: Wed, 24 Jun 2026 23:15:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: remove unused pcap driver
Message-ID: <178233558816.1517260.4014426316177717649.b4-ty@b4>
References: <20260527193927.3523952-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527193927.3523952-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:arnd@arndb.de,m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6742-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 610B16C163A

On Wed, 27 May 2026 21:39:03 +0200, Arnd Bergmann wrote:
> The platform was removed a few years ago, and the mfd driver
> is also gone now, so it is impossible to build or use it.

Applied, thanks!

[1/1] rtc: remove unused pcap driver
      https://git.kernel.org/abelloni/c/a50b23a57fce

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

