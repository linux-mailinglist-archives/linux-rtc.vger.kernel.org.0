Return-Path: <linux-rtc+bounces-1998-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3A97A442
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8398BB2CBA2
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 14:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88DC156F39;
	Mon, 16 Sep 2024 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DNwbSC7Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7E155316;
	Mon, 16 Sep 2024 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497253; cv=none; b=WwvMeHiCpIz1rNVPpfv0CK01XtoaivEe4asytLH611EcogGO+hNPQpoDQyp2F+E10uCtFvqQGOJyKOyIh4BfRtMRId1gX3+NzEaz3q8zEDifu6C+vjN1//XoCKXlDVKR43g3OPbSNiMdch+F0QyZu1S6WF2sv022pAfR17Ou3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497253; c=relaxed/simple;
	bh=pSoeKF2CxoGcJsQNgsi79thTLDQHBKgmcJ+Q6tANxPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9d6XMHToQSt6DuO8XUf+1Z6Ko5rzXtEvN9LaiQMX88M8WSEULpQw7LT8l7xMHyBeUDxM8OALdCl1dornAm17pQsbSimj4ErW4nY83wJVv152eFYDVASOPEZmnvoqtKylmob5GIPk+QItIIP05SDViy13uGkwSotoNpn18vD9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DNwbSC7Z; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60B061C0011;
	Mon, 16 Sep 2024 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726497249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdKDr+vXYYA/wATEJlbHZYT7+pvHpBt+R944tF/F0e4=;
	b=DNwbSC7ZqzEfhLNKVcASBnUIKBD8CqyrXlmVOKH0oyw2yofmmmy08dJ8IQvZP/gojRd0R5
	7BclSh4nQE/dh5U/ZWsXmTrn/cRJx67LBU2hpPqea7udDnt5d5MalLaQwQIaGLJT/gwK3t
	0qu7zB7AYIo02uKXRoGqW93KnpLt7CdoOuKNarvltglPOQJNwzReb0bdcQyDTLSg2pwwK0
	Gb7VSR6Hfw0fsXuGcrvujO9ESLnip68+TWLztfreQz1q46oc4OBD7WW8meulsFZ0gYo68R
	wd/l9IJtFygPqiBERJOsSKEuilF9FjGgW5/9brRNgDkRaz7aqrlg+CpvSj9lsg==
Date: Mon, 16 Sep 2024 16:34:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028: add
 #clock-cells property
Message-ID: <20240916143407734d133c@mail.local>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-4-karthikeyan@linumiz.com>
 <202409161237568b626ad7@mail.local>
 <2955009.e9J7NaK4W3@phil>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2955009.e9J7NaK4W3@phil>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 16/09/2024 16:26:23+0200, Heiko Stuebner wrote:
> Hi Alexandre,
> 
> Am Montag, 16. September 2024, 14:37:56 CEST schrieb Alexandre Belloni:
> > On 12/09/2024 19:54:48+0530, Karthikeyan Krishnasamy wrote:
> > > RV3028 RTC has a clock out features, the clk out can be
> > > controlled using clkout register, to consume the clock out
> > > from rv3028 '#clock-cells' property is added.
> > > 
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> just for my understanding, does this mean that you expect this change
> to get applied together with the others?
> 
> No preference, just making sure I understand :-)

i was actually wondering how this was going to get applied. I guess that
if you are planning to take the rest, you can also apply this one.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

