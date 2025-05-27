Return-Path: <linux-rtc+bounces-4166-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0412BAC4A17
	for <lists+linux-rtc@lfdr.de>; Tue, 27 May 2025 10:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77414169601
	for <lists+linux-rtc@lfdr.de>; Tue, 27 May 2025 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F19248F63;
	Tue, 27 May 2025 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="fFN6T3j4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125B226533
	for <linux-rtc@vger.kernel.org>; Tue, 27 May 2025 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334159; cv=none; b=Q8WewzM0MMGF5QnyUBix+NsqqU6fFCb4Or/G+ZwP2MtEQqWS/9jTUJKLQjYqWADKN3o5Il1Sdf8ktUfOkuWIVf/JNhXmMCD5hK4NLbBPp3Fv0MPVmA942hGOmnodfeRbAbfzJY1z/LEhvKV8OPULasWVdW15GPE62A3y0bDpFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334159; c=relaxed/simple;
	bh=b+MGXsE80mn6k512t7VEU/4kdLuz/YLTq/FCgsOrKAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Now8Ixxt/jxkXF2nTkIchkdDNlzryIciWdbp7eByv9n7c/+GutDar7xBB2F3+C86K4ZUnvIbJxMhkx/2JEmC7IWwEC2nLNx2eZziG2iG36dpnvFy1nE/VLytXszQRGM/rVWjEu80SC6nMMhslkYUPRAKOUUJb7rR2L1Q+eO9FEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=hsyco.com; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=fFN6T3j4; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsyco.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87def342791so636826241.1
        for <linux-rtc@vger.kernel.org>; Tue, 27 May 2025 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1748334156; x=1748938956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DeBB8nUWQnN2Xyu+ZYx+6TiOtJfpeTIaD+yvdQIb+w=;
        b=fFN6T3j4cD/CHjN+5N3FhYEaVTgtLCpM2M3RqkNnJ4iWYH2Arrd3y0xQ3ATd9p3MNL
         k4kT0lroQy+3YqsPIFMDiodSxBuK0P5alLsqw9sCtyYJOZP8fYMmkWj8LzpXOljJiYsF
         YPCEwy3kVcnVdSBn90x1aqGrzwJFheUEev2Z6wrcTU0lb/+vROpX9xeRnHLfULxmb+wU
         RWrNSQrAPCaYw+jwKNqlFS7DREDX2HxvO1poS/lxz+pb1THI1uNQc9rA9HHb41HdqZPM
         GEHThD6PiJb/b9xOJx1C7Mmazk3H556Wcp+FsGzyyw0VcBkxYySorKMo3Wh/83Y0ueJn
         V0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748334156; x=1748938956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DeBB8nUWQnN2Xyu+ZYx+6TiOtJfpeTIaD+yvdQIb+w=;
        b=JfEzrHB9VyJePOayp9wlFiSmbvmTn7T6qp/G8Qo006VW/VlXBRXDI0GWtrEBNIOD2r
         HIKCygxzdWFRSJ446n2mrGMQJCdYvdQTkq+eZN2l2+PozCHaxfT3sf+PdI3Fg5Va1lAP
         NIFldC+ZnOVg38C2DbJynlOpFz8dnQAfoWLUf/BSMxq8nbFAO+WkrN23IUqBVeqAW5YW
         BY+H2lr53UkssIYbir7qxeS6UOOHMFp0peP+AzUZQv57SQDkGczM55W+DQ4JZZsJrLyj
         K+W1p18cf700c7rq+IwOcOu4tRH54+9aIxZbfXmIXNNC0jWpzG7PUCLtzfJdg0U4qr5Y
         hzvQ==
X-Gm-Message-State: AOJu0YzURVd2wi7xle81oQESN4OTqaQlYlUXAoCXqldz4PL2QZR56yOv
	pdMgZI9YYD5cnwZEtImSKBTu7jeUG2R5QZwDQ8TycstCtubwqCAqLp5QvZOo9OmAWmZCVgQWuk8
	ETzwSU2xtMnwwjpamZlQDPixuagRaN3Bv95GMgAyD0g==
X-Gm-Gg: ASbGnct0yUOALXWYHfQS30uW2SqtyW3AUd6AE+Zls4Qn6ICFSxOcAX6JbQzMHhmqeu+
	Q4oQtUWj4fQ7BqBtOjX0qyHoYyaOe9R9siCMhYtXgXGqo/VeJKNgVqkDBRULpRZehu2YfspNr1D
	5HxHn7+NaRQ5b7Hr+JGZ58N+xHNik=
X-Google-Smtp-Source: AGHT+IFWq7h/oWKb9eocZ0AC10ijBvnESKpIqtSFz0scdSEPEmJlTFX9vKntc/vtXzbnHpERR+6K40is+k2z/a3rRHg=
X-Received: by 2002:a05:6102:d8c:b0:4e5:59ce:470f with SMTP id
 ada2fe7eead31-4e559ce47d0mr2750168137.21.1748334155947; Tue, 27 May 2025
 01:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526161234.13236-1-giampiero@sferalabs.cc> <20250526193958617d18ab@mail.local>
In-Reply-To: <20250526193958617d18ab@mail.local>
From: Giampiero Baggiani <giampiero@sferalabs.cc>
Date: Tue, 27 May 2025 10:22:23 +0200
X-Gm-Features: AX0GCFsE59a3ApGO9wt86mNgNDMP2qHuYQ-txa9lSiNFZ9pemutyQTh9WNku_Zo
Message-ID: <CA+gFNtY0q2kyj2kjDbUSdrhkZkcjnwHCau=0Om-akpm-imkYFw@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf2127: align power management configuration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the prompt feedback Alexandre.

On Mon, May 26, 2025 at 9:39=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 26/05/2025 18:12:34+0200, Giampiero Baggiani wrote:
> > The PCF2131 comes with the following default settings:
> > - battery switch-over function is disabled;
> > - battery low detection function is disabled.
> > These defaults differ from those of other models supported by this driv=
er.
> >
> > This commit aligns the behavior across all supported models, configurin=
g
> > them to the settings typically expected from an RTC.
>
> We can't do that as this is going to break existing users as they may rel=
y on
> the current behaviour and the configuration is persistent across reboots.

Would it be ok to use a "backup-switchover-mode" device property?
I guess a "battery-low-detection" property will be needed too, which
would also fix the current issue of BLD config lost when switching
between BSMs.
Thank you.

>
> >
> > Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 31c7dca8f469..cbdf7f23e6a6 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -1312,8 +1312,15 @@ static int pcf2127_probe(struct device *dev, str=
uct regmap *regmap,
> >        * Clear battery interrupt flags which can block new trigger even=
ts.
> >        * Note: This is the default chip behaviour but added to ensure
> >        * correct tamper timestamp and interrupt function.
> > +      *
> > +      *=E2=80=87Power management functions set to:
> > +      * - battery switch-over function is enabled in standard mode;
> > +      * - battery low detection function is enabled;
> > +      * - extra power fail detection function is enabled.
> > +      * Note: This is the default configuration except for pcf2131.
> >        */
> >       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> > +                              PCF2127_CTRL3_PM |
> >                                PCF2127_BIT_CTRL3_BTSE |
> >                                PCF2127_BIT_CTRL3_BIE |
> >                                PCF2127_BIT_CTRL3_BLIE, 0);
> > --
> > 2.39.2 (Apple Git-143)
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Giampiero Baggiani
Sfera Labs - www.sferalabs.cc

