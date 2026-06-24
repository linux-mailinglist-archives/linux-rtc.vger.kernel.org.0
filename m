Return-Path: <linux-rtc+bounces-6746-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkuaBEtJPGrDmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6746-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:16:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB56C1681
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:16:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=UxzzLGJf;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6746-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6746-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA93304B2B6
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3653E5A3B;
	Wed, 24 Jun 2026 21:16:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48593C769F;
	Wed, 24 Jun 2026 21:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335762; cv=none; b=En5OofWztk5hvpvWex5QwmlmxH9hFNjcPX4yl0dwOOUt0wxgG/m/Q9XXs/zZEEpPrEl9OgbbdVB8FkSS8JOtPEB24fguF+D0gb9kD1uLewogctpPd2sIeBoSL3YpJ7Pdo+MYC+cAzsKLXSBkh7mt7JAbAFr3GjJuikF5QF7vKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335762; c=relaxed/simple;
	bh=6uJA7oAXYWb9sq8UylywV/3PqzIrlvufTZPG6wQ3CCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdiBIKKWH5yfBQAmp34MM545taN14xVPPlZy6tRYJv60kaLwW9H7o/EuIE+43qTaZtgKez2yFvn59DwOOTjSUO5T9zZQ8gelvWj7DD9euxao6CcL1IRu91FajcKeAnikBaUEpcJTh+3BztSkykYlIz1WzpYMDpMHwhIeeZ4g9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UxzzLGJf; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7CE5FC6B3B9;
	Wed, 24 Jun 2026 21:16:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 634CF601C5;
	Wed, 24 Jun 2026 21:16:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 751C0106C8468;
	Wed, 24 Jun 2026 23:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=jX/spYia6vgkjEvWJUg4hDpgZ/ho2W2OEzTDqRzUy3U=;
	b=UxzzLGJfHM37sB2R4rJxXjo+Maa+D1dX7nJL40PayVyGD1jbgLmRF0igTRbc5CiayCghoX
	zw0YF0bsnD0NLeEWdQvAPUy8bORCupPPAgMC7J1+5dA1RmZH6ydN5LZTkvpVdHTHyzsRGI
	AKZhDu0qDRfUWyKCGBEpb2qOF0Eo6W7roQK98ADN+frzYJ2jSlTZD6JgVZtcbIxM7RemmS
	j5+wq5TYePlNsecNvgNOibed2AO+FL1viUQOWHfsn+HClCOnIEKqZ2gE9cgBsoVhhsQA35
	65emRJEBWcwsfyGYkPeId3++BWQUtwlzpj7JclBZqZpchvHcXq1lnhALfqqYsA==
Date: Wed, 24 Jun 2026 23:15:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v2 1/2] rtc: Add rtc_read_next_alarm() to read
 next expiring timer
Message-ID: <178233558814.1517260.7453046865036017375.b4-ty@b4>
References: <20260521043714.1022930-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521043714.1022930-2-mario.limonciello@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6746-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Shyam-sundar.S-k@amd.com,m:mario.limonciello@amd.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:tglx@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CCB56C1681

On Wed, 20 May 2026 23:37:13 -0500, Mario Limonciello wrote:
> Add a new function rtc_read_next_alarm() that reads the next expiring
> alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
> which only reads the aie_timer.
> 
> The wakealarm sysfs file programs the rtc->aie_timer, whereas the
> alarmtimer suspend routine programs its own timer into the RTC timerqueue.
> Both timers end up in the RTC's timerqueue, and the first expiring timer
> is what gets armed in the hardware.
> 
> [...]

Applied, thanks!

[1/2] rtc: Add rtc_read_next_alarm() to read next expiring timer
      https://git.kernel.org/abelloni/c/947d7ea6f60b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

