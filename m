Return-Path: <linux-rtc+bounces-1122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C23248BEEF3
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 23:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E80AB2242A
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 21:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DA276410;
	Tue,  7 May 2024 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d4AVzzIp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E575818;
	Tue,  7 May 2024 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118228; cv=none; b=Xe+9zL+RrGL0gNw5cJF/2RH69ykN2zo/0DcNzfswLutiYxY/RqTYg6LRCGNOMIF2Ft5RAc/8IWPXUFT5pSHQwtyjWv/7+68fi+YVmV7KLQaphaykUoYs/DzD3cWjs4MIzlA8dj/DwkBlQaPlMkQ7cgvlYUzS6rr2zeMC99lkTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118228; c=relaxed/simple;
	bh=9KUEQCcJ1WRlrmjnwhcCpsj0qPYhAXWExZXMwhhWK8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkAN2yalXpKPpm3ff7qmszJDy0AqOd+dE4508itAcRcZ0MShvA9EnXiFFfbmm6dxBC6aMCy5LUyOs5vHjh7VUQLYwYSvuTEkMlL7vubjzWLT3Y+uQkJ8sS/kQ9AWyQssUXlxr7aWTAfeLvjJuvLACwWYo8Yxwlf44IGIhS+ObYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d4AVzzIp; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1031AFF802;
	Tue,  7 May 2024 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715118223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPjYXbBGoaNmBH70GuuSxMS8mJuyYhtqJ5BS72t4bnA=;
	b=d4AVzzIp9+jyKXOPkEkGKyCL+1qTxCaj7aUYrDh//VpAuomEBZnbkOdhJld+r3p09VhcrF
	YzTFpicEaYauND6ndIrPVS53uL/EyHMZ/j3lphnlSjuBDdrIr+kihFEama0J3ku2cvOTPN
	X28/JGsPHo0ked6jTCV8PlGk3mAYrKQZ023dg8YlDOVxaEBBugHzyoWJLxweSVKO7jxc3o
	+Hh1no4Mo/KAEK4RZJ7dsyxBCj4zLk3KqxK1wsNietGwNxYzRcaXgQ5LAJDDiurq1ps0Sx
	gFGN87h8CXT2eW6eNXGWjV1yicFkp4vOWHOeGm2t/V3gwRA+nGG7+vpOGiYxXw==
Date: Tue, 7 May 2024 23:43:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rx6110: Constify struct regmap_config
Message-ID: <171511816313.992987.6441539046108137631.b4-ty@bootlin.com>
References: <833a7f612c0de9dcb1179a0b75b189c237a335ac.1714862560.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <833a7f612c0de9dcb1179a0b75b189c237a335ac.1714862560.git.christophe.jaillet@wanadoo.fr>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 05 May 2024 00:43:07 +0200, Christophe JAILLET wrote:
> 'regmap_spi_config' and 'regmap_i2c_config' are not modified in this diver
> and are only used as a const struct regmap_config.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    8896	   1554	     32	  10482	   28f2	drivers/rtc/rtc-rx6110.o
> 
> [...]

Applied, thanks!

[1/1] rtc: rx6110: Constify struct regmap_config
      https://git.kernel.org/abelloni/c/6a216cbadbe0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

