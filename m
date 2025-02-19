Return-Path: <linux-rtc+bounces-3227-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B6A3C012
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F15188B778
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522F91E32D3;
	Wed, 19 Feb 2025 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFWk/jig"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BA1E0DFE;
	Wed, 19 Feb 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972227; cv=none; b=YMsNGNFC13Kl5UcXYnUuYiEO59ctVw8yyv5l7tub22vIUfC7com6907qWSHmlA/3IKAzCBKuPrZePr49ALjl59lZxG6VPgNQSGgyL+nyT347XF5lNzIw5ua+WYE0xQgdcO1GV73LC+ukDhiO1Gjh7P9RAY3kG7fXwbHG3k2UVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972227; c=relaxed/simple;
	bh=b17Q3TzJrxxMz54pH+z89L0mjFrLAuOg+g6ZufoF97s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAOB5Seutnp3fUK7zybMfxXHiRFIb7I7rAvOCxvuNBLA06SJn1jY9dPE3Y6Zaaz0/F+iOGD21BcjzMNgM8elkI3VQxsJnsM5TUo+zTWfuQvGu4UakRB1ivnVTURvv3o5vruhKkeiQXcG08zOSaFXxMHQDSrc0/Y5Gffv2i/3/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFWk/jig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95174C4CED1;
	Wed, 19 Feb 2025 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972225;
	bh=b17Q3TzJrxxMz54pH+z89L0mjFrLAuOg+g6ZufoF97s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFWk/jigD0B6pdk/g694GJQE+a3tmWLH0SoUAQHDwCziKd5q8xxoXBELWEZtO/T8A
	 ZV8XhVOFg98l9eb2uK+IhaRvdkTru5HbRWXF4gXLqdOGSF7EGYJWKCP/LkxGF+U/Lb
	 3kl8NTwlajJ2t73By5PY8eFW2B8PS4AwkfY3vXRH8wfaHkOzGNCoTcy/5ifmDQseod
	 O+LPHPsTvGqq2rUOZ75BsdWG3JEuwAR1InZocPsEHvRCTfbSihcvnt9dS9Os7MRjeo
	 kf3IsULrYTmiayEK1z8wWIuHu/ag91OtIE2KQX+Pi9hP5mE9VMfEuEn+GmJKnLQ8QM
	 L6TuLZXjBN29A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkkGI-00000000802-30yU;
	Wed, 19 Feb 2025 14:37:14 +0100
Date: Wed, 19 Feb 2025 14:37:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z7XeioAlf69sp0aj@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250127002026.GA2534668-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127002026.GA2534668-robh@kernel.org>

[ +CC: Ard and Maximilian ]

Hi Rob,

and sorry about the late follow up on this. I had to find some time to
think more about this so it ended up on the back burner.

On Sun, Jan 26, 2025 at 06:20:26PM -0600, Rob Herring wrote:
> On Mon, Jan 20, 2025 at 03:41:45PM +0100, Johan Hovold wrote:
> > This series adds support for utilising the UEFI firmware RTC offset to
> > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > Elite machines.
> > 
> > Included is also a patch to switch the Lenovo ThinkPad X13s over to
> > using the UEFI offset.
> > 
> > The RTCs in many Qualcomm devices are effectively broken due to the time
> > registers being read-only. Instead some other non-volatile memory can be
> > used to store an offset which a driver can take into account. On Windows
> > on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
> > storing such an offset.
> > 
> > When RTC support for the X13s was added two years ago we did not yet
> > have UEFI variable support for these machines in mainline and there were
> > also some concerns regarding flash wear. [1] As not all Qualcomm
> > platforms have UEFI firmware anyway, we instead opted to use a PMIC
> > scratch register for storing the offset. [2]
> > 
> > On the UEFI machines in question this is however arguable not correct
> > as it means that the RTC time can differ between the UEFI firmware (and
> > Windows) and Linux.
> > 
> > Now that the (reverse engineered) UEFI variable implementation has been
> > merged and thoroughly tested, let's switch to using that to store the
> > RTC offset also on Linux. The flash wear concerns can be mitigated by
> > deferring writes due to clock drift until shutdown.
> > 
> > Note that this also avoids having to wait for months for Qualcomm to
> > provide a free PMIC SDAM scratch register for X1E and future platforms,
> > and specifically allows us to enable the RTC on X1E laptops today.
> > 
> > Rob had some concerns about adding a DT property for indicating that a
> > machine uses UEFI for storing the offset and suggested that the driver
> > should probe for this instead. Unfortunately, this is easier said than
> > done given that UEFI variable support itself is probed for and may not
> > be available until after the RTC driver probes.
> 
> This information would be useful in the binding commit...
>
> Seems like something I would say, but this is v1 and I have no memory of 
> discussing this. 

You're right, I should have mentioned this in the commit message and
linked to the RFC discussion directly:

	https://lore.kernel.org/lkml/Y9qO0yQ7oLux2L9n@hovoldconsulting.com/

> I would also say probe ordering is not a DT problem, 
> but sounds like an OS problem. Aren't there other things needing EFI 
> variables earlyish too? Do you really want to have to update the DT to 
> enable this?

Yeah, there are more things that expect EFI variables during early boot,
including systemd. In fact, that is the reason why the Qualcomm efivars
implementation can currently only be built in:

	https://lore.kernel.org/lkml/ZJ11H8btBhvCx9gD@hovoldconsulting.com/

The variable service is supposed to be a runtime service that is
available when drivers probe (module init), so I think it's reasonably
to simple refuse further modular efivars implementation (we already have
another from Google).

Since allowing the Qualcomm implementation to be modular now would
regress user space it seems at least that one will need to stay built-in
indefinitely.

And again, hopefully all of this goes away (for future platforms) once
Qualcomm fix their UEFI implementation so that the UEFI time and
variable services can be used directly.

I've dropped the DT property for v2. 

Johan

