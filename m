Return-Path: <linux-rtc+bounces-2109-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD0993B2A
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 01:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89A37B25A40
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 23:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34A818DF87;
	Mon,  7 Oct 2024 23:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="BknXOZ8s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007D18CBFD
	for <linux-rtc@vger.kernel.org>; Mon,  7 Oct 2024 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728343457; cv=none; b=k2sKot9xSYUTNdeF4kUdNGNsHO1yS7eyAp117Aj1Y3drly1eu3Ez4TTiHecEQkPqNIv2tCS2URsjHQnsS8Rwm5uMZ7agXs3xrHcbpnIWHy7HckusMrBBLbOweR4SDyreD1flB4fXt5WOD20ktTpDCN81LyCBXWJcL1s8lNIFT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728343457; c=relaxed/simple;
	bh=S++SZRGC4WZd6VqO5EBNm14oG5f04BfiaAcbU5vSpUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifht2Er+7giZX8x3ezUxm+uAfSvYARr/feKVYOzu0XHmSM9g3vI6137WskElae5jsgyR7Ewhvks/uhGda3zejlCin5qPOaQ5v50oMFx2mETBz6GxujP3sNVd2GX1kOQOVkTX6B53npKuq1tkCViB9+p40pZx3LTJGqNgg4LQEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=BknXOZ8s; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8ce5db8668so775167666b.1
        for <linux-rtc@vger.kernel.org>; Mon, 07 Oct 2024 16:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728343454; x=1728948254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA93a5yRb00a+UuMXUW9NqL0csLZVpZst4pu2BAc5AA=;
        b=BknXOZ8s68wjlH9MaVnZiMwTjWnBScNqP0rFrtSDj2tuHEi0CqKmLwuOeFj4ygv2aa
         HhcftVdJjJjNvkZa/uDfAfHAdSYHChKzXQhlfwcqfvmaWWdIIOIk+581Tt+CMLos3yHl
         0vIaoZm2u1eg7aZTY6Vb91rnHPWxYyIzQqMo+L/ksob8urFIxE0oLNqX8MHugyNUZscM
         uGt6/V/sv0vVlXrHADZMkIp2cemEzQ7uPCxas0CvtbFWzpoiGEnnzFukb4Nzu3IMHGVO
         hBPFg7s+bTD3amfhsfotAdzgFSkhd8qRfNRJeH9siK3II7wge771wsUMkfiteMfpdfxn
         G90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728343454; x=1728948254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA93a5yRb00a+UuMXUW9NqL0csLZVpZst4pu2BAc5AA=;
        b=if+KVWnp+gfAbFlesJ03penIoMCGyntdxeB8W6OqxIHv9Eb8o/nSa8kkL2pN941DLz
         pU6ZFP/jNIA54ljqzdGS2rIia5SXKwaDMuybK/jRvQ1hXiGQS5SndyTl2Z/ukcoGklup
         n8taPDzczuSTr1mg8jW33WUTZs+h3mOIJ1ejDgCO9JoZc1auRoqqpuragSnvdRmH/5z4
         r7wfIHtoOplYFxWc/W3rIPYEKQsTYTYqmqbajm932Cn2hCcvectEA3Xe7P89OHut3YOJ
         nWJbcthe0NU/SkbLpMY76DeXhVsyF2zT5fUU+f5COgcCLDKnVwjLw8qm+ZpMa21nnwf0
         i2ZA==
X-Gm-Message-State: AOJu0Yzg1xNgq+JFv5DnHgmdwcCyAFCTDu92k0A3RhqlMJ4lNkF7tvoR
	gVJp/rtRa4cBvkXaVWvj0eFqt3UhrnngvkNQERousttYxVnsXj2MwEZ77pGPsjQpkudFWNiANjw
	sg/E/VPyJ5chzX+/fhbdkqzil6VN2F7Gpnz0=
X-Google-Smtp-Source: AGHT+IERrr0zaNaDVVkW0Rnlzxg6JvJCU14edQFkNtV2OEdfJ3z6obkLAO+RaU9b3thWOGpvRRhCh+RZYXmVn1C4KNE=
X-Received: by 2002:a17:907:1c93:b0:a90:d17f:eced with SMTP id
 a640c23a62f3a-a991bd04dd2mr1420586866b.5.1728343453702; Mon, 07 Oct 2024
 16:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006001553.7430-1-iwamatsu@nigauri.org> <20241007135920ef75da53@mail.local>
In-Reply-To: <20241007135920ef75da53@mail.local>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Tue, 8 Oct 2024 08:23:47 +0900
Message-ID: <CABMQnV+Gi2qysXf872OCevCJikyWRbbw016ivoD_tmvweUan5Q@mail.gmail.com>
Subject: Re: [PATCH] rtc: rtc-mc146818-lib: Use is_leap_year instead of
 calculate leap years
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2024=E5=B9=B410=E6=9C=887=E6=97=A5(=E6=9C=88) 22:59 Alexandre Belloni <alex=
andre.belloni@bootlin.com>:
>
> Hello,
>
> On 06/10/2024 09:15:53+0900, Nobuhiro Iwamatsu wrote:
> > The is_leap_year() for determining leap year is provided in rtc lib.
> > This uses is_leap_year() instead of its own leap year determination
> > routine.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> > ---
> >  drivers/rtc/rtc-mc146818-lib.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-=
lib.c
> > index 651bf3c279c74..ce4d68de05831 100644
> > --- a/drivers/rtc/rtc-mc146818-lib.c
> > +++ b/drivers/rtc/rtc-mc146818-lib.c
> > @@ -232,8 +232,7 @@ int mc146818_set_time(struct rtc_time *time)
> >
> >  #ifdef CONFIG_MACH_DECSTATION
> >       real_yrs =3D yrs;
> > -     leap_yr =3D ((!((yrs + 1900) % 4) && ((yrs + 1900) % 100)) ||
> > -                     !((yrs + 1900) % 400));
> > +     leap_yr =3D is_leap_year(yrs + 1900);
>
> Could you also eliminate the leap_yr variable?
>

Yes, I will send v2  patch that deleted it.

> Thanks!

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

