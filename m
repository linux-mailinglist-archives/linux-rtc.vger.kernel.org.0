Return-Path: <linux-rtc+bounces-4307-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C79ADE9E8
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Jun 2025 13:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB14A7A3254
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Jun 2025 11:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEA52BCF73;
	Wed, 18 Jun 2025 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/pyDwyM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E729B8E4
	for <linux-rtc@vger.kernel.org>; Wed, 18 Jun 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246043; cv=none; b=bX93kDFXPbYQqIIADCwyRy66OizMH7zoFQ8BddxcTFWpz1IDr7OJ+QPE5Ip1rZe7tJakMuomoAGgsyPQa1cXPA+3l0gIDbbGfllhhFCl1gpwC+xDADH//mgBg2pLQPAFvULagWFyG9F2N462WD7oiTq8oxKkXhyOco7whet5Z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246043; c=relaxed/simple;
	bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKT8GpnxJZ3q1TAFmwnPj2nAOpZW9kOyPb+XiyDmDLJXlQA8AB6lN/e+mG5pLJy5u6sNh0QdsktkaixNgHkuqxqadKOd6a3DWstXnnKtOqTQ2MuwNNuoM72igHyDndmYTnDeggO/P2xNLjjlqVjozgKIID9tduj0/Awo0g5UeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/pyDwyM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so7023437e87.1
        for <linux-rtc@vger.kernel.org>; Wed, 18 Jun 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246040; x=1750850840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=s/pyDwyMJvSCAVC0O/FbLpfEEpa7bM+dfz5CfpngCdhVtUEy3w+W011mZDkiV/WJM/
         DSw/FgpJbjcEw3e87pg+Y/NpKT/OUd+/O0M6StjuGP8fsskAaDNBHCL5eOWoM3KiwEil
         rpid/gh99Q/qrjULVsia3ykGoN0hoLrAiUqq9UWBjq3DCNLXzJCimpwMFmzssjZuvNrJ
         fMTIcK1dQCMiS503OnJ5kCue7o8nfO2KrVSoFAqxkKKK2GcCy5u5+KakBnc2csnSVa1E
         gqcqn6GLHtsMiY8/WGTmB4QrnTYgDP1LqsSjixD2iF9SR0+4Nnf4AMK0cwdZXuin7cSH
         ipVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246040; x=1750850840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=AHtcPYHK33Jb1RxEnVcQbXalW0kJUOw95E3JGri+iTXLgnMBcO5NyHijLcKUvc6Eo7
         uWssdbDh5j4aYsAtXwSBeFz5afkic+HqxW0qDHNTeSa+XXjfnYZ2CflMCdeqBdhyReBn
         yjUxsQiriYDjHHFz+Ylqtd9NSXAS2JYNB3NGY3wV6FqcuF5OEjUSqFzEmKGsYiOZ9wrG
         OaJanAy7qg9Sm3Z75tGwJGxzypRhB7GMxd9D2lPW6uXpaV4t6L4sCi3uJgeSLU/SVYpv
         Gm86T4NxrVc9W/TTcfLGUeHhIe1tL3PY7wMPN+cv4KLm7pQ4eS1RJYfnkQGQvYJgEZh/
         7q7g==
X-Forwarded-Encrypted: i=1; AJvYcCWqF9K0RCccVrAjPdpwHWna6rtgTVn8VIgvV1q9E4OAUwptJ6FwI6zS5S+eD6/2wA9+nx6a49ZwJLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfK39yRVuSXsBUYRXTtuf7ZIcaSzAbJyH+Vq5nOZ/RBMwoLXA
	G8Rw5AFPjg9rvqF7Az+HctN9mkVefBWjZgQ+Tz7GexUvoljRTKGERS4gco68FTwxb/3tWqz/0yO
	Q0CYci5OK5QxRiXIg+vbutcYfDOYigwbY8n5ZCBr/tA==
X-Gm-Gg: ASbGnctW7mZjL7HQahdeje+q4sB++EycS+sfliHu5aCiumTJhTwgxu5infRRwYaqmm6
	xiQXwGg1KYM/anWTP3ESo0cDrA4EHNdLQKUChJpUUqdJJJ47WQnV6eMsu4ovXWm+k9UvhClGRIM
	orGPW6BdPjyX1isP7nr0QU/SMUEa02gwdtG2I2ViqkWx4=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 8:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Changes in v2:
> - Add Rb tags
> - Patch #1: rephrase commit msg (Geert)
> - Patch #2: fix/require dependency on OF
> - Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-=
76fe97899945@linaro.org
>
> Description:
> ------------
> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.
>
> Dependencies/merging:
> ---------------------
> Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
> prerequisite for all further patches, including RTC patch, therefore
> probably everything should be via main pinctrl tree.

Patches applied!

Yours,
Linus Walleij

