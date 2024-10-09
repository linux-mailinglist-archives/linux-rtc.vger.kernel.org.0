Return-Path: <linux-rtc+bounces-2131-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84210996C81
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 15:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 044E9B21670
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DFF1990DD;
	Wed,  9 Oct 2024 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikULBheg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB191990A7;
	Wed,  9 Oct 2024 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728481461; cv=none; b=Mo5BnfQfLF5ZEb3jnazrYiAKX8eDYI4+mu1tCZvfyJonRe+eA1l066c/g9cu3S0aTOSpHdg2HADMu1yn4rBKim0jrwbKJzi6KnPTMFAUUrpq7h611sHwL09vbchx5J2RAmekngcDTJPMKbXnxjiFT9aM2Gx/0HDAapcMa5qJ7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728481461; c=relaxed/simple;
	bh=4s3Ll570CEXXXOM35CmndjfaF+lPBtnfxA2ujcrrsec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEy8iqaQfqVqiJnIalKWhmqbkVtqxR5hlX6EJ1c0/D3Jec5LqtNJPgY1+ETfASh17evztW6xHKUo82uBETXBF8Tdq7LLCzbQZNmO4fkq9RXkHMUab1Ru3Xh8zoQri/J90jOmodj+F2F2J7teJSL99l88G1Xtq2TNLj+eoFeqRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikULBheg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9E6C4CEC5;
	Wed,  9 Oct 2024 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728481460;
	bh=4s3Ll570CEXXXOM35CmndjfaF+lPBtnfxA2ujcrrsec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikULBheg5mrkdUjA0NV2K5MP8cAcKv2Qf0js3IZ8aV8wRKu2zKNc4k2+gsq/vhTqS
	 MWP62VtedEWtDo70hGjETHLT953VYZEjZqa41K9wHudEGcrqvc272wiF+xFX2lipTf
	 CdkySdGSX+rnP/GbO0MkNWg+Sc98REQ/zMABlZF4YSo0yVxCw2QcBL7czHlzIBru2W
	 pEBKoFMVeuvI+rYz0LS9Ydjs6EwvIqwzmJRsWC0uMOO+WnNw0ILsF6ikQwoYxE/pY0
	 wLUYFbOpz29woAm8k4NGpkLWA0tCIE14AjwGEtTC1sH4/SSKUE/AcSc2lsquabnnrF
	 cTTtRjYxO5ikA==
Date: Wed, 9 Oct 2024 14:44:16 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <20241009134416.GJ276481@google.com>
References: <ZvVNCfk10ih0YFLW@fedora>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvVNCfk10ih0YFLW@fedora>

On Thu, 26 Sep 2024, Matti Vaittinen wrote:

> A few ROHM PMICs have an RTC block which can be controlled by the
> rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> from the parent MFD driver. The MFD driver provides the interrupt
> information as a set of named interrupts, where the name is of form:
> <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> 
> From the RTC driver point of view it is irrelevant what the PMIC name
> is. It is sufficient to know this is alarm interrupt for a block X. The
> PMIC model information is carried to RTC via the platform device ID.
> Hence, having the PMIC model in the interrupt name is only making things
> more complex because the RTC driver needs to request differently named
> interrupts on different PMICs, making code unnecessary complicated.
> 
> Simplify this slightly by always using the RTC driver name 'bd70528' as
> the prefix for alarm interrupts, no matter what the exact PMIC model is,
> and always request the alarm interrupts of same name no matter what the
> PMIC model is.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> This contains both the RTC and MFD changes in order to not break the
> functionality between commits to different subsystems.

I can take it with an RTC Ack and an indication whether an immutable
branch should be created and shared.

-- 
Lee Jones [李琼斯]

