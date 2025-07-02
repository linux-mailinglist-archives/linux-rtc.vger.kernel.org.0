Return-Path: <linux-rtc+bounces-4412-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA0AF5E91
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 18:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF0D8167871
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143A32FF499;
	Wed,  2 Jul 2025 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvIcD3Ie"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C02FD597;
	Wed,  2 Jul 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473586; cv=none; b=RmiEDDBxnlSBXq2X3/ERpZBuhEdp4OR1A/QUo1B440J28rCOI4yRNGYX+NaN12as2DXgpiHJt/KNq084Bii3Ce33AWhsm8Ki7EvaKWvT6z4yJ1CgVrnOOX1C/8o9M4XJ+PcOGr5VGmtOkU0GaFeGT4bjn3JbQ9xdIvhKz2vfvXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473586; c=relaxed/simple;
	bh=MK0TeEDtIYEG+qBbIu9c9zXZjic9aPUL1e3LYCTRgLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUkW8wK747bMvZxvb5Mj8QrzDzVxiHS76VtWdec6KhAByL+geI5gZBNYrcJC/effz76L0a5rmvroPeLGo570Jy0cB0n/9frUKDYM/+nbPj2eVW5vrZ2mH4aF6Ge7e5c2ZJCVM7Wo3+NH748XLplgPef5xy88SXwpTfMN0vXyNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvIcD3Ie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FB9C4AF09;
	Wed,  2 Jul 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473586;
	bh=MK0TeEDtIYEG+qBbIu9c9zXZjic9aPUL1e3LYCTRgLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvIcD3Ie5dSYOZ0oz9yAtCTe4rl3T57V8I636/dO+Blo49qAcxJ5YObOaqwmA5LTI
	 UbEgko3Ae4m1UXqGcu6Zc76uYkHiY9CdVsrjfqxQzoZCLNq30/KYn6TbkEJRDC8eV1
	 wu0X+hlp+IHSgABor5nc/eSiZ9PZZSYsSDmYt6d3nc+rpsQPzgixUczz57zh1MVDJm
	 sHQQ2lVrAb4xftyGSltUYjrooYe7fP9hfJK08/DUlOTkfENchV89XlCbA60sRTPsjA
	 jHgXldVmJd01Y5BGBsSZl6q1MiKBUJs/S3x2cxqXes0juev8I5CRoRlulX4u54DXfc
	 z9nFhjT70sHuA==
Date: Wed, 2 Jul 2025 17:26:20 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250702162620.GA10134@google.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
 <20250702152618.GU10134@google.com>
 <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>

On Wed, 02 Jul 2025, Alex Elder wrote:

> On 7/2/25 10:26 AM, Lee Jones wrote:
> > On Fri, 27 Jun 2025, Alex Elder wrote:
> > 
> > > All devices supported by simple MFD use the same 8-bit register
> > > 8-bit value regmap configuration.  There is an option available
> > > for a device to specify a custome configuration, but no existing
> > > device uses it.
> > > 
> > > Lee Jones suggested modifying the simple MFD implementation to
> > > remove the generality of the full regmap configuration and add a
> > > max_register value to the simple_mfd_data structure.  This can
> > > be used in the regmap configuration to limit the valid register
> > > addresses if desired.  It's simpler, and covers all existing and
> > > anticipated device types.
> > 
> > Woah, not like this.  I wanted to make the framework _more_ flexible.
> 
> OK, sorry I misunderstood.  I'll send another new version today
> that does what you suggest.

No worries.  Perhaps I wasn't clear enough.

-- 
Lee Jones [李琼斯]

