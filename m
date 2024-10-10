Return-Path: <linux-rtc+bounces-2136-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8C49980A3
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFAF7283636
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18CF1E9086;
	Thu, 10 Oct 2024 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5/mWpCY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914FE1E883D;
	Thu, 10 Oct 2024 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549065; cv=none; b=rzvTJv66skJKJv8y4dHiy2NEO6W3A2J6tQi/wbQ1kJY+YQCmFMPIrImPoYcdGj0YdQFvWPrYyXKAhUO98Z+OWrZxFeaZF5FymzHmf4BProysSOrt8Ao2O+xJQ4jhbQIP6oSHOZQs9AV+YQSKdQ6AL9PLZwGYw5We3bVZy7xHceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549065; c=relaxed/simple;
	bh=hMyP0iqE4jdi89c9Hcn12/5V6EDBQa1FCfu88DXZVWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV/900hTAG/iIBSKWUPLnBrG8WCiZLkwTjlbtrRGo7nyGnEnd/+ne7i/ZS7zNVAJLfGai0zC8/h4u1aRwdk6fchrvuI+yrehSgDQzPQFExrAf70vTDu8mfQqE1Aeoo9hWO5k/KPDQWu1VqhHASe4T0Mygn7nb8phMcSO29RCr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5/mWpCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30769C4CECE;
	Thu, 10 Oct 2024 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549065;
	bh=hMyP0iqE4jdi89c9Hcn12/5V6EDBQa1FCfu88DXZVWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5/mWpCY7/+rOk132CtYiOVK4aiQxwl6d0jgfd6ewE5p5QxdWRPNxi0LZ8l9E1l6s
	 mSJTH7n6pjHa98hICIDfAIds9ZT84N6mzKDbyLijUxIYObXDh/bzdT33RirIRdhpcp
	 VAUAX+AVmsLGxuyB3W8cMGfW+o5wqqcXZN2PZ2zImaALb22It/rJePD05B/3AAJi2S
	 MQBcDeTXiYznMs1nOaiFwf66LiThj5Iugwvw4csIW6vnn/QIaxhRloRcNu/AWqIMZa
	 e6EhD7xRGU27PdpC3Wrm5KnPqr7Mry+nLtbdblmzjmjQvF2h9dqnb5Uhz7dojphoZN
	 57NUtuB45kTyw==
Date: Thu, 10 Oct 2024 09:31:00 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
Message-ID: <20241010083100.GB661995@google.com>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
 <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz>

On Wed, 09 Oct 2024, Karel Balej wrote:

> Lee Jones, 2024-10-09T11:06:43+01:00:
> > On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > > RTC lives on the base register page of the chip. Add definitions of the
> > > registers needed for a basic set/read time functionality.
> > > 
> > > 
> >
> > Applied, thanks!
> 
> Thank you, however I'm a little perplexed.
> 
> It was my understanding that RFC patches should not be applied without
> further agreement, is that not the case? Obviously this patch was very
> simple and I used RFC mainly because of the RTC driver itself, but I'm
> curious to know for future submissions.

I missed the fact that this was an RFC.  I can unapply it if you like?

> Also, I expected the entire series to go at once through the rtc tree
> with your ack as while it is not a strict dependency in terms of
> breakage, the first patch seems rather pointless without the follow-up
> which could theoretically take a long time to get applied and even some
> requested changes could require changes to this patch. Could you please
> explain what the policy is on this?

The policy is flexible.  However, the generally accepted rule is that if
there are build-time dependencies between patches, then one maintainer
(usually me since MFD is usually at the centre of these cross-subsystem
patch-sets) takes them and sends out a pull-request for an immutable
branch for the other maintainers to pull from.

However in this case, there are no build-time dependencies so the
patches are able to and therefore should go in via their respective
repos.

-- 
Lee Jones [李琼斯]

