Return-Path: <linux-rtc+bounces-2259-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D817B9A5D0C
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 09:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76D3F2845B3
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 07:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B2F1E1027;
	Mon, 21 Oct 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITsJ7Xe8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BD1D26F3;
	Mon, 21 Oct 2024 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495715; cv=none; b=RpeCq1O9ExS2cRtyweOpk7BuVTEuCCAtDiv6N6fgR9/uJrsCkCcOSYwc+Q0/EOn01k5tSB/T2jRcWgQ6IIlc2/cFypYOh5vbWnlE9ir5V+Dfu/x58OfCnn5kkgofy3nqrkEGuyrKZk3T19JDaZFGxZfu9daOfUgntw7OAmVgJdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495715; c=relaxed/simple;
	bh=52mchW7sM2a516X8vgAywVVAVAlcmPu5ayeardsvgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+xvOeEfnjZRgf4B4B9dWSfjn8UQZXNqpDb2/roSG7cUgE4MraVfixCVFkGWknrMUd81PscGDb6nLpA6xd0BTZybPJPguqy5YsE/QyRvuevjqiSQoXfFgb3tD5oFfzE4xM5KkEw3FCXZ6p0M8IFxuRJ/C0H1mZ+eIXLxsnmxFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITsJ7Xe8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65D0C4CEE6;
	Mon, 21 Oct 2024 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495714;
	bh=52mchW7sM2a516X8vgAywVVAVAlcmPu5ayeardsvgp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITsJ7Xe85N+no/+tqrFcdBinkSVKKH2V9QTo0CSTEeExLhjXm7YmaOEOU1zPRn5ly
	 SREuvPkJhAcMWUIYqupSUTZNZ2OW3KOGBw/YmWUYb01lrH059NrQbgfItwdqQZNA47
	 6vWPpOJXTUzZls1+ljTM8kGkldiTNuJQejPpDl0cl58NBiESvH1yIUlx5qzQseH4rK
	 i2f4L+nHV7rS22BtB0q4uZHk/zRDKqztZaQBK77+v6g18mpdsWSX9Hzyvhb+fiGGJh
	 1HqCnM+EYrK6NdXemhCXqAiAGsdKeVpdHnDXHUanlDG0J/KoutCcWUsMwrCkDjDNEF
	 +NND7aRorvx9w==
Date: Mon, 21 Oct 2024 09:28:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: clock: r9a08g045-cpg: Add power
 domain ID for RTC
Message-ID: <mjr7toy62usxxza4e4dgmpfu24kcjtmm6ldkd63ixnh5icvrmw@76tzy36muhty>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>

On Sat, Oct 19, 2024 at 11:47:27AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The RTC and VBATTB don't share the MSTOP control bit (but only the bus
> clock and the reset signal). As the MSTOP control is modeled though power
> domains add power domain ID for the RTC device available on the
> Renesas RZ/G3S SoC.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


