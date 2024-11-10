Return-Path: <linux-rtc+bounces-2483-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812529C34FB
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B32E91C20BC1
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F171581E5;
	Sun, 10 Nov 2024 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Sfo4Pljn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108D15749A
	for <linux-rtc@vger.kernel.org>; Sun, 10 Nov 2024 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276392; cv=none; b=dP0nYqqoaD1MobsLsOKYsrC6G6f99Aldn/Jm++JhPzdWgF9mybYwVE+hyqesYaHQewU0nZr2HXA2L8UEnbaZyzukQ+6bZTZXyZRQgnlqaWm3s/02NsPmOkM5xRzjXNPIosdaHtXbupi3VJVAt87DyD4LFVwloawK9Xy1IpmWEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276392; c=relaxed/simple;
	bh=15oQAKuPz0WmNrTe2CjfiB+Zr1UKINPI3S9UmNI762Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3qfUkOanyB6Fh+l17dUhpfrcfJ2BeKNO/t/tzB1A5PyCgind6+VZ0KtwmxdZ1Wd/Qa1i8uIoBxULtTlRTcP9xkvDucYatRUJ2kmXOUlCieQ/AAHI0V0chJNHZkpHqEKmFVLGrvsUX7c5wIL6ZFWVh7l13uazd7zz67kh63zNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Sfo4Pljn; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 94CBCC10A6
	for <linux-rtc@vger.kernel.org>; Sun, 10 Nov 2024 22:06:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4138D20003;
	Sun, 10 Nov 2024 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zUdaOedIQ8kUg4x9LzwEvFzayNO8i4Q73skUB7XP6nE=;
	b=Sfo4PljnlqS27SB2PJ9FfKpI2ZiaRbV7otawTkMzyTbtUY0PINozJKZmopnIPKCfOG3uJz
	yR+6J3euujKK8ebiqYr/Zz1QKLrLAx/J+ow4JaMbuxZqIrd4L6+Ai1HRgqQ6RKV67yBTY6
	iekNdnPSR4PFWY5YWrT/oEHfbWZPd6GC8teEQpfUMxwYiQ8HOr2B4MW9MvH+cWXm71rAVU
	ZBeIFS3uZHqJgVgVS6q8YXxlRlcRyM1dUk3AT8eVI386TEiEJhRj1mss9YMBf49xmzIXYi
	Zv2w58JkepakbW5A0GHD1nfNudjb1jZZ18C9hEBagpCyGRc1P41YNBhmEeb7zg==
Date: Sun, 10 Nov 2024 23:06:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: patrice.chotard@foss.st.com, lee@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH] rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <173127618343.3020900.8341724701726838297.b4-ty@bootlin.com>
References: <20240912033727.3013951-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033727.3013951-1-ruanjinjie@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 12 Sep 2024 11:37:27 +0800, Jinjie Ruan wrote:
> If request_irq() fails in st_rtc_probe(), there is no need to enable
> the irq, and if it succeeds, disable_irq() after request_irq() still has
> a time gap in which interrupts can come.
> 
> request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enable when
> request IRQ.
> 
> [...]

Applied, thanks!

[1/1] rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
      https://git.kernel.org/abelloni/c/b6cd7adec0cf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

