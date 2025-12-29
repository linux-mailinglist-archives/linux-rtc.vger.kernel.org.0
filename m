Return-Path: <linux-rtc+bounces-5623-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B2CE5A95
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Dec 2025 02:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C70F530053E8
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Dec 2025 01:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1131DE3B5;
	Mon, 29 Dec 2025 01:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="yyzQ8YL8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3503A1E99;
	Mon, 29 Dec 2025 01:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971223; cv=none; b=QOxsZ4GpY7g0atO+hQjKisXUo05J9Dq3qMYL5Jz9zcRFKQDeBCyCuN+E4dT7NW+oMdf7g4JVXNXjEjtzJ47EMhfIaduKjjSpU3e3M0I0dYmjILGHrwqASRootPQR+s7hRlAxFEpl7T0BzTL3KHL68TfuBEO0a2tS/Tm5je+cWQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971223; c=relaxed/simple;
	bh=hsmClUGEQA7rZBxAXqKjeDz/XtsH0eUv/RPooz6i4Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3JTGAegL3XgoHtHR2hRbkCHCtQf+Fm6Wyi9RFu+0XMEbVqvyV4IWRdiI7Phg+yhnj3E/ZI23eSdUm7R9OHjPT3Wxw48bjW6uaQIaKU/bp4I0EVsCtr+Mo3PYJw0x2NjVPiqMO4oknUrFfvp7iWNkuUZRQvauZvHc5/RBNrkR08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=yyzQ8YL8; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766971214;
	bh=HjPCSciAn5sVVRUOoQBxpkF3fdcwbHn1thnE3om09YI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=yyzQ8YL8nLyrzeINcrN/aEQy3SaaW8Ri6pT8kUu+TLqUCJkb/kaQzk5g+FhnoFCom
	 euS0shzFx0XxSOAF+Cp7s98nVdDAJMIGD6TraJqEJP4yA5kglZ7yOGRjcIbgKkjfwS
	 /pEHxRbkTxr1r3KgzLM6z1ZcloMtRQktxoFMxrgM=
X-QQ-mid: zesmtpgz9t1766971209t9fc9de5a
X-QQ-Originating-IP: fT6Q8r14RLfcZbpJL9RtazBttNJy4iPas1PtPR2xOX0=
Received: from = ( [183.48.244.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:20:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16357926230597589350
EX-QQ-RecipientCnt: 13
Date: Mon, 29 Dec 2025 09:20:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20BB6D852C5C87DF+aVHXSI7Mn5GH-xBF@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
 <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N7bzzhFwp0G2YD0j7RqdQnXHoyelMSBDh7H4v6fW+L47kj88oHfddz18
	o1pGWMWIYEKcKr37sf5T4RBcLFnvYr1vj/Ih04pWKTX0T2LwUf7Luiv7f/ixv5tm1bVFblw
	gNADGebUTHrsHJdKowJNs+ZI7mT6BrTqs+eKt4tFf9NA9GYyLYCEf+cXmAS2nGZM8KvP3Uf
	Y5/fgplLZ9z+R1kaRyQtHVoFPxMT5+eB9A4C7jiqJf/Jxo2RTiFV8K11dUjP4V/gcnsVX1A
	e1/QzfUzFoXzm84uWAiNxoXjUFB35PZILUm2f0rwpbjcy1Qf/SKHnKSsxaTvABiD32XMb1F
	HlGMitW0T/zv5jeEHjl0vq2xFYmpVnT0TOgvaTcD9WkVvNSZzzrLk5ifAomS7Iv2mMvfcdp
	pEApkrb2fwB/FWATeB6x4exiMNAMjeuk+/VEDlExuO8DNN/a6SNX1g/hX9w/c3xPT+pUJdC
	HHnlWCKmLtxyDqAxjocx7qD1Lu64IUmCv0clxryphaVPsntZA37Is0H9Nx1fRaD95zFuTUB
	wOhHbjub9/F2DLEvtMFdkWCU+M1PIOvoY878tGtnaMtMSp1VaHUeKkn/BRM/NQJkacKDEYW
	27nZBVCC/2E9h2fNZOBFWxJ5xigX+AlRb8SZeOt5zabVs6p1R+a5+q1giFLaus238asNx9J
	pt3j0LaNTzKKaa0+fKZDf0MwocYqvCRfp54w9uBo7Zths9uXGUcRFR06tYKpqpN2d9Zi28v
	aenDm1RqRx60gEyM7873Yk/abqGumfGeqvLoR4lGmw+ZFzGnbCe/L7Y6emQK+AFUOMAlAWa
	N8Sdf/hEQHq5HsK6Mw184QCwv9elu24erOiYudHJyInY/rug2vqDBHoYrJ5rBLFX2hmASD2
	d91cQgUQHZyi6WrDjDSquhMyTHeG2H5YlGMaEVJTe3sCXCmCflf+TzNF4W3DckSCi2IFfcW
	8CAIH3WkjMUIxIStIwPAqV3oJH2gox924fqoXzmgix3hpb/E31p4q2SkOZmdnA+GCtyKUMy
	igESOeeGXZFqRHjhWut3uh+F78S9eMW95ewmtfLzP6IZyqOgEo
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 06:58:00PM -0600, Alex Elder wrote:
> On 12/26/25 1:52 AM, Troy Mitchell wrote:
> > > > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > > > +				     unsigned long parent_rate)
> > > > > +{
> > > > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > > > +	u32 lv, lcr, mask, shift, max_lv;
> > > > > +
> > > > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > > > 
> > > > Would DIV_ROUND_CLOSEST() give a more accurate value?
> > > I'll test it.
> > Same result. So I'll keep it.
> 
> Is that true for all clock rates? 
I only test 400k.
> Anyway, it's not
> a huge deal, but especially when the number of rates
> isn't very high this can make a difference.
I'll test more. Thanks!

                          - Troy

