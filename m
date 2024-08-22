Return-Path: <linux-rtc+bounces-1696-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF57095B432
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 13:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861001F24293
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 11:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80C91C9421;
	Thu, 22 Aug 2024 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOffhufb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0E17A584;
	Thu, 22 Aug 2024 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327395; cv=none; b=NSEUyLf06HP6bGx7TY9tPAjfCsejnNx1YPOJ09d54o+WsTIYM8TH6hqpqKJaRCCZ36bKKTyEXApIplK/N7fjAOw8LXsWY4pPc/emclbVfADXMXitT4bCKFA4w01kRWnaB4CJgTYk16bRdOZ5tbT2txUIAKatjDSnHOGC2fr1t+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327395; c=relaxed/simple;
	bh=Dt4LFrbNnXt5IZdzzmCGwGIQswW/M/ytO2I8SZAYO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8tncesC7B1Ayf45GPyLFNBhgGOuSkgOwPgTecu3ogs/o4FbzG7gjuEO4jr/NGMm66uy0oTY1w0nlUDnCsVa1GZSjjDDVX1WwPrrGc77Lsx5HGJpU+CFQjgZI++8IfxV+JAraxYSGJ3EnsIW0Rp6/FP7/zVjPjGm0621kp1TroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOffhufb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C597C32782;
	Thu, 22 Aug 2024 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724327395;
	bh=Dt4LFrbNnXt5IZdzzmCGwGIQswW/M/ytO2I8SZAYO2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOffhufbh+OB6mKyaAl/rLeZHOr1Z1boFD8T3qeWC6ZAHyUeZoJInBFPSHpnKDphg
	 wHbxTpD1Py+lmvdiCRHhssuSYRZic5RSnq6IIY8u3fRxAu9emOdnV1q1HuT1cNeXZb
	 vswlvoDOWx2TqKmcBQT0q0GNYdq5KlfQIcUE4s0ib5ZzJGuxK5sUAsciKHp52yuFqY
	 WQxNRWKMTjleOk9KbFlmU444hnywblUsCrHBHuVTce0IMwkVvnH0FF4KO+MTnzSJCu
	 B+Qr4TFYcZZl8GWr/Cmkw5WyeIUwQMOvIoMrVEHspAtORoIyqFlI82+0xfokZK3+dE
	 N6rckoG/TIEmg==
Date: Thu, 22 Aug 2024 12:49:48 +0100
From: Simon Horman <horms@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Chashper, David" <chashper@amazon.com>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
	"Christopher S . Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4] ptp: Add vDSO-style vmclock support
Message-ID: <20240822114948.GM2164@kernel.org>
References: <410bbef9771ef8aa51704994a70d5965e367e2ce.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410bbef9771ef8aa51704994a70d5965e367e2ce.camel@infradead.org>

On Wed, Aug 21, 2024 at 10:50:47PM +0100, David Woodhouse wrote:

...

> diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c

...

> +#define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
> +	(_c)->size >= (offsetof(struct vmclock_abi, _f) + \
> +		       sizeof((_c)->_f))
> +

...

> +static int vmclock_probe(struct platform_device *pdev)

...

> +	/* If there is valid clock information, register a PTP clock */
> +	if (VMCLOCK_FIELD_PRESENT(st->clk, time_frac_sec)) {

Hi David,

Sorry to be always the one with the nit-pick.
Sparse complains about the line above, I believe because the
type of st->clk->size is __le32.

.../ptp_vmclock.c:562:13: warning: restricted __le32 degrades to integer

> +		/* Can return a silent NULL, or an error. */
> +		st->ptp_clock = vmclock_ptp_register(dev, st);
> +		if (IS_ERR(st->ptp_clock)) {
> +			ret = PTR_ERR(st->ptp_clock);
> +			st->ptp_clock = NULL;
> +			vmclock_remove(pdev);
> +			goto out;
> +		}
> +	}

...


