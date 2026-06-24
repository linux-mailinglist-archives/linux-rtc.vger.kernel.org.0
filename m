Return-Path: <linux-rtc+bounces-6748-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1nmjEHRJPGrJmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6748-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:17:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC586C1696
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=AKWL3j+z;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6748-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6748-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2780330156DA
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399353E5A3D;
	Wed, 24 Jun 2026 21:16:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8471D5CE0;
	Wed, 24 Jun 2026 21:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335781; cv=none; b=d0dacRqvAJ1y07Xpy5NlKjhwH4paO6W4qcx3wvIU6uVi0p4HWxwEemVesYmnpKHDcS20SXpuqDVL84hmaKWAzNCNxDcv4BEtIsQBBpGWbfGu07HqjbRZClUKOmd0SehxklxpCqfd8p9hcQD7FLezgIPDdtS3jd5rr9YCTYwPy6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335781; c=relaxed/simple;
	bh=QLULNfhq29XMMZO4RoEB1PaECna/JxZ0vqBUX5WerNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/LV4jgYZiJVEEo0myrL7h6VqQMzsidw18434LA0A02VCGtXI33TKJoFNBfxWd+oaxsTaxns/HZtZY1JOw9el/umliYdwqMNtpqwTkbW+GFjz0IeOj9Pm50UpINF427EkRCguVxLrIpiWviqEkIgqo25OsGrkkyX3ZdaDwMwBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AKWL3j+z; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D1CFC1A094C;
	Wed, 24 Jun 2026 21:16:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5B34601C5;
	Wed, 24 Jun 2026 21:16:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F04E106C846B;
	Wed, 24 Jun 2026 23:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Rg7jV6FtC3coJMWkUAc4o9nP5JzQoxsK641myuTG5LY=;
	b=AKWL3j+z1h+1edOaX1d1aN/ka3OYvAWmvbwifKZ5Eb2Wv7a7O7zef1iP/g0Wz/dX5x3o62
	OuFZYkZXAQrZSSK7tF9OPJ1feMwm4KxDOJqKDpEAkEZspNXEm0e2W2FKPxIXICt7ka3tkV
	1bYG5wzyk2ACkfbjH1/TWncWpZ8ac9a7lcZOotF7dlmdCm+FWQEnG9U66lbpZUlQrg6Szy
	iBJCZN8NIwypJH6daCqdahGx8ZFBVVYueHUgq4bphauygpp2RbMAfdpHbHaUnM07ZVIYl2
	m9Pah6v7NXRmSLndfmoyiLAw90n/sdVPoo2zLOZfNJ3srRi1VdmtmMlletWwqw==
Date: Wed, 24 Jun 2026 23:16:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tyler Hicks <code@tyhicks.com>, Sasha Levin <sashal@kernel.org>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <178233558796.1517260.7671121629764613994.b4-ty@b4>
References: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6748-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ronan.dalton@alliedtelesis.co.nz,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:code@tyhicks.com,m:sashal@kernel.org,m:meaganlloyd@linux.microsoft.com,m:giometti@enneenne.com,m:chris.packham@alliedtelesis.co.nz,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC586C1696

On Fri, 08 May 2026 15:24:49 +1200, Ronan Dalton wrote:
> Prior to commit 48458654659c ("rtc: ds1307: remove clear of oscillator
> stop flag (OSF) in probe"), the oscillator stop flag (OSF) bit was
> checked during device probe for the ds1337, ds1339, ds1341, and ds3231
> chips; if it was set, it would be cleared and a warning would be logged
> saying "SET TIME!". Since that commit, the OSF bit is no longer cleared,
> but the warning is still printed.
> 
> [...]

Applied, thanks!

[1/1] rtc: ds1307: handle oscillator stop flag for ds1337/ds1339/ds3231
      https://git.kernel.org/abelloni/c/a091e1ba3b68

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

