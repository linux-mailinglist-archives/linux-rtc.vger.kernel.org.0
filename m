Return-Path: <linux-rtc+bounces-3702-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E2A756A9
	for <lists+linux-rtc@lfdr.de>; Sat, 29 Mar 2025 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DD916F1AF
	for <lists+linux-rtc@lfdr.de>; Sat, 29 Mar 2025 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207761D6194;
	Sat, 29 Mar 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EexcGqKT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E11B424F;
	Sat, 29 Mar 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258615; cv=none; b=FNZXmnLT7nWHdszd2TJdHjWTisdRUWEn3cdCgmz5wGnsf++Ypejbeb6fsB1c1tMNwSFG9JvY1fD1ramWldMO2pP55slVRdmEip2Lav2R/pQOQgY88u839uU+gHk9RZCsgRnaPyfDTP/iMNMF/Z2cyjcEJGJXTDa52zYPzKOOUcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258615; c=relaxed/simple;
	bh=w0oCwzhaxAnRCzRQ9/YRYIOxKZmZRzvgSTK++PeHVpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgSToVaFduaMnxis9b08Rqg6VJHy7g+5cHaBipWAIoIFJnCUqB+yPs1hZqQGkz+RKfUg1Q3zuSD5oJ80XUB/yRalnnScyDwhArbXASBSwU5Jbpgb6DFPvLP3aVoSsMXqkyXzemWYho2VPO8WUqaaRQb+3d7NFaWjpZMqyB4d0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EexcGqKT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so5003885a91.0;
        Sat, 29 Mar 2025 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743258613; x=1743863413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xQzPizb+4q7++3drew8nzj42HkGLzBNjvrLjUAd15k=;
        b=EexcGqKTceZ0JBAdt9qPEmmchZwwYFPgYUfYq3Y0ZXmwd/09WhysuqbOMPwO/IdFRI
         1gCvrD+Lvs0LTmEzd3BK8G4Liy5s3WFU96uEDM3mXH8Jc4RPueo0utCGq7T0I+pGYu7Q
         YmdL/0WSzEp8KjGlQ/NjKIwC6w7/AHYhbVP7Xsue08te1kDGdbI/HjHui5uEXFJ4LTw4
         9/6cAzGc7DM/I/jaaljqhEc2RwZ/ipmViOZa5OR6v4ODFk381JX1IjT7y76VMoKejAZP
         KxG4JBkpf03wTeksg8j8jOnI3woxx5pYBRjkWjnVIGmSovJLyO3Uh06zFWQzY+kmtkm7
         ET6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258613; x=1743863413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xQzPizb+4q7++3drew8nzj42HkGLzBNjvrLjUAd15k=;
        b=vlWJLVDzKpjSsxwZHb0yGX4bSQFF4uuY5m36bH2wVNa8+AGBP8qJKYV2Tj9LQ4jRDk
         adn+C7aYIOdoMqQ/5o471D1xZBVkdUfnnw8etC5Yd+sdgNJyuV5ux357PaUgIpQvq35C
         rGK/chMzsUwv4IhCaCzoQX7GiKqMb9bXbO8zq484FU9Br0ozIy+qRGy9VHGS0y1Js6MU
         hreHqu8sseJd+4jUARw0iI0FVMP5BC/mFJ3XVcvbb5XyiL76Jz5B8UNZfMjASLBLbKKA
         COEbPTNQH/NgVumREmJNIrf7O7nm5mRpRQ23EJw2TTFLWC7PvJ6Ws48f6nfKInaJiLYd
         FIXw==
X-Forwarded-Encrypted: i=1; AJvYcCXBNbYVk5KXv8dE1F/vMb/Bu4UBlmz+2pQ1XhE8Qg75Io0odHfabGYE3mubFRHp4ei6uyBF6eol3LrJ8+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZ6OVOqtBuxKiQIgB6VT2eTyOEM2Gz27hPzHRs2BsslRi1Tay
	rgaTu3qnri7fFYE2rwuwS8gVx4bKZYMwWcLt96/35W/Jf0uPkIVFSz7bXxyxlA68+Esy6uI4uYl
	P6vgk0xxb4LIXu+S/kl2UCE5YsfKG9A==
X-Gm-Gg: ASbGncvA0k0UYFHXINK//XgAwNuu/N8CPA6DAARmQLrnQWKksZtFQo3RjlZ9XTxl39Q
	p+7WISs5ccxz4poPCc+lfBuiFZXjKO8/0uKTH4FPg8iC2P7SbdU6JZIclMOCE5T7tc4RR1lKUU4
	xovPcS0qnkTbZkIEg53mrqCsNqgsAREdqfje3GiQ==
X-Google-Smtp-Source: AGHT+IEZeGNvIgGgECDw9rUtEaQ1M5ojjZ6MTiTNno3W2R5+/BaqqCGv4o8c/FIay7eczCuG3dQAzb8XomY0bhRqn6A=
X-Received: by 2002:a17:90b:2801:b0:305:2d27:7ba5 with SMTP id
 98e67ed59e1d1-30531f7bf94mr4126927a91.6.1743258612675; Sat, 29 Mar 2025
 07:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317183349.346399-1-bharadwaj.raju777@gmail.com> <2025031721511050987ca2@mail.local>
In-Reply-To: <2025031721511050987ca2@mail.local>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sat, 29 Mar 2025 19:59:46 +0530
X-Gm-Features: AQ5f1Jrz_QSXKF34LaUrfOrHihalyXOcyYry5aS2gclqre26Jed_H26IChjSkAk
Message-ID: <CAPZ5DTHKSzg6UV0bT5U9Xet7jL1c__n+GgfYz-38GybGzerYNQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 3:21=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/03/2025 00:03:43+0530, Bharadwaj Raju wrote:
> > The trace call invokes rtc_tm_to_time64 on a
> > potentially uninitialized alarm->time. Move the
> > trace call to the path where we do successfully
> > initialize and read that struct.
> >
> > This fixes a KMSAN warning.
> >
> > Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")
> >
> > Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> > ---
> >  drivers/rtc/interface.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> > index aaf76406cd7d..82ba33bf478b 100644
> > --- a/drivers/rtc/interface.c
> > +++ b/drivers/rtc/interface.c
> > @@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_dev=
ice *rtc,
> >               alarm->time.tm_yday =3D -1;
> >               alarm->time.tm_isdst =3D -1;
> >               err =3D rtc->ops->read_alarm(rtc->dev.parent, alarm);
> > +             if (!err)
> > +                     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->tim=
e), err);
> >       }
> >
> >       mutex_unlock(&rtc->ops_lock);
> >
> > -     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
>
> This removes the tracepoint when there is an error, rendering it les
> useful.
>
> Also, as discussed about a year ago, alarm-time being uninitialized is
> not actually an issue as mktime64 can handle whatever is the input so
> this will never cause any problem so this isn't really a fix.
>
> I suggest the following:

Thanks for reviewing. Would you like me to make a second version of
the patch with this suggestion?

