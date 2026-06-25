Return-Path: <linux-rtc+bounces-6762-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u+fdCYwiPWpYxggAu9opvQ
	(envelope-from <linux-rtc+bounces-6762-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 14:43:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B279D6C5B0E
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 14:43:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=NAuZKHz5;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6762-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6762-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27E1730022F4
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 12:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8313E3E1D17;
	Thu, 25 Jun 2026 12:43:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B933E172E;
	Thu, 25 Jun 2026 12:43:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391433; cv=none; b=HZsFAg7c756SlH3AZOMOxF804e19eolJjZkcf1s8EeALJDiFta6XvngMw9cyA289o0Y//6zuvJDP7cADam+Hhwt0oIwAJTtgkQKe9zPH/Bck3iZKhcjessI0VJZooa1FxNdbvxzu0CbTKoax2fwV3R8qllB+GRe4YKEDK7W/jKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391433; c=relaxed/simple;
	bh=7Ht0CHhlya6/viuKJgJ+qOX9L4qYHbHXPYw+ZSlYgjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8iVUXGuuEk07IENR64De3hMNlXHj3CScd0V3lCVbWXB1o+LTHr/MxhDaiwwyYJjjsaqJp3qH8lamyyhT/FJNwIfCZMUVxXbVLX+x/MyZOw6Fu/7VXyz5kPScUR0DWKIVKGWRwxVE8Uzqhe99JTwrX2xtS2Ju8vtA2B79nBkIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NAuZKHz5; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E28271A09A8;
	Thu, 25 Jun 2026 12:43:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B53945FF03;
	Thu, 25 Jun 2026 12:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48F29104C973C;
	Thu, 25 Jun 2026 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782391422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tuVo9EOR9f+Ioh0VbmHAcwroaayMdh8xeHIayvllSUU=;
	b=NAuZKHz5XphfLMtNUvm8EFcxIHNTZnJNimDsy2xs/DIYqqV/rONXteJySUvock05Frakp7
	x/rB3/+wmyFKST2/ljz9g94fThO7Apm36Ne1lCWbGDNInnOeHhEXvY7GW0c7ZenTvLtqZH
	M69kcgIPmvb3q9FGjiEo2k6+lx8f35mhVHCnmeTPdqGz/lpDBBLVeVBCc0DtbSZDAsjlh1
	OX/BPCa6DK6b99zkXumZS2Vt2EVhoiH1COFHWj+/7IbC2U+F9Gxj7AiobJTcTjqGYE42U0
	8Gd6Lkdie3tb76t5CFwsDlmPlOWtgpCAiODYC3UKshBJIjtqu+1NC70hMAmTAw==
Date: Thu, 25 Jun 2026 14:43:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v2 0/2] Fix S0i3 wakeup with alarmtimer
Message-ID: <178239140188.1613320.1695497134037536107.b4-ty@b4>
References: <20260521043714.1022930-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521043714.1022930-1-mario.limonciello@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6762-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Shyam-sundar.S-k@amd.com,m:mario.limonciello@amd.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:tglx@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B279D6C5B0E

On Wed, 20 May 2026 23:37:12 -0500, Mario Limonciello wrote:
> It was reported that suspend-then-hibernate stopped working with modern
> systemd versions on AMD Cezanne systems. The reason for this breakage
> was because systemd switched to using alarmtimer instead of the wakealarm
> sysfs file.
> 
> But really it uncovered deeper problems with how these timers work.  Adjust
> the code accordingly.
> 
> [...]

Applied, thanks!

[2/2] platform/x86: amd-pmc: Fix S0i3 wakeup with alarmtimer
      https://git.kernel.org/abelloni/c/f7ecfc3fe575

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

