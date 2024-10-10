Return-Path: <linux-rtc+bounces-2157-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF9998D2E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 18:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8B51F21A78
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 16:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BED1CDA3F;
	Thu, 10 Oct 2024 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2L3IVx/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74C57DA62;
	Thu, 10 Oct 2024 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577357; cv=none; b=YSIFkmTKszfh8mzLKwIuAa6c6kQGDByh/hPsy3Yx9UNVKmA4+IKgHUAENxk5mh2/kNs2s4Ni53jAGuxf9AEot/CRI2KL/phqwKOMv6HJQGXFfvVPENSJ3oRNNRXX6GeTKW7hs0KbFEwJ8Ddeith3GaTtFpMPH7Li6uuJ3153m64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577357; c=relaxed/simple;
	bh=wfNXoBUE/fKR4ZCx4sn7qg+tVZJPZmlq6y1KBKZ2avo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx/9o3xXpoZQLwzyofk1Zuph5ta/Obu37Mrdmb1ueqSO6Lu1uHWMOonjjEKPmEg3C6D4RikbWi3hK2zVfjI5eQe+6OdJEkoeUtgeClflt5SXdh+DkMtJ3mtug2Llkm4+tws7ucMmd3+2lNf3+6zOdNPrKy1j3fex0KtrLQ5AwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2L3IVx/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5475CC4CEC5;
	Thu, 10 Oct 2024 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577357;
	bh=wfNXoBUE/fKR4ZCx4sn7qg+tVZJPZmlq6y1KBKZ2avo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2L3IVx/hhk6gSw2T5URJmZJcBS2aR686SoslCcr/f37i4Gb1b5i8OUQkGjI+Szjn
	 ih23HxaYI2SZNuN+oY+6lRnlJZpERlRO4+HrUj1vBdMOLOCVJZUG1GEXTumI8hX3pp
	 NfdYDW3FrUFOxiBowAsF+yZjfFIRrxawgFNIFh9zrKAscKOCUFwWJcIQCPLVV9iKeF
	 UmwSmfDl2kSjOJJFaAK0kZxY5n3ZAbJdUZC7s32hi90FucfP074placO6m38+fPcxB
	 g/B83xgZRqacO0YSrtgnNK0H+Frl/yLNtw6pkUo8lTf7ZtAik2NhuiwStUXtNbskyj
	 JCg+b6iJlAQrg==
Date: Thu, 10 Oct 2024 17:22:33 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <20241010162233.GH661995@google.com>
References: <ZvVNCfk10ih0YFLW@fedora>
 <172848415740.588729.14326036177340227520.b4-ty@kernel.org>
 <2d48be5a-a259-4ab8-89dd-e662110d4d68@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d48be5a-a259-4ab8-89dd-e662110d4d68@gmail.com>

On Thu, 10 Oct 2024, Matti Vaittinen wrote:

> On 09/10/2024 17:29, Lee Jones wrote:
> > On Thu, 26 Sep 2024 15:01:13 +0300, Matti Vaittinen wrote:
> > > A few ROHM PMICs have an RTC block which can be controlled by the
> > > rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> > > from the parent MFD driver. The MFD driver provides the interrupt
> > > information as a set of named interrupts, where the name is of form:
> > > <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> > > 
> > > >From the RTC driver point of view it is irrelevant what the PMIC name
> > > is. It is sufficient to know this is alarm interrupt for a block X. The
> > > PMIC model information is carried to RTC via the platform device ID.
> > > Hence, having the PMIC model in the interrupt name is only making things
> > > more complex because the RTC driver needs to request differently named
> > > interrupts on different PMICs, making code unnecessary complicated.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] mfd: rtc: bd7xxxx Drop IC name from IRQ
> >        commit: cd49b605779b4fea8224650eeba70b258c5cc8cc
> 
> Hello Lee, Alexandre,
> 
> Nothing pleases me more than having this quickly merged but...
> ... I don't think I saw ack from Alexandre yet. Furthermore, the (subset)
> makes me wonder because I sent RTC and MFD changes in a single patch - which
> might've been a mistake...
> 
> I tried finding the cd49b605779b4fea8224650eeba70b258c5cc8cc from MFD tree
> and failed. Hence I'm a bit unsure where we are going.

Applying this was a key-binding mistake.

This was my real intention:

  https://lore.kernel.org/all/20241009134416.GJ276481@google.com/

-- 
Lee Jones [李琼斯]

