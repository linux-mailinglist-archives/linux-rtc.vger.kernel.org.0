Return-Path: <linux-rtc+bounces-1620-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86B93D9DE
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 22:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958AE1F245A0
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 20:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7209714A095;
	Fri, 26 Jul 2024 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6UlP8A6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7814A08E
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722026256; cv=none; b=Cnufb5WqaJbJWWYVvKKDqtMAHQZWLSF2f6DAbqyNFrbWCQDiMHF1hgoGQe6gzSl68TFoq7QRd8hy0C+I+g62VdxubSUNYM5QpaWd2Nz5/3bHlW9Vp0CSuZgTD9g4inU3zVvAsEQiuuULhaalF1OeckcAroQSymexUYGuwTfUhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722026256; c=relaxed/simple;
	bh=VpFGnpRR5hkWzh8gvesZMOzSfdyh684K/16SG0UCRpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNqlALcXtXjZGSNoMNOwFd8p2eJjWMfKUANwAH9JWVkE0WzUhQkFD4p1M2pVVWCjLhz/MzgLtuMeuwm3EcuTeb3uzWPw3bUbohBGIyJBNzIa54zxmvtNGg+q8ap+q6qWZw/TeO6/pgLXaZOAX1lN7c8l+ofjCcRuYkJBV6yaxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6UlP8A6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd855adbso2457233e87.2
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722026253; x=1722631053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=657P5JeC8SjYcUxgWCTWkbvBvs/fWchllBX/2A8VqhE=;
        b=U6UlP8A6jqlkui3uZh6xk5RE5GUgU0wW0VLnTMiXsGjQ1eJk0HwMzl/YUWKEz/VAZw
         dtLKq9FLjDsDIxk9SyicT7SQ1BtLXq5Bsnaky6fTwN3MiridOQSKKATk6WtpWOcTUBPl
         c8e4sLWuAEXoQhgEjmRXoPIw41gHB2GpLrJYAEjnvMGdR1zzBj4JS619zRVW0f8IUHCN
         qz2glptWV0H8Fk/e/mHA0Ibm71gDUWJJPG05XoOAQg5wKGSFPb+7QDpiqRF8Eodcy5lQ
         JptP5hERs1VZYD7iFgm1VTYyYBjUu7Nw8d58x9KfH0lkXl9PjojVcmUE1Gk9zIO7XyCf
         OijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722026253; x=1722631053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=657P5JeC8SjYcUxgWCTWkbvBvs/fWchllBX/2A8VqhE=;
        b=rJkSZ+zzgmtH5fnianLK4qHsc4MgCTA4NxwJEk/nqgR+PBIH8ERsSxSgZl27g8n36p
         F7hAW3EpdaTkitDBC0ykgEqxeyLV6lfPPqgoUoHWWeoG/iP1YyjP+mzwj21h/EM5sitB
         5Ajspv3wC/XrjVCu3hqyvW25RpZn7n5D/MbdB0FP9x3IpzSq6GRutitTvIqv9tujBDvk
         XJUR+Ht2QxbR9CF4QsVJN8kjeRT7UQvWrCYL1ngyGQ7ob2YvSIlhoTQ18vZWhb6UyGF5
         oe3GyVxN34DxNZo8gOTwKM8YBdXDfknFl+chCu2yoFdQwpHgVGIM9bZCy10dVvRo9U42
         gEOw==
X-Forwarded-Encrypted: i=1; AJvYcCUUbB/yLr5HCYgrcvT0KfC8VCjU398RVQB8tfzIofxBhH2q9hI35eWi9lVWZrrs/Uxcw1JMlplh5YvuABwTjSrOXUoCHRk1Ehot
X-Gm-Message-State: AOJu0YygfM3icU/d/dCf9BdzKiSdCl0J+0gnDHHuY6fFw2ldCEXPWP3C
	bBcdj7KiY1RrS70TEVhHvn/gB6fzWOfgmGTyKSx2v931dShGaPw/2k1qbQjV7TccgDld4WhTXhw
	G+rPS0Ie1ZvqtZ5l2uF686Mjd5VtAJIsDr/MT4Q==
X-Google-Smtp-Source: AGHT+IHJKjb7DhnOe6IE0tF8j9C9EWdehdE6mzT6mGSHyOSD6devxjVA8ebqqDI8599aitXQ59+ccERwN/3nlh8FY+w=
X-Received: by 2002:a05:6512:246:b0:52c:d967:79c6 with SMTP id
 2adb3069b0e04-5309b270bd5mr545733e87.20.1722026252672; Fri, 26 Jul 2024
 13:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:37:21 +0200
Message-ID: <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rtc: stm32: add pinctrl interface to handle RTC outs
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

On Mon, Jul 22, 2024 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.

Interesting! I think it is the first pin controller outside on
drivers/pinctrl in the kernel tree.

Please include me and the linux-gpio@vger.kernel.org list in
subsequent postings, I want to be sure what gets merged here
and I only noticed this from the LWN driver patches summary.

> As device-trees will be upstreamed separately, here is an example:
>
> stm32-pinctrl {
>     rtc_rsvd_pins_a: rtc-rsvd-0 {
>         pins {
>             pinmux =3D <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
>                      <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
>         };
>     };
> };
>
> stm32-rtc {
>     pinctrl-0 =3D <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;

So the first one is a generic pin control setting and the second
one is a hog for the pins defined by the device itself.

It's clever, and works. Nice work!

(There should probably be a comment in the device tree to say
what is going on so people reading it are not confused.)

>     /* Enable by foo-device */
>     rtc_lsco_pins_a: rtc-lsco-0 {
>         pins =3D "out2_rmp";
>         function =3D "lsco";
>     };
>
>     /* Enable by stm32-rtc hog */
>     rtc_alarma_pins_a: rtc-alarma-0 {
>         pins =3D "out2";
>         function =3D "alarm-a";
>     };

Yours,
Linus Walleij

