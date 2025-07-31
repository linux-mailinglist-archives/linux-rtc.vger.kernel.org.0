Return-Path: <linux-rtc+bounces-4618-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D5B1723E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 15:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B269189F7D2
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 13:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62652C3745;
	Thu, 31 Jul 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij8PkJSh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537B16419;
	Thu, 31 Jul 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969315; cv=none; b=Xd7mkpldXWzQjxLdcfZQHP3eg+IeoVm5Sxi0bh7EA6unltedgEgZeBYqiwWasMqO6wVkXq8PMPNX4KRTGEIOqgE88vQUA59fHhwSBXtcxWxvs/Xw1lpCQld2N8BGKzMbt+9ZOHWr6OKaidzlOSfxYkzuW/k2SvaM+wrhcwUElRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969315; c=relaxed/simple;
	bh=trI9eEiA5VY8YQDC03bJMw+fv5vHkRIbkQ2JDxq1II0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0jvXvD3tKh5Ng7ADOq9unJwrR5obD1LxEvcS5zrb9xpiIzGZYs4VNil2VxmQ/YWUgOTOqwcbNSESuzmHOCE9KYAvXHjoE8kRORVdce9KHIyENOsKNvYFaZNx4B56v4cnVbJ7p0bw2P2i/y3imkWFq9jGf9TraHP44Xl0VUozAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij8PkJSh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC91C4CEEF;
	Thu, 31 Jul 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969315;
	bh=trI9eEiA5VY8YQDC03bJMw+fv5vHkRIbkQ2JDxq1II0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij8PkJShew8pu4ZGzkFdAFzoVmlvHFirzjpMKDqKVC1ruFUCkYgsklBDSvJx8UlNV
	 VzfYdfROTIRh9IoGe6I/K3Cv9LHmsrwvdubM2KBTPFwDNPxbfMlxw3e5wRBDrBkxvc
	 d4eag+/alBpnnjHKYGC4teXTPtpVmlq4liGjAc4nxSFyswJyKrCN9DiNANNqxYKvqX
	 SX4yiyee514bkcfPBjYqArFvOhJF9uI5HsZHB+wGzsEpYM2oGCew42tDcc5zXstyS5
	 OcFeAX7DAWPvAU5szCjEqxo+aoDnEbxFdOu8b0yzxYLaZ6GeHmJ3+APnola/gK6kVq
	 X/qF5OfxxpAzw==
Date: Thu, 31 Jul 2025 14:41:48 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250731134148.GI1049189@google.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
 <20250731131827.GG1049189@google.com>
 <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>

On Thu, 31 Jul 2025, Alex Elder wrote:

> On 7/31/25 8:18 AM, Lee Jones wrote:
> > On Sat, 26 Jul 2025, Alex Elder wrote:
> > 
> > > All devices supported by simple MFD use the same 8-bit register 8-bit
> > > value regmap configuration.  There is an option available for a device
> > > to specify a custom configuration, but no existing device uses it.
> > > 
> > > Rather than requiring a "full" regmap configuration to be provided to
> > > change only the max_register value, Lee Jones suggested allowing
> > > max_register to be specified in the simple_mfd_data structure.  The
> > > 8-bit register 8-bit configuration is still used by default, but
> > > max_register is also applied if it is non-zero.
> > > 
> > > If both regmap_config and max_register are provided, the max_register
> > > field in the regmap_config structure is ignored.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > Suggested-by: Lee Jones <lee@kernel.org>
> > > ---
> > > v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
> > >       - Introduce simple_regmap_config_put() to free regmap_config
> > > 
> > >   drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
> > >   drivers/mfd/simple-mfd-i2c.h |  5 +---
> > >   2 files changed, 41 insertions(+), 9 deletions(-)
> > 
> > This has gone from an in-function 11 line change to 50 lines and the
> > inclusion of 2 new functions.  As much as I _really_ appreciate the time
> > and effort you have put into this [0], the added complexity being added
> > here doesn't sit right with me.  How would you like to go back to your
> > v4 idea of providing a bespoke regmap_config for for device?
> 
> I LOVE this suggestion.  I will send v11 shortly and it will
> be very much like v6 (or something like that).
> 
> > [0] Beers on me for sending you down this path!
> 
> I'm looking forward to seeing you again, beer or not.

Likewise!  =:-)

-- 
Lee Jones [李琼斯]

