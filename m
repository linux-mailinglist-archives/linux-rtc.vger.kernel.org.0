Return-Path: <linux-rtc+bounces-3544-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF1A665EF
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 03:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E320F18956D8
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 02:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818C017B402;
	Tue, 18 Mar 2025 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdGOrYsx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9481749
	for <linux-rtc@vger.kernel.org>; Tue, 18 Mar 2025 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742263491; cv=none; b=FIXDZz2LxcNzxMzAAXHtA3qdGHVBvlleXnSp9/lIKUxZX4KEgIvuR30pOxgtaDkSm3CuSXyEH3JVpTQSuuMq6eqiUQ9JDLVd6Ns5KbJLgw2I1c4lfYcYt5lKGhsfHPJAwzVmx3klmrp2c1v7ODPJtIBf8qnhu9r3YImtiRbArX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742263491; c=relaxed/simple;
	bh=9nssrSXve0zxWBOJD0yExmdQYxoFqyAiqs3raRutUCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eg050ziaCa/waeL7i6+POF5eDapsH0Wr6/FZ1iWBj5DizInttdbBavp8UB3EC4Bm3/f1FgWC/+B8+Wn6FJuz3oJUjfdV2mGntSQR9znTpyVqFqLcWp3tjs0y3DUEA+ILkOR7mTliQtroA1ZhGsvcrE0n9c8y/aiMAJsKULpLKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdGOrYsx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742263487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HagLySi8cLl3r+54xADX7ls5xoEWrbGMKO8f5L1ISh8=;
	b=MdGOrYsxZ7ApLgOz7dAgY44h7oDuEWHnWZaOc5R9j8gHWq+XfWPHaaLMGjpNlMBPTK+DVX
	Ew04nMI8V+MDxSPI8ibVFqCpNQRz96qmos+wJvyVTVWQQ2dQZ76SWFlH+cgdrzC4bCn502
	P0Vhf1ZJinPVfFlurkZcv/uHokpQZvE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-Rt3nPsz7PeS0I0V6vrV6wQ-1; Mon, 17 Mar 2025 22:04:46 -0400
X-MC-Unique: Rt3nPsz7PeS0I0V6vrV6wQ-1
X-Mimecast-MFC-AGG-ID: Rt3nPsz7PeS0I0V6vrV6wQ_1742263485
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e6b2b8339fso4670251a12.3
        for <linux-rtc@vger.kernel.org>; Mon, 17 Mar 2025 19:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742263485; x=1742868285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HagLySi8cLl3r+54xADX7ls5xoEWrbGMKO8f5L1ISh8=;
        b=whpaAXNwhg8WZTh3fDa/69kLtakw038J3sSSCSCSDRvq/pDBI7peR7Q3c+y1lNfPrb
         eIb3bMSLjy/vOLotMggW+M0KXWtVxTKhQaJX6yPiMcxcYvPq3pFdpfg93mzZfgXa6Viv
         owRWsuh0NQvWxY6lg9rnPCAXc7s/68jNAWBkLni5IbEh3u2onQxBu/Lf6suUq7YdFdz4
         kCN75i+nr8z53dY4DbzMECA3QfbrtHTBVdMMViU3D4EWFhEAsV0eynKW4NWR12I1awBW
         Uj+BdlnyL04fJPYAAUJPMWHkFU0FuV723iffmJfjV7WEOxHv2cELLLOpXeUpINh1CABF
         aRRw==
X-Forwarded-Encrypted: i=1; AJvYcCURoEixnGKR3Bm5xul4HdIi+KaslWz/0ED0XXlRVafxLaWgPldFMojAxh30Sc0Fim9rKRmCJftGg/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gcfm3xjdz1RAQBb3nVRCRsMqX2qmve3rM4/wCoeMKmFzZya5
	Vk/MSUo4A1Q2lmqMXT3cR23kOdaO77vn4XpEP1xqNtZYDE+h3FfyuJzA31Fo0KDMMqHLFEYzz4O
	YTwwyEa+i1HZM3qAzEM3bK3Yu1fw2UWgRw2JHCZABCpWrSKJUjRNbwSaO72iUT1f5VZz86CFWH1
	j4iKWSSDJtDlPAmkU4A8Z8BwlWylhLLYvE
