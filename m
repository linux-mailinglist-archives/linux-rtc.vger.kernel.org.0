Return-Path: <linux-rtc+bounces-2458-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A49BC30F
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 03:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FAC91F22AF8
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 02:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364132D7B8;
	Tue,  5 Nov 2024 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMRW/P58"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327AEAD2;
	Tue,  5 Nov 2024 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730773170; cv=none; b=dv8xwKqrLqLQpfR+Bl55SCQieAJCqiOacfed2u83Sfyql0+DYrybeYk5XtB2/xtpheqRWZoX2NHqSJtNduDIXkcsqCBDWLyVWlkHyfn56FreEny2YxkQl3VsvCVa2Ws9cQJRe+U0BDEUsHpi8on/5YEHaVsqnRakNZfA6Gv4zB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730773170; c=relaxed/simple;
	bh=i6G8GnDsiZTal/kkKMwzZHQjeFYe+c86hf3Q7lJ2aY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jKRxGQm9+qH4hkrfU+OadJ2hx44d7dLPPNdT4P3vrEruQ2UAiZt2Szl+3uE9JBSJ5jt3MuSClkQEceHhqfBnH0ulXVHUsUq+la2Wp9z5e00aPYD7D2QhZ+V3xDJyihao3KvvyxMWzCVKTlc29rCuV6ULxvS0kVpBtU9FAwiUQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMRW/P58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEF3C4CECE;
	Tue,  5 Nov 2024 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730773169;
	bh=i6G8GnDsiZTal/kkKMwzZHQjeFYe+c86hf3Q7lJ2aY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FMRW/P58uN3mjJ8SrWdDP0mhFAfKK7zPrETFDHL/9n22NRSWbbkb54D9u7+HF4wk/
	 NnGBXCkXXHWsHcYTTnclYG3vSbzPZeck/T+vGPEyDKh48tE1Rtrrj+c1454rH6IVrc
	 esV5TZESlpDGbIZUf3ipGTbUjCD676m7dllKj20mPee64zmCQi5oUAPjQ1VXn/X47c
	 1Bm9TZcqR9Xii+7aZ97dLV18H/6CDvMC8YasuD9JVfUHVxTpUDPfxbpxr0EzihWMW8
	 hyZN2V6OMjt8fwZWs3kUFpSLIpIHvUwIdFtQoZy0UMYvDtr2hPu8mqyD+0A3dpzh/c
	 QYXLEeDMTTDSA==
Date: Mon, 4 Nov 2024 18:19:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, Paolo Abeni <pabeni@redhat.com>, "Christopher S .
 Hall" <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>,
 John Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next] ptp: Remove 'default y' for VMCLOCK PTP device
Message-ID: <20241104181927.05a9485a@kernel.org>
In-Reply-To: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
References: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 02 Nov 2024 16:52:17 -0500 David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The VMCLOCK device gives support for accurate timekeeping even across 
> live migration, unlike the KVM PTP clock. To help ensure that users can
> always use ptp_vmclock where it's available in preference to ptp_kvm,
> set it to 'default PTP_1588_CLOCK_VMCLOCK' instead of 'default y'.

Good enough for me, let's see if it's good enough for the main guy :)
Thanks!

