Return-Path: <linux-rtc+bounces-3219-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A802BA39DB1
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 14:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA643B7101
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6DC26D5D6;
	Tue, 18 Feb 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzR4ccIT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2AD26D5D0
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885311; cv=none; b=hefcRrI4YximMuQWIJMUwHWLyuSJXLY9F8DXW0OQ5ufaNnb+EzuXMz69VcBxe1788G+6R4iExXHmnMzDECHnMBpDitmhZoYMm7VfetEXGVScJAVZgrpenP6D7tV9wCVqeBej5xPm1SaqBBBkUrNyZWUl/TK9gk19IsU6slR2VAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885311; c=relaxed/simple;
	bh=pG0ofDnBTPMsSK5EuiIvIeCHQc6obtdotKpH29smXFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UcdPl8881w7xHQDWYKvc+o77dC4PPn5rGsLJf6ZHH/caDsJ/fOHWbXSBu2qZTALpcwTQXxnYivu/ZtfiTYCi6iR2y2iGvsHztVwwn5ZHBE/2Nmq7+oP00U1N6W4s6+I9B/YjCiUe5xVEm22XFJ0WW2z9pUAH7yIK1C+jBnxdgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzR4ccIT; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f89aa7a101so2183230eaf.2
        for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739885309; x=1740490109; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggKvX7aIvNfmNGDpMcIL0mJ/Sh3ceUaGYIhD/+Shulg=;
        b=dzR4ccITsDhuU3rV/exmXPtH21gXqSKyAo98OPq9SXf+II0XTheZY2iayWrDavC9Nt
         FymbGrgVwbUoBBj/LbEsSpvwK4pZQioaPEqonLOP1TJ+DubNlurWDx+woJ5VFev+DrN9
         Ng2gkI6469yVi5i8dSU2GbOOhmp/Uum06m+KU+0KpBClBO+D/LM124WPCc7fb4USizlC
         1NQAlLc39psIPPrNfoz6cc10GR2MIl4nn2iYUhfp9KQsh2IgSPOwdBvLh2xbFMQ65BuP
         rz/DApcq5fazGeu8IqTQPppt4cuCPPKJb1x3y+AXRdZWkXdQXP+mNiPOyKCb/swQqZCe
         79wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739885309; x=1740490109;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggKvX7aIvNfmNGDpMcIL0mJ/Sh3ceUaGYIhD/+Shulg=;
        b=fM2eGyKcb73tTn6wO+NEvSo9oXAAUZYS3SeUp1dJyajVSuS5GQUcvNqOTPddcsVQH4
         LDixwD1BpRWDQDP4SsfJNaYRndbEc95HwZ5vdIldQv6V+jGjkLWs5IwtaTcKtSTC93XW
         93JGG7S4mxX64nJ9zZ6z2FHCkPZuCCkF6GOUhkwuomAhs0eJVoxgR56J/VAWpPsJEQwL
         gT+uvr3tXGOoGpU+jESQd2G9yVP6lqMOqP/ZI4zM9z9EnESLEEAXYvlAL2pMnJuZfWQC
         /aRq4TgbLINmbc1j8nmwEv1pUOraYoIKyHw/1Mhqs6s15JRmYro002YneRFyR6xfO2qa
         2z/Q==
X-Gm-Message-State: AOJu0Yy6xjqf9Yv7OVnknNJRYdYtJvsJwMx7qQ5jRlJvBLW+EAk/4SNb
	+eAWo0vyHWynkEI6OJ6xFugjim22XRlCSKc358DWT5okeVGBOOHn3SKQ4NXa2DnLyAAO/j0hqCe
	MpumaMaOTbgL/nXbB6fnTSdH/PTnBskxsgTg=
X-Gm-Gg: ASbGncu3J1fcEtd+NSPbI9DOfmXfgGNqdDEgk3W7Pc0AUJY/Vp6TOBgo/S30Suqdlbn
	r5DH/fx5f+qqy68WwM6zc2qOgF/WHUjp2/7QTz10TMM26/4oLv+Zf8wQpXkIPhbgJHqAFv8k=
X-Google-Smtp-Source: AGHT+IEbq0SYuJ6utkhGqM6ZWGl7+9gB+ZJ0YdWwZYQUyUrqfZzQYCKYQHOJQPOfBm8nKzZ24ytCRx6Cnm+DGUPagsc=
X-Received: by 2002:a05:6808:1316:b0:3f3:b6c2:a29 with SMTP id
 5614622812f47-3f3eb0a4145mr8051728b6e.7.1739885309116; Tue, 18 Feb 2025
 05:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218111150.3024-1-tolvupostur@gmail.com> <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
In-Reply-To: <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Tue, 18 Feb 2025 14:28:17 +0100
X-Gm-Features: AWEUYZnvnXxoL0fEvv9wngL8-8fVX2V--IDA6YzmJPh45rjwFe1008zhE-h6QB4
Message-ID: <CABhNV23xJoMaknX6GnrNkXh+uTtSkUuGtU12nBdoiuBh-chbTg@mail.gmail.com>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
To: linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again

On second thought, removing is too general.
But it's still very much broken. Is there any reason why this was not merge=
d?
https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app.fastma=
il.com/T/

Any thoughts on how this should be handled?

Best regards
Einar J=C3=B3n

On Tue, 18 Feb 2025 at 13:45, Einar J=C3=B3n <tolvupostur@gmail.com> wrote:
>
> Hello again
>
> On second thought, removing is too general.
> But it's still very much broken. Is there any reason why this was not mer=
ged?
> https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app.fast=
mail.com/T/
>
> Any thoughts on how this should be handled?
>
> Best regards
> Einar J=C3=B3n
>
> On Tue, 18 Feb 2025 at 12:12, Einar Jon Gunnarsson <tolvupostur@gmail.com=
> wrote:
>>
>> The check for BITS_PER_LONG =3D=3D 32 makes no sense after calling
>> tv64.tv_sec =3D rtc_tm_to_time64(&tm);
>>
>> With this check, any 32-bit system will silently return an -ERANGE error
>> instead of setting the correct time if the hardware clock is storing a
>> date after Y2K38 (2038-01-19).
>> Without this check they should all work as intended, since the rest of
>> the function is perfectly 64-bit safe.
>>
>> Fixes: f9b2a4d6a5f1 ("rtc: class: support hctosys from modular RTC drive=
rs")
>>
>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> ---
>>  drivers/rtc/class.c | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
>> index e31fa0ad127e..df58edf99ed3 100644
>> --- a/drivers/rtc/class.c
>> +++ b/drivers/rtc/class.c
>> @@ -72,13 +72,6 @@ static void rtc_hctosys(struct rtc_device *rtc)
>>
>>         tv64.tv_sec =3D rtc_tm_to_time64(&tm);
>>
>> -#if BITS_PER_LONG =3D=3D 32
>> -       if (tv64.tv_sec > INT_MAX) {
>> -               err =3D -ERANGE;
>> -               goto err_read;
>> -       }
>> -#endif
>> -
>>         err =3D do_settimeofday64(&tv64);
>>
>>         dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%ll=
d)\n",
>> --
>> 2.34.1
>>
>
>
> --
> Regards
> Einar J=C3=B3n



--=20
Regards
Einar J=C3=B3n