X-Gm-Gg: ASbGnctnrNSt5gYQMKJpT50l1uvNCYlGVml/XcpQZnPetNAOUDUsC4S+1DmqkJAFga0
	2Y691L5DQVEvUblUR8hJ/VG99sGhYSvCimWvyRqTnj89zQlivpXYtWp+y4U//Sxg6UJw/LrwFkg
	==
X-Received: by 2002:a05:6402:2813:b0:5dc:94ce:42a6 with SMTP id 4fb4d7f45d1cf-5e8a04269dcmr12618028a12.22.1742263484894;
        Mon, 17 Mar 2025 19:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTHOOl6Hk7CUXcBJnZcgEEeHkmDGirQ0K5SylxbpBmJhN12iZN0vDQ4dXRO1NR5QuZfjHl7zqPMlB3eBqqNbA=
X-Received: by 2002:a05:6402:2813:b0:5dc:94ce:42a6 with SMTP id
 4fb4d7f45d1cf-5e8a04269dcmr12618008a12.22.1742263484512; Mon, 17 Mar 2025
 19:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313173707.1492-1-quic_philber@quicinc.com>
In-Reply-To: <20250313173707.1492-1-quic_philber@quicinc.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 18 Mar 2025 10:04:07 +0800
X-Gm-Features: AQ5f1JraV-K8l7M1witBxN1YhEzF_YkK0S9tGmarwOVGMg-B43l_lWg4rMiqWYk
Message-ID: <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com>
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

