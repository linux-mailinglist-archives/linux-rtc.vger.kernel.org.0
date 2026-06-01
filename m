Return-Path: <linux-rtc+bounces-6602-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IwsIsVvHWp/awkAu9opvQ
	(envelope-from <linux-rtc+bounces-6602-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 13:40:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EEE61E798
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 13:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06029300F61C
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2026 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BB636B067;
	Mon,  1 Jun 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlSgHH3S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE136C0CA;
	Mon,  1 Jun 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314020; cv=none; b=CF7SQMiMNnazj1udLfHvNYCTv7g/Tn1ad1QRBFTZpPyrR/qUy2h25EsaVkTGevwKk0WUL/hllokSZaXkObOvpUaxOGgmYViXwHWeUPEp8XxNtwnqj84IvxzFhnTtf2hb/Crs8Ub8MxNvJHfL3XWKLCRx8IKCOlGmHEUoZJB3ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314020; c=relaxed/simple;
	bh=g5n+pNpfqd7ObkQPa0mLolvaWZlGhlLZ5dvu3tVOjo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9m8UaoyRsIYt8fX4ebMmVFRtgDsjpdcFig1fJpNabwrTQH1d9Bkygrlsig6N9GBk6gkrnWDeDFDIxpCW4uZIm6y52gjYvwmesJ6NfRuCPsvgaZ7f36MO+rxsjpw0UNCjdadDNxFwQlCR4nmrc0qUmGPsuGyY4ppcluxqsmnUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlSgHH3S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9892B1F00893;
	Mon,  1 Jun 2026 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314018;
	bh=vyO2Y39ojBF2Rd5PpuF4upTFPXdvxVq0+p7BtDjiWjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlSgHH3Ssq0wt13AoXpWDUx2wFK63ZYexLOEWgB8YgbERbReMXKi8qgbNEettabIB
	 QeYg+4RLzI6bfBLxwxadQHgajwLKgwsHXHmBLxrm0Ay8mCuvTctcH+SbtZIyrC++BT
	 zyDzMUijidysVHB9b+PEVMImEUK4ijkgZY70o7thpj9nzRJzF6IsprUAzvtY4JuDQM
	 ckgIVtpkK2bt4lykPl3wxHyj+N6YYz3qo9RYZcwUGl0is6bwCEz6DGDrZGQ5Zhhwlk
	 C4V2p4L/MVU6nDSAKoSG6p9IbbLUM24tBhR8xDuhHwIYOGykekdxP77PDt6YYrPBW+
	 IaN25kRDO5tUw==
Date: Mon, 1 Jun 2026 13:40:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: alchark@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
Message-ID: <20260601-zealous-loutish-termite-ccfc8f@quoll>
References: <20260531171041.4149-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260531171041.4149-1-challauday369@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6602-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,brighamcampbell.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 17EEE61E798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 10:39:55PM +0530, Udaya Kiran Challa wrote:
> Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> controller binding from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v4:

My comments from v2 still apply. Almost all of them.

You a PMC binding and preferrably all this goes to that binding.

Best regards,
Krzysztof


