Return-Path: <linux-rtc+bounces-1726-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C995DA71
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 03:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93D121F228F5
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 01:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602BABA20;
	Sat, 24 Aug 2024 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g3qumbqB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33FB644;
	Sat, 24 Aug 2024 01:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724464695; cv=none; b=Kab2CSTTPY3nsLYXHU6tmRCBx3MZFYLgLNCqUF19KQc5KOMsR2DQiI1yGo+xMp11bUo8OFz86W1HEQ5qcKqdV4Zwg93NcHevAm0PCfAPBjxEUIL8IiAoJ49t5f6V6m/z3Os/QmpYQPK3EzvZSo2WLITAHBvhtZclXfi1rP85CmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724464695; c=relaxed/simple;
	bh=GINWLrrg2nx3Vivl4ATkC8nbh6bCMwwHWBKvUXlUXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDo7HmmG0HbeusSTB1N3xK7GChQ+kQijzKmRL8dD1f+d16GV75xQqGC6oZgDV/WuUWy+dxCHh7vm5Mil5ZxUSYxUSF1R3Fk92/BUz8+y2l5yzDevFrhvJ96VDU0TX4MBSbLCgEWuQDYbBpFVPonLjwCJwuicBGwUYo8iLe6benM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g3qumbqB; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5D011C0003;
	Sat, 24 Aug 2024 01:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724464690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnixKGZ9j8jXTXWeAPNxltVu25XKBOwXu4ouyQ+656A=;
	b=g3qumbqB+AysT8EzAW1bLfb8GrBd6ArIkZi3UnJWiVFuNyKqDu114L0+Q6iGeP9Msij8IW
	MvNmt+IMliivrJWlT86VRHJC6XRXWYzyyzf4FcXB33CeEuQauiyGN0uvR1epCxSk7qnJ7S
	b7DoynDLdTiT3Rd0Ews8KW+6dhzE/3AAkAl6NDQS9FKEueblSsYVNfF7lB1pbc8Ar/qq9z
	8pjBcXhB6SEayNsz7c0rq9yjQInKCrFh3+uxwygCLpyXrhBfXL/RhMzrwSYqG4GfX5iVM3
	lAhj819UHAFn/pL7b1LjhU6oECJnCJ/rlB4C/DECt7Lo603feOFaspMZ1inh/w==
Date: Sat, 24 Aug 2024 03:58:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5/8] Documentation: bindings: rtc: add clock-cells
 property
Message-ID: <202408240158092f696ac7@mail.local>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-6-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823153528.3863993-6-karthikeyan@linumiz.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

the subject needs to start with:

dt-bindings: rtc: microcrystal,rv3028:

On 23/08/2024 21:05:25+0530, Karthikeyan Krishnasamy wrote:
> consume clkout from rv3028 rtc which is able to provide
> different clock frequency upon configuration
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
>  Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> index 5ade5dfad048..cda8ad7c1203 100644
> --- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> @@ -22,6 +22,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  "#clock-cells":
> +    const: 0
> +
>    trickle-resistor-ohms:
>      enum:
>        - 3000
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

