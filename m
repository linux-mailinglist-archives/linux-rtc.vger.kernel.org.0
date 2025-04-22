Return-Path: <linux-rtc+bounces-3974-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B57A96D2F
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Apr 2025 15:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B99D4015DE
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Apr 2025 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D0C281370;
	Tue, 22 Apr 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecEvA8KN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812D280CD2;
	Tue, 22 Apr 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329189; cv=none; b=tP+GmjSf249bk3cG6qYBj1a5iDX+tf5r9Ii++YcXPMgbPGhhDWB7QiY2zi5ptd35KYlK7IhexZNKqm27ON5xHmCYTSADVsQI6RE3dCkfvBQqMEfd8HMQChrmX52zBDlK+s1qFdOCObrd3iBtx9XSPVNJTNsNm10NrkTLOZSkzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329189; c=relaxed/simple;
	bh=RRMkSQ6dpu08+r+o2kINCZkfxWvHTejP9hsfltA7pwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/oSt6Cfohcu5nFbQV3gE4jh0jnIer2gZLnwAf30G/byL0wBv5nLkKNrUASAKqF+gqum9HQ0ARLWObUnQ8Ot8tQKRgpTkyX4IJaRVfVVNQpMrGoDYKwISvEG+5qHz7hCAoXxphLeT+wP3rRX4QLGIHNgg3ulRHnZb5eZRI55tkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecEvA8KN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E25C4CEE9;
	Tue, 22 Apr 2025 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745329189;
	bh=RRMkSQ6dpu08+r+o2kINCZkfxWvHTejP9hsfltA7pwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecEvA8KNq5aqRqgySwz19zoc5spezyErx6ZrvJS3CLpyo15NfNPnUhKqXMnn0Gaxd
	 7k1Tt49aQAGe9+g19yQxZjVl07jzdFT+6b55nRkHE2poFZNVYlSZtGKEkMKbYt6fHz
	 nZamK3v7b8RV0Spb7bMRJvB4rYKJzVUYCQQG31Wji8wDhAqU0QctoEiYvygAwWv9mS
	 RHNddLw3L0EwI0OC90BLILKWFmJpAlARfB/NaY0OCX9nY3doSOTzZAELOcRg6Obdt8
	 8yPk1/IMJzuh0rwSfAq2oiqkLZdSJ3JQ3S0IoVhTelN/Im8/IjNNIbifTr5D5l0rQI
	 d5TSy8WSKEHYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7Dqk-000000005rC-3LpE;
	Tue, 22 Apr 2025 15:39:47 +0200
Date: Tue, 22 Apr 2025 15:39:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <aAecIkgmTTlThKEZ@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250127002026.GA2534668-robh@kernel.org>
 <CAF6AEGsfke=x0p1b2-uNX6DuQfRyEjVbJaxTbVLDT2YvSkGJbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsfke=x0p1b2-uNX6DuQfRyEjVbJaxTbVLDT2YvSkGJbg@mail.gmail.com>

On Mon, Apr 21, 2025 at 07:36:28AM -0700, Rob Clark wrote:
> On Sun, Jan 26, 2025 at 4:20 PM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Jan 20, 2025 at 03:41:45PM +0100, Johan Hovold wrote:
> > > This series adds support for utilising the UEFI firmware RTC offset to
> > > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > > Elite machines.

> > > Rob had some concerns about adding a DT property for indicating that a
> > > machine uses UEFI for storing the offset and suggested that the driver
> > > should probe for this instead. Unfortunately, this is easier said than
> > > done given that UEFI variable support itself is probed for and may not
> > > be available until after the RTC driver probes.
> >
> > This information would be useful in the binding commit...
> >
> > Seems like something I would say, but this is v1 and I have no memory of
> > discussing this. I would also say probe ordering is not a DT problem,
> > but sounds like an OS problem. Aren't there other things needing EFI
> > variables earlyish too? Do you really want to have to update the DT to
> > enable this?
> 
> I was debugging why RTC offset was not working properly for me, and
> eventually realized it was exactly this problem (efivars not avail
> when rtc probes).

Hmm. It seems dropping that property for v2 under the assumption that
efivars would be available at module init time (since the driver can
only be built-in) was a mistake.

I see now that the current qcom efivars driver does not probe until
module init time itself, but even if we change that the scm driver
depends on an interconnect driver which can be built as a module...

> Hacking up rtc-pm8xxx to return -EPROBE_DEFER "fixes" it

> > OTOH, it's one property, meh.

I guess we need that property on these platforms as I had initially
concluded after all. As with the rest of this driver, hopefully all of
this goes away for future Qualcomm platforms once they fix their UEFI
implementation so that the time service can be used directly.

Johan

