Return-Path: <linux-rtc+bounces-5197-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B987C11DE2
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 23:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F901893DED
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 22:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC48C331A5F;
	Mon, 27 Oct 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZZdxYt0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA4331A40
	for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604954; cv=none; b=IoFtdudhARzBQR44Sj14Yg/6SQ0399zziWxOxYjWh7p/OXYobU++RC+XQxDy8ZgrdgRMg9tVQmLIDvRizs7nO036q0x6Lg+SbX38ePnHCLfXPSq4Q0K3YzUnmqqhX+z4MX/sDHPG/oQ9U0dV52Q93azTgjSs738mZp3UT6toDik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604954; c=relaxed/simple;
	bh=mdMs/b0H8ZKYdk7N+cLM+Uj/aE/vejpLNMBlaSFUExo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKOXYYX4mMq3VmmC6TNttCXzp66Fe+ktBgiekGvWVGJDoivJVqn+7OmEYU/mNYmJ9k/b2Q31ks8KZGlVuEMWkLfpBLtetE7oaFSGIDYD5i95SrNRYsZlUHi4vK8514rvY2EbQJ6mYtWwpmvOfeNdtYAbMJ3UuYxJr2aDnfBHUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZZdxYt0; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-784826b75a4so61419987b3.0
        for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 15:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761604951; x=1762209751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEbWuq+sA3qayyKc6Q0Zwp+mZTGvAg5r2iKjERsSY7s=;
        b=KZZdxYt0Z2WZKZuPgT5rRan52bxSrRh4T492YeoJIxeDY4LeXNDR+R3yOnRnZyzVb8
         KBlWPmFy+95MRsIPWWq05i/z4Vn8LC7vRp0/hibWv4bpyEPuRJpN8p04JKGNALA59BXB
         r3b3PPsDTPdzYTJGjWqbufP1y7+F4e3Z/hYN3mc3SqLZRCp6/byeKiquedgj54rR/WoW
         zQl9+qIucwctk7wZ2brLUUZ0eQi/1r9U9SISaTDla8dXL6QC8+0YkkCn12F12/lVVHm5
         EdDcsB2o5zlBZs5CEApaknmyKahuQv4I3nfHGGpBcs/xheH7rog0kOa5jFGtyALH4ZMW
         qI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604951; x=1762209751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEbWuq+sA3qayyKc6Q0Zwp+mZTGvAg5r2iKjERsSY7s=;
        b=KYGXVcw350Hh8ogxMkT4NryEVran6BCHccRybFhB7a8vtSld3lspfWd1cR71sUR2/p
         BNX0fNY8Iksp02hy4Cb+b68JnrwYQQgJiD4SwLhcghs2pZf4pr4UCcphpaKnTUiwS6DI
         xH9yH3HkGwZBxUaJyUAZGFJ/3zw/4oHNT8fDajdqOQeD/0pbkZ/vpyeOOYWU0atndjjP
         McWtE4krnMabCC5kj2iXiqyI+UuYn2DF1pY+743HgcADkIlJCG1JT8DNsxR/PRuDrPLY
         1i+3pdHInr1VB5XII5HWtJg7ivd9MUNUi+sooRykV32bE6hl2Zg3+g7uzm8lugXwY990
         dUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXy7XxX7mMj/CqMnnVd/Mzw1RM3+7wOupUZfQPWG8EnGfNOEwtap5BZ7ebUo19H+tLGeeHC2TA6pps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqiyLI55ovSf4c3Vbrpu8xCz4IWyjKtZ0cJazlbkJ8/2gmbF2
	kf3ms21DUBaHt0F6l/e/9XtQIjRELIBapelPqu2t4zUTU7C1g1l2MDOltNzYqDA3a9fWAS6oiSb
	nJSArGKXunC8Iihifu1Rk0G4rkg+tGyhSxxRMxV5NOA==
X-Gm-Gg: ASbGnctW+eYrZrNwV6HsVP8khTJ7sYzgw4XRTb0M7Vvuq5PBMi2jHlXlVjeyE0DKBRw
	uR7JtIhLmxtUccBr04H1j64hrYaNz1yV3uZpBe+HCjlFh57UNTjEh9pK995yfDLLr97UzeSNCgi
	8c9UjK9qCoo1hYRmmCDXCm4WRdjJY6DUN3lqonsVgsZK6xQ3Uw4xFqnvFU2VV6l2MbnjVL6HLfo
	zTGDuZ8W0EblElSSXA7zl/zp7YPjq9CIQGIpEKrbqLS2OrZsaNsfl5vRaO1
X-Google-Smtp-Source: AGHT+IFea0a7SdSezzmFvdSfx4jiKtpkMteXYqF7MqSlxI3OsRPCoABiY/0t3pyhk2zywEU29O2vl188K3Ur1ROhIiE=
X-Received: by 2002:a05:690c:3684:b0:783:697a:5daa with SMTP id
 00721157ae682-78617ed7dc7mr16221547b3.30.1761604951123; Mon, 27 Oct 2025
 15:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com> <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
In-Reply-To: <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:42:18 +0100
X-Gm-Features: AWmQ_bnqjdOEx6PHBZRMUEpMuG3EOvSnhd1cnxA8WMLK3e2WMcsLHGdno_I3fzM
Message-ID: <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> +  rohm,clkout-open-drain:
> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmo=
s".
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1

I think CMOS is the same as "push-pull" ( I could be wrong, but I think I'v=
e
seen that before) so I would probably try to use the pin config standard
names as strings here but I'm not sure.

rohm,clkout-bias-open-drain;
rohm,clkout-bias-push-pull;

Mutually exclusive.

Or maybe use the pattern from rohm,pin-dvs0
with string enumerators?

rohm,clkout-bias =3D "open-drain";
rohm,clkout-bias =3D "push-pull";

?

> +examples:

Maybe add some of the exotic string options into the example so
people will get it right?

Yours,
Linus Walleij

