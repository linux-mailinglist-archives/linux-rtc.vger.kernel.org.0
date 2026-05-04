Return-Path: <linux-rtc+bounces-6460-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBrqIGDE+GlQ0gIAu9opvQ
	(envelope-from <linux-rtc+bounces-6460-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 04 May 2026 18:08:00 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3E4C12A5
	for <lists+linux-rtc@lfdr.de>; Mon, 04 May 2026 18:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7D6F3044225
	for <lists+linux-rtc@lfdr.de>; Mon,  4 May 2026 16:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB263E123A;
	Mon,  4 May 2026 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HhcvF79F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137EF3DEAED
	for <linux-rtc@vger.kernel.org>; Mon,  4 May 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910701; cv=none; b=qHmwKIK88Imn4slKS2wolIvOmlA+1BlSorTCiZGDLYrJ4xPi6SGtM+RPIaCNTUFw6yyKuaa6F5L+x4csGf7f7WjIZ3YILKcqomraqHzPtPwoqUkbkrwNDZ31fwM1JVXLEIhLsklADs/KqTvn5g1oq/jLTk1IM62KlljbVAyTYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910701; c=relaxed/simple;
	bh=pIChqJHK4QoVGzD8P8ZzDautQjyne7jnubA1InQLeA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUb2tNMZc0vOquVXp4qfWEK1t5GpqCKogyBjSYqXa6A09KwwjOSE/Lb2eArxnNcZHa7/2IIznR7D4BOsPRaSrOt5bKBIrme+Zq/afZCxrEm+YSp8NNYaQLvRYIJ3xZ8PIJvxjLBqzfUJAryqV5ic9ul0eEo6hvgXZSTh+Kxq8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HhcvF79F; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 773644E42BBD
	for <linux-rtc@vger.kernel.org>; Mon,  4 May 2026 16:04:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4514F5FD5F;
	Mon,  4 May 2026 16:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 114BD11AD2C16;
	Mon,  4 May 2026 18:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777910696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wYe1rF+N3ZLuSJkfqVJHQzeQ77pZlLLWMRDa9Ka0Sfk=;
	b=HhcvF79Fgl/gi878K+SULv3jDthK7CYvFrofeHDHBwnORhMPOU+HlEWKMJo9iOs7aHPrp/
	HJj5X16BDJQ/n8bfMIwyFFHOI+TwlRxFoqXPi9aW9/S7cJOlrE9PlGvnKSOZwn5VWO9oxs
	VBcHcENUHF9Y8o7yE3fr5wpH/24gcR9QkFo5IfE9BJTq0ruSchb24aY/4lmCWi1YjttRWi
	X2KNu/P74uM+NNFySn81yhxw/xy5pKuRugC8prV9cFdUlpeNadn87Ii2tSb+HQswSgtvyE
	6g599dza+1Ps5Upye6u/WHCb0O94Yjcd1n/e8WLkZvQ0v7/nK78bijnO6VyWTg==
Date: Mon, 4 May 2026 18:04:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linusw@kernel.org, Maxwell Doose <m32285159@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rtc: ab8500: replace sprintf() with sysfs_emit()
Message-ID: <177791068700.1168135.10171466794848460029.b4-ty@b4>
References: <20260503201236.29685-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503201236.29685-1-m32285159@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 2AD3E4C12A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-6460-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url]

On Sun, 03 May 2026 15:12:36 -0500, Maxwell Doose wrote:
> This patch replaces sprintf() with sysfs_emit() to ensure proper
> bounds checking. It also simplifies the return logic by directly
> returning the error after logging, instead of logging, calling
> sprintf(), then returning.

Applied, thanks!

[1/1] rtc: ab8500: replace sprintf() with sysfs_emit()
      https://git.kernel.org/abelloni/c/b72386864481

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

