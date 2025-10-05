Return-Path: <linux-rtc+bounces-5047-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C98BB9B4D
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 20:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7343B5AF2
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 18:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05C01D8E1A;
	Sun,  5 Oct 2025 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XlNG5njp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B034BA47;
	Sun,  5 Oct 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759690413; cv=none; b=WSRtKR3sWMhoeO5kUVTjoE0BDd1aP6y6KdlJFd/uGFVShsWa30hTupxAGEIJtKuIEG1V1Pv8b4Uj1J3cYQB+KfXPlkXMLRboBdngZE+ww9VSnnM3PksHKOpyphSFlmti3Z/bWm1RmSudEGjahrn9wdbzwb2pbz9ARVmIUnJX0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759690413; c=relaxed/simple;
	bh=pYyxpJTNmJ4wh7iuWFc02oK80AUpboI7y+evLOttDLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7Ucd0zxEVo1Mxlokf+ypTku5sjiHBZsL6wFhxytkbU1ClVtd2jYFFZKNdsT7FZG0tBbNksGch7c4RkBqEuHNSwS01Y23wUFKb1JYNxhdn1ihLSfzRzQ2a7/pJOmtkdC4kyxUrJYG65iJtny0b4kdpSw9j6+d51N67b4mpmtcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XlNG5njp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6A954E40E54;
	Sun,  5 Oct 2025 18:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D1786065F;
	Sun,  5 Oct 2025 18:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00BE4102F1D0B;
	Sun,  5 Oct 2025 20:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759690409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=u19hvYqBtDPln0UXyuVWirL2/wEHjSw45hYDP0ZXJFE=;
	b=XlNG5njp78SjaC4uxyvvm341zexEW1eOW0/u2B3ghp0eTasMqbZPTR1Ktvx+Y8AMVPjaPx
	MMkJTS+eL83lfzrIGoPLaKMPfhOVpSHJuWk4qkWnTt30NrNZ7fr/umQ5BUFwwkrYRI3OBx
	4JYcOM96kDuct3kSw6We7HV5ciFZN0vtSvgKwzoO+zdR06udIU29Ij9VRZbMdqa1izKnzq
	H+o5qQ4bjtIMVyceZMUPoc91Cd9L63iMegdol4mBqvIQdDJ37tbEnk9rZlxXaGmQS6jBqB
	8IiakDlpIXESyhqcrjffszxR0pumFlekrvxLwy/5Czdri79PEZa4rYj93pkIFg==
Date: Sun, 5 Oct 2025 20:53:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/2] rtc: optee: Fix a couple error codes
Message-ID: <175969036642.3720436.4580102508635950819.b4-ty@bootlin.com>
References: <cover.1758182509.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758182509.git.dan.carpenter@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 18 Sep 2025 12:48:39 +0300, Dan Carpenter wrote:
> Fix a couple error codes detected by Smatch.
> 
> Dan Carpenter (2):
>   rtc: optee: fix error code in probe()
>   rtc: optee: Fix error code in optee_rtc_read_alarm()
> 
> drivers/rtc/rtc-optee.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> [...]

Applied, thanks!

[1/2] rtc: optee: fix error code in probe()
      https://git.kernel.org/abelloni/c/8bbd727453b4
[2/2] rtc: optee: Fix error code in optee_rtc_read_alarm()
      https://git.kernel.org/abelloni/c/eb7392a01964

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

