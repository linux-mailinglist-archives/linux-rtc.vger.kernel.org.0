Return-Path: <linux-rtc+bounces-2354-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E69B362B
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 17:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8A8C1F22710
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 16:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9CC1DFE0B;
	Mon, 28 Oct 2024 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0q+lkSK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383C1DED4F;
	Mon, 28 Oct 2024 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131979; cv=none; b=ABjNfRRe6WpvwB3rd7Yz/ffbaDXqU/vADN13n7D3yDuV/F+qRfziFGurIP2aU9B0MkG2/ZCc/rOOqtywEArJdOkhiiubu7XtyJkHHeh9c5Z0JQqtOLI4O7pAe76cM740nFONaLHeKOjuZ5VHUBSjYCWLezv13zIlRGf5+/LN05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131979; c=relaxed/simple;
	bh=xuzSVIC+24hcvUH3Uu6IJyxDoI8NF9z/u0YhE9kqbOY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNVP7hAqgExtXzxI3tlfkFXEQ2r0Oh9VSkcLoHN6QV+2RQCU6kL3CW+ZAP/NxVW14yT9xT0dmL9dKEgVRLYLbS8DHPjoPv+Z+Tpjruwq9rEhOBkjiE0niCqhpShKnshaYzgFDRP+drXMRIipma+Z8ZaiegD/BQozJXkLFlMxVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0q+lkSK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1B6C4CEC3;
	Mon, 28 Oct 2024 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730131979;
	bh=xuzSVIC+24hcvUH3Uu6IJyxDoI8NF9z/u0YhE9kqbOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C0q+lkSKR1cXdmfA70QriKxNHoGAVcH+ZKCc+Zox4ygDHb48qTdn8VuHT2A4+o5V2
	 zoili6j4ZeZdYddsbvCBmzv4/WQgpSj7kTlw06ahaK4hCP3zTRP9o3R85+DvpU2GYF
	 JOfOD4cd4nqkmkIlo1feNr7WS5I7Lq9w9Ag0huIfm0H86flbsmELoeR1CWqpKwnAA6
	 NYQH1pJbxeuWuW0ou07d6MW7v+ovxkDt0VgRA/OeSEyVzpisDjPRrKkn0IRURMLEiE
	 huG9vkW7i5jsybC0co+F32KJLuGZov4R0mWfhQFuXfe18nE4zlmADox5tRHMwhBpHw
	 r+wobvKfES9+g==
Date: Mon, 28 Oct 2024 09:12:56 -0700
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
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
Message-ID: <20241028091256.1b0752b4@kernel.org>
In-Reply-To: <c1eb33ffd66d45af77dea58db8bdca3dcd2468c4.camel@infradead.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
	<20241009173253.5eb545db@kernel.org>
	<c20d5f27c9106f3cb49e2d8467ade680f0092f91.camel@infradead.org>
	<20241014131238.405c1e58@kernel.org>
	<c1eb33ffd66d45af77dea58db8bdca3dcd2468c4.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024 18:49:24 +0100 David Woodhouse wrote:
> > Yes please and thank you! We gotta straighten it out before 
> > the merge window.  
> 
> Hm, as I (finally) come to do that, I realise that many of the others
> defined in drivers/ptp/Kconfig are also 'default y'. Which is only
> really 'default PTP_1588_CLOCK' in practice since they all depend on
> that.

AFAICT nothing defaulted to enabled since 2017, so I'd chalk it up
to us getting better at catching mistakes over time.

> Most importantly, PTP_1588_CLOCK_KVM is 'default y'. And that one is
> fundamentally broken (at least in the presence of live migration if
> guests care about their clock suddenly being wrong) which is why it's
> being superseded by the new VMCLOCK thing. We absolutely don't want to
> leave the _KVM one enabled by default and not its _VMCLOCK replacement.

You can default to .._CLOCK_KVM, and provide the explanation in
the commit message and Kconfig help.
Or if you feel strongly even make CLOCK_KVM depend on the new one?

> Please advise... I suspect the best answer is to leave it as it is? 

I'd really rather not. Linus has complained to us about Kconfig symbols
appearing / getting enabled by default multiple times in the past.

Sorry for the delay, vacation time.

