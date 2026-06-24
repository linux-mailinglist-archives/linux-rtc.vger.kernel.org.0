Return-Path: <linux-rtc+bounces-6754-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KqW3BOZJPGromAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6754-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:19:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 537036C16D2
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=TGYOLxT2;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6754-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6754-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A47AC307C944
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599933E5ED1;
	Wed, 24 Jun 2026 21:17:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF13E5ED8
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:17:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335832; cv=none; b=p8ILl3UhW2sCb6UKvBwVIgahu4O8HxKcT1Csgaq+cDP/Hoyr+nfyqasVTxgF7wmwq/x1faPWvhaUp8s376WCL6gGVKbsFZfShL/zWTXf9o8TwVlE5DDZClUe34+KMYDOZQ14COIakRIxulNM02hxZNPHvHWVlo4kuBxFDKuUE78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335832; c=relaxed/simple;
	bh=y/je1/4LTHI2AyDj4MWckz0MKjx6XCuqNoHBp0Cc9ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLx79ldtJyL6NP/j08tdDuO+B9DiYMNd5nOJJQyFGIVDYyatEnuPKtaPtGihEdiPp3Uu8j8wqMog30VLK7oYmrff7cEUdprg5DyW8q84sy7h1wmg3q6Xdcw3eSa+lxN5s+k9z3wghPA7g2HGICJ15wJEkRwJ1ef+KaBcnUzHQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TGYOLxT2; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1CF64C6B3BB;
	Wed, 24 Jun 2026 21:17:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01BF9601C5;
	Wed, 24 Jun 2026 21:17:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40949106C8468;
	Wed, 24 Jun 2026 23:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iGwXiogecWQIeW0czsq8Yitvo+dnH4pRmWAHTUn7Rls=;
	b=TGYOLxT2RgBvohQO9IyCcgUu5QLFjAsUZRKQRx06wFAoCeRqrxtKyihwHsBu5StNQINJoQ
	xtMDCw65PuVQdMmmEhAAzy5bXgssYUXTI5Ud3XNrbXhX0Gfk7kh72uMs4i5fw6IquAhvW1
	Z+Khz2fqqrZ60ZGF8lJEzunr464m3fkC+cp0sgNiv55Ml6VjvvzUoUQ+oGJ/ciyeuKELBZ
	ClzWORk5PjOowQMS44AlINgxF69sC4qXzSbLQGUYPahXhlJsuG3SWkIKlSUlHjBMlDs0sy
	Q22zCr4VXdhFyV1apvsFMIE+Gc63+X3JbKiapZ7cNYAJxVaoc8XPrcVehbZW7A==
Date: Wed, 24 Jun 2026 23:17:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yahya Saqban <yahyasaqban@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: interface: fix typos in rtc_handle_legacy_irq()
 documentation
Message-ID: <178233558820.1517260.11770752112296341376.b4-ty@b4>
References: <20260512210235.343070-1-yahyasaqban@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512210235.343070-1-yahyasaqban@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6754-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yahyasaqban@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 537036C16D2

On Wed, 13 May 2026 00:02:35 +0300, Yahya Saqban wrote:
> Fix spelling of 'occurence' to 'occurrence' and 'of' to 'or' in the
> kernel-doc comment for rtc_handle_legacy_irq().

Applied, thanks!

[1/1] rtc: interface: fix typos in rtc_handle_legacy_irq() documentation
      https://git.kernel.org/abelloni/c/4202e4254403

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

