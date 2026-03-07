Return-Path: <linux-rtc+bounces-6154-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILMfOoMlrGnnlwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6154-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 07 Mar 2026 14:17:55 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F7B22BE5C
	for <lists+linux-rtc@lfdr.de>; Sat, 07 Mar 2026 14:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B724C3023517
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Mar 2026 13:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E9F248881;
	Sat,  7 Mar 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ+3V2Ul"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA6923F417
	for <linux-rtc@vger.kernel.org>; Sat,  7 Mar 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889467; cv=pass; b=Z4XEW21SwKFkKjIYnxzRjDkG98XMqCrU1DU4JH5u+2FKUwIHrUpAT3AUd2f/VTLyDfEkPB6BZ3kfN7huKfVwut+zjwmBu5z9nCYWbdCailfnPFUqvThqLfZ9OuLCDwtBO/dTTnCaUxsokb6gJxONI02RpLjKb8BU+BDVYDTiHIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889467; c=relaxed/simple;
	bh=BGH5fw1KTyI0IIpta/ctbnM5IMYss8VocaP1z86Flns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPxN7y+U722C696qeewu1tKxt0yrtO71r6ahTK6FzRDDpV029wed/Mq2ogGMEGKmY8npAroDgqBDrh9E5TlGNuPY4FvpawrDvZUCTDomie2yhUNLDjhP6jxFCdVWkws3ZZ6ug6JumbpF1DNC7rIUPEpOQJrlsJazGdsPiCKMa1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ+3V2Ul; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so6789375f8f.2
        for <linux-rtc@vger.kernel.org>; Sat, 07 Mar 2026 05:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772889464; cv=none;
        d=google.com; s=arc-20240605;
        b=Lxf3LrPtUZTlCL0PYRpBs6kIh8KzOt2SvIuBzsNfYJ8ZSQYy5RPo700EljoWQdLjdy
         ZupiCyNyEJJBV9Lzqg3wlZaNX+FuI6OZMQkh6JTfOAwrmekK40K6IoEIrQugL7LtYvjp
         4hlufDt3VZkzDsbWpWoJwjMdPl3h7pKxin1klm4mcCpT4pkQkdov4o+xPjjCc4T0kzVs
         V4EXY5qAufCggjvYLa4KdOAfFxxaYTJhLH8+Ltu3l4MTbjY4JCi15iAY+PnC7i9l+Wwb
         AvBPJcIt1D7iazzrSXGz2yv25SR3Bxv91pI/akQItkQZBoGkGPr34v3aVA9SacBN2LWy
         ZVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        fh=MCVolEDTaXZUiX9dFNE+7upkuLAjtXfEs0AYc1ItMvI=;
        b=HdYUvBRvZiLGiWbg2Ygir16QkqHzM+ceOYr4DUdtP67azuPBqw/G6nHikRzze+llYy
         GdrV+yIOcoetK7TJi/iuUWST8e6N6APa1qnCxGvCVJg6lkOzd/jQ7guL88ki0VFtnkiU
         YKFZ4nN6d45xh+X0jKm+O18i2fANtFeUECn7QZlqZeMbRZqLRqmnuhkCjjYjt97ltt0K
         J3+TyzuKO9XEmL4PaBxpOmFhBSdAYyIa1c8+tRh6CG+4o44z3GQjIXfTTebgaSc7Kyu9
         T1ziX8FpZ3C6ab1P7FNiZ4iP5YSMqmf64nzxi5IpjJ8qgv+kOcIN0U9KdXjyeHuvbVIR
         tZTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772889464; x=1773494264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        b=cZ+3V2UlBKXkxskZn/S5bW2/UthLRJU36cWn8UpQOyqj6mYbssGEBjAhD44JwZfqjK
         nAlhV/x3iY5cZ8UhRDe1OPcd2zrcq+4C8nz6AwfLDG5HcfAxhhJzbvet7W9VYa6wFbKi
         sl4EPnb7ROE9cUHk1WDUh2XwlBILsoHr0lHPuOxMkeb7bJxwZX5wAvG8ABocP+Y7Ty/K
         kPHjk0lN/3H/7YKIbT6VBPumPusLYSGyYXPANg+bDLLVyNyyuGV7aa4kxy9ImXY3+uzs
         dqMQWjaFRi41vJwdNbfQqAIf9gfeuvGznpfZAfYHFwvg/2GBCyBYDMvd8g2NBnYTHUsr
         aJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772889464; x=1773494264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjwpvT6wtYJv8QceRQPyk3jFj/BRY6zuY97whk5Cwg0=;
        b=lkPatHV4rzrB8Jgr1gUDcw4I55gCFw/1yD2Jtsq0LU914c/cUkjYLyMtwnRgB5Q88Z
         FuSLLL6Du9QPipkJ79Zf8h7hyyBG0miNCUVPQDgnAQCxQvtZ2rN7i9KnXXAeDMQSfwLr
         +Zcmpzk4PU4+Ed/B8i+Yu7eDoI5HchMi8sWUIJyPvtZBC6JKJcH5LZdrWqg+EHwwBbTx
         1rkGpvZVZUNn6FddkEJCH96Hr16WU/r1mOrt3ETwWRutpV6fhVoRIl45MW7lZ4Q2ZfSt
         SIkSkWpxAxBdcTW2sB2QsK7fC8QZnp2KodDUeOkbnF6lKJo7J24E7R4qQdagWTve6GkZ
         ebCA==
