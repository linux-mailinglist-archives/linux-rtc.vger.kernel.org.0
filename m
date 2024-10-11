Return-Path: <linux-rtc+bounces-2161-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92C999E1C
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 09:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75DAB28A7F6
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 07:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3593209689;
	Fri, 11 Oct 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdj7QnNb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943A6207A30;
	Fri, 11 Oct 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632414; cv=none; b=j1GhOfnaoS1PG1zKuGxDEP1wcecFAyZ+i4zxXL70zXMAKtvHJS6uJRFjrBVkg+Z8Ruc5SNXb/+nqADAB/YxhlNq/00jaI4AWh9qKk0c+c7AQuWywt38cZf3yUW8Qn18SzJE5kf1hXIuzi7RIk9DfiRyGbwzB1i01/GCNgFbQh4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632414; c=relaxed/simple;
	bh=ufe1xPjenN3eDVYHCnQkY7klh2kLErGpDUiRsq7Aygw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN/e5quBbcDzsSlPecJcGru/ybodBCpIcJczH6c6KMlzKBcM6TVVBriV/I8JrlInZlvdoHJFlqFEOxKo2lWLhmFSTMZ4uzRqMwBuGvTD8F25CUlYVX5A8RTaep6FoiDMQcEgPacrLS72mvMRnfsB37DxW7UzbyiLASzWBO03OjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdj7QnNb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFA3C4CEC3;
	Fri, 11 Oct 2024 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728632414;
	bh=ufe1xPjenN3eDVYHCnQkY7klh2kLErGpDUiRsq7Aygw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdj7QnNbS+n42PAUJAwDuz5+0Vwz+wKsoXpey0YtbomEQzGZV8tFN39xZfOkxF2ys
	 ZI6Bxxw8ubCw/mRkjd7ExwOSIxyJ9iWNH1BO1/AcAz1tB3elvRW8v08dzSVu35dfua
	 M27wFxddC5poYu3O2rsMjTbdrVpISZY+W2qN1ykiFCjJkbCyjwalVCh+83gtEItOdO
	 Zs9zwBHvkHQ09kYMoTtiKf9weBydE8uvBpqGIv/NlL1TUaNCySPI+5POLjO6Y/8rtm
	 cBtNLr2To/Tu9D3N1pxj+U+qqxzOr+YMlYEG3WXx2HF3RDYl2k4RW8o3QVfpo1WEyM
	 0a4JcFIKG37Cw==
Date: Fri, 11 Oct 2024 08:40:09 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
Message-ID: <20241011074009.GM661995@google.com>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
 <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz>
 <20241010083100.GB661995@google.com>
 <20241010083519.GC661995@google.com>
 <D4S9WUGGL00V.16E4ARKMPS1JJ@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D4S9WUGGL00V.16E4ARKMPS1JJ@matfyz.cz>

On Thu, 10 Oct 2024, Karel Balej wrote:

> Lee Jones, 2024-10-10T09:35:19+01:00:
> > On Thu, 10 Oct 2024, Lee Jones wrote:
> >
> > > On Wed, 09 Oct 2024, Karel Balej wrote:
> > > 
> > > > Lee Jones, 2024-10-09T11:06:43+01:00:
> > > > > On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > > > > > RTC lives on the base register page of the chip. Add definitions of the
> > > > > > registers needed for a basic set/read time functionality.
> > > > > > 
> > > > > > 
> > > > >
> > > > > Applied, thanks!
> > > > 
> > > > Thank you, however I'm a little perplexed.
> > > > 
> > > > It was my understanding that RFC patches should not be applied without
> > > > further agreement, is that not the case? Obviously this patch was very
> > > > simple and I used RFC mainly because of the RTC driver itself, but I'm
> > > > curious to know for future submissions.
> > > 
> > > I missed the fact that this was an RFC.  I can unapply it if you like?
> > > 
> > > > Also, I expected the entire series to go at once through the rtc tree
> > > > with your ack as while it is not a strict dependency in terms of
> > > > breakage, the first patch seems rather pointless without the follow-up
> > > > which could theoretically take a long time to get applied and even some
> > > > requested changes could require changes to this patch. Could you please
> > > > explain what the policy is on this?
> > > 
> > > The policy is flexible.  However, the generally accepted rule is that if
> > > there are build-time dependencies between patches, then one maintainer
> > > (usually me since MFD is usually at the centre of these cross-subsystem
> > > patch-sets) takes them and sends out a pull-request for an immutable
> > > branch for the other maintainers to pull from.
> > > 
> > > However in this case, there are no build-time dependencies so the
> > > patches are able to and therefore should go in via their respective
> > > repos.
> >
> > Actually, it looks like there are build-time deps between them.
> 
> Indeed, I didn't realize that yesterday. What I had in mind before was
> in fact the other part of the patch: I was wondering about the policy of
> applying a patch adding a MFD cell for which there is no driver
> available. That's what I meant by "not a strict dependency in terms of
> breakage".

I've become less strict about that over the years.  The chances of the
accompanying driver not going in over the next release or so is usually
very small.

> > Please break out the inclusion of the additional defines and place them
> > into the RTC patch.  I will then Ack that one.  The patch making changes
> > to driver/mfd will still go in via the MFD repo.
> 
> So the above in other words: it sounds like you would apply this updated
> patch independently of the RTC driver because otherwise you could just
> ack the current version, is that correct? If so, I cannot see why this
> would be preferable given what I wrote before about the RTC driver being
> possibly delayed or eventually given up on (not that I would expect that
> to be the case here :-). Could you please still comment on this then?

As above.  I trust you. :)

-- 
Lee Jones [李琼斯]

