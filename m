Return-Path: <linux-rtc+bounces-2220-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4119A0B4B
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 15:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B821BB26088
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328E52076C7;
	Wed, 16 Oct 2024 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y19B4KlV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AED154454;
	Wed, 16 Oct 2024 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084870; cv=none; b=rAkqb7AanSQJnJ7JsziJAyrk6wEeCtfkGyUZCPP6NKFZ0G9df4j1GOt4UROFq4FYjhqNNaupP6ytKBLHu70VX3ipady0PO9y7mBCSmQ3EHVlc6NLGyyPf4tQAHbxy6ICs9dVNE6LJFK93RQjepjqEY0MSKS9melEHYcr4IBaGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084870; c=relaxed/simple;
	bh=Cc39XxaHHVl2pzqCdZ1eElkddP1pmbsnDVkqnSgLoiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvRDbCd60W42k+2tszfSYftq7rDxpP2UHkkg7kF9QItRtxnuKuX7+u7h0A0WqTYBW4RjED7dSPd9wi0GW1/RsDI+6+Z0K03EZY1b2aJQHTIaa/mcXCHBD+r+gAYl9n36AZDp+kpEJ8omb0R26CsBRqErF4JMNgJSi6ttnQVKxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y19B4KlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9CFC4CEC5;
	Wed, 16 Oct 2024 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729084869;
	bh=Cc39XxaHHVl2pzqCdZ1eElkddP1pmbsnDVkqnSgLoiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y19B4KlV32tJ2+I2xZ7crKMq+BzwCvd4zj9OdkOMNlvtOjZP6SZ3JK+8LjH4K643E
	 NcXBUiTd6JG3WA6WXwOdLmkb2CHL4ablbKhR6i53GImVQjnR3tE3ZWKJ2Fv4yWPsPZ
	 9yz6QB9ArZV2eunfhNOuVXdowyA33tEK68I0xPbPZyUkd10vIcls8futmvJ35xuZyu
	 EZUaBDn7BZpyjDu+riLExYs+G38oSP0F+8w0U2mZGBY9+VO/8XgoYQkaLYYXqpkzx2
	 iN3L00lSyiSxn13BSYxqMhAslez/h+Z2ULl2sgvCjftl3b6WctLvrcTb9T2kGRL5Xt
	 cWg1phnEohoaQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t13xk-000000003Oi-1882;
	Wed, 16 Oct 2024 15:21:17 +0200
Date: Wed, 16 Oct 2024 15:21:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
Message-ID: <Zw-9zFwwJfV4yPvO@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
 <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
 <682acd15-58c5-6bdf-f913-0940a2733451@marek.ca>
 <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
 <8c8df288-cb8c-2e59-a570-e8dcf39a367f@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8df288-cb8c-2e59-a570-e8dcf39a367f@marek.ca>

On Wed, Oct 16, 2024 at 09:12:08AM -0400, Jonathan Marek wrote:
> On 10/16/24 9:02 AM, Johan Hovold wrote:
> >>>>    	int alarm_irq;
> >>>>    	const struct pm8xxx_rtc_regs *regs;
> >>>>    	struct device *dev;
> >>>> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >>>>    	if (!rtc_dd->regmap)
> >>>>    		return -ENXIO;
> >>>>    
> >>>> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> >>>> -	if (rtc_dd->alarm_irq < 0)
> >>>> -		return -ENXIO;
> >>>> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
> >>>> +						 "qcom,no-alarm");
> >>>> +
> >>>
> >>> Stray newline.
> >>
> >> That's not a stray newline?
> > 
> > There was no empty line between the assignment and check before this
> > change, but now there is even though there should not be.
> 
> There was no empty line between the "alarm_irq" assignment and check, 
> and there still isn't. That empty line separating the new 
> of_property_read_bool() line.

Ah, sorry, my bad.

> I could move both of_property_read_bool() lines together to make it look 
> better.

Yeah, that sounds like a good idea.

Johan

