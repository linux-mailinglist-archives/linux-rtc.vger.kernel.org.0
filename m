Return-Path: <linux-rtc+bounces-1436-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177C91E44F
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jul 2024 17:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BFB1C210D6
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jul 2024 15:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBFD16D315;
	Mon,  1 Jul 2024 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l46ptC4F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACB16CD03;
	Mon,  1 Jul 2024 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848348; cv=none; b=ese8iyJz/3STI5CkblYEnIMyH4N9oAK4+WEOJRI8m13PA8zjHC91MfTPw5/aRUI6SjFz6SjPD7p3hMxZGdw+69iWxuSjKi5jKy6jWbY/t4qOXOWcNzY8HYjiR+uPQmHfotbhlRD4r1/7jw4kzrEJnblq5Q3aeRs1NiC7EsLO20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848348; c=relaxed/simple;
	bh=CDbBeTvr+5wXXFfoeHEpMAUlbiSssKcGL82z6iSD4AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doTx2F05IEfxdP7IONtlhl3WL3csxKna+9R8RhFseQ4WCV5l9N9eITy3tHudG0FtjE4Zt5TQQ9gxN1hYGKfK7qIlOZN9225VV4EmQjvB8sT62fI1HcX5duOYSSVAkgtvfgVaKDSfuGXEumQKqn7krz4el2YwgbDAWKZr8brhc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l46ptC4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64C5C116B1;
	Mon,  1 Jul 2024 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719848347;
	bh=CDbBeTvr+5wXXFfoeHEpMAUlbiSssKcGL82z6iSD4AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l46ptC4FnytzBDrRTiI8bdZeLXfZ/OOkiV2dJLYek3WJy798DwuCGPq1Jnese3bY4
	 ci6cAE9Ld7TwCvCx1RPIG4McMNKrwm4lLCtHPLW+u6pAHjqBzB8HKev3jFcAyHx8Vm
	 XUtHDM4nAgNYpe3cllG9KYS3tKtSQYocl6CSqnm97s5i9ca/CZ9kSpcCF3rFUjBidE
	 jU9OF3ULjEsj5l1vcKpexfAdZpKWyBjXO1G6J+/2ZSf5vGlBedTzHBJi9qaHKAGrpt
	 CUNN5Ansmav+fHoHAwH7CCfv3kO0g6vc1p7dUSrEDkxqVb5k7bro2ok8EBCGLOQc2B
	 8JzKSwZs9BjEA==
Date: Mon, 1 Jul 2024 08:39:07 -0700
From: Kees Cook <kees@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Simon Horman <horms@kernel.org>,
	Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Christopher S. Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
Message-ID: <202407010838.D45C67B86@keescook>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <20240630132859.GC17134@kernel.org>
 <4d49e640143a557861a75a65678485965611b638.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d49e640143a557861a75a65678485965611b638.camel@infradead.org>

On Mon, Jul 01, 2024 at 09:02:38AM +0100, David Woodhouse wrote:
> On Sun, 2024-06-30 at 14:28 +0100, Simon Horman wrote:
> > 
> > W=1 allmodconfig builds with gcc-13 flag the following.
> > Reading the documentation of strncpy() in fortify-string.h,
> > I wonder if strscpy() would be more appropriate in this case.
> 
> It's never going to matter in practice, as the buffer is 32 bytes, so
> "vmclock%d" would never get to the end even if was a 64-bit integer.
> 
> But as a matter of hygiene and best practice, yes strscpy() would be
> more appropriate. Fixed in git, thanks.

Thanks! You can even use the 2-argument version. :)

-- 
Kees Cook

