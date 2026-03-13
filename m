Return-Path: <linux-rtc+bounces-6197-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEwNNXrms2ktcQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6197-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:27:06 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D2281692
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A35AB302A56B
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 10:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43E038D00C;
	Fri, 13 Mar 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sMugrtBx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509823182D
	for <linux-rtc@vger.kernel.org>; Fri, 13 Mar 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397614; cv=none; b=RkO+xWMgmh6geIkMTprGJisNuxrsY8a0oqhpRj9+NEAsoWLVIUk9pLSowyuMU0wLtVYjcW6PIiP6R21KtkR6PgUYatbzIjyZCXz7YNSFbNiYnWuEX1yUM0FdjxqpO3ZiH/SzEnLCLn2sOr0a9j5LLgx+6ylRIWqrzvA1hx5Rsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397614; c=relaxed/simple;
	bh=OCZUyHaGL18x9/2jowdPDl9P04TpCCGPOYUKG7oUoc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDWwaY5EgwKz9mU3LgXyLjeBg/nAhcgRA8Of4LGT5z2L8kt/w19yFfQc3rTbaM+t0WpVD1SaNgTpM9c43MeruGiRF9RZ59/V0i5+46CZTAfnhHdzSLFYu3a63Vz1/kFn9u9ilWfiu0pLZNZgj254dUVDaMIn0Eg+VR/TSeXCoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sMugrtBx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 041A54E4265A;
	Fri, 13 Mar 2026 10:26:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBF9860027;
	Fri, 13 Mar 2026 10:26:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2849110369E5C;
	Fri, 13 Mar 2026 11:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773397609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VhyWFQlG5kM5a2LcSuo8L0gRDMTfjVWGWozEYXAOnsg=;
	b=sMugrtBx0yLiH03UfPyn/BFrI49T0ORFt8Lczv8U5tZbq44MujFu1fQuqBipJ6QUHEavAo
	TDndTnlvWQwRkYwQZHvM+Vsk7Vx+yvLjvnvhIwO1qgsb2fSWY0bDylLRPNY0o9s8GPTtps
	lEQpWs2e2xewcrgHXHhbz3/PJwlSLxhB4XG3LQp8B2Lfrfj2LkXjcePFYCeqXAkHGafXYQ
	ttp/VZol8kKFITwdW0QLwD5wjNI9O3oEvsjhJvrALpquDks0NQzmKjYIC74sLNXagF7dPy
	TicTJ6pLYIuJsbT3hLAF66+Va82rg0rmFvPordVErkasmBaH1nfeS0QpmQtoAw==
Date: Fri, 13 Mar 2026 11:26:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
Message-ID: <177339759096.2797383.7105613894300986419.b4-ty@bootlin.com>
References: <20260304225329.24510-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304225329.24510-1-rosenp@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6197-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 531D2281692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 04 Mar 2026 14:53:29 -0800, Rosen Penev wrote:
> Use a flexible array member to simplify allocation.
> 
> 

Applied, thanks!

[1/1] rtc: armada38x: zalloc + calloc to single allocation
      https://git.kernel.org/abelloni/c/5827fe59745d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

