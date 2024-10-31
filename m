Return-Path: <linux-rtc+bounces-2398-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80109B7CD1
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 15:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75944282461
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 14:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A741A0B00;
	Thu, 31 Oct 2024 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqYedp1k"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AF19F48D;
	Thu, 31 Oct 2024 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384869; cv=none; b=NrgwmTBrYdA+ASv3q1YxlzX6yNHy/vkUMwr01VyxCBTaFlo314z6+9Kh8TRCDS0cKz0i3W8nFxFHzx4JXxMTDPETQtkav26ZNX/n4aIsPFT525GzHuGNIuT9oYPHiCoH39lK5rOfDHl8d2/Ypaqg3SCWtcH6eIUoxOgG+BKCn9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384869; c=relaxed/simple;
	bh=sbEKJSLR6SCM/xtwqORFWG5BjxTETy5KcvbqWWDD+cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3IhMVHGZtdeoXb8hWVUKWibzbIDwG1sPGNsjvauSb+xNPrsXGReZ4cz0MToEWEP/NSOfPO2sx+0hTfE5MK/t6vM8r+TF7FYUqxHjfQeoSg8IXUsyc/dkgVlGVroa/XGDTSIETmpjJ0f6dguz1hiIBnpssCRyzGePaugXkGke1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqYedp1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F74C4CED1;
	Thu, 31 Oct 2024 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730384869;
	bh=sbEKJSLR6SCM/xtwqORFWG5BjxTETy5KcvbqWWDD+cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqYedp1kEYbPQN9Teylixth5QYodrv4gL1IF8I7g9BodQuZ1x/uGkwlr9P6XcYNcz
	 Sx5GLl7Xcp+zGGfARhho0lQLVY/x+HKgCzOb0ALQZdgFXRshL9bxXCWKb/mgmHniAi
	 SQ+dyE0tPNIL2XlgSjMqIFqKvg887995j6dCVkllmzAiu+2A62Vtx6z97TpqX2/jon
	 lUWVfG0puB9xcpMF5ggI9HE0KDLQio0FL6tKkqgfAgMK3/RDNQm43mqWsYrWKoB+ON
	 Xy3vgFWVNl5XSDdvXDVD9YRLxjDXxxCSR0CKeg17EIw3A6sex5kpxaygwrqSK5QWGW
	 hyo+PhIJ8i8gg==
Date: Thu, 31 Oct 2024 14:27:45 +0000
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <20241031142745.GG10824@google.com>
References: <ZvVNCfk10ih0YFLW@fedora>
 <20241009134416.GJ276481@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009134416.GJ276481@google.com>

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Thu, 26 Sep 2024, Matti Vaittinen wrote:
> 
> > A few ROHM PMICs have an RTC block which can be controlled by the
> > rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> > from the parent MFD driver. The MFD driver provides the interrupt
> > information as a set of named interrupts, where the name is of form:
> > <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> > 
> > From the RTC driver point of view it is irrelevant what the PMIC name
> > is. It is sufficient to know this is alarm interrupt for a block X. The
> > PMIC model information is carried to RTC via the platform device ID.
> > Hence, having the PMIC model in the interrupt name is only making things
> > more complex because the RTC driver needs to request differently named
> > interrupts on different PMICs, making code unnecessary complicated.
> > 
> > Simplify this slightly by always using the RTC driver name 'bd70528' as
> > the prefix for alarm interrupts, no matter what the exact PMIC model is,
> > and always request the alarm interrupts of same name no matter what the
> > PMIC model is.
> > 
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > 
> > ---
> > This contains both the RTC and MFD changes in order to not break the
> > functionality between commits to different subsystems.
> 
> I can take it with an RTC Ack and an indication whether an immutable
> branch should be created and shared.

I fear this may have fallen from Alexandre's queue.

Please submit as a RESEND.

-- 
Lee Jones [李琼斯]

