Return-Path: <linux-rtc+bounces-2887-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71206A0ACA6
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 00:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536243A1C15
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 23:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF1A1C2DC8;
	Sun, 12 Jan 2025 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aq3k2qui"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67A1B6D06;
	Sun, 12 Jan 2025 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736724434; cv=none; b=BUEFnN6oLda9n1AS+8BdcYXUzc6UsCBITVNFmJHuVHIa5OQv5YKulkbE9P+E4noKe8ctZxsCiHohmRiULLZ7fwfQWzvdEYanKvHl096wTXNNdZQxntSQiBj1IYjaZW65IHetRQftgl0ubTebjgDayMpS/B8M0RBH2af1kv1gzFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736724434; c=relaxed/simple;
	bh=DtRAJ53E4ulo6PXcSHMN1q2kaBdDciNO18dIZ72yLXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPKSUO8TF35dn1PkvTpYSG0rtou1cWot+3ScKNm320k9g3Zfpdo+O/Mm1O8uLYDqIc+7dP4U/RF5hn8D3oejYW/7CuOaQVpxgLT1MRWUgK2PTTyR+MHj0oqvziXUx+p0v/Z9QaM9x3PJnarbdLYXyMcY0gPX9xZYYTCGtH1fKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aq3k2qui; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C84CBC0003;
	Sun, 12 Jan 2025 23:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736724430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OM+NmPO93xj/JGpeWUjtX1zIgKVpCLo9mjIHddcUyG4=;
	b=aq3k2quiykqzenCLX0ElgxLE1gcLRfF0RwkVROiIhWGzbNF5PM+FyaV0T4AjiJIl+UEYAG
	7i8LN7qsQxvboBl599L7IQLNUUdaZ0SzqLVcauN62k3XDkpO8cUm0TV0ciZeZJLTpTjK4X
	q5dOlzO/ktQnWHEpeM0H5tLbBkmohMTOZvSP66rgHvBrUEjls6qdBdRb8IzDZbY1DXpxXX
	dYJATQqHSp714l+LetNSXPMu291l+BaIKDaGtGanxvhKi/tKL/07kdbxepdxEna+WhXzaD
	Tx9HaghiD5xtemRNn/SnerlV/QkZuPZ6338+nobie9jcv2C3Qyp21bI6yhM9fg==
Date: Mon, 13 Jan 2025 00:27:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH] rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM
 read
Message-ID: <173672442028.1487900.17913987088323810689.b4-ty@bootlin.com>
References: <20241218-rtc-pcf85063-stack-corruption-v1-1-12fd0ee0f046@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-rtc-pcf85063-stack-corruption-v1-1-12fd0ee0f046@pengutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 18 Dec 2024 20:34:58 +0100, Ahmad Fatoum wrote:
> The nvmem interface supports variable buffer sizes, while the regmap
> interface operates with fixed-size storage. If an nvmem client uses a
> buffer size less than 4 bytes, regmap_read will write out of bounds
> as it expects the buffer to point at an unsigned int.
> 
> Fix this by using an intermediary unsigned int to hold the value.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM read
      https://git.kernel.org/abelloni/c/3ab8c5ed4f84

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