QE tested this series of patches v6 with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Fri, Mar 14, 2025 at 1:38=E2=80=AFAM Peter Hilber <quic_philber@quicinc.=
com> wrote:
>
> This series implements a driver for a virtio-rtc device conforming to spe=
c
> proposal v8 [1]. It includes a PTP clock driver and an RTC class driver
> with alarm.
>
> v6 updates
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> v6 fixes the PTP clock name length, and a few style issues, some of which
> resulted in warnings.
>
> Overview
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> This patch series adds the virtio_rtc module, and related bugfixes. The
> virtio_rtc module implements a driver compatible with the proposed Virtio
> RTC device specification [1]. The Virtio RTC (Real Time Clock) device
> provides information about current time. The device can provide different
> clocks, e.g. for the UTC or TAI time standards, or for physical time
> elapsed since some past epoch. The driver can read the clocks with simple
> or more accurate methods. Optionally, the driver can set an alarm.
>
> For the Virtio RTC device, there is currently a proprietary implementatio=
n,
> which has been used for testing.
>
> PTP clock interface
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> virtio_rtc exposes clocks as PTP clocks to userspace, similar to ptp_kvm.
> If both the Virtio RTC device and this driver have special support for th=
e
> current clocksource, time synchronization programs can use
> cross-timestamping using ioctl PTP_SYS_OFFSET_PRECISE2 aka
> PTP_SYS_OFFSET_PRECISE. Similar to ptp_kvm, system time synchronization
> with single-digit ns precision is possible with a quiescent reference clo=
ck
> (from the Virtio RTC device). This works even when the Virtio device
> response is slow compared to ptp_kvm hypercalls.
>
> The following illustrates a test using PTP_SYS_OFFSET_PRECISE, with
> interspersed strace log and chrony [2] refclocks log, on arm64. In the
> example, chrony tracks a virtio_rtc PTP clock ("PHCV", /dev/ptp0). The ra=
w
> offset between the virtio_rtc clock and CLOCK_REALTIME is 0 to 1 ns. At t=
he
> device side, the Virtio RTC device artificially delays both the clock rea=
d
> request, and the response, by 50 ms. Cross-timestamp interpolation still
> works with this delay. chrony also monitors a ptp_kvm clock ("PHCK",
> /dev/ptp3) for comparison, which yields a similar offset.
>
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000329>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>            Date (UTC) Time         Refid  DP L P  Raw offset   Cooked off=
set      Disp.
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>         2023-06-29 18:49:55.595742 PHCK    0 N 0  1.000000e-09  8.717931e=
-10  5.500e-08
>         2023-06-29 18:49:55.595742 PHCK    - N -       -        8.717931e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101545>
>         2023-06-29 18:49:56.147766 PHCV    0 N 0  1.000000e-09  8.801870e=
-10  5.500e-08
>         2023-06-29 18:49:56.147766 PHCV    - N -       -        8.801870e=
-10  5.500e-08
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000195>
>         2023-06-29 18:49:56.202446 PHCK    0 N 0  1.000000e-09  7.364180e=
-10  5.500e-08
>         2023-06-29 18:49:56.202446 PHCK    - N -       -        7.364180e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101484>
>         2023-06-29 18:49:56.754641 PHCV    0 N 0  0.000000e+00 -2.617368e=
-10  5.500e-08
>         2023-06-29 18:49:56.754641 PHCV    - N -       -       -2.617368e=
-10  5.500e-08
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000270>
>         2023-06-29 18:49:56.809282 PHCK    0 N 0  1.000000e-09  7.779321e=
-10  5.500e-08
>         2023-06-29 18:49:56.809282 PHCK    - N -       -        7.779321e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101510>
>         2023-06-29 18:49:57.361376 PHCV    0 N 0  0.000000e+00 -2.198794e=
-10  5.500e-08
>         2023-06-29 18:49:57.361376 PHCV    - N -       -       -2.198794e=
-10  5.500e-08
>
> This patch series only adds special support for the Arm Generic Timer
> clocksource. At the driver side, it should be easy to support more
> clocksources.
>
> Fallback PTP clock interface
> ----------------------------
>
> Without special support for the current clocksource, time synchronization
> programs can still use ioctl PTP_SYS_OFFSET_EXTENDED2 aka
> PTP_SYS_OFFSET_EXTENDED. In this case, precision will generally be worse
> and will depend on the Virtio device response characteristics.
>
> The following illustrates a test using PTP_SYS_OFFSET_EXTENDED, with
> interspersed strace log and chrony refclocks log, on x86-64 (with `ts'
> values omitted):
>
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>            Date (UTC) Time         Refid  DP L P  Raw offset   Cooked off=
set      Disp.
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>         2023-06-28 14:11:26.697782 PHCV    0 N 0  3.318200e-05  3.450891e=
-05  4.611e-06
>         2023-06-28 14:11:26.697782 PHCV    - N -       -        3.450891e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:27.208763 PHCV    0 N 0 -3.792800e-05 -4.023965e=
-05  4.611e-06
>         2023-06-28 14:11:27.208763 PHCV    - N -       -       -4.023965e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:27.722818 PHCV    0 N 0 -3.328600e-05 -3.134404e=
-05  4.611e-06
>         2023-06-28 14:11:27.722818 PHCV    - N -       -       -3.134404e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:28.233572 PHCV    0 N 0 -4.966900e-05 -4.584331e=
-05  4.611e-06
>         2023-06-28 14:11:28.233572 PHCV    - N -       -       -4.584331e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:28.742737 PHCV    0 N 0  4.902700e-05  5.361388e=
-05  4.611e-06
>         2023-06-28 14:11:28.742737 PHCV    - N -       -        5.361388e=
-05  4.611e-06
>
> PTP clock setup
> ---------------
>
> The following udev rule can be used to get a symlink /dev/ptp_virtio to t=
he
> UTC clock:
>
>         SUBSYSTEM=3D=3D"ptp", ATTR{clock_name}=3D=3D"Virtio PTP type 0/va=
riant 0", SYMLINK +=3D "ptp_virtio"
>
> The following chrony configuration directive can then be added in
> /etc/chrony/chrony.conf to synchronize to the Virtio UTC clock:
>
>         refclock PHC /dev/ptp_virtio refid PHCV poll -1 dpoll -1
>
> RTC interface
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This patch series adds virtio_rtc as a generic Virtio driver, including
> both a PTP clock driver and an RTC class driver.
>
> Feedback is greatly appreciated.
>
> [1] https://lore.kernel.org/virtio-comment/20250306095112.1293-1-quic_phi=
lber@quicinc.com/
> [2] https://chrony.tuxfamily.org/
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> v6:
>
> - Shorten PTP clock names to always fit into 32 bytes.
>
> - Fix sparse warning about endianness mismatch (Simon Horman).
>
> - Do not mark comments missing parameter documentation as kernel doc (Sim=
on
>   Horman).
>
> - Improve error status computation readability.
>
> - Avoid conditional locking within a block.
>
> v5:
>
> - Update to virtio-rtc spec v7, essentially removing definitions.
>
> - Fix multiple bugs after readying device during probe and restore.
>
> - Actually initialize Virtio clock id for RTC class device.
>
> - Add freeze/restore ops already in first patch.
>
> - Minor changes:
>
>   - Use new APIs devm_device_init_wakeup(), secs_to_jiffies().
>
>   - Fix style issues.
>
>   - Improve logging types and clarity.
>
>   - Drop unnecessary memory barrier pair.
>
>   - Return error status from device, whenever available.
>
> v4:
>
> - Update Virtio interface to spec v6.
>
> - Distinguish UTC-like clocks by handling of leap seconds (spec v6).
>
> - Do not create RTC class device for clocks which may step on leap second=
s
>   (Alexandre Belloni).
>
> - Clear RTC class feature bit instead of defining reduced ops
>   (Alexandre Belloni).
>
> - For PTP clock name, always use numeric clock type, and numeric variant.
>
> - Use macros for 64-bit divisions.
>
> - Remove unnecessary memory barriers.
>
> - Cosmetic improvements.
>
> - Drop upstreamed timekeeping bugfixes from series.
>
> v3:
>
> - Update to conform to virtio spec RFC v3 (no significant behavioral
>   changes).
>
> - Add RTC class driver with alarm according to virtio spec RFC v3.
>
> - For cross-timestamp corner case fix, switch back to v1 style closed
>   interval test (Thomas Gleixner).
>
> v2:
>
> - Depend on patch series "treewide: Use clocksource id for
>   get_device_system_crosststamp()" to avoid requiring a clocksource point=
er
>   with get_device_system_crosststamp().
>
> - Assume Arm Generic Timer will use CP15 virtual counter. Drop
>   arm_arch_timer helper functions (Marc Zyngier).
>
> - Improve cross-timestamp fixes problem description and implementation
>   (John Stultz).
>
>
> Peter Hilber (4):
>   virtio_rtc: Add module and driver core
>   virtio_rtc: Add PTP clocks
>   virtio_rtc: Add Arm Generic Timer cross-timestamping
>   virtio_rtc: Add RTC class driver
>
>  MAINTAINERS                          |    7 +
>  drivers/virtio/Kconfig               |   64 ++
>  drivers/virtio/Makefile              |    5 +
>  drivers/virtio/virtio_rtc_arm.c      |   23 +
>  drivers/virtio/virtio_rtc_class.c    |  262 +++++
>  drivers/virtio/virtio_rtc_driver.c   | 1407 ++++++++++++++++++++++++++
>  drivers/virtio/virtio_rtc_internal.h |  122 +++
>  drivers/virtio/virtio_rtc_ptp.c      |  347 +++++++
>  include/uapi/linux/virtio_rtc.h      |  237 +++++
>  9 files changed, 2474 insertions(+)
>  create mode 100644 drivers/virtio/virtio_rtc_arm.c
>  create mode 100644 drivers/virtio/virtio_rtc_class.c
>  create mode 100644 drivers/virtio/virtio_rtc_driver.c
>  create mode 100644 drivers/virtio/virtio_rtc_internal.h
>  create mode 100644 drivers/virtio/virtio_rtc_ptp.c
>  create mode 100644 include/uapi/linux/virtio_rtc.h
>
>
> base-commit: 9d8960672d63db4b3b04542f5622748b345c637a
> --
> 2.43.0
>
>


