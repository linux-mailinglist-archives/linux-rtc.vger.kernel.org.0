Return-Path: <linux-rtc+bounces-1621-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DF93D9E7
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 22:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A76282D09
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 20:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A61F149C40;
	Fri, 26 Jul 2024 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jcBIwHfJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9F149019
	for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 20:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722026323; cv=none; b=DitPBEZ3mRArPI6JqbfKGH1yDqSJkDiNc1uTDHl6JgVM61ebwVOkNC0GUBFHnpVra/SKHJn9gJ8J7apKtSh6D7p6KrbnRDQjqV13G2yJZ/UvELNZ/fxTPHlUCeoiFYmu1KW/jvdt6vhxX1qgj/hUkUWDiG5Ig00ZSQdti7dX+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722026323; c=relaxed/simple;
	bh=rW/mjPQFMDuWlDKqsBRHZwlG6YWHVt6ZqbKxEMjtSFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fghtecc2yo7IT8smlcHy2rMi6n6CJXwNE3ZiiVCWHLpfOnFTUmf7WCL+yAMkpsWxVE0GcxRuE/pngy/IJXHsKeQgojmQaX9Fg4M428K/NcljchpL8B5z13SGk2NtAOpMxktfRdGFehgVRa73Twikdn0JNZn0AqStmKwMrpmKJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jcBIwHfJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f01b8738dso1846535e87.1
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722026320; x=1722631120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW/mjPQFMDuWlDKqsBRHZwlG6YWHVt6ZqbKxEMjtSFI=;
        b=jcBIwHfJxNcINDIu9BWUSdQG9SdO5wjXFtdLkfoSa33wddGDAabOq9EUr3Pib0QOxO
         BYir6YhuSZroRdY8yNhO9dXOMHvgsADAFnqNn/GKUeahZf8tT2WAZEj6Ax97l01RF5BX
         G0wcc+Kc1Gfv4sf2A6BizB1KMrXT0tU5AOr5j5+rpPThC2E3eSNCkZexXsgLBNK6RKYv
         8USlbUl15NZ9kuFzwnxS5+V88CFf3OOLj3ATy3weO404oVzqaCnEqUWlL5wLbmlIt4BQ
         RpOcjcc1JkYC4WJvlfom5OhyJ5xMRcQMkoGBioMYodH0LigZYd9gvFu6vkoRrf5Iab/x
         fQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722026320; x=1722631120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW/mjPQFMDuWlDKqsBRHZwlG6YWHVt6ZqbKxEMjtSFI=;
        b=GizXkyr/owRzeMdXXGlisU+YxVX/2Y97l+4AEdi6WLfXTAa/vSmP87w4JETbK/s9ZY
         LIUMPQIXmgI29xfVwxnEZ/oTuumIQ9axOJ4e51vaZkhS3SjOIfnBpcAYq75JF0FFwuAp
         m+znui5ZL9eeiNhOpgha/BTECzOBWwfPUqsKeSKlNVXoNn1CXAJPVGrmmYm1bCbohs/a
         J5HY31ov6mi4MYHeMnlmeSY/EQxAXFoZlpKUNBp9FllYbZL1Z2+nLXtdUhYYSmnZaKPL
         /YNW28NZug03AiZFizx7jAEBR0aEagncAjQU7FYF0J1zvjhunqtczoMAepTz6yVIgdah
         D83g==
X-Forwarded-Encrypted: i=1; AJvYcCVCTuDiFhBWfWA9navBy5ItyO6MyUM5OgNB9AT4Tu5ZPETbpCGXte7OPYCav/vGdh4zoI8jpaCLeNcdezTU6r41btJeMvNYhqVB
X-Gm-Message-State: AOJu0YyTGSS8tCxEEZUWY9ATy7mV0mNVTjfVWH/LbNFu8B/sMz9sR0ns
	TQr04ReU2vzkugF4fm56aVcXw0aLmtyk9gHRtgXLT3d2l4rAH5lm1LunAPzcxCcropehiE25Wgi
	CAsx10mS5uzjWW0DUk70pbkNUn+qa72uNpCW+dg==
X-Google-Smtp-Source: AGHT+IHz/y8/buT1Q4Ov7Oc+F2tq/tFZZb040THUUnc6gsADTyKKKUkowSMmF4Ldk8jwYen4+HJqSnTy+HhOgCdrHk8=
X-Received: by 2002:a05:6512:3ed:b0:52c:e00c:d3a9 with SMTP id
 2adb3069b0e04-5309b2698b8mr531605e87.1.1722026319708; Fri, 26 Jul 2024
 13:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com> <20240722160022.454226-2-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-2-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:38:28 +0200
Message-ID: <CACRpkdYheDSTNszVdm4YOuupCNQbib5KB5xHgYTU3K1k_fMtyA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: stm32: describe pinmux nodes
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

> STM32 RTC is capable to handle 3 specific pins of the soc (out1, out2,
> out2_rmp) and to outputs 2 signals (LSCO, alarm-a).
>
> This feature is configured thanks to pinmux nodes and pinctrl framework.
> This feature is available with compatible st,stm32mp1-rtc and
> st,stm32mp25-rtc only.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

