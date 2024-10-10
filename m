Return-Path: <linux-rtc+bounces-2158-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44C998D36
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 18:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33EDA1C209C2
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAB71CDFBB;
	Thu, 10 Oct 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azP8RG08"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F507DA62;
	Thu, 10 Oct 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577390; cv=none; b=KTV/b4sLG4t3I3IgRBEhIrK0+Mai1l4jWJ0m0CGaw409K5U2w8MRPjFUoL1KyLYTm4P/cAtq9dwFYV5ndG0IC0mroJzshzbhN+GQTDG7kqJCSSCm1I1UioNrLGnb79Jqkh50IGi2A9HcUODgeQDo9QJdy7yv4cBt7LYlKL1J/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577390; c=relaxed/simple;
	bh=wiaG2hsbl0nrHihLZXw7EYkseAZel52F+tdBzkQViqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZPp6Hu8OR01BjWIeKeY9D0KNeuROh+Hamyq4n1qhc9eHF48mD9lXgQDqCCoFH86BLyEuMt+oXkwU2BpcB57RTlg7RE28rr5KQjZsE2lsRtFkL+eEWSnkVYS5fcjNvmXd3khnYtVf/QpiUPHvIkNJNwNPxFkHVNVpKgSQVdOsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azP8RG08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308DAC4CECC;
	Thu, 10 Oct 2024 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577390;
	bh=wiaG2hsbl0nrHihLZXw7EYkseAZel52F+tdBzkQViqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azP8RG08Jbq7hKgZHYBAgv02d3feoyJUdCV1g7+LeLaVmC9PX2s5OEkXYN/hqEqvK
	 IPdmy+yBUdDM2GHpm2/1qbykjIZSreO/PYITIh9RNydbMa2Hsh4h1DJlmxLqvTKxyf
	 lP4HNH9KZa6Qi0nLHV4mcNm/JofNKFVTJcpZaAxEmfPohCCq8gg+Qctqivxt5AuQKo
	 uKJ0BSwIuhD+TpRdT/T3n2MaceOu6Inx5CMFv8tkjBBKu1c/L3J0hm4px0QKdnvKT0
	 Ywl9vr4+YLOAB4w0bdwsnnFezOoy+xIvxX7D43OlXOPMXs8CjBsm20Nv2b3DoD2zPF
	 it5nWWod3Gcqg==
Date: Thu, 10 Oct 2024 17:23:06 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <20241010162306.GI661995@google.com>
References: <ZvVNCfk10ih0YFLW@fedora>
 <172848415740.588729.14326036177340227520.b4-ty@kernel.org>
 <2d48be5a-a259-4ab8-89dd-e662110d4d68@gmail.com>
 <20241010162233.GH661995@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010162233.GH661995@google.com>

On Thu, 10 Oct 2024, Lee Jones wrote:

> On Thu, 10 Oct 2024, Matti Vaittinen wrote:
> 
> > On 09/10/2024 17:29, Lee Jones wrote:
> > > On Thu, 26 Sep 2024 15:01:13 +0300, Matti Vaittinen wrote:
> > > > A few ROHM PMICs have an RTC block which can be controlled by the
> > > > rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> > > > from the parent MFD driver. The MFD driver provides the interrupt
> > > > information as a set of named interrupts, where the name is of form:
> > > > <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> > > > 
> > > > >From the RTC driver point of view it is irrelevant what the PMIC name
> > > > is. It is sufficient to know this is alarm interrupt for a block X. The
> > > > PMIC model information is carried to RTC via the platform device ID.
> > > > Hence, having the PMIC model in the interrupt name is only making things
> > > > more complex because the RTC driver needs to request differently named
> > > > interrupts on different PMICs, making code unnecessary complicated.
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!

Unapplied.

-- 
Lee Jones [李琼斯]

