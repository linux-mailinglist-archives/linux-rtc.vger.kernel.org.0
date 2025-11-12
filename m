Return-Path: <linux-rtc+bounces-5311-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AEC50ADF
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 07:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D29151898E9A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 06:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78392DA76A;
	Wed, 12 Nov 2025 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dsv+t/L0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A92D97B5;
	Wed, 12 Nov 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928093; cv=none; b=h0bimNrKqdGrtasOzoImYH+p4UlGgJW9mk2vci7r20h6RUyy0Xo+Xcc6xHEY7J1nWMlyCJor6rvIkBxkPQFebyNl+Khag/yWFzpsj2c08GOYc4C43tPuEKhWlPhqid3S+kuUj5QVz3rDnj9BfEOzTvTnD3K86eS0ilr+fiZVOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928093; c=relaxed/simple;
	bh=ZzwUCfCOYUTbEaBhH3v6UCAZXDLHw9mxwZkVmB9i0/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0QiEccohOpMoa4Cvgp2s7SA6VpCgTbPOh0F0rs6d4Sl6qNZYchbZLbaUrxI9ocD6uAfVa5awzWuVZ44RCYPQByCVJYWvKqZqkvSs/0n9qzCzD/8oCb20m9ZiF4yTXUHSEE5kXOxqalkfsjJPVkTdX4CghNAsKi1BLkNvnIohLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dsv+t/L0; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762928085;
	bh=T8n6eKWtt9uTv/6xGBgqlzn+awiCOgVLvVexDCR5CIA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dsv+t/L0hZpxmzM25xtrzvlpzl/6ym7opx1xRp9CftNoGZAA/4jjPvgKvQ5N6Ih8J
	 Fg31AtsAMtb0STpgv+HXTsISny+8mGoMkZEZM8ek/Ew28pogUfAimAtm2hyE8R1b2V
	 sIXYYTFRorH4QjdDJBOXfdPku6xxvk26fkM2JQkg=
X-QQ-mid: esmtpsz10t1762928081t5c587094
X-QQ-Originating-IP: kbEYhoF8GacQU0UCEfUev11PykziyM/ntLfoFyAF7Zo=
Received: from = ( [120.239.196.22])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Nov 2025 14:14:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12126374271057103050
EX-QQ-RecipientCnt: 13
Date: Wed, 12 Nov 2025 14:14:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 2/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <01C031AEFDAD4CE5+aRQlzq76t3huDaLg@kernel.org>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <20251027-p1-kconfig-fix-v2-2-49688f30bae8@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-p1-kconfig-fix-v2-2-49688f30bae8@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLiMdF5B5RXDirk+iOar4cHbn/oBh9NiY7VH8rCICYxlTi4PIxJeIKi5
	eQy9J80mzoft/dgGoNX6br99A7raws5YsFxPzsC1XtpqYysuR9vJV3VCF6gfLlx7T1Wga9I
	b1NBSoZv/ylxg8qk7IC9nDHRjhdDAQY42AVX5hZjsQXYVmhMHCR70IwXzo19/OGMRJ8EIVK
	beXQ874kf0rGmvMT8R/6WnZHdwiv7V5lDPrvPjc+G2Afi9njImiCef11uIK3wrRI0XHkFH9
	dx649kUtADjckxhx67v0t+uxGrs3iz2059TsFYh2H6PkMwKmRLxkrKLWkLj1b72EhsPI0Xk
	T0fzdRM2d3tz5DWCY+y6Awh7DKaBAwRRbEHL5HuxOZB1YYLJm5UKg43Sht27lGHX0PPB7Ya
	obmaSrTKLby9YZe7KLBUsRSbAOibV4EdnqI9S9040IaZehiPQAg5utsGwOyq8byP1GkT70V
	yvboqwRLYlCUOFEPp3w+/ma2hl4zzgxRUmY52sbkwe5rRUxRZejOMbeY6Aj+dwuXFgV6tiJ
	RqntBnsUxxsutXeJ7Ha9HIhCUCv8D8juC6JzrDB+inBsn8UYm3qRBnyxaRUBj1Y8GoZarQt
	fSKG51MXZxRFirFUKpQi0U/3ix/HyAZkGMjBOIUFfEmIFqBGu14LAcUoyS+OmiItqMrJo1J
	UNZtShUGffic7g9CGVYRuSz+gUc/aP9LgI1PE0/gws4Z5qI1UrL/EHoEGLk5ONw+x0kmmRq
	9eTMErroZb3SMZncrKZAg+wP07656iKcv4eGBBjuQr9D+lKL8x7tdqMFYqqcPda++qWgjve
	MfoQ8AhvzxYQnqDMg1YuL0cDLwJp6A9etwkQJuclzBK9KfWsiYuJUxm3UnLoSt/jmKkt7KH
	Xna6M0qBkddSTfYWK3oOBZ+M9NbbpLKOYGaJM0fJ5onDkjmNcvhYuQ9G8DXTwJrxt9QxjS5
	orbwx7POjvddmYozYOxOmqLE1wTZ79HSRn8h5UZWQJbRGnxyzVfJlEyitCaTspwOh8eLrnY
	UNlqFtxqD7o3kFH4WUIDuy614DbaCY6Xdij0bWhOXRiIhBNTt+yDQPyQ+Sv3ytVdsl1g5Xk
	Uo17uxdFkxQzlBXLG5Bn/tPpyZZpTVf56SIKf7asyTg
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 01:48:06PM +0800, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.
> 
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> This patch was affected by the P1 Kconfig, which caused the maintainer
> to revert it.
> The current commit is a direct cherry-pick and reserves the original changelog.
> This note is to clarify for anyone who sees the cover letter marked as v2
> while the changelog entries reach v4.
Hi Andi,
Since the issue affecting the I2C patch has been fixed [1],
I think it should be ready to be merged now. What do you think?

Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [1]

                                    - Troy

