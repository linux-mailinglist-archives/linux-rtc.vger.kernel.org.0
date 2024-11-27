Return-Path: <linux-rtc+bounces-2640-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E29229DAADF
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 16:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B973B22253
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 15:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2469B1FF7C6;
	Wed, 27 Nov 2024 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h06J1PDO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46829194C65;
	Wed, 27 Nov 2024 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732721615; cv=none; b=X3RLHTQWH4+laBb2QR/jqbv7K78IICx80vn6aOYI0nNyN+iTE+u2BWG5c0cRuuRIz0mO2EAX9423t7oLWQt0aHZgBkrQxrE8OizD7iMC3ruExuOsDrNd8Knsiv6vCyXpoKlAwOMK6fQkObqvA1Y7hm7urUFhMCqGbZ6HtAxfRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732721615; c=relaxed/simple;
	bh=7RlEqjYnC+8dGFAM+WHiuUoN1rLG0jy2DrDAPEMpnog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5syZXe26Zhn0Oyqg4c/a7C9DPyi1ZVUpg6aLHe1vdZt+8nXLoEo3bjAUokMzyKM0cferfZEbhJeayJbRYTVWmt31z/Yp8yc5MtLYSgBoT7KwNykxK5A7SJMHp4scPCXKZWFOLoFVikfwLEHQBbrWdIlyTaiAXAa9k6mSdTfUmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h06J1PDO; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E815AC20FC;
	Wed, 27 Nov 2024 15:32:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A385C0003;
	Wed, 27 Nov 2024 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732721533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7funRjx8lQefW5KmPdssuiZ8xdwFD6h0t0ZpnfERmc=;
	b=h06J1PDOzfKrBbGwfuW0v6NUw0khhYs9VoDHlDHLcSVyAqnV0uLino82KRIw6a4e+8ZhfR
	eDBAD1uXmHeolU/BdytnrqQwv4fvXGhH61bh+h37HZfYj+iPj1mNh0vSGGle+pA8e6gDum
	WCnvOjxqje1DUDf8VRVTZdlRcdpEr7ifbs2P8I3yPuTtlXK85hQGqZBWSQRsQshfjH9Kd4
	SIAsONboJNmzMpZMch60c/JBcr6V/gAYMG5t+nBRKpByV/G9JPekxNq7YKEHcRWlU2fpir
	88+7ZQzN8t93bjkRlFDq6WrWQtHFXoPc272JWtE3C0AAC+fbmjzXe68yIKKZPg==
Date: Wed, 27 Nov 2024 16:32:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <2024112715321236991788@mail.local>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
 <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
 <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 27/11/2024 17:07:48+0200, Ciprian Marian Costea wrote:
> > > +	if (priv->dt_irq_id < 0)
> > > +		return priv->dt_irq_id;
> > > +
> > > +	ret = devm_request_irq(dev, priv->dt_irq_id,
> > > +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> > > +			priv->dt_irq_id, ret);
> > > +		goto disable_rtc;
> > 
> > 
> > Already enable rtc at rtc_clk_src_setup(), you direct return fail after
> > check clk_get_rate();
> > 
> > if you want to disable_rtc, you use devm_add_action_or_reset() to add
> > a disable action callback and return dev_err_probe() here directly.
> > 
> > Frank
> > 
> 
> Thanks for pointing this out. I will use 'devm_add_action_or_reset' in V6.
> 

Won't this disable the RTC on driver unload which we already discussed
should not be done?

> > > +	/* Reset RTC to prevent overflow.
> > > +	 * RTCCNT (RTC Counter) cannot be individually reset
> > > +	 * since it is RO (read-only).
> > > +	 */
> > 
> > what's happen if overflow happen? I suppose it should go back to 0 and
> > continue increase?
> > 
> 
> Indeed if overflow happens the 'RTCCNT' counter goes back to 0 and continues
> to increase. The reason for resetting it here in 'suspend' routine comes
> after dropping the rollover support (as agreed on V4 of this patchset) to
> prevent an overflow during the standby state.
> 

I don't think the overflow matters as the comparator should continue to work
properly after it happens so you always have the complete range to wait
for the alarm to happen.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

