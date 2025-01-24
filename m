Return-Path: <linux-rtc+bounces-3040-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BBA1B792
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 15:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E7716BBD9
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6588D78F23;
	Fri, 24 Jan 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PISFTcUW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1E13C807;
	Fri, 24 Jan 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737727642; cv=none; b=OKCVpM3ZwFiZrhnYqsm5k/z8LTLmoBFkMVPdIZmBD5FYe9GHXJDxKhlUOMLc0lD4qBWHf8oQ6Jqq5uccm8EACqlgtk+wpbSLZGnWrxt0f2+KXqXAMgH7zp8Pa7VdiI3YizhYxw14zIpZra3xKI1dRMt49UCaWvZZ1my6TRT+9dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737727642; c=relaxed/simple;
	bh=wxYCuWnJt+GTJlbMqLQWecdmDxpr7pUhECUTtYJ6/I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6O+99HpzrhKMD7y2eJv1G+jongOB9wOHN6s0wCPb80DakExM5U7bQYJuqT3cL7V+nQhpV/6y9DIVc+qyPsOS3tBbfVOGfAsuvVZSz4oSlj2hHAaoUkaHCqfkAIyzJB0iPJvqGd/ECfTwjSjzqj/8JzFsQjgJIa+DD3s6zqP+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PISFTcUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD29C4CED2;
	Fri, 24 Jan 2025 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737727642;
	bh=wxYCuWnJt+GTJlbMqLQWecdmDxpr7pUhECUTtYJ6/I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PISFTcUWLvH42s6xDtcILB0SJDo54dASpkJMzyqUkbw02Kfn4T82hLkn5yVmnRWIe
	 jSSkeJJ7eAycnUYlzmWZtxbGlp1j2n4aIqSH47D8a+0pvhsK/e5ai6nBrNiW9ldIJT
	 Wod4ZZOxW1RRxyln3aXqDQ9OhED9cBzP2D/rEDTOgkwgQtLbDzhGGju9D7SIa6uLUn
	 ngDf/JkzLnSSlANTlti3zWW5kFMVOl/7EobN01Ey3tt4vDDG3irnxFwi6H2paYhoKd
	 aSyHaL8AIPzGdg3OLxxWmbZB3aQ9JRnb/D5t1Pjn16WJ3n3XgCZux30yS9zMFLsMBv
	 phX0uqev/tF3Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tbKLI-000000007bb-3rDQ;
	Fri, 24 Jan 2025 15:07:28 +0100
Date: Fri, 24 Jan 2025 15:07:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <Z5OeoMUAVmhxElwA@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
 <wkkhlpgqf7vdtsmxqdt6izysj7nmbemmzf3lkclbg5oewn3xz5@oybsmken7s4h>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wkkhlpgqf7vdtsmxqdt6izysj7nmbemmzf3lkclbg5oewn3xz5@oybsmken7s4h>

On Fri, Jan 24, 2025 at 01:56:56PM +0100, Tobias Heider wrote:
> On Mon, Jan 20, 2025 at 03:41:48PM GMT, Johan Hovold wrote:
> > On many Qualcomm platforms the PMIC RTC control and time registers are
> > read-only so that the RTC time can not be updated. Instead an offset
> > needs be stored in some machine-specific non-volatile memory, which the
> > driver can take into account.
> > 
> > Add support for storing a 32-bit offset from the GPS time epoch in a
> > UEFI variable so that the RTC time can be set on such platforms.

> Thanks for the great work Johan, seems to work nicely here!

Thanks for testing.

> I think you might need to add MODULE_IMPORT_NS(EFIVAR) for the efivar_*
> API calls you added.

It's already there (inside the ifdef):

> > +#ifdef CONFIG_EFI
> > +
> > +MODULE_IMPORT_NS("EFIVAR");

Johan

