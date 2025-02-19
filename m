Return-Path: <linux-rtc+bounces-3226-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3BA3B290
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 08:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75151173E2F
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 07:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07FB1C175C;
	Wed, 19 Feb 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZOcESS5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5CDF42
	for <linux-rtc@vger.kernel.org>; Wed, 19 Feb 2025 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950593; cv=none; b=u4+VsZ19ZUwmsVstQEYTGRoRa7ouXCUgH8zUMUHK8VRAx1FEkb7bDAF4wTqwypQ6NFoSQxV4fE9yj26ND38V1itdTYKrziRRMQczCbrZw9Q03J9JMq7Kxs+jIth5teKXxVMWsDZR8WN+lRwrODB9NORZuWDQwRO28I5lDyoCdQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950593; c=relaxed/simple;
	bh=wD4UiWzxSAdMvqQmvxHU9tlbGz10pvEekdiAZ3wWHO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDqxaoQhBlFuMFe38hHRDG3mlKjIfkWoJWsE4iR48wzBDYNy6SJ2oYwqEYVxtj8vUx8R22OlZvaEe29znpOfJVqYVPy4nzLMXY3x7Cb2hyoO03ded1BfU8E3kA4fdbR+faQfrQtHrkA7SMKpLiOGpQN0FLRQ0CdE2BM/LIbDeSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZOcESS5; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5fcd50841f4so1463490eaf.0
        for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739950591; x=1740555391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD4UiWzxSAdMvqQmvxHU9tlbGz10pvEekdiAZ3wWHO0=;
        b=JZOcESS5Ieawibp7SabnUpEK//T5PTDWMML27HJBu1FdAuxWXbaBnC20PfaWTdJDIn
         wuaBAiL1Cwixnn5dOeq5h2aSU28bOtqbWVsxcOoOpjGqs+CNqoWfnl++R95hjozdpqqW
         aVuKwjIqiPkE7ufYL4cR06/ms44J/b+6Bh2TzQSP7+mWUTO1bB7GcWrYAYLAdsL3X+Jg
         20dnW3GSo7WcoykVpUzX1cazGaKBO8Qmm5ISGdW/x4W7OIzqrwcz9Usl3XaWvGYlhKTx
         MEIo3t69aahnLBF4UOFXBjLIGoc0JnnBxdTOFdRL2S/oth1PqxsqOtzbsbEK0LDLhvOJ
         HFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739950591; x=1740555391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD4UiWzxSAdMvqQmvxHU9tlbGz10pvEekdiAZ3wWHO0=;
        b=SIxqaAke67+JDrgAvreIc53YZy5rzZ1m3qwu7vInmbtMs3lkvzx1tqjQZ60NtiFVNa
         O/gU7SkCrzFO9Rdyp7Ffu89R1rWkLGNLV3otd47MQs+d5SvHZ9R1BnqEpWMps3tgOBSy
         +ZzJVdVCec260nWZOAfdQCAkkr89eWwlFN1usfLjgI7zNJCuhw7pKhuNeQ4EvfZVN6Qt
         bnJ3vcQPZmcvSA1Je0lOBxOml7nbxzldNGzY6saThAFK3OhLSZWPPD3jO7zYN0aNku3h
         HWQ7ZXF8NLby6yHc9mhWXslvAiZAN3lBal8wJuy/LBWI+xzUD4a4T25zhfw+QQO6dk3u
         3TGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8dA9Z7tLBToipd8Lo0Ip5f6SwnuUCcze/zmZpGUcfHUeQPB9qjGPQ0Hhepw/Ynhds6/1T7xNhpnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsTGOes052psLmt6Ld2ixxE7R6WyKlTe0WgTF2j0VInzc1jE/K
	RCpB2NbNoGh1EsEki/RfpCv+esWAtrPc73yL2bFm4VPJK6V67znlC9tElPlQ9HWpiF4U/EDC5Ja
	WKRHQuSYcKK9BCkftccFGiuGD0fRVKllcZSo=
X-Gm-Gg: ASbGncvlBAq5/g9z8zgdJj5CimUxPJvnY8WfGz+IgdLrIpnY5UDLiUZcaZ17e8GPZai
	5AySH+69mmpMpbJawkf0kInir5jp5kZ56kyg0pKE5q1DWfKBSeSOZgdXh5AHiYoMMLlxx86E=
