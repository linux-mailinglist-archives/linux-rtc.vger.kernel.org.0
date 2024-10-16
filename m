Return-Path: <linux-rtc+bounces-2218-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFD9A0AED
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 15:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07971F24FE3
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 13:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580C9208D85;
	Wed, 16 Oct 2024 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO09P/u1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FF208967;
	Wed, 16 Oct 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083718; cv=none; b=jGkw43jJc2VE6zhDrqpoKRz37VMo2Xq4jQovuAFG6Db0KKi4F/s1ieBgFmlNXJWhTXc1xOPL2ptHe+SF979Rd3cxpoTz6pyWhQ377GHyDXdUNb5rjWWbTvp6bcxe83tD3yXRQS2JfMibooMDBoxo6OsFbH5MP9vYOUu5A1i+NK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083718; c=relaxed/simple;
	bh=tUl3xUtMWH52CUWdebccnaiOooZSiwBdgLEqO8gpAJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG3F2UeZazU5O9KI4UQqC9zd70YmjFBWzkqh6cMiOA89SPJYKR6krdLxk9/MfalUeN4Emta/N7FX5e/WEAVryHo2dMpxHnWw6GvAP/Im4+oNzFMIJcaEe0rv6XwGAsK4w7jVoGqbl77XO7zdW4EgVwMbvZxXhuH7hnHkVbNugrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO09P/u1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C032FC4CEC5;
	Wed, 16 Oct 2024 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729083717;
	bh=tUl3xUtMWH52CUWdebccnaiOooZSiwBdgLEqO8gpAJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HO09P/u18wxjj0rTeIca6ApLsA5XSgJ5eM8XEYJZeyvUTB2cum9Nhl1+bYUTU9De8
	 5Yi1alJo6DdDIQp0dtbF8B0ED0vvHIYHDs4xMTSoWxtNgdr1rQ+135FOxFWTVOFKaA
	 /OIEEc1ePsgnj+fkuzA6nIlnztIsOuBKS7m9p+9Yi3PFUfVvFdS7mJcVtTTenoftGZ
	 40WwK/m0efNU7+YT1OyEQMPCWwDpWyzg4sjqShux2Osjn+0jzX+abY03IHriJHFcBA
	 LacCS6eo3G98Cqyn/u27iDYGMTDYsgclleHLilGIoDgKWrMSFzRDc8D5uMGdcsC8ia
	 BFSchb+KezN7g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t13fA-0000000031s-44rx;
	Wed, 16 Oct 2024 15:02:05 +0200
Date: Wed, 16 Oct 2024 15:02:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
Message-ID: <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
 <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
 <682acd15-58c5-6bdf-f913-0940a2733451@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <682acd15-58c5-6bdf-f913-0940a2733451@marek.ca>

On Wed, Oct 16, 2024 at 08:44:26AM -0400, Jonathan Marek wrote:
> On 10/16/24 2:42 AM, Johan Hovold wrote:
> > On Mon, Oct 14, 2024 at 08:47:26PM -0400, Jonathan Marek wrote:
> >> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> >> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> >> possible.
> >>
> >> Add a qcom,no-alarm flag to support RTC on this platform.
> > 
> > An alternative may be to drop the alarm interrupt from DT and use that
> > as an indicator.
> 
> That wouldn't be right, the registers/interrupt still exist and should 
> be described in DT.

Yeah, the registers are still there, and are probably readable too
(IIRC), but the OS will never receive any interrupts.

> (if you have firmware that allows access to the alarm, now you only have 
> to delete the qcom,no-alarm property in your dts to use it)

Fair enough. And the new flag mirrors the old.

> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   drivers/rtc/rtc-pm8xxx.c | 44 +++++++++++++++++++++++++++-------------
> >>   1 file changed, 30 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> >> index c32fba550c8e0..1e78939625622 100644
> >> --- a/drivers/rtc/rtc-pm8xxx.c
> >> +++ b/drivers/rtc/rtc-pm8xxx.c
> >> @@ -61,6 +61,7 @@ struct pm8xxx_rtc {
> >>   	struct rtc_device *rtc;
> >>   	struct regmap *regmap;
> >>   	bool allow_set_time;
> >> +	bool no_alarm;
> > 
> > How about inverting this one and naming it has_alarm or similar to avoid
> > the double negation in your conditionals (!no_alarm)?
> > 
> 
> My reasoning is that the DT flag has to be negative, and its better to 
> use the same name as the DT flag, but inverting it is OK.

I agree about the dt parameter, but I still I prefer a non-negated
variable (similar to allow_set_time).

> >>   	int alarm_irq;
> >>   	const struct pm8xxx_rtc_regs *regs;
> >>   	struct device *dev;
> >> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >>   	if (!rtc_dd->regmap)
> >>   		return -ENXIO;
> >>   
> >> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> >> -	if (rtc_dd->alarm_irq < 0)
> >> -		return -ENXIO;
> >> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
> >> +						 "qcom,no-alarm");
> >> +
> > 
> > Stray newline.
> > 
> 
> That's not a stray newline?

There was no empty line between the assignment and check before this
change, but now there is even though there should not be.
 
> >> +	if (!rtc_dd->no_alarm) {
> >> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> >> +		if (rtc_dd->alarm_irq < 0)
> >> +			return -ENXIO;
> >> +	}

Johan

