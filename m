Return-Path: <linux-rtc+bounces-5409-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BBC6BF0E
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 00:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D96CA364443
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 23:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC8830F553;
	Tue, 18 Nov 2025 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfvYck1u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FD1309DDD
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507200; cv=none; b=sp2bHBS+45X58fOGOg1hs+xLY6NGg8MyyXbZAp/pMTPKaT2aUKKWcN6hjdMLv1vef9kxOTVzt/A6LSSnA+ia8kRdYYYsi+1BBD2c1anbUBQ8TBuySsHx41SMNhuk8ilM8iOZY59tfRjbY7QkMclGgEqCzmFvI27+TD2DlfsbHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507200; c=relaxed/simple;
	bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jY6Iv/hs+Vxhs4N08VEmBrr9xXcNUOMVfen0RcE8aZmnc1ZwelwBbkMQ8KSXDg6grXcwj5xwjbjX5wGOt5M3WzxiHhuaESoY6RT223rKvwVjMRkjaaupNobt7ykZ32sbsCO5+nw1LTelI3rJTbErzpw5EktBdU8Sq82CHWY9/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfvYck1u; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3761e5287c9so53419271fa.2
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507197; x=1764111997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=UfvYck1uNz8mqIo13JFGwzFX9VIkjKIEo9RmRV4QPX5MnAX+9ywoIUDmVoPkCRVIiG
         3fxyN53ckBdXcvwPWw89T7UAoRuOIys+10yKO3sA++4R44slzYgRUir+QbRn2769mnk4
         UnUwnfec1xgR4Xn6p22g6kaT7AUAac4rXo6Lmu/xf/BLJjfEXH5eFSFC9uHxVF9+UTu/
         HGU5ktezAOQtZ36HJxwuWEjhQul4Gcn10kzddMrXMmazzT9msgcv/l0C71FGD5mXbrDK
         x9lKdHGi+prGGXgWm8LMMM/Td90mu1ZLW+L7bVuf4z9Kl5kYjL1Q39LHBi+TKA/57TK+
         TdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507197; x=1764111997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=V8ig1zmvC3mqcR9BSQVJQdhwdawKXgFATply87nuNPv4LmFesP8wwLzvzDPITvNuy1
         +vIjKAkum3FnFdXG1ufauW4SBwslMJ59vtDqHNyRsGxfoQbg6sXbUlRUy8h9XSebNIei
         dWxq1y8wELFgoPekDT2FSt/3u0bP4cp6b/eAWAPTR//DiGTGNDwl7TRxV5FKxGhUMGKA
         G+uIc9vqvi/b13lieZGcdbFy60TUc9RYk0uPYE1K0dL7RsgBo/ST8mGxbno2xnALR7PZ
         YzvBiuDlrCmd2EFPr0jDnBmF4s3KJfYVIcY6smnSQvaDxF9f00iXvURqO6uTPsEehbH8
         frPg==
X-Forwarded-Encrypted: i=1; AJvYcCUu7VpGgf5Yl5Wk7oR4j4RyOELeu9VZfOKFcgnsbvNL+R92W2NaBzJ9igBG6YpICRCqvhrPeQnBrW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtsY/19Optoq3FuF3+Z3SgAs347r42n6EcKpnqwEkWtdgZkBSz
	thoHgsi3NBxx4i6VYZE71oOGrkmkRMGupgHR0ifTBfLtA23rMBcqqcNILse1XyxmDRXAZpwpDiM
	NHoSrB++Q/+EhD014ejbQ6jmI+1gOMt4rgZzFajiFbw==
X-Gm-Gg: ASbGncvqn37W7CDYrVQDfE5HJsr5U0Qb9caZyyyKaeAXcTfvFvNQwb7Wn+sEZp1EMFL
	w5KLB7TUAP8aNlkwY/T2nKoODh+2txhvr3Xq2n5rb85xzUZQ9wVY5EBjfBk318ixc5Rz/Urd/Sh
	4lmWjgj0YEpFPLQ3K86pnPer119mrowpgu7MB0mGwIc7XXjjocM5zVyt9fEPBc7Xa6EqffexH/G
	wPUSStDegblDPrvua6CNjGWGlkKLkGR+fhI7VRDtnoGSBBFzQjMZDCnXBHehAOWuyXu4/Oe7ShM
	LHP77w==
X-Google-Smtp-Source: AGHT+IHgvWgHNR1n7HikNfbECM3QMJGErQNkGV7PI3jzhreQtbR/8j6SX6DzkJAmHt+W6Slk62x/gQ3zMskh1FFfiGU=
X-Received: by 2002:ac2:4c4b:0:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-5958419866amr5810310e87.7.1763507196990; Tue, 18 Nov 2025
 15:06:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763022807.git.mazziesaccount@gmail.com> <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
In-Reply-To: <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:06:25 +0100
X-Gm-Features: AWmQ_bnx0kL6TQjG1WBAuJJp0XRB0JYUZxqe_CZgABTVpH_anNv9ed5mp--DLwo
Message-ID: <CACRpkdaa_DuXbLYqOV3aOSGywz1wSPc3-7SN8FtwTdVza6-omg@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] dt-bindings: mfd: ROHM BD72720
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

On Thu, Nov 13, 2025 at 9:52=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
> charger, LEDs, RTC and a clock gate.
>
> Add dt-binding doc for ROHM BD72720.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

This is looking good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

