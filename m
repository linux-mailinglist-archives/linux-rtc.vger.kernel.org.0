Return-Path: <linux-rtc+bounces-3546-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4AA67125
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 11:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55905422123
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 10:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195042080FB;
	Tue, 18 Mar 2025 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ib3c9nwE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB1206F3E
	for <linux-rtc@vger.kernel.org>; Tue, 18 Mar 2025 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293416; cv=none; b=C/bj8GZ4B6McbGF7EYZScpoGEfBP6P27xCn1uTVFP0qT7d4GlwD7U9jQ9gccfoh0WNrev7MKmKGx9e3KHzVbKUZhmebZswZ4mQFRaUtEbAFPHikgNB6EY00BVKOHJyO0Pb8gn//iU+W1qCqWkAprFPQJsJCuaNynkIC/Gm+K8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293416; c=relaxed/simple;
	bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEPJHtuqFUdzLAyM9H8XFkOZHGyCqCGHmsZ8l4O5knVXUcNOkLxHw9VaMhXjGYQIeoBev3wVKH4U+B7n0tTROFsT5CsAMmiQKuV4EWZTDQD7r/fLJ33xR/Epz4kuPAh+h8qTgzD703XeBEoIt21X/QKdx+TQMeX3p0p3rV4VyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ib3c9nwE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742293409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=;
	b=ib3c9nwELDYrrI292ukohrF9jF8bTR9WFSKpH0hTtv6pkapFYQGXvGr9QOv8dB13rQyGam
	B4pFiRlrzcKLzFbfhAYqhYF4vqqsCxAAjrrav7rgAN7Gu8khCSwj3c5RQUzE+OnAq+HMtL
	VDycQFxW9t3TV34ZJNi+873DxVmQXR4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-0cDnJ-B6O1CmAx0h60fggg-1; Tue, 18 Mar 2025 06:23:28 -0400
X-MC-Unique: 0cDnJ-B6O1CmAx0h60fggg-1
X-Mimecast-MFC-AGG-ID: 0cDnJ-B6O1CmAx0h60fggg_1742293407
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so7719684a12.0
        for <linux-rtc@vger.kernel.org>; Tue, 18 Mar 2025 03:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293407; x=1742898207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=;
        b=wNwNSsSHmY8i63G8Chmn8EN7BCs57QpCSRMm1eztsGpja3EAM8pItmLnJeAENAbAuF
         z5gJaeFOp5eWowtt+PcxI1QH57UFuHJi6A2sY5gvb3JtFZTR9Tpd3y0cBpD9wfI4J6/V
         FPgcahUahw3nG4Xky87jihKM7M9q6hf2mT8TVkVS7r77x1M27vxJEnWZy3wLiBlYwFCr
         gtK4qSl1tTeaiVQ0jbP9KpBItuzv7c0YwMuuZDcsC4TfiOgWBDE75O+qtJmeILrf7kt0
         szAnlm+KmFPQq3ht+ylC6TCkctS9/Jxgps0XeYTh8CGAXY9C5ctcTR03XL9rRrcahPs8
         KfMg==
X-Forwarded-Encrypted: i=1; AJvYcCWqR4s8k6KUMMRCAe6458vkAU8MIOribo97xdObzJp4a6b0+Uf6eQLywlspzUps1U2zqRCIr11GHy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVdCo+nGFrlW3uS/2mjZTce1XN+YrmjJEKJ8t4hcxbGy7Q/ma
	jsBc1T62mnnpr8lsjPqGRijRHQToBp5bJ2upfmj3srNHeF2/aZq3up+3EzwLH1hVNvN8AVnBzQa
	kP5rCo31tVYc5969agrGWGNTdYV47oEnI5z82OGcr9z3dH0FEJVENoa9spixJh/MO59EVi8gLrz
	hl9GCiKQLbEH5WDMR3sUSDhk0uutV8yRnR
X-Gm-Gg: ASbGncuYTBYa9n27hfF6dmQEPAM77T5OE31JUfQkMbrp82dl4p3DEuZPKAVMJCmUXp1
	XH+8taKArV4BuFqOTAaClvv34o9rD+/Y01KInz7AXicDed5+pknfIZQ/J7vYcqiXGps67Jfbo6A
	==
X-Received: by 2002:a05:6402:2746:b0:5e0:4c25:1491 with SMTP id 4fb4d7f45d1cf-5eb1f0003a8mr2755890a12.7.1742293407103;
        Tue, 18 Mar 2025 03:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjyrDRk1usiBEXrUhkwIqs03+nWpkGjuY57aQwx3IT25kzIUISqmC8GAQ0nzFy+hG1pV9t2z5H2wCr9D8rn8k=
X-Received: by 2002:a05:6402:2746:b0:5e0:4c25:1491 with SMTP id
 4fb4d7f45d1cf-5eb1f0003a8mr2755871a12.7.1742293406690; Tue, 18 Mar 2025
 03:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313173707.1492-1-quic_philber@quicinc.com>
 <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com> <xogief67mb2wonb7angoypj4ddvvecyrcsnncqitggpij6ssim@fo3psnqqhovp>
In-Reply-To: <xogief67mb2wonb7angoypj4ddvvecyrcsnncqitggpij6ssim@fo3psnqqhovp>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 18 Mar 2025 18:22:49 +0800
X-Gm-Features: AQ5f1JrBFyW8xkFgMxVk6GGg-rvzIxamknFWt0oP1OOTPXdljbsO7bXLrfDxGHk
Message-ID: <CAPpAL=xiQ0x7Vk55of1=-Hm0ijsVQkeLixv65WJc-J0sL9Fnww@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add virtio_rtc module
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	David Woodhouse <dwmw2@infradead.org>, "Ridoux, Julien" <ridouxj@amazon.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Parav Pandit <parav@nvidia.com>, 
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Simon Horman <horms@kernel.org>, 
	virtio-dev@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 6:14=E2=80=AFPM Peter Hilber <quic_philber@quicinc.=
com> wrote:
>
> On Tue, Mar 18, 2025 at 10:04:07AM +0800, Lei Yang wrote:
> > QE tested this series of patches v6 with virtio-net regression tests,
> > everything works fine.
> >
> > Tested-by: Lei Yang <leiyang@redhat.com>
> >
>
> Hi Lei,
>
Hi Peter

> thanks for the reply! However, I am not sure which virtio-net regression
> tests you are referring to, and how these tests would be relevant to
> virtio_rtc. The virtio_rtc driver does not have any relation to
> virtio-net ATM. Reusing virtio_rtc within virtio-net has been discussed
> in the past, but not done yet.

First let me introduce the virtio-net tests which include
ping,hotplug/unplug nic device, live migration under stress etc
scenarios. This test was triggered because some of the monitoring
conditions of the CI tool are general. I will change the code later to
avoid similar things happening in the future. Please ignore the last
comment from my side, and sorry for bothering everyone.

Best Regards
Lei
>
> Best regards,
>
> Peter
>


