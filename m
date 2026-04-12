Return-Path: <linux-rtc+bounces-6314-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL+uMqYG3GkgLQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6314-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:55:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3943E5F86
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C004300399C
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 20:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B45F37F8D3;
	Sun, 12 Apr 2026 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e5grjL1x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756B37F016;
	Sun, 12 Apr 2026 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027297; cv=none; b=FTftdhwCHV3F/E9B9WOF0yRi0Vr1w+mNNqyqa8d9UGIgdXwk9M66kqBXP4f1mlKMllIaAuVzhm3GIqeKPch06uNi+SW70vdqECUqjhKqk+xbAhb7FiupM2YAQmoxMZtr6/rm1EpHzkMfEAlx8it60gQXjXgzysgp9LKhOeQ/+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027297; c=relaxed/simple;
	bh=JgnDkB/9kfGW0qhDMSzACRY/lg2jFuAyF5Rw+5W0+X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6UsSJIa52nQ1+f5WKRYgzz7vRtLAzGCEn6Du8LPLMC5Ve5BMgbzBvR1oxImXvNLGd69phxRCY4CBjYEDa7YGTn1cZB5k+TE5gD6coigE10wFxanDQuuUgZm3ciKGMwhosUctslCVRtDrSfYGI53zyypKX8fGaKR9PBNSF2OPkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e5grjL1x; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3FE6C4E429E2;
	Sun, 12 Apr 2026 20:54:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 066285FFB9;
	Sun, 12 Apr 2026 20:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01F14104500EE;
	Sun, 12 Apr 2026 22:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776027294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DkmreSeOF6tVK6TvM9FYzgfhtfGfnhkMGODWKQyuItM=;
	b=e5grjL1xmihcOQbZ9hJC+KfO4+W7w0YClp7AbHtsIYnmnMoNehazns1tD/M/1neKn3sLv6
	yuuFuiaUC9xy/kBnBqiuj2duJIpblYyj84sIbIuN3NbEnZNDawrUre9H5/u62Z8+d/H3yR
	3MJie5lQzv60zcB0J+BdjJnZyt4BLfMZ5IYiO7yExLv9H6s1hZIilpV3ZN8ha2pgqoGgpr
	zYMiWrBzP3N2DV936Ynt9osY6DgdvrM1Pvje8Osofck7m+6zXmRkXhr2/Mm0SNiC0zYTdg
	3NDZoVLQQXIasKi02qsdeatWEUXiuqQppiFT3R3m0lbiE0FDHjxeQ3F1qPW36w==
Date: Sun, 12 Apr 2026 22:54:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Johan Hovold <johan@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: ntxec: fix OF node reference imbalance
Message-ID: <177602728247.2842050.14857102553395575976.b4-ty@b4>
References: <20260407122717.2676774-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407122717.2676774-1-johan@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6314-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.net,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 6A3943E5F86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 07 Apr 2026 14:27:17 +0200, Johan Hovold wrote:
> The driver reuses the OF node of the parent multi-function device but
> fails to take another reference to balance the one dropped by the
> platform bus code when unbinding the MFD and deregistering the child
> devices.
> 
> Fix this by using the intended helper for reusing OF nodes.
> 
> [...]

Applied, thanks!

[1/1] rtc: ntxec: fix OF node reference imbalance
      https://git.kernel.org/abelloni/c/30c4d2f26bb3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

