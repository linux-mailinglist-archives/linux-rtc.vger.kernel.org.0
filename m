Return-Path: <linux-rtc+bounces-4047-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F5AAC81E
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 16:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4191C42331
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 14:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72483280CC8;
	Tue,  6 May 2025 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUWXf7d1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C73145B3E;
	Tue,  6 May 2025 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542106; cv=none; b=JtP9ypTwdnQPlmHclP2mk8nFp/lMbp7uWL69Sl47XehLHSDIMYdCaU7ZSv2hVvdpy75L792Lg2doP6HzDs/YuXE+IiqCoAcoohEvcez5E/Qk77nzt+f1XsL6scGdN2Ri+KGzMKBHXJtiIC4b1IJSnw5P8cZ0Yy4Ex+gB5WCn+A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542106; c=relaxed/simple;
	bh=QoKV61VjHqxZtxwE8J2Yx21kvHpVjYSKwgUKFlhYTpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMNIzpmXTaJbpNw/2UKP5Cti22TxZqv8sR54/aMxMdoiFYRBL9pW0+QLqBDseVozBoh9g6wOn6zwuLAndxJayZ1SHi4YpNzcUz8EiTisNI/+FMndhGXObUG+5DVcIzHjwXSWCpl9yux3hQOVaumCWNhHtlVohRLzQwq4fZpua1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUWXf7d1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4F7C4CEE4;
	Tue,  6 May 2025 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746542105;
	bh=QoKV61VjHqxZtxwE8J2Yx21kvHpVjYSKwgUKFlhYTpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUWXf7d1oUw/M09w1ZiFhbmLgkKnaH/kgPityJH5By6GCpJGSTs1JA5jvhF7aX+sR
	 hnwFx1SL7DEDnoNL/rx33gNccScwPay6P2VYLWSZ1G+Mt49dB/jcok/NhhzkoXN9MU
	 EE5VtQbG5snv86bdOmLMivw1tPiZEkVztgaaWPWVLajZgjrULdt5LEGGucYCnZj2kT
	 KE9xirnngj0YWOKxUNgMPLaqvdVm5n2Dt6wXrWqqMfeTAKi29wl8IngTWqzJ1KK3xy
	 pobhKAK0R+Iu40hY8LUG9tb8g0axtnWhwljPQuW4HZi1UxkJD+BeQQm9OFAfHVys1d
	 5vKCMS7k2YebA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCJNt-000000006zd-1tJ0;
	Tue, 06 May 2025 16:35:02 +0200
Date: Tue, 6 May 2025 16:35:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] rtc: s3c: drop unused module alias
Message-ID: <aBoeFUbBKsNoqyd7@hovoldconsulting.com>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
 <20250423130318.31244-7-johan+linaro@kernel.org>
 <193c2c8c-df64-43ab-84ef-5e981fc31469@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <193c2c8c-df64-43ab-84ef-5e981fc31469@kernel.org>

On Tue, May 06, 2025 at 04:19:08PM +0200, Krzysztof Kozlowski wrote:
> On 23/04/2025 15:03, Johan Hovold wrote:
> > The driver only support OF probe so drop the unused platform module
> > alias.
> > 
> > Fixes: ae05c95074e0 ("rtc: s3c: add s3c_rtc_data structure to use variant data instead of s3c_cpu_type")
> 
> I believe this is not correct, but instead commit dropping last platform
> user, which I think was:
> 
> Fixes: 0d297df03890 ("ARM: s3c: simplify platform code")

No, as I write in the commit message, the driver only supports OF probe
since the commit I refer to. It fails with -EINVAL and the following
error logged:

	failed getting s3c_rtc_data

for non-OF probe.

> Just like in other patches here, these are old drivers and even if they
> have OF matching method, they can be or they were modprobed via board files.

See above, similar reasoning applies for the other patches.

Johan