X-Google-Smtp-Source: AGHT+IFcd1G/J64xHb4GaPXRSQEKqoI3B8Sgqep37lCbBhgCkQqOOhd1KrGLfF0VqSwhJEnmY81enYnXsDZpX3mM8cc=
X-Received: by 2002:a05:6808:1490:b0:3f4:13ed:ca78 with SMTP id
 5614622812f47-3f413edcb8amr458811b6e.27.1739950590956; Tue, 18 Feb 2025
 23:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218111150.3024-1-tolvupostur@gmail.com> <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local> <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
 <20250218154057079fa7e0@mail.local> <baebf0c3-22e9-4b3a-9955-ed27fba708a6@app.fastmail.com>
 <2025021816395435e28cd7@mail.local>
In-Reply-To: <2025021816395435e28cd7@mail.local>
From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Wed, 19 Feb 2025 08:36:19 +0100
X-Gm-Features: AWEUYZkoHLjKj7fkwUYgA5AFmB5RxV1BbgQh53pNFyIf4VeCJKcC4CWx5g2Hqmc
Message-ID: <CABhNV23E8aBFY4wDYwwFDBV9UC8=59GGW_1rp5HHfT+Qi5ZyyA@mail.gmail.com>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 at 17:39, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/02/2025 17:05:23+0100, Arnd Bergmann wrote:
> > On Tue, Feb 18, 2025, at 16:40, Alexandre Belloni wrote:
> > > On 18/02/2025 15:51:24+0100, Arnd Bergmann wrote:
> > >> On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
> > >>
> > >> I don't know how many 32-bit machines are affected by the bug
> > >> where they return a random time, or if they are more or less
> > >> common than in the past.
> > >
> > > This is going to break some of the Marvell board that RMK uses becaus=
e I
> > > guess he is not updating his userspace.
> > >
> > > Also, I'd note that OpenEmbedded switched to 64-bit time_t by default
> > > just last year.
> > >
> > > I'm not against removing the workaround but keeping it doesn't actual=
ly
> > > break anyone, it is still possible to set the time properly from
> > > userspace as it should be done anyway so I'm not sure about the urgen=
cy.
> > > The impact is mostly about messages timestamp in the boot log, before
> > > being able to run hwclock or any similar tool.
> > >
> > > Or am I missing anything?
> >
> > The main problem with the current approach is that it suddenly
> > breaks systems in the future (at the time_t overflow), which is
> > the opposite of how the rest of the time_t conversion worked.
>
> Yes, it will suddenly stop setting the time on boot which the platform
> can (and will) survive because it will probably then start NTP. However,
> without the workaround, systemd will just crash on boot, bricking the
> device. So as I see it, on one hand, I have mostly recoverable breakage
> and on the other breakage that mean going on the field and reflashing
> the device because the system will probably not be able to do any OTA
> anymore.

You guys think that all devices have a network connection? Even in 2038
I don't think that will be anywhere close to true, since there are a ton of
32-bit embedded devices out there running linux with no network.
Just my company has thousands.

I'm using rtc-pcf8563 with systemd on i.MX6 (majority has no internet), and
I just removed this check locally. That way my devices can keep time until
2070 (EPOCH+100Y), which is currently the upper limit of the rtc-pcf8563.

>
> >
> > We now have distros with systemd that advertize support [1],
> > and we know this breaks every single machine they run on that
> > uses an RTC to set the time.
>
> No, this breaks systems that only rely on RTC_HCTOSYS without a
> fallback.
>
> RTC_HCTOSYS alone is anyway pretty bad idea and no one interested in
> time should use it because it can be off up to a second which can take
> 4 to 7 days to resolve by selewing and not stepping. Anyone serious
> should use hwclock or similar to set the system time precisely after
> boot so the offset will be closer to a few ms.
>

Suits me fine. I do think that documenting this would be nice, since most o=
f the
hardware seems to be able to handle dates after Y2038 - it's mostly a users=
pace
issue now.

--=20
Regards
Einar J=C3=B3n

