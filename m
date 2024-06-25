Return-Path: <linux-rtc+bounces-1400-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DBE91742D
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 00:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CBCB1C22C1C
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2024 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB07717F366;
	Tue, 25 Jun 2024 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhL7dmli"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B4179203
	for <linux-rtc@vger.kernel.org>; Tue, 25 Jun 2024 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719354136; cv=none; b=q3UDmjOUW/Y5rwpQ7V2mqRP/Ugo5dGTG8Ga1OOx8RY7OqSwflq8bprjHPnI5OQMW+npV51dyy9c3SLb/j3Qk/D82rr7PWv37sVE5CcmFNdc82cAOOCjm1OjAL1pYiznk8Xn0TturANwmpncysr/68ycNccIV1t0h+HFeMrHQE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719354136; c=relaxed/simple;
	bh=CT+sk2Ytt9MGpByyhaQ7wR0eTG6aV5txV6U0a2SQdQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3wyXy6Tw3wGKSEhKfriL+d9PkEXaVXIPx8Hde3HejhTTcKfmXFsNt5ZAPjOn+1TQnIrr9zK6+BVCnkgrLwaicxqN55bQtBgbahOWGeQDTCulHA3cTDQ8kMTbA6Ncrz/J7R8jPp2s7aYeSi3Rzadi772XUIVdIkVC8Wg5IQSdNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhL7dmli; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-422f7c7af49so13475e9.0
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jun 2024 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719354133; x=1719958933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRw32GwIVEPX+VKGt7keuELHgLE2OAFARiZsfNjEDuM=;
        b=YhL7dmliA9bsLxRYtPUyPr/R9gx73OjgzP9SxhY5EpKGpZ/iKor9erdy6rkyUrn8j4
         KgCKR3/rpXghyNMIRuePtILgrz5JgUafgJtGTU9KeJkpteSILeZ9NBNa/bd6r0d8HVP9
         Ewh+wo8QgOJcn57NJYMraEC2DQHk1ZOx3QUkzHIn6/ulloKz4EaKTp22ReyiLeKPGNU3
         zEtinonvtF7RLpbGsylAZ8YQNR1OaDi90SpiYLtRTmUToD3mbfYZqo6NSkP4gCPVmB9V
         ZScQ18/EjN9kcs3I8vu1mv6Nn0ibPWQ3SPt3Vlrizw2uXeMNY4NzV70Di69rPUavH38U
         PS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719354133; x=1719958933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRw32GwIVEPX+VKGt7keuELHgLE2OAFARiZsfNjEDuM=;
        b=ZOBVsEsrQd4ym+goJ9ZmcV3Ulaj4efe7W91xvOLn94rmm/TM7yC6aI9AEac+q2ygZP
         +J8J07YE1LWrEL8PaRJaBX0gKRoHvGAEJf5P9zLAg8C3KifWZCEkxYLBwdRBkuJQjRdd
         POfGidaLtp/sQBxPaHCm00mpWqeSqJnVLY7VDFFxE7FhWomWLrfUFjxsawII6CXINuLe
         PFjjR8a4Znl9R5tVChOFmC5ay52rXZjs/ziuq82nQrpRMNkDKGAJX1PjEZ4xtsAODF40
         Up3+vTJjHp1Ud1z8hu0c/fIWbgNIlNkEvnk4m1KPK77ifW+8K5YF36WtNwIBb+FWThli
         CyQw==
X-Forwarded-Encrypted: i=1; AJvYcCUUmuG4sZ8/aGEHIh6NZAdbLTkHtIH9YcD9ku75jRPk3yZRUUjgzW0ARFi4WxmEy4ZnAtVIMC5RQIp6GGndqub2JQ/nanItAs80
X-Gm-Message-State: AOJu0YxtJLQZFUpEIY+5V4ZPG6TEJ7kvVNOqXNiJrPj2P5TcBj9Tw2xk
	9PA8AH8wpOBA9mgAOIZVbY8TGB5S/PinsgDsUUs+cjvO4cSSS5Id0CJ1imCEzbeTwp8Yb4ZGIXX
	DHj31SCbOmBkKUQdXhLeCxrsLNNsFz5G9dMs=
X-Google-Smtp-Source: AGHT+IF0XX6TI9w/czvpBi7HzAI1d8YJKNGlvcJv6XfswT2Wl99IeE6v4pHQbFEkTmScbB2O/MYGYLKXqh0Ft2bqS7Q=
X-Received: by 2002:a05:600c:6792:b0:424:8b0c:156a with SMTP id
 5b1f17b1804b1-424e5a8f63amr147125e9.2.1719354133301; Tue, 25 Jun 2024
 15:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzic4sgv.ffs@tglx> <ea7c5eda8180904a6caf476c56973a06bd4b5e78.camel@infradead.org>
In-Reply-To: <ea7c5eda8180904a6caf476c56973a06bd4b5e78.camel@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 25 Jun 2024 15:22:00 -0700
Message-ID: <CANDhNCpi_MyGWH2jZcSRB4RU28Ga08Cqm8cyY_6wkZhNMJsNSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Hilber <peter.hilber@opensynergy.com>, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	"Ridoux, Julien" <ridouxj@amazon.com>, virtio-dev@lists.linux.dev, 
	"Luu, Ryan" <rluu@amazon.com>, "Christopher S. Hall" <christopher.s.hall@intel.com>, 
	Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 2:48=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> On Tue, 2024-06-25 at 23:34 +0200, Thomas Gleixner wrote:
> > On Tue, Jun 25 2024 at 20:01, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >
> > > The vmclock "device" provides a shared memory region with precision c=
lock
> > > information. By using shared memory, it is safe across Live Migration=
.
> > >
> > > Like the KVM PTP clock, this can convert TSC-based cross timestamps i=
nto
> > > KVM clock values. Unlike the KVM PTP clock, it does so only when such=
 is
> > > actually helpful.
> > >
> > > The memory region of the device is also exposed to userspace so it ca=
n be
> > > read or memory mapped by application which need reliable notification=
 of
> > > clock disruptions.
> >
> > There is effort underway to expose PTP clocks to user space via VDSO.
>
> Ooh, interesting. Got a reference to that please?
>
> >  Can we please not expose an ad hoc interface for that?
>
> Absolutely. I'm explicitly trying to intercept the virtio-rtc
> specification here, to *avoid* having to do anything ad hoc.
>
> Note that this is a "vDSO-style" interface from hypervisor to guest via
> a shared memory region, not necessarily an actual vDSO.
>
> But yes, it *is* intended to be exposed to userspace, so that userspace
> can know the *accurate* time without a system call, and know that it
> hasn't been perturbed by live migration.

Yea, I was going to raise a concern that just defining an mmaped
structure means it has to trust the guest logic is as expected. It's
good that it's versioned! :)

I'd fret a bit about exposing this to userland. It feels very similar
to the old powerpc systemcfg implementation that similarly mapped just
kernel data out to userland and was difficult to maintain as changes
were made. Would including a code page like a proper vdso make sense
to make this more flexible of an UABI to maintain?

thanks
-john

