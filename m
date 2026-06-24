Return-Path: <linux-rtc+bounces-6756-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tfqJJ5lQPGovmggAu9opvQ
	(envelope-from <linux-rtc+bounces-6756-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:48:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F46C196C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:48:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=pZl2biYd;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6756-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6756-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD42311337A
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C743EB81E;
	Wed, 24 Jun 2026 21:42:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15E3E8C55;
	Wed, 24 Jun 2026 21:42:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337362; cv=none; b=LV0M0Hn6hzgeuo4Crm7bwmdxU9yeK5hMNxRJsNFd27ZXEE9nnEKBfP5yM26IUOQZVevMnGPyaOPQdYDpx7ukifbs5CxbWfe51WA8QYod8FXtrHkqvRWTJ9200S66rtkYCRAGYr2fCdCctB7wfcmpkt6SPfBcO/Rm3G25F1CcjIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337362; c=relaxed/simple;
	bh=0RMM/boG+GaB588kmZxoY56SjoqBvNVJ+cICVOp23jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G70fDor8bjboMcOU8QsJX4Unz8XHWTbLUzS01fr2HhltlucjOM4Z1lC8Cs/EM1paPEj9yaJzT49ZuNRDDKMEN36tyuqdwXF1MuPQHX3WCFf+6rc8pcgJvtzWaG+n5wPvUE/xntMyg6Gsx9roZSkl5T62soN3vpeMh7i+g+ulcoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pZl2biYd; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 831104E40832;
	Wed, 24 Jun 2026 21:42:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 420DD601C5;
	Wed, 24 Jun 2026 21:42:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE5C7106C8077;
	Wed, 24 Jun 2026 23:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782337352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Py+lZqkgIXqXX6fzyMcdekYsc+HT7S1N5nEntrkRFqs=;
	b=pZl2biYdGQwMIEvHwAt9tU70J5DNwLHP9I2xBh336qsU/n0sp+dEYP7OoOV8UXvoWmXFt6
	tgfV6N4ibKi2C8rcBAMKOdYIT0g+EppKkjrZ7y9dkIALIG+XCk5KMVOBlRtKFKqRBXfwFS
	LGwoADnGgxYOuKn1F8B/AAXwpzIBqeTuGJxHiJUn4ox5flkFae5V5XJg/0VNCJDtG4vexh
	eTUYRkwWUVDxRxI1JhbUoHDjdgO3+Bl/uvs2zzYlh718dXitx3t1HEyJn4cFGY/iOX6LrZ
	mXJjHIw1PD9hNIMK1eCzU4/mXI8Yls9SbPyz8bAcQyELrmZsCI6lKx2Fzpwx5w==
Date: Wed, 24 Jun 2026 23:42:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adriana Stancu <adriana@arista.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v3] rtc: bq32000: add configurable delay between RTC reads
Message-ID: <178233723837.1527737.15397795714342862411.b4-ty@b4>
References: <20260416142151.3385827-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416142151.3385827-1-adriana@arista.com>
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
	TAGGED_FROM(0.00)[bounces-6756-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adriana@arista.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 380F46C196C

On Thu, 16 Apr 2026 07:21:51 -0700, Adriana Stancu wrote:
> When the RTC is used on systems without a interrupt line, userspace
> tools like `hwclock` fall back to a frequent polling loop to synchronize
> with the edge of the next second.
> 
> On the BQ32000, this aggressive polling can temporarly lock the register
> refresh cycle, because the continuous transfers prevent the hardware from
> updating the buffer. This results in stale data reads or select() timeouts
> in userspace.
> 
> [...]

Applied, thanks!

[1/1] rtc: bq32000: add configurable delay between RTC reads
      https://git.kernel.org/abelloni/c/d4992b7050a1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

