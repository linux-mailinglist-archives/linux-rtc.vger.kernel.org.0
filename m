Return-Path: <linux-rtc+bounces-4729-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2AB2C5D9
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 15:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1D881BA3049
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9402D33EB1C;
	Tue, 19 Aug 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COYgvlki"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58D33CE84;
	Tue, 19 Aug 2025 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610534; cv=none; b=Lmn2ex8XjemZVo6JVKJKolMIjhFDe6QrtBokDqIaC1cO6bcOXf84PHT8ydOeZ3Uhk/iMb+X4dXOXJtkNqZL37OC35IiFHtQCbYIV8FR4DmZWsjVqM2WWprt6VX4dQTHTfOGo+nq0nfGRmBuACpmDStoS3ig87DpQ9G+v/4bRWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610534; c=relaxed/simple;
	bh=21MYMk6EDbZshX4F6YaaOm3J6l+vP3iaeBbvkcl1Nrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5g/YFwnplynbcIiRyD3engkiGhJRTCNX7tTjdNtOD26Zzf1yqYKtyQK0HcFBs13G+mTA0QYIqfx+ZCdWrLwkXWzqOqqggG0Vl8igaTUxG/+mEo1aKzgdhb0KqVXac18Nn/SXQts2k+eoLKOBBn1gJ3YXLnIt1GFBKSha6Ynp6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COYgvlki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F45C113CF;
	Tue, 19 Aug 2025 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755610533;
	bh=21MYMk6EDbZshX4F6YaaOm3J6l+vP3iaeBbvkcl1Nrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COYgvlkit94FrgDuTAFmmLQmf3vJNoWGB6yyEQVhfXnQi8TgdfL2BMeJuGsokhMLV
	 IGcsDG1Ctr3uBZIcioDK/zBbEbZxGjAEydyFdkr7ZhtmfTvKyible4jevW86vnAXRR
	 NmOtrfJAwLiHXD9Bw3WYTD0QVJW2rrFZB2n/DS4l5TLIvU3FqI0tpxN7YbPmYDn2o+
	 IWkAJn1+hlHmsyOJwOOFton7IDr7oLvL1ycRUzKCP2wc90rBY61Hl8La+v6C/UU+8E
	 o1lGQ3L4wDgBGxuq8C2vEHsTWdJ6mV8TSgr4P3oP0pGaq4tpQ8Ebw9QLIWUUEjP1yk
	 tbmKzAw6bYu3w==
Date: Tue, 19 Aug 2025 14:35:27 +0100
From: Lee Jones <lee@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819133527.GH7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
 <20250819123505.GC7508@google.com>
 <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>

On Tue, 19 Aug 2025, Sasha Finkelstein wrote:

> On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> > Separate patch please.
> >
> 
> Per the discussion in the thread linked from the cover letter, the dt
> maintainers have requested the bindings for all subdevices to be added
> together. Do you want a separate series with just the dt bindings and dts
> changes and the actual drivers in separate series or how do you prefer it?

I'm only concerned with the part I highlighted:

>  drivers/mfd/macsmc.c            |   1 +

-- 
Lee Jones [李琼斯]

