Return-Path: <linux-rtc+bounces-1996-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E3E97A26B
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 14:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4256B23C43
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 12:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FF015531B;
	Mon, 16 Sep 2024 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m3o/NVeE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3747A62;
	Mon, 16 Sep 2024 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726490282; cv=none; b=hf59Za5GOyZhehBqe0ez7Rx1TrbqqWDvwPZwMMvuqAowj/0+E4kktpsgMUAm1xHiP6qi64xgoFmNozuKhz8rGlwhZ8kmg1pThEKK6H0hmwDGhOAmfSC9BV1VW+xHWWyIRTPYJPXn5Js7Z8mb094lBVvKg9C/5v5bBkLRgkmYzPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726490282; c=relaxed/simple;
	bh=wyhQ/1XhBKxhfcWBgJPyILbAjor07laWIT+0K4HTs1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdS9eXBQrIADhFGau4wso1s6F+PvpWNd8mxW71O0qgP+ePJzKEMIDXZ+PDoNmI9sc7Q/lHcpzqD1xprLPi5S1gabfyYOLaojlay/oMDmxjPnL8GpaPm3Lemb8R++Q01HfhovNY2a9G0B/gddak264eysSBQrf2nb3aPdPREj5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m3o/NVeE; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE8B240006;
	Mon, 16 Sep 2024 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726490278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLkXpJT9dGCwpmHNqyKonZZcRd+WJrVd5CM3zLffLK8=;
	b=m3o/NVeEvXK49KYFrO0OUF5UYvy9X8gvcsMc+8zXzqn2sSF2p1dW+z+djPjUuxoZ0daJc5
	e6inRencX+z0xorrs8P70zs6CknIw7ZTGP4OEen0i9BXbGtjIExrwZipun6FdBbqKpukz0
	5Cx8nsBwn7NVmo0gSUgc//qxLxdb/gscweUPEkTNmpD1oa6PqMzhPvKbscx9HGvvb15Tel
	EkNRNCNWUHYa3lce6jZsqA84LNK+Yz2PsbdjL5A0DWTvEBadAmW5OCnOBU1KEXlLXl4Iw8
	BdEjSXIKBzNkTrriGLUwVtqI/pUKp6dcYs2DlPueMQUwk4ZRMqlgRunX9SC3mg==
Date: Mon, 16 Sep 2024 14:37:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028: add
 #clock-cells property
Message-ID: <202409161237568b626ad7@mail.local>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-4-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912142451.2952633-4-karthikeyan@linumiz.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/09/2024 19:54:48+0530, Karthikeyan Krishnasamy wrote:
> RV3028 RTC has a clock out features, the clk out can be
> controlled using clkout register, to consume the clock out
> from rv3028 '#clock-cells' property is added.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
> 
> Notes:
>     v3:
>     - fix commit message
>     
>     v2:
>     - fix commit message subject
> 
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

