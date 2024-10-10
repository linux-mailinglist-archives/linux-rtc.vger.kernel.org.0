Return-Path: <linux-rtc+bounces-2137-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EA9980B1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1440CB2333E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6191BB6BC;
	Thu, 10 Oct 2024 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIE9QQNy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331D61D0DEE;
	Thu, 10 Oct 2024 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549324; cv=none; b=uAUVrCMvfK8ie4UkZfjXaj0snk5vxBbZH63c+AelayF2wxXtFJWL+mcaQ9/xj241E3O3pHdE7Q8yRgYvG2m+pZQj99U0O4nS9lnvk3Ku6Iu9wQ7oGaEiKTLSRco5ax60yW88NEjUUNYpXOZ5Zy+jsJky9yXN+CHqUyL4F+xA91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549324; c=relaxed/simple;
	bh=FjCpKQcHBq2MJTA4mu6vcvwD0kBtWsw1rr0lcV+7Ufc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs8kwp5GmNU2G1+EySgXRoGRjK362IB+VALV6LgXdwvEv9uE5ZsMPacgu3TsO/RmpkrJDsVPoic5Kt0H4qCbOLsz1BLKGcTQCf5fLmQRSWBd/JD/YkQHlcTUGvEcOSIoj/4SjbMJTqKi/l3902XiMOR1Mj0mmgqf/jS455tAcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIE9QQNy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F119C4CEC5;
	Thu, 10 Oct 2024 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549323;
	bh=FjCpKQcHBq2MJTA4mu6vcvwD0kBtWsw1rr0lcV+7Ufc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIE9QQNyqADo/J6Gxhu5plzKAWPpHqsa44BkDiMJG8M8AEH2P03egxD5l7jvHTALo
	 /cZWE8YCexg1qK8jrT9idOSMHi9O3ok8u37oBKoKIu3o9/S7IsrKe2Bbf53Q5+jn9L
	 7cq8ewKBA9cxrZ/S0Kmht9ZvTppc2uqRCu1iRg106+I4YFcfql7vLFyuNhpA5yUuhL
	 /qTD/+Q75nx2VmJMilyE3t2IHNWkmpyuoVvaIaOkg/YCpBi1RR4GRAsI8ciR7GVkh6
	 QgONw4jBF6jAo0VlvuW9tWsChnYcrGPJh0tCyKLBa2Xq1N7z6qDNIVE2+QWioYHfUC
	 ivXaRgAjJTe3Q==
Date: Thu, 10 Oct 2024 09:35:19 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
Message-ID: <20241010083519.GC661995@google.com>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
 <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz>
 <20241010083100.GB661995@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010083100.GB661995@google.com>

On Thu, 10 Oct 2024, Lee Jones wrote:

> On Wed, 09 Oct 2024, Karel Balej wrote:
> 
> > Lee Jones, 2024-10-09T11:06:43+01:00:
> > > On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > > > RTC lives on the base register page of the chip. Add definitions of the
> > > > registers needed for a basic set/read time functionality.
> > > > 
> > > > 
> > >
> > > Applied, thanks!
> > 
> > Thank you, however I'm a little perplexed.
> > 
> > It was my understanding that RFC patches should not be applied without
> > further agreement, is that not the case? Obviously this patch was very
> > simple and I used RFC mainly because of the RTC driver itself, but I'm
> > curious to know for future submissions.
> 
> I missed the fact that this was an RFC.  I can unapply it if you like?
> 
> > Also, I expected the entire series to go at once through the rtc tree
> > with your ack as while it is not a strict dependency in terms of
> > breakage, the first patch seems rather pointless without the follow-up
> > which could theoretically take a long time to get applied and even some
> > requested changes could require changes to this patch. Could you please
> > explain what the policy is on this?
> 
> The policy is flexible.  However, the generally accepted rule is that if
> there are build-time dependencies between patches, then one maintainer
> (usually me since MFD is usually at the centre of these cross-subsystem
> patch-sets) takes them and sends out a pull-request for an immutable
> branch for the other maintainers to pull from.
> 
> However in this case, there are no build-time dependencies so the
> patches are able to and therefore should go in via their respective
> repos.

Actually, it looks like there are build-time deps between them.

Please break out the inclusion of the additional defines and place them
into the RTC patch.  I will then Ack that one.  The patch making changes
to driver/mfd will still go in via the MFD repo.

-- 
Lee Jones [李琼斯]

