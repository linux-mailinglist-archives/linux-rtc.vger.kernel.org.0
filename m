Return-Path: <linux-rtc+bounces-2187-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B965B99D7F8
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 22:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52E50B20D3E
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 20:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9431CF7B4;
	Mon, 14 Oct 2024 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4xDbyNF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415314A4E7;
	Mon, 14 Oct 2024 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728936760; cv=none; b=SbPps0Uj3ukZiT3PnEBt/1lY/9JXRa8GdN0+fOlBObaAyzvo7mhazBYpDkiEi8TEkmHRxi7dB0TkV9EnHMq8b3cJ6Dy00jQ38/8Ulo6VveN6flVulmqSYA/k8cukV9jVGFchyRWjkLTZDBY8399reAraBlYlGlHuw6lPCuAYwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728936760; c=relaxed/simple;
	bh=ZTBxdRUCQr80BBF8O7VYgUYSjhbIYghb8AV3U3WUn/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccCTEMyPXLLmqLa7wFZ4FAfEdBSs+1G7X4J7GAnx32pFtHVJaEDFY28aKA/HDuOE0Q0sjvLd/Yy9ocpBcRa5rUnavgsCQXh1ptv+o4DV2Tc1UItCRFMi1e2RVYogSkY3DsWf+HSptUyIk7gwNc89M3WB4GLQafwTsHtNF48KOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4xDbyNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ED4C4CEC3;
	Mon, 14 Oct 2024 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728936760;
	bh=ZTBxdRUCQr80BBF8O7VYgUYSjhbIYghb8AV3U3WUn/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l4xDbyNFEt5AbgSRRn6USSqmX4KqbacdsJnmKr1iUXlZc1hV+G0tPUz4bLCpYhrU7
	 1BMbEuAzxNfPY5HZGTq27URh+n5VJQzOtXE8F/ArHmPO7Ou0nb1hRLM7QgX4rA1mZX
	 +4WQHPIw3WKobqtPu13Gspjw8UOssLPxFXSpgSXtuUxoNAkgPTKp9rI+FvTPEFgKo/
	 5t862vqDQuUfEMXaPyafwXPIhNAOpVsTdkPNSiA1wkib4U/fSIaItErgNbKNbUQEwN
	 YilCTnDOxiI/0ehc/aBqZvVKjefh2pUgSyerPStonPQJ6dJ8hs+BnIterzf75wLWfD
	 gS1zONSrqmJqQ==
Date: Mon, 14 Oct 2024 13:12:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>, Paolo Abeni <pabeni@redhat.com>, "Christopher S .
 Hall" <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>,
 John Stultz <jstultz@google.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier
 <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, qemu-devel
 <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v7] ptp: Add support for the AMZNC10C 'vmclock'
 device
Message-ID: <20241014131238.405c1e58@kernel.org>
In-Reply-To: <c20d5f27c9106f3cb49e2d8467ade680f0092f91.camel@infradead.org>
References: <78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org>
	<20241009173253.5eb545db@kernel.org>
	<c20d5f27c9106f3cb49e2d8467ade680f0092f91.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Oct 2024 08:25:35 +0100 David Woodhouse wrote:
> On Wed, 2024-10-09 at 17:32 -0700, Jakub Kicinski wrote:
> > On Sun, 06 Oct 2024 08:17:58 +0100 David Woodhouse wrote: =20
> > > +config PTP_1588_CLOCK_VMCLOCK
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "Virtual machine =
PTP clock"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on X86_TSC || ARM_=
ARCH_TIMER
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PTP_1588_CLOCK =
&& ACPI && ARCH_SUPPORTS_INT128
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y =20
> >=20
> > Why default to enabled? Linus will not be happy.. =20
>=20
> Want an incremental patch to change that?

Yes please and thank you! We gotta straighten it out before=20
the merge window.

