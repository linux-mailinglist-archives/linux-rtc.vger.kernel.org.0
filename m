Return-Path: <linux-rtc+bounces-5196-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803AAC11B99
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 23:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B201A28523
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 22:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C4932C937;
	Mon, 27 Oct 2025 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5q5hdt1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5602E54BC
	for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604463; cv=none; b=VEasMCayRiHwFfoZnV5jECXTIzIe5bqV6qkFzD3ZysaajMwM+0GB7aikKQ4jsiUJHE9q/e+PCxtZpHUOVoDJl+CtFav/uTscBq8pVtdqo3tPDvRGL804EhMmvZ9ukfZq+hngUM/Fe+JyMVRFoc0iv4hqulFMJ/t6c3Zk3+61o3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604463; c=relaxed/simple;
	bh=6FK4Cywp2kPqN6IZB7Pn8a9qrx5ElGyAJ2bbf8tmYpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXPdMs7YQ7m1nZzF3is/0u9S/Fwwia1QnVcywTaZrZJ74wQCRPKoAHrQYFfXZIXc8q/Q8Y8Txzmf2kyaWqIDxL7qXKcXCGiES/FBligJBMLiuJAZgZxOrSIloBOTTpJkRzBQcgt1oDFwT/a2OnFwuRX3GjeVMJc94ufGH0ehQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5q5hdt1; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7829fc3b7deso40986807b3.3
        for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761604460; x=1762209260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FK4Cywp2kPqN6IZB7Pn8a9qrx5ElGyAJ2bbf8tmYpc=;
        b=b5q5hdt1cL9wVjYbAkH1AYKzJIgDa5TsWEjX8dyjivJOfapORAREYYvKyA/iPWm2tj
         jdLTg/5lfN55rkoJPgsEVGdUUKXpnBalcjBCv9TtrNcFVVjF7GtDNvgnSNmVkkIaYPXX
         hpudTMw0ZlFb0tm9eSu2JnJQUikJ6zvK8L86g2qIJIf79h3o34sKAoMSgGLTUlqpgwX3
         1TlTTn4jYV6lUjIyYNmvhByncI+JbC3ej7P1WNKFYhjzWg0Nrp8AEllBjroEKywayMr6
         C7hDksahGiwpPgmSCsPbroAyx8bvOirouB7KbQG7gjXbTgpmTH4QdM/Hwct/DAefQ9No
         nbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604460; x=1762209260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FK4Cywp2kPqN6IZB7Pn8a9qrx5ElGyAJ2bbf8tmYpc=;
        b=NhH9l98OUFeqHtrQ2Vg/fWiNeYIlngQfdmqLs/LcMRwTieB5CUOiFGco32e43+eCE0
         E1ZKAwgrfdZ60+8HOWwaNUx+qejJMdbg3pZELHwJLqZ4EE1JkyJzVHHILwA8mPBo9bfw
         Zm5sXOQ/3MVt4GKE0h4ch+P19U38cz7DhxjhPr2HgMT7jlY/OtteWJGV0K4C/FjYGbNT
         Xpc9xL866GlLgxM/825iTuXeuVb/eKdCp++v6Wndq7PloGaxOl9gaurIQUjJJ/YQqKYZ
         26Bm9gv34kEQBfZIgDV7wDIPyMEnq2q947Dv1EwJVXg2E9UqqnsP1/I8kBcw/u6TsCQi
         kuGg==
X-Forwarded-Encrypted: i=1; AJvYcCXFPYw4Z0zn9/96caQ9V7yH03Qn/A7JwaHJxMzpI0Sn9GFjP3JonDdT4MJEA9/mF18myNiNpn9OI3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9YBkExXeDVApEZpXPfmqjHOBhaWcoe6GHBhVHIxge1xbe+n8
	q6NYtaQijRkXF1VIrs1RlSaAuMYE95JLqGnNXip44BxgfJX2ui0TN3olTmtCeVeNcrORveEAcZ+
	pgdskrUdovgGI75F9nNqaRnUyYbefXeYs/+jYRjVq8w==
X-Gm-Gg: ASbGncsgdq6HmopR0PqfMK3s2nXpZOQnEmJQOZHE6/QDzKS2r9K70kiPk/s+oT41xFb
	TGs4cj1EI1FMj5SIcmm21daTlOVrERLUlvb4m4CmllCpknBKSOY12OoDa+lmy9wM9dOg+z/sGJF
	1TxIBdkRSa4NxG61svp/dcXJH/lmQl3uRIxe4G3j4w9omHQT6u0MXmNE1Vg6Jj49LJbcHAObOPV
	4Bbhhzfyi6/qLYqb2x0XOR4IFsvMJhZlUxPdwypLY2B5lia6qIGqj/dwS0p
X-Google-Smtp-Source: AGHT+IHFxrQwcIAfHl/EDjyJgU4+jEXTaSyjinBJCcTfFFs/TuXmdRuhxaYs6OB/9vERDl+26CgqDxFOu0ooMCeyJi8=
X-Received: by 2002:a05:690c:a00e:b0:781:1c1a:98f0 with SMTP id
 00721157ae682-78617e5fb66mr12794187b3.18.1761604459817; Mon, 27 Oct 2025
 15:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com> <e8d0273bcf0ac67382e17c40be87d345e28ac06c.1761564043.git.mazziesaccount@gmail.com>
In-Reply-To: <e8d0273bcf0ac67382e17c40be87d345e28ac06c.1761564043.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:34:05 +0100
X-Gm-Features: AWmQ_bmCeM1hCEpCcloBtHCP-z98b1djEaHpBG8dS_Pa6X6P_LL8sPGseuESUz4
Message-ID: <CACRpkdbfjqbmy5EbLApee3p9TEsEzBKOcGMrbspeWxqUc_niiw@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: power: supply: BD72720 managed battery
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

On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The BD72720 PMIC has a battery charger + coulomb counter block. These
> can be used to manage charging of a lithium-ion battery and to do fuel
> gauging.
>
> ROHM has developed a so called "zero-correction" -algorithm to improve
> the fuel-gauging accuracy close to the point where battery is depleted.
> This relies on battery specific "VDR" tables, which are measured from
> the battery, and which describe the voltage drop rate. More thorough
> explanation about the "zero correction" and "VDR" parameters is here:
> https://lore.kernel.org/all/676253b9-ff69-7891-1f26-a8b5bb5a421b@fi.rohme=
urope.com/
>
> Document the VDR zero-correction specific battery properties used by the
> BD72720 and some other ROHM chargers.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

From my PoV this looks good, and makes it easy for engineers
to read the DTS file and understand what is going on, so after
addressing Rob's final comments you can add:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

