Return-Path: <linux-rtc+bounces-2607-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084249D5D67
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48C71F24767
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE5F1D6DA5;
	Fri, 22 Nov 2024 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M27819ws"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45418133F;
	Fri, 22 Nov 2024 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271975; cv=none; b=A6Q03AmeE0oLXrcr+BPe7LZX/JMtpwqzrESl5hn/5b7UlZsRuSpQIbdGLFKKOQSzyzJZUQPdtP93P4E0RcyijBdu3hfR17XEtzQq/WjNFs3KVCBMJ7cUd7nRCbjtJyzz2EItr7wLs+NShqiH4zbvxnJuahQFL7YzYUdJbQBp4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271975; c=relaxed/simple;
	bh=8fifDnFSA75+FxWf9yIkSc1x6x+Sy3nBrkjwA4JtshY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uZ2B+knlnKUViqXu6Z8eT52/70CD5AleE0GOQL76RKcOtmCFDolsJTIERcPLgxRY1bgy0umTU3I75qKkEFQC5iVxuMM6bKUAouPeVx2ts3G+f/o0Itigo1x42TL+VH47Fgf27dkkzYfR9MoxvRTXS9u7PoNam3X3Dc2l2Myadzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M27819ws; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24F5FF805;
	Fri, 22 Nov 2024 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732271971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fifDnFSA75+FxWf9yIkSc1x6x+Sy3nBrkjwA4JtshY=;
	b=M27819wsY9gEoZOw/7ha/XJQuehzhz4cflnAySZO8M4w901/iL4IqGHPjr5AdwAUENo5PJ
	c6rGVNYrNR0k+XhDZNozF5g+JCzxO6kCHDP2RvxgFk0BSG/Q68UYz4sXZ9WBbE/gW28Z32
	7cV7QVBYW/G+AOijAV3FrR3aPJvDjhdue/EmwIxVjgctGey8KyMOcEWUX9aJ2a3n5mLjht
	OGlI0e+WxNd1HNrmYnB1+zvbjbFiGuQ9D4qT+ksPvGdnIOgYPuqLrx4wnoE2EuQnVOhnd2
	PJqEmCP3Ty0q7o43dA/3GXiIzDWRJMQgEyzAR7DHXEoJEDDF1uC5z30kQHGHDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] rtc: rzn1: reduce register access
In-Reply-To: <20241122101448.4374-3-wsa+renesas@sang-engineering.com> (Wolfram
	Sang's message of "Fri, 22 Nov 2024 11:14:48 +0100")
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
	<20241122101448.4374-3-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 22 Nov 2024 11:39:29 +0100
Message-ID: <87frnjpn6m.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

On 22/11/2024 at 11:14:48 +01, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> This RTC has special 32bit registers which return multiple of the same
> 8bit registers at once. Use these to minimize register access. Also, do
> the to/from BCD conversions right away, so 'tm' always contains values
> as described in time.h.

IIRC it was easier to write the other way, but it is probably more optimized
like that, so

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

However I don't feel comfortable commenting on patch 1, I'll let Alex check.

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Thanks,
Miqu=C3=A8l

