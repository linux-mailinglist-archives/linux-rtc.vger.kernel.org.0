Return-Path: <linux-rtc+bounces-5309-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12BC49B1B
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Nov 2025 00:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB5314E311D
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 23:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AE23009EA;
	Mon, 10 Nov 2025 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhQ1D1Km"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D02F5A10
	for <linux-rtc@vger.kernel.org>; Mon, 10 Nov 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815867; cv=none; b=RC1RN2FGbGCYU3Fscgl2KqIgLDUaLr/fg3oDvy2ur6PJUFeuj5F0O56q4YreYRMaPMyIC0E8EMoCfwkS+HcUOJquk72uEGprZXdGE2hGriGgZD6E0YE7Xw6L6CsoP/4eTdWC/pipm5OBN3VR0COPO0xPMrC0ShQJVFGYHEMoI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815867; c=relaxed/simple;
	bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLssv6GrEzAKtiu9tQVfH9xSw6L07mgdFHc9xNHOXdcusGYU+R6mUWhWWHePEbdfLEJLvrCDfppNp53l7BVQ3lEkWzi6Yy6osj/4Y7fVguc0MuFyJMzRQXfWV0rq01y63zZqwx0etfoRiNzjhgYHvpARjFtvJ4UABq93YMtUg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhQ1D1Km; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640f88b873bso155233d50.3
        for <linux-rtc@vger.kernel.org>; Mon, 10 Nov 2025 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815864; x=1763420664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=UhQ1D1KmPSyna4F/76ZCUiG8KhIv95nF4dhc49qrIM3p2GzZR8fl4PtKw6Yk5uaenr
         Jxo6B1MPDizlQu/eAzhlHvAjPysa3NgZUqffrBat8sUZCey95AmWJHKnSMiP9zRpfVwn
         yDf7hD9zPMNJY5K/TDMfIBp874x/FBBHi88+dxfp8g2/um8X8UHQj372t+OGfbo82eR1
         O1hbOAThw5oCk4Sy/TkWbTHXa+HDjeRny+D/HCyIsPlxXxKrnhIkL79zMZOuophqGxN7
         HEm1Hqzly5dxGv5sdqIOUUxBQAtVaiVswEfsuQw5gUpO4MhmxEB5Nma4Cgn7+HcHKITN
         65kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815864; x=1763420664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=tDEBhz6W5lRjZOr12AFoZHjE4OpaJTzDo254xQ5Rcd8qfiJ0wbDFUHyvcNz5vJHvjI
         7VfXsujotDg2aSKx5iRI3zJfylBKTuPczI1g1VPIN40aduXB6IgXl1kt7zmAUx7RZM3H
         a8kqtYQV8eJwYKWqs1JHV7UchokyH4T8aIpKoxIBGN4v/qB2wAK5UC8Sd6c4qb/tjqQT
         +UM6/PTLr4pRjboib2c2iTycKhlvREqKV4qK3yXN4hUzyilaNtBp/yPwBHTVDWWRgBz7
         UtTDx4rBgpDcOzO/3pNzqkJ/Cyd1GfM15YAMeOXx5krrtfBAOXmu7oJv/Dt/sGMlrwPc
         HIng==
X-Forwarded-Encrypted: i=1; AJvYcCXNJ4Yl8T+tQ1wYiLMxS12dUxAhFuDv93/bquxeOejuQQAMSX8Xa5vx0v8WwCx336IzK2Y43oY+7Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFj1b/9n2j+ydgHeT5E3reCpaaKHv/+/gtRpyzkOM+vh77Uu5
	p7qXlwmYIrGhsq1azJCfcJDB1Go/0l806vVXBB6uudQ5s0egnkCI9+o/BWsswfvl/hWTSTtlpI5
	PRwkEtib3Y39pXXHIpdywKKnhk6KncNBaIXlc5CepmQ==
X-Gm-Gg: ASbGncugNotKRrlz1MNaCqgpKB8NGOGBSXkd69SRHgzwx9tZGdRuAuxdKVdQNXVpA4S
	x98n1Gv3/hSArqTjIZDA+Q8cfdmojjIUlnjZqJ3XdVB+MKxGuB1txNtzpC8CtlkuPdcmIm6Yrs1
	76i4zCUOhQoVgKdEirKCqcxHTl/i09KAyB0n6NbwiCFq6WVmjA2g4aVC7fwNHDU+fVx2uqom5Kp
	1MYqMQ/54ypH9of9qjSh27aH2z4Hf4K247S0qTbnwEXCnFmdSr9m7SnkBCnjNYKtKZ96jE=
X-Google-Smtp-Source: AGHT+IHoC/R8TGWkSsRmVYTrTznpjr4STw1JDCmsU2sbR9qoad5PnTy6Rrlwiey4S9ikwN3xlZNQtXBlBuI95lMoqZY=
X-Received: by 2002:a05:690c:6385:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-787d541b7f3mr90568307b3.35.1762815864323; Mon, 10 Nov 2025
 15:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762327887.git.mazziesaccount@gmail.com> <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
In-Reply-To: <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:04:09 +0100
X-Gm-Features: AWmQ_blNtjThswk7W8THjiE7tdsgu2zFtwGMw_ARgVxMcfWy78tjHu1U0YBhMO0
Message-ID: <CACRpkdbP-GZXtj_-AuZ=q8zUKwt0qWQ1L6v7WsoQ50JwTs6JUA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: battery: Clarify trickle-charge
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:36=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The term 'trickle-charging' is used to describe a very slow charging
> phase, where electrons "trickle-in" the battery.
>
> There are two different use-cases for this type of charging. At least
> some Li-Ion batteries can benefit from very slow, constant current,
> pre-pre phase 'trickle-charging', if a battery is very empty.
>
> Some other batteries use top-off phase 'trickle-charging', which is
> different from the above case.
>
> The battery bindings use the term 'trickle-charge' without specifying
> which of the use-cases properties are addressing. This has already
> caused some confusion.
>
> Clarify that the 'trickle-charge-current-microamp' refers to the first
> one, the "pre-pre" -charging use-case.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