X-Forwarded-Encrypted: i=1; AJvYcCX4JRgmNe7zP5EFxPoj40M1xLVs+Am0To7yBBEiZxesrq4zC185sofeJlk5hJoWKeor3vliPK7bJnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UBmZOkjaWcBGQwlqgNGx77MUelmIFPMdPNsXki1eFMwl8c62
	NEmOFnjjXUeEbagWV6OqhDP5y4gTYQJz9FwtZnsfP0vRQZwF79WdUs5JcLnPdqMJFJn++Mx7IV/
	f2YHvLviYJHBAV3r/DEyIf88HqIaYzCYxlesn
X-Gm-Gg: ATEYQzw8ku4yLWgkxb3qebyY4f+R1eSvHLOYeR8MYpTgT/vacVzlnMRPhfuUGrZ2qon
	majkWRDYG8fpJ0MFqWTWQ5xsC1jKtrbScayrCFSbp5FYmi2bL1hF0Bmy7fUBQrL5B5xYu0mw/nt
	yezJ9p0bp3YPIq+/0jj4Sk6h9GDEu84s3zwOQw1HuAXC2NA85YRjD2qaPBRHxRs/neJYjwK7vWH
	uvwry2aRbEFgYjYRrixxQDE1CzcD9UYv3s/+468UBHNOFsDS8OyPOhBM2pxLXa2m917g7b6pjbt
	DpfhAUyQ
X-Received: by 2002:a05:6000:2509:b0:439:b7c9:2eee with SMTP id
 ffacd0b85a97d-439da656ae8mr9474585f8f.13.1772889463755; Sat, 07 Mar 2026
 05:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-5-clamor95@gmail.com>
 <20260307-huge-excellent-tench-0afefc@quoll>
In-Reply-To: <20260307-huge-excellent-tench-0afefc@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Mar 2026 15:17:32 +0200
X-Gm-Features: AaiRm50GLCk_SOmhHd2bvwAI0azWxfEbywfHqltNh_WJ56961YJKr2R5TU7KTzo
Message-ID: <CAPVz0n0Mfzt_rXKxQisrOmNqiEaZKE19yXFqJbgCWzcrFpHwAA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: mfd: max77620: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 92F7B22BE5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6154-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3c:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Mar 06, 2026 at 03:33:49PM +0200, Svyatoslav Ryhel wrote:
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/mfd/max77620.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        pmic@3c {
> > +            compatible =3D "maxim,max77620";
> > +            reg =3D <0x3c>;
> > +
> > +            interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>
> This is odd interrupt. It's I2C device, so how can it be GIC?
>

I have used layout from Tegra device. I will switch to smth simpler.

> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +
> > +            #gpio-cells =3D <2>;
> > +            gpio-controller;
> > +
> > +            #thermal-sensor-cells =3D <0>;
> > +
> > +            system-power-controller;
> > +
> > +            pinctrl-names =3D "default";
> > +            pinctrl-0 =3D <&max77620_default>;
> > +
> > +            max77620_default: pinmux {
> > +                gpio0 {
> > +                    pins =3D "gpio0";
> > +                    function =3D "gpio";
> > +                };
> > +
> > +                gpio1 {
> > +                    pins =3D "gpio1";
> > +                    function =3D "fps-out";
> > +                    maxim,active-fps-source =3D <MAX77620_FPS_SRC_0>;
> > +        };
>
> Messed indentation.
>

Acknowledged.

> > +
> > +                gpio2 {
> > +                    pins =3D "gpio2";
> > +                    function =3D "fps-out";
> > +                    maxim,active-fps-source =3D <MAX77620_FPS_SRC_1>;
> > +                };
> > +
> > +                gpio3 {
> > +                    pins =3D "gpio3";
> > +                    function =3D "gpio";
> > +                };
> > +
> > +                gpio4 {
> > +                    pins =3D "gpio4";
> > +                    function =3D "32k-out1";
> > +                };
> > +
> > +                gpio5_6 {
>
> No underscoers in node names. Use hyphen.
>

Acknowledged.

> > +                    pins =3D "gpio5", "gpio6";
> > +                    function =3D "gpio";
> > +                    drive-push-pull =3D <1>;
> > +                };
> > +
> > +                gpio7 {
> > +                    pins =3D "gpio7";
> > +                    function =3D "gpio";
> > +                };
> > +            };
>
> Best regards,
> Krzysztof
>

