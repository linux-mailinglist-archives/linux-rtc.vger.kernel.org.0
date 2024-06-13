Return-Path: <linux-rtc+bounces-1291-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0219906430
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 08:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B521F2465C
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 06:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1FC137767;
	Thu, 13 Jun 2024 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AXEuLiE/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32923137753
	for <linux-rtc@vger.kernel.org>; Thu, 13 Jun 2024 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260683; cv=none; b=CFUepoXhZzzKMPjL88ofZ9F5ym+1vb5SU+H3ajsHbvIaWJ/H6QLEdoM2lehgLV4wDeheqkhN9kZSfJ5zaICQvF6RxH6IrHBrALbXRzd/MDkT9LP3SU5fHrm+K9K9Wg3zNvrCxmp8XJkp+xhlXqxPfQA2g6kaH4zGGAd3K5nroCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260683; c=relaxed/simple;
	bh=D4H9WEaybswir/ij5ZUvHUvZ3BrEX8LaPweXhA6txCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFIpw5vm16mcwMOnx71KVs4uPggZ8nNNqyCmiChtHurLwdxxEBaEYrk599HajvEW5B8HetvtLrtPHPPt/P3l5HQVnCVbEE9mgGh+uchM3ChmBwro/aAZzDF+DJH54/IHSwKcXQuCirA+1Ar3JUeMKghDb1jNYiPc79XOJ8OKuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AXEuLiE/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so520281a12.1
        for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718260680; x=1718865480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSxaLeoUF2GB1Ynl8GPq9r0Ie6ml6kc6+0f2KJsgPRI=;
        b=AXEuLiE/uoqR6/G8TRtZ7Fthaw3ew+CCyLh8U8snXL54+PPjXidFKllyGOk7zlkgZv
         Haxg+yCqc3teH9EoVzDJ4UO8uo0NqPtiml+p7ejaZwi4HfAXFWlCUwXIk38Ff/bbbQfe
         8Lvi91ngAvc941Ec8M2eHQGb0wQPivU7s1rT/uXMbXeGDoJk4QMiYWynOk5bsCUHedrK
         RSD2ANuTVd8505LC25cyLVVKv65xOKW9GFm+sQ5J8TNsSHV97HZOyziPVx8CqjDAMvg2
         zrbzDWCRuFDRaYKR47rbc20qvsC22ZAfdWsGEDYZHzyy1RVo3fTtOPcdjoH74/IsGHkq
         9LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718260680; x=1718865480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSxaLeoUF2GB1Ynl8GPq9r0Ie6ml6kc6+0f2KJsgPRI=;
        b=EYGt/A8w5yg6uIqLVLPS1+T3guLB9Jdw6H5U1a9eD/d9/xkFdjpq49YuQzagQ15msE
         jm7f/TsGJd8SvRfUAz44vgAdyCo+M2KfUblwGNAxPzH0hZjMCiTjorBUU+oHXbTKZgAR
         HbGTdfO9w2QiUBwlQdC78RFz1OcXOLiNPvu2dwuBSavb9HGaqqSFt1wEaBZg3L07/XWD
         OyaZRiBNugcywosc9OExoLUO5lLjd0z26pgxQTckKE8eh/5qV7c83ZsnhMOkt5S349e7
         +TYUukIENjlSbAKd4NQ8hm/yLPyx7mUsbRKYirfQKaRh756D14y0yhzKamDhV8sJpOQA
         DJig==
X-Forwarded-Encrypted: i=1; AJvYcCUciQOPevM5phdmG0Fd8JCyE6+BFpltEan+zTlMxyIyaxwMTsRezwGxhz0i16UGviF2nxaMOOdU2Yk92rFAFxauRqznbe00Vxat
X-Gm-Message-State: AOJu0YyMr6IMOO7MaVASxnEtRXrD1IDuM0YGzi35rOQUrLX5qcSCXtSc
	ctH5BSIznLc/8oVTrmYiRVtFgcek20/H+p2Sn3hzVoxoRp4IbA2hSZgTYByrRtKRrVcK3Wm2y/K
	A9Ek3dfyr1h0zY1rqGe7ygdsSxheyap/gElrz
X-Google-Smtp-Source: AGHT+IEqcKmqMMras1IdQ4mwQeBPhF+tSokCQR7CyHJU0B0QtGnxu+D8T/n28pxb8A+jM+mpThteZ/Rdl1GC9K4JyBE=
X-Received: by 2002:a17:907:e91:b0:a68:fb0c:b294 with SMTP id
 a640c23a62f3a-a6f47d622d0mr247392466b.77.1718260680210; Wed, 12 Jun 2024
 23:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612180554.1328409-1-joychakr@google.com> <f0dbf963-bfd9-4a0b-8284-d141999da184@moroto.mountain>
In-Reply-To: <f0dbf963-bfd9-4a0b-8284-d141999da184@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 13 Jun 2024 12:07:46 +0530
Message-ID: <CAOSNQF1AiD5rcpJr=c8Dov=j-g4=xOZXViX+Xibu_kBA=2rzgA@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Fix return value of nvmem callback on read
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sean Anderson <sean.anderson@seco.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:48=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Wed, Jun 12, 2024 at 06:05:54PM +0000, Joy Chakraborty wrote:
> > Read callbacks registered with nvmem core expect 0 to be returned on
> > success and a negative value to be returned on failure.
> >
> > abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> > returns the number of bytes read on success as per its api description,
> > this return value is handled as an error and returned to nvmem even on
> > success.
> >
> > Fix to handle all possible values that would be returned by
> > i2c_smbus_read_i2c_block_data().
> >
> > Fixes: e90ff8ede777 ("rtc: abx80x: Add nvmem support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
> >  drivers/rtc/rtc-abx80x.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index fde2b8054c2e..0f5847d1ca2a 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> > @@ -711,9 +711,16 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *p=
riv, unsigned int offset,
> >               else
> >                       ret =3D i2c_smbus_read_i2c_block_data(priv->clien=
t, reg,
> >                                                           len, val);
> > -             if (ret)
> > +             if (ret < 0)
> >                       return ret;
> >
> > +             if (!write) {
> > +                     if (ret)
> > +                             len =3D ret;
> > +                     else
> > +                             return -EIO;
> > +             }
>
> I guess this is the conservative approach.  Ie.  Don't break things
> which aren't already broken.  But I suspect the correct approach is to
> say:
>
>         if (ret !=3D len)
>                 return -EIO;
>
> Ah well.  Being conservative is good.  It probably doesn't ever happen
> in real life so it probably doesn't matter either way.
>
> I don't really like the if (write) follow by and if (!write)...  It
> would add more lines, but improve readability if we just duplicate the
> code a big:
>
>         if (write) {
>                 ret =3D write();
>                 if (ret)
>                         return ret;
>         } else {
>                 ret =3D read();
>                 if (ret <=3D 0)
>                         return ret ?: -EIO;
>                 len =3D ret;
>         }
>

Sure, I'll do this in a follow up patch.

Thanks
Joy
> regards,
> dan carpenter
>

