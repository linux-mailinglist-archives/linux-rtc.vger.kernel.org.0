Return-Path: <linux-rtc+bounces-6312-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCwEJwAG3GkgLQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6312-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:52:16 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8D3E5F37
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 22:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F6303003634
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Apr 2026 20:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8517637CD36;
	Sun, 12 Apr 2026 20:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KDYR4rRs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AB292B44;
	Sun, 12 Apr 2026 20:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027134; cv=none; b=Rh9Lc4AKTbnSoO4fhkoFTjrTWC4WLXCbliwsO0o1dwlaJpZVHxbk+WyZfPMcofkNqE9WYrbFj0oUto+F530mxxtV2o51cCrdr0BG5oRBBYZCB6uyOieHn2LS8LapoJ9lSkMJ5L7Q1RuW73QSW/tq1rhSpzQplN4wReJein1HPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027134; c=relaxed/simple;
	bh=RS9tbXgFVKtD0t8Z04pC8hr116odLBrRQsUk2tAxDGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXEgmBvv3UDeza7BtOpBqy6BX2TLfqpf+p0tHOx0dGrH44u8A32D/iLuKTRYt1Jz3NTCbT9y/vXUIFMWxzuoa/PBz856UY2lFbQmDnWnVCjLWfE+rkG61VhpfSvhYnh4NhwFFQcWQQmgVJy+rJWxggPcBE30tb5Sd3oJYzVeSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KDYR4rRs; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97B8AC5C1BC;
	Sun, 12 Apr 2026 20:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48CAE5FFB9;
	Sun, 12 Apr 2026 20:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D069104500EE;
	Sun, 12 Apr 2026 22:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776027129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wT/c+GaN6QTV4D7XKeYNXiTJhAi4dghghle6IRNMIP0=;
	b=KDYR4rRsoNA5Q3F21mE4Xqj3yLI5MreAA3YUI9Bdqkx2aDWzieJUG7QJFVg8zcM0EOWZE7
	ZsZvHhiM9Xq9KN/BvgjVmbLVPDMicErQjv6BVgs//SyIYlQ5CNPODun5cY+cc6BkLJSrx9
	v7uSojLiU4oxWKRC7wqHG5G8Z0gWCK6D7Cyx6XrCW6pMVRBHM+rXcwwB9QFXsjW+SgTLMT
	1eKa5wM/6M/9ENSPkj66Aq9CzFtKtNx544AoGt9fInplRvUuf5b4UHC7CWmxgpyZuwgHQb
	mv33kP8rxPZ6fVbf2IQ5lvtyMys84xqSlfiK9m7kCeEi1naupaICTLoxGFJlLw==
Date: Sun, 12 Apr 2026 22:52:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: praneeth@ti.com, nm@ti.com, vigneshr@ti.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Akashdeep Kaur <a-kaur@ti.com>
Cc: msp@baylibre.com, vishalm@ti.com, sebin.francis@ti.com
Subject: Re: [PATCH v2] rtc: ti-k3: Add support to resume from IO DDR low
 power mode
Message-ID: <177602711736.2841110.1179102351115660780.b4-ty@b4>
References: <20260313111740.1492519-1-a-kaur@ti.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111740.1492519-1-a-kaur@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6312-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2AB8D3E5F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 16:47:40 +0530, Akashdeep Kaur wrote:
> Restore the RTC HW context which may be lost when system enters
> certain low power mode (IO+DDR mode).
> Check if the RTC registers are locked which would indicate loss of
> context (reset) and restore the context as needed.

Applied, thanks!

[1/1] rtc: ti-k3: Add support to resume from IO DDR low power mode
      https://git.kernel.org/abelloni/c/0e9b12ee74c5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

