Return-Path: <linux-rtc+bounces-5248-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAFCC32E4F
	for <lists+linux-rtc@lfdr.de>; Tue, 04 Nov 2025 21:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E64D4E24D5
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Nov 2025 20:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723582638AF;
	Tue,  4 Nov 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vbIrFJbF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D87221FB2;
	Tue,  4 Nov 2025 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762287660; cv=none; b=kMwZg+cQHWvAwiEsvrvkP2uvmZh5wT1zpsN8w9aU7ltTp0ABwlnns5zenNfzQ1pdDwcR+qSphudXLkBNXLGMyRx57lRFE0hC9Ia8Te8vbeT/4TTRoK1iM7PdnKftswY2Y56J0KrQjIdx2gndrOJ5qNfOWtFIH2mCIHUgw3EcMns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762287660; c=relaxed/simple;
	bh=qPGkxIjDXW5zpPissyVoIhvHyG6+0/+i76vtrzIzZa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBrax3BiuY7KwEiwAndJP+rAxjHDR5HLarbXtzfeWonRRHJnoALtaXEGVZEInVofwbj6MszZWv2uPSJm8lXF9nHORnN0lMkU+sWqrrODs3qE/RIa/1anvHC6I45tG/DPzDigsvMHwC+wX1siEJBjKoOFURBk2PueO5FrwcDJkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vbIrFJbF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC4DF4E41503;
	Tue,  4 Nov 2025 20:20:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B029D606EF;
	Tue,  4 Nov 2025 20:20:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6008410B510B0;
	Tue,  4 Nov 2025 21:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762287653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=5f5xDTfPirdrX9sDwHxGK4skY8bI+7AmuogtBOTygLY=;
	b=vbIrFJbFD/q/Hf+yINbSGoNb3XQ1+wLAY2HK47tI/CLpijQ7zs/mUHCYy1BHjMQlcU0OXd
	6fAtSIdVvgSadyceeSTEr5VGgOHIQq6y3xYcROkVTi9FzVIdA8zwookDU37CN3oDItDHv/
	8vyymSjp8zg0+y+3Mv/G8nvXw22nxeSimesJgJk4Gm5kgmhBZYziTkV33m9qzKLftxgYDx
	aEf1v/TFkRHQ9AJDTVj4XAFM9tnP3XL/zLwijqVT5zcX5t7O4KHZicvHA+Q/sdklDyvTev
	l2uLwlPlF72qXJaEONN0yJr1SFMlzYML7VXdPqA6FfFeQHsD3noib1mtCBzo1w==
Date: Tue, 4 Nov 2025 21:20:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	claudiu.beznea.uj@bp.renesas.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <2025110420204948103c2f@mail.local>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
 <20251103121848.6539-2-ovidiu.panait.rb@renesas.com>
 <20251104-magnitude-deodorant-be607e3ff4be@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-magnitude-deodorant-be607e3ff4be@spud>
X-Last-TLS-Session-Version: TLSv1.3

On 04/11/2025 17:28:27+0000, Conor Dooley wrote:
> On Mon, Nov 03, 2025 at 12:18:45PM +0000, Ovidiu Panait wrote:
> > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > (r9a08g045), with the following differences:
> > - It lacks the time capture functionality
> > - The maximum supported periodic interrupt frequency is 128Hz instead
> >   of 256Hz
> > - It requires two reset lines instead of one
> > 
> > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> > the binding accordingly:
> > - Allow "resets" to contain one or two entries depending on the SoC.
> > - Add "reset-names" property, but make it required only for RZ/V2H.
> > 
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > +        reset-names:
> > +          items:
> > +            - const: rtc
> > +            - const: rtc_rtest
> 
> If you respin, just make this second one rtest.

I already applied it as it had your ack but I can still change it

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

