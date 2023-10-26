Return-Path: <linux-rtc+bounces-134-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A47D809B
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Oct 2023 12:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFC151C20972
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Oct 2023 10:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227C92D04B;
	Thu, 26 Oct 2023 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pkwrrz23"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D82D02B;
	Thu, 26 Oct 2023 10:21:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAF9183;
	Thu, 26 Oct 2023 03:21:48 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7965AE000C;
	Thu, 26 Oct 2023 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698315706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGcZNXbWjy+iksWtqqJpAf6k6WVn04EIPNKOTg5UZUc=;
	b=Pkwrrz23POBOjesBMT1sSYR9fFmwNbamTDO7MR+WlTut6bzE/Pp4qMKH/N1T+p5R5hYwU4
	JgMPNXnd3Kw9EhTqcqd3lm0uG1EWFt+GzsHEwiN7Rf/aHw8/ijSToYg2y/hh3eOZZenaw0
	sa50XlY4/6Bsvn2rjv1/JNyXZw7/kinL92rLyD+V6xOMUqfD0LypvdU7u2ZtqPSl+ok9Fs
	+9mqCv5PY348oo9fufW6ySoa8hUtIDxUg0wZM/Xx/yRwNlk0uk9NXDdvPirJ6ExPK86Byf
	DS8Atf9WpyhFJGZlK/xc47v1PfGIvGanZzOUobEYVxbjaLRnDzOUSoCI/DsUAg==
Date: Thu, 26 Oct 2023 12:21:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: nxp,pcf8563: add hiz-output
 property
Message-ID: <202310261021467b56f131@mail.local>
References: <20231024-topic-pcf85363_hiz_output-v1-0-50908aff0e52@wolfvision.net>
 <20231024-topic-pcf85363_hiz_output-v1-2-50908aff0e52@wolfvision.net>
 <20231025222327c0b5d460@mail.local>
 <2f17c031-30f6-4242-b2a1-1628402b3091@wolfvision.net>
 <1c4a6185-fe09-45d1-900a-10abf48e3fc9@wolfvision.net>
 <20231026005008b8255799@mail.local>
 <8fec6c89-548b-43b5-8361-869663a58573@wolfvision.net>
 <202310260956166bdcb845@mail.local>
 <d3dcb034-f589-41bb-8a67-1de8ce51db8c@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3dcb034-f589-41bb-8a67-1de8ce51db8c@wolfvision.net>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 26/10/2023 12:13:23+0200, Javier Carrasco wrote:
> I want to model the INTA pin as a clock source that only should run in
> sleep mode because its clock is only used in that mode. Therefore I want
> the pin to stay in hi-Z during normal operation.

Can you disclose what is the user of the clock, do you have a driver for
this device?

> 
> I do not want to get any interrupts from the INTA pin and the battery
> mode indication is not relevant for me either. I do not know the CCF
> mechanism in other RTCs though, but I think that the hi-Z mode
> accomplishes exactly what I described.The assumption about the battery
> mode is therefore beyond my knowledge, but my first reaction is that we
> already have the hi-Z for that.
> 
> So in the end I just need a mechanism to configure INTA as hi-Z, which
> the driver still does not support. There is another application where
> the clock output is not required even though it is physically connected,
> so hi-Z is again an interesting mode and the battery mode would be
> available if it ever becomes relevant for anyone.
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

