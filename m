Return-Path: <linux-rtc+bounces-1622-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C193D9FC
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 22:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49877280EDC
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 20:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA64149C45;
	Fri, 26 Jul 2024 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tn5T3kj2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0286BB39
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722026814; cv=none; b=TvZuY51AygK14vW2Etkv7Oe7Rk9NEe2+qDG3egBazywZrGb6VOhhuuz+BWwMFa0JjTZvcDosqFrqnNCm7gWbUIvKinTJ+bCxIy30LkY0sZn0CjvrsA3uHrNkeTC63UB8T/1RL0OHRHpiGmgOElT7Vx+yxUaZ68dCGXTfDzkPcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722026814; c=relaxed/simple;
	bh=oVfdt+OymtZ54PYvBu9Sztkpm/XoiNvJu0aqy8PJ1Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxPVPIa/INQTaMXmK8NkkMrGCJJE6jhXAaNWAv1mlHXWyFJnwN6DfEC5w0RRkyfQnlgq/mdP/x8DwrbW7F8n3xleATrvm5AoNy8H7ZowCqQF4w6d3PQgqYevagVNiT8ROx4KMBkdZLgxESGLIYuRuPmOxnDNW7RgSYfZ+ibI5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tn5T3kj2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so1818257e87.0
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722026811; x=1722631611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZXkbU8q+Zt3SnwgAk8/hFQnwK7ueMI7bqu+1Re++d0=;
        b=tn5T3kj2s0euk7qoM09mmPjVmlZ9ftFyvOZ/JadAQOsJhRelD5wNusE7tf5I6D4vjV
         Zrb9LIbGyW4wiiHeJnVUpPLV/ljCuievLtxYK+Cg/XlFCU3xJX5Api01bNEhsbpnsmvl
         yzLd8PIqKotdChUd0wvAvHnRXxb4ZBWt0LlsMIStZD2vZs1E+fCy8WQeFASe/V+uhWSg
         fGugd5FpLFMW0arR3ytXRkrvWpMRSaGL5YkMu4QcyThZz//3Ls+BlQtb9jRude1a0Ib2
         /Nsj9YuxZG9CzYr7yAiY7y2MEXvd8zBmPBfdP/X/xA2z3dWPt3HqS2EUXzdOhGi0QvLQ
         YG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722026811; x=1722631611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZXkbU8q+Zt3SnwgAk8/hFQnwK7ueMI7bqu+1Re++d0=;
        b=VFMyB+KrgzES6wBbcDFPWYN17fJ0qZjUd5hS6ySY37Y0cuC3eK3WvCbk7ZorYeSqIR
         659L5NP8aqo8sABdtAs5iss/G/pa711Zdfdlst1TWREFDDMofkhKiSZwAra7swmekG7X
         ZKc2RZf4cX90GP3XdiJ1i0a4ZBaQrcE28Kh8GaBjH0mbKmGJgbum96tapOOQVQZHFnTT
         aWxyscjcWP9IS8IwS0ubhzu7pp9gSoDidn5LA6VI+xxHCCw1tJBEghN4Z3GiULUYqoNx
         49rtyqnr/AmhouxGAP9FY3kI4ShIQ7lz+bk98hgKAILbS4ZmF0VLpVs2Xvq7Q8kPR88Y
         dOXg==
X-Forwarded-Encrypted: i=1; AJvYcCUsJVAFDbH26yo3T2lfM0Q5sKW6kU2Wl4vc+hmWkE1VyBBQTeiSHPwTEsH6VD32L3ysvxDpqpoKea4B0KV7CAMHapOst7lhuAnL
X-Gm-Message-State: AOJu0YxjRhs9rXlji148xq7HJTyQ0Z6slIu74/LA1WYCMreeoy4Gw7ja
	Rygj5JF7kGhh9AcfAWH6htf9Vu80xkWYicKgPR+uqMXr1DA1MgQ4grFqvQPuodxDHmUW/7ImIxC
	CoGraOZCSMbvTdtZUSFmRBDepy/MP0FPn6/6TBQ==
X-Google-Smtp-Source: AGHT+IGtk2Ynpj/GJYUcsbK8mhjqd1a3MpqdYpelqVYrMrT58LYio/Tlrul5HfHB3aAXXNe3R6YeSxbB+rKUCRNWpio=
X-Received: by 2002:a05:6512:3e0e:b0:52c:c9bb:2ba4 with SMTP id
 2adb3069b0e04-5309b2b6e87mr649721e87.46.1722026811406; Fri, 26 Jul 2024
 13:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com> <20240722160022.454226-3-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-3-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:46:40 +0200
Message-ID: <CACRpkdahF4uDux1Dh1XSh7nHusyGVD3sNu8TVB8HVu277vGLtg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rtc: stm32: add pinctrl and pinmux interfaces
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> STM32 RTC is capable to handle 3 specific pins of the soc.
> "out1, out2 and out2_rmp". To handle this, we use pinctrl framework.
> There is a single pin per group.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
(...)

> +/* STM32 RTC pinctrl helpers */
> +#define STM32_RTC_PINMUX(_name, _action, ...) { \
> +       .name =3D (_name), \
> +       .action =3D (_action), \
> +       .groups =3D ((const char *[]){ __VA_ARGS__ }), \
> +       .num_groups =3D ARRAY_SIZE(((const char *[]){ __VA_ARGS__ })), \
> +}

This is a very clever and clean macro.

We have PINCTRL_PINFUNCTION() in <linux/pinctrl/pinctrl.h> which isn't
smart enough to use VA_ARGS and ARRAY_SIZE.

Now you also need .action but if it wasn't for that I would have asked
for the macro to be made generic.

The implementation is clean and impeccable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

