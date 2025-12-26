Return-Path: <linux-rtc+bounces-5620-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA7CDE75B
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Dec 2025 08:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C417D3000B27
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Dec 2025 07:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D079313E07;
	Fri, 26 Dec 2025 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TL+1apDg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31838F48;
	Fri, 26 Dec 2025 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766735620; cv=none; b=OzrYPWj4eYC+2FVJdvmykYjl4ZF26Pq3PhtvEfHUXIXuwUmV7PwLj1AHnECamD4d9S2Es0zPI/EdQ0Kz5CH8rKtgtUj2oEaB1yKl622fBSYhaQmvGSUVfvSd119NxKwc5+XnJ6KcKm6sVLBeVT7nSpLICDJlWZyfrZXpZiINX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766735620; c=relaxed/simple;
	bh=oqZDnjjZpkNlyRr0hmebLTt+r39NO5/ZRJwa+WjVV5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2t6ACd7b1OmWOZnOXyeoDqbYwuyZJxHyjycEQvPJtAs3qUoIaTkmLjPRvU3wFgb11OZvnaK4DQ7TmnZvH1e/umrFmxh4/PNzK/1qgJJX4CbYqz2e+muIZMKqgnmivb5CD//UEiPASd/wVeZl24T6UNx7x0oZ3Etmu3L4NVKXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TL+1apDg; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766735578;
	bh=5rqzRz+DAZpWWro/FXmO/xzVSv2PlwUs0gKPEOGz7hE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=TL+1apDgRNlEuutnAD7V6AC5S9DeYALgcAiatmCH/OSqDUqElPYxTflb+xt0LEXks
	 KviYV/qUqiv5FFi7rXYqjuQhCT6bmOV3CHbdYeVFQyZa94IAj1Eaxp3OqB8K4oRYas
	 7KFt+K9j+XVQb9RuIuFAD01S6IvLCWOgDzGyGnnw=
X-QQ-mid: esmtpgz12t1766735574tec301483
X-QQ-Originating-IP: A4Tsnl5JTI7DzEsZRGnZiXX+NSH/kdjq4a+YWdmnzZU=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 15:52:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6635047226762412195
EX-QQ-RecipientCnt: 13
Date: Fri, 26 Dec 2025 15:52:52 +0800
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
Message-ID: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkLA2q2LD229DZPVNH/vzzIvNhlAdYOmg71DbFL4TkBEjrfk21g4VH2e
	Hbau2+E89ZiBu6KPMaxB+2cyKpw/KPwOxhfllh37HCzdHej2n5tTIdck4M3PjGbCX3G+MTE
	GvUToEs5O6/9G2Jpjeo/YmNHb1+5SK/Y33rY3fcRuFzsPfvfOkGDW93Ik2tu80QUyWmBe38
	Vk4JkWPlWgw9RibzXQw7jOE08Zpx9K7k4ZBBde16rTFNil6cESku8i0VsJQtHsjZX4HVRgO
	03AaPbATxPnphBH8yn4iiTZN4ZkMAFH/PFitj8DOQoJkt4YeuA52k7a3+FuhiRNjkoS7GuE
	0aYQ82oSxiZfiSjMQYKkEhHoQhT5xl/pocP2YmdprewRWsgZFFaSE5m7RqnLeTEROv2RwW6
	NOM6MvVeTAt/4O8NeVOUxxmvMb9I4xpBfEa0mpaD0iVcGOYHyI7c3a2Meu0lG6i7fQ5fjIq
	bLrYjOlEFjaaD34A4D1EkoBat/9a/XEF5BMIfj68mHSaj9NO1CH6YaeHs+kVsDTLBOPpEMV
	ajmxgG/fnck8Kxo7iFyIiHMmvQ1cJ+AY6v0GGfVjhYtO3nS/Hi4NFdyZDj85vzna60HBd63
	VVK8KgWutj+25enEra9E9HHq3A3B2xfsLOztZqlWMsIhha4ODJbepDml0u8+8wqWDLeIsjE
	cI9pJJyGTjIk72B/6RrUvhvEEUuPgei3/HgvE8HKFCgokm1KZ+6pYATG8PHheSktmbofb/i
	2X5rKFGbXLslZGWNuocWb13gZ5BEHtG9hg2hiXet3yjWIJIbXcfX+1sjwempiVPvESxUsIY
	ql15JXTM96x/Up5mGtNo/hG/2TwCyyFykJFaiWImJCBvaENdaDPNmp2Unnmv7drPg/rF03Q
	v56dGJyhKrZ/sgfNxySMxhk4CI1N3HecXKNvkcdzQGgfc9OiOH3qgGEZKIiXMKi6/Q/Luak
	SwYBeWE+A4yOqIlwNWdQI2OssVO6dmk8wuygWiDPAAte1F6Wud6ODcHn7I3mfUT16amLPxX
	IyFlogmn6hD7ZcNRXv8kGvApuClxIC3RB6dt6TWzifZqQunWJ8SFWb+RdALbs=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

> > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +				     unsigned long parent_rate)
> > > +{
> > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > +	u32 lv, lcr, mask, shift, max_lv;
> > > +
> > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > 
> > Would DIV_ROUND_CLOSEST() give a more accurate value?
> I'll test it.
Same result. So I'll keep it.

                        - Troy

