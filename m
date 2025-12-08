Return-Path: <linux-rtc+bounces-5518-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D7CAE4AF
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 776EE300E92E
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE1D2EA169;
	Mon,  8 Dec 2025 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YDx/0Ho+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66D2F6197
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231823; cv=none; b=iKIoH5KzsWY6T0xPN3QA0KYtXUQ6FZaShyiUoZRKwd2s+dEhy6Va7xvRc4PigQLnWCfN9727Ter05ZJUM/CuPh//OjHaY7ZAMTDt1j34i8dNcqs9Vxlvlo2Dei/VsRd4KweOG0VnTwKbVmFvkA1AAeAqZWLmmBdffSlZo0co7Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231823; c=relaxed/simple;
	bh=uC/VUxI7Md3bxaAcQhmTuVDwcGqZHs3pInbWw5erD78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG+K+xe5xWJ9yYNBAAY2TKSn+ediz6n8n+4s65C/8rPGgNflUmiXltmVupouBAAfypud4UM5fiXcnCsnTs8gLdcumxQoieF+wXImmWo9qeDedGAfUVtCXanJpW2JPgZqQYoUkS77BpLtoDsiS96DEya2sQxqBA7vXGdaPOUM7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YDx/0Ho+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 647E81A2026;
	Mon,  8 Dec 2025 22:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39D71606DD;
	Mon,  8 Dec 2025 22:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8504D103C8DAF;
	Mon,  8 Dec 2025 23:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IUXL9+yLiJGwDKEPw83BLOjDomsLydCn5+qHUXMAL+g=;
	b=YDx/0Ho+43gmZidRo3Q2gK4ystFkxPV7gX+WsUdH/bSaggWol55ylR1jw8H81KkuMYuXUy
	Hbw4H5EsKG6CSDT8UFee6g2ZRBf92ZsXICOnVFaMd3sFUW7hAkuJufsdKGfU17QiDi14WN
	CGohPsgVK2ZKz+MQQDm3aahx15FThGV+LGHnBzPwL+djQiiUv04dxytVPDC34x2MEq8BQl
	U3pAnNy5wxqeIUlcoDiH/2MdjhU1MGGs/xCAV1S/wyGmlaBnHNdhF4LhS9OwaDEwzA8g8B
	rDSS1dA3tYSvKKktS2yFoyhnIY8EZ+Xs7FmZ+jzgrecILalBviMPoSYTffvjiQ==
Date: Mon, 8 Dec 2025 23:10:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linkmauve@linkmauve.fr, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: gamecube: Check the return value of ioremap()
Message-ID: <176523152355.342815.11295174896709907592.b4-ty@bootlin.com>
References: <20251126012019.1003-1-vulab@iscas.ac.cn>
 <20251126080625.1752-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126080625.1752-1-vulab@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 26 Nov 2025 16:06:25 +0800, Haotian Zhang wrote:
> The function ioremap() in gamecube_rtc_read_offset_from_sram() can fail
> and return NULL, which is dereferenced without checking, leading to a
> NULL pointer dereference.
> 
> Add a check for the return value of ioremap() and return -ENOMEM on
> failure.
> 
> [...]

Applied, thanks!

[1/1] rtc: gamecube: Check the return value of ioremap()
      https://git.kernel.org/abelloni/c/d1220e47e4bd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

